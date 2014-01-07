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
  BANNER = <<-USAGE
  chmod +x parallel_copy.py
  # copy two files (text.txt Errors.go) using threads into `/home/simon` directory
  ./parallel_copy.py --dst=/home/simon -t file1 file2 ...
  USAGE
  BANNER.freeze

  def help; end

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
      @files.each do |file|
        stdin, stdout, thread = Open3.popen2(sprintf("%s %s %s", CP_PATH, file, @dst))
        stdin.close if stdin
        stdout.close if stdout
        threads << thread
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
        raise "#{_file} Doesn't exist"
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
        raise "#{dir} Doesn't exist"
      end
  end

  def parse_options
    OptionParser.new do |opts|
      opts.banner = BANNER

      opts.on("-h", "--help", "") do
        help
      end

      opts.on("-t", "--with-threads", "") do
        @thread = true
        @fork = false
      end

      opts.on("-f", "--with-forks", "") do
        @thread = false
        @fork = true
      end

      opts.on("-d", "--dir", "") do
        @dir = true
      end

      opts.on("--src=", "") do |arg|
        @src = arg
      end

      opts.on("--dst=", "") do |arg|
        @dst = arg
      end
    end.parse!

    raise "No Files supplied\n" if ARGV.empty?
    @files = ARGV

    verify_files!

    if !@dst || @dst.empty?
      raise "Destination must be supplied.\n"
    elsif @dir
      verify_dir! @src
    end

    verify_dir! @dst

    if @thread
      copy_with_threads
    elsif  @fork
      copy_with_forks
    end
  end
end

ParallelCopy.parse_options