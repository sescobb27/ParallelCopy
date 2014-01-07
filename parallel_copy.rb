#!/usr/bin/env ruby
require 'optparse'
require "open3"

module ParallelCopy
  extend self

  @thread = false
  @fork = true
  @src = nil
  @dst = nil
  @dir = false
  @files = nil
  CP_PATH = "/bin/cp".freeze
  @processor_count = nil
  BANNER = <<-USAGE
  chmod +x parallel_copy.py
  # copy two files (text.txt Errors.go) using threads into `/home/simon` directory
  ./parallel_copy.py --dst=/home/simon -t file1 file2 ...
  USAGE
  BANNER.freeze

  CPU_INFO_PATH = "/proc/cpuinfo".freeze

  def help
<<-HELP

    Help
    # copy two files (file1 file2 ... ) using threads/processes into `[DIR]` directory
    Options
    |        --dst=[Destination]
    |
    |        -d or --dir # => Copy a directory in Parallel, not implemented yet
    |
    |        --src=[Source Directory]( Must be a Directory -d )
    |
    |        -t or --with-threads # => Parallel Copy using threads
    |
    |        -f or --with-forks # => Parallel Copy using forks (processes), not finished yet
    |
    |        --p=[NUMBER] # => Number of processes or threads created (Use this option with precaution you can run out of memory ),
    |                          by default the maximum number of threads and processes created is the number of cores your pc have

    Usage
    |        ruby parallel_copy.rb -t --dst=[DIR] file1 file2 ... # using threads
    |        ruby parallel_copy.rb -f --dst=[DIR] file1 file2 ... # using processes
    |        # by default works with processes
    |        ruby parallel_copy.rb --dst=[DIR] file1 file2 ... # using processes
    |
    |        chmod +x parallel_copy.rb
    |        ./parallel_copy.rb -t --dst=[DIR] file1 file2 ... # using threads
    |        ./parallel_copy.rb -f --dst=[DIR] file1 file2 ... # using processes
    |        ./parallel_copy.rb --dst=[DIR] file1 file2 ... # using processes

  HELP
  end

  @copy = ->(_file) {
    $stdout.puts "Thread #{_file}"
    cmd = sprinft("%s %s %s", CP_PATH, _file, @dst)
  }

  def copy_with_threads
      threads = []
      # @files.each do |file|
      #   threads << Thread.new(file, &@copy)
      # end
      # threads.each(&:join)
      count = 0
      @files.each do |file|
        stdin, stdout, thread = Open3.popen2(sprintf("%s %s %s", CP_PATH, file, @dst))
        stdin.close if stdin
        stdout.close if stdout
        threads << thread
        count += 1
        if count == @processor_count
          threads.each(&:join)
          count = 0
          threads.clear
        end
      end

      threads.each(&:join)
  end

  def copy_with_forks; end

  private def search_file(_file)
      file_path = "#{__dir__}/#{_file}"
      if File.exist? file_path
        file_path
      elsif File.exist? _file
        _file
      else
        $stderr.puts "#{_file} Doesn't exist"
        exit(1)
      end
  end

  def verify_files!
      @files.map! do |file|
        file = search_file file
      end
  end

  def verify_dir!(dir)
      regex = %r(\A~\/)
      dir.gsub!(regex, "#{ENV['HOME']}/").freeze if dir =~ regex
      if Dir.exist? dir
        true
      else
        $stderr.puts "#{dir} Doesn't exist"
        exit(1)
      end
  end

  def count_processors
      case ENV["_system_type"]
        when /linux/i
          File.open(CPU_INFO_PATH, File::NONBLOCK | File::RDONLY){|file| file.read.scan(/^processor/).length}
        # TODO
        # when /darwin9/i
          # `hwprefs cpu_count`.to_i
        # when /darwin/i
          # ((`which hwprefs` != '') ? `hwprefs thread_count` : `sysctl -n hw.ncpu`).to_i
        # when /freebsd/i
          # `sysctl -n hw.ncpu`.to_i
      end
  end

  def parse_options
    OptionParser.new do |opts|
      opts.banner = BANNER

      opts.on("-h", "--help") do
        help
      end

      opts.on("-t", "--with-threads") do
        @thread = true
        @fork = false
      end

      opts.on("-f", "--with-forks") do
        @thread = false
        @fork = true
      end

      opts.on("-d", "--dir") do
        @dir = true
      end

      opts.on("--src=") do |arg|
        @src = arg
      end

      opts.on("--dst=") do |arg|
        @dst = arg
      end

      opts.on("--p=") do |arg|
        @processor_count = arg.to_i
      end
    end.parse!

    if ARGV.empty?
        $stdout.puts help
        $stderr.puts "No Files supplied\n"
        exit(1)
    end
    @files = ARGV

    verify_files!

    if !@dst || @dst.empty?
      $stderr.puts "Destination must be supplied.\n"
      exit(1)
    elsif @dir
      verify_dir! @src
    end

    verify_dir! @dst

    @processor_count ||= count_processors
    if @thread
      copy_with_threads
    elsif  @fork
      copy_with_forks
    end
  end
end

ParallelCopy.parse_options