## Author
#### Simon Escobar Benitez

#### Python version: 2.7.3
#### Ruby version: 2.1.0

### Options
> Options
* --dst=[Destination]
* -d or --dir # => Copy a directory in Parallel, not implemented yet
* --src=\[Source Directory\]( Must be a Directory -d )
* -t or --with-threads # => Parallel Copy using threads
* -f or --with-forks # => Parallel Copy using forks (processes) Default = true
* --p=[NUMBER] # => Number of processes or threads created (Use this option with precaution you can run out of memory ),
by default the maximum number of threads and processes created is the number of cores your pc have

### Usage
```bash

# copy two files (file1 file2 ... ) using threads/processes into `[DIR]` directory

# Python
  python parallel_copy.py --dst=[DIR] -t file1 file2 ...  # using threads
  python parallel_copy.py --dst=[DIR] -f file1 file2 ...  # using processes
  # by default works with processes
  python parallel_copy.py --dst=[DIR] file1 file2 ...

  chmod +x parallel_copy.py
  ./parallel_copy.py --dst=[DIR] -t file1 file2 ...  # using threads
  ./parallel_copy.py --dst=[DIR] -f file1 file2 ...  # using processes
  ./parallel_copy.py --dst=[DIR] file1 file2 ...  # using processes

# Ruby
  ruby parallel_copy.rb -t --dst=[DIR] file1 file2 ... # using threads
  ruby parallel_copy.rb -f --dst=[DIR] file1 file2 ... # using processes
  # by default works with processes
  ruby parallel_copy.rb --dst=[DIR] file1 file2 ... # using processes

  chmod +x parallel_copy.rb
  ./parallel_copy.rb -t --dst=[DIR] file1 file2 ... # using threads
  ./parallel_copy.rb -f --dst=[DIR] file1 file2 ... # using processes
  ./parallel_copy.rb --dst=[DIR] file1 file2 ... # using processes

```

### Benchmark
```bash
    # Options
        Destination = home/simon/parallel_test
        Files = [hinting.py, limit_skip_sort.py, ProcessWhatcher.py, upsert_pymongo.py, insert_pymongo.py, HelloWorld.py, find_modify_pymongo.py, mongo_regex.py, PymongoLecture.py]

        --dst=/home/simon/parallel_test ../hinting.py ../limit_skip_sort.py ../ProcessWhatcher.py ../upsert_pymongo.py ../insert_pymongo.py ../HelloWorld.py ../find_modify_pymongo.py ../mongo_regex.py ../PymongoLecture.py
    # Python
        # Processes
            time ./parallel_copy.py --dst=/home/simon/parallel_test ../hinting.py ../limit_skip_sort.py ../ProcessWhatcher.py ../upsert_pymongo.py ../insert_pymongo.py ../HelloWorld.py ../find_modify_pymongo.py ../mongo_regex.py ../PymongoLecture.py

                real  0m0.091s
                user  0m0.036s
                sys 0m0.024s

                real  0m0.081s
                user  0m0.036s
                sys 0m0.024s

                real  0m0.086s
                user  0m0.020s
                sys 0m0.044s

          /usr/bin/time -v ./parallel_copy.py --dst=/home/simon/parallel_test ../hinting.py ../limit_skip_sort.py ../ProcessWhatcher.py ../upsert_pymongo.py ../insert_pymongo.py ../HelloWorld.py ../find_modify_pymongo.py ../mongo_regex.py ../PymongoLecture.py

          Command being timed: "./parallel_copy.py --dst=/home/simon/parallel_test ../hinting.py ../limit_skip_sort.py ../ProcessWhatcher.py ../upsert_pymongo.py ../insert_pymongo.py ../HelloWorld.py ../find_modify_pymongo.py ../mongo_regex.py ../PymongoLecture.py"

              User time (seconds): 0.03
              System time (seconds): 0.02
              Percent of CPU this job got: 72%
              Elapsed (wall clock) time (h:mm:ss or m:ss): 0:00.08
              Average shared text size (kbytes): 0
              Average unshared data size (kbytes): 0
              Average stack size (kbytes): 0
              Average total size (kbytes): 0
              Maximum resident set size (kbytes): 24240
              Average resident set size (kbytes): 0
              Major (requiring I/O) page faults: 0
              Minor (reclaiming a frame) page faults: 18275
              Voluntary context switches: 64
              Involuntary context switches: 39
              Swaps: 0
              File system inputs: 0
              File system outputs: 72
              Socket messages sent: 0
              Socket messages received: 0
              Signals delivered: 0
              Page size (bytes): 4096
              Exit status: 0

              User time (seconds): 0.03
              System time (seconds): 0.02
              Percent of CPU this job got: 72%
              Elapsed (wall clock) time (h:mm:ss or m:ss): 0:00.08
              Average shared text size (kbytes): 0
              Average unshared data size (kbytes): 0
              Average stack size (kbytes): 0
              Average total size (kbytes): 0
              Maximum resident set size (kbytes): 24240
              Average resident set size (kbytes): 0
              Major (requiring I/O) page faults: 0
              Minor (reclaiming a frame) page faults: 18275
              Voluntary context switches: 64
              Involuntary context switches: 39
              Swaps: 0
              File system inputs: 0
              File system outputs: 72
              Socket messages sent: 0
              Socket messages received: 0
              Signals delivered: 0
              Page size (bytes): 4096
              Exit status: 0

              User time (seconds): 0.03
              System time (seconds): 0.02
              Percent of CPU this job got: 75%
              Elapsed (wall clock) time (h:mm:ss or m:ss): 0:00.08
              Average shared text size (kbytes): 0
              Average unshared data size (kbytes): 0
              Average stack size (kbytes): 0
              Average total size (kbytes): 0
              Maximum resident set size (kbytes): 24240
              Average resident set size (kbytes): 0
              Major (requiring I/O) page faults: 0
              Minor (reclaiming a frame) page faults: 18276
              Voluntary context switches: 62
              Involuntary context switches: 46
              Swaps: 0
              File system inputs: 0
              File system outputs: 72
              Socket messages sent: 0
              Socket messages received: 0
              Signals delivered: 0
              Page size (bytes): 4096
              Exit status: 0
    # Ruby
        # Processes
            time ./parallel_copy.rb --dst=/home/simon/parallel_test ../hinting.py ../limit_skip_sort.py ../ProcessWhatcher.py ../upsert_pymongo.py ../insert_pymongo.py ../HelloWorld.py ../find_modify_pymongo.py ../mongo_regex.py ../PymongoLecture.py

                real  0m0.067s
                user  0m0.032s
                sys 0m0.016s

                real  0m0.058s
                user  0m0.036s
                sys 0m0.016s

                real  0m0.053s
                user  0m0.032s
                sys 0m0.012s

            /usr/bin/time -v ./parallel_copy.rb --dst=/home/simon/parallel_test ../hinting.py ../limit_skip_sort.py ../ProcessWhatcher.py ../upsert_pymongo.py ../insert_pymongo.py ../HelloWorld.py ../find_modify_pymongo.py ../mongo_regex.py ../PymongoLecture.py

            Command being timed: "./parallel_copy.rb --dst=/home/simon/parallel_test ../hinting.py ../limit_skip_sort.py ../ProcessWhatcher.py ../upsert_pymongo.py ../insert_pymongo.py ../HelloWorld.py ../find_modify_pymongo.py ../mongo_regex.py ../PymongoLecture.py"

                User time (seconds): 0.03
                System time (seconds): 0.01
                Percent of CPU this job got: 84%
                Elapsed (wall clock) time (h:mm:ss or m:ss): 0:00.05
                Average shared text size (kbytes): 0
                Average unshared data size (kbytes): 0
                Average stack size (kbytes): 0
                Average total size (kbytes): 0
                Maximum resident set size (kbytes): 33008
                Average resident set size (kbytes): 0
                Major (requiring I/O) page faults: 0
                Minor (reclaiming a frame) page faults: 6497
                Voluntary context switches: 24
                Involuntary context switches: 16
                Swaps: 0
                File system inputs: 0
                File system outputs: 72
                Socket messages sent: 0
                Socket messages received: 0
                Signals delivered: 0
                Page size (bytes): 4096
                Exit status: 0

                User time (seconds): 0.03
                System time (seconds): 0.01
                Percent of CPU this job got: 87%
                Elapsed (wall clock) time (h:mm:ss or m:ss): 0:00.05
                Average shared text size (kbytes): 0
                Average unshared data size (kbytes): 0
                Average stack size (kbytes): 0
                Average total size (kbytes): 0
                Maximum resident set size (kbytes): 32976
                Average resident set size (kbytes): 0
                Major (requiring I/O) page faults: 0
                Minor (reclaiming a frame) page faults: 6474
                Voluntary context switches: 24
                Involuntary context switches: 16
                Swaps: 0
                File system inputs: 0
                File system outputs: 72
                Socket messages sent: 0
                Socket messages received: 0
                Signals delivered: 0
                Page size (bytes): 4096
                Exit status: 0

                User time (seconds): 0.03
                System time (seconds): 0.01
                Percent of CPU this job got: 85%
                Elapsed (wall clock) time (h:mm:ss or m:ss): 0:00.05
                Average shared text size (kbytes): 0
                Average unshared data size (kbytes): 0
                Average stack size (kbytes): 0
                Average total size (kbytes): 0
                Maximum resident set size (kbytes): 32992
                Average resident set size (kbytes): 0
                Major (requiring I/O) page faults: 0
                Minor (reclaiming a frame) page faults: 6465
                Voluntary context switches: 24
                Involuntary context switches: 20
                Swaps: 0
                File system inputs: 0
                File system outputs: 72
                Socket messages sent: 0
                Socket messages received: 0
                Signals delivered: 0
                Page size (bytes): 4096
                Exit status: 0

    # Python
        # Threads
            time ./parallel_copy.py -t --dst=/home/simon/parallel_test ../hinting.py ../limit_skip_sort.py ../ProcessWhatcher.py ../upsert_pymongo.py ../insert_pymongo.py ../HelloWorld.py ../find_modify_pymongo.py ../mongo_regex.py ../PymongoLecture.py

                real  0m0.040s
                user  0m0.020s
                sys 0m0.016s

                real  0m0.050s
                user  0m0.032s
                sys 0m0.012s

                real  0m0.046s
                user  0m0.028s
                sys 0m0.012s

            Command being timed: "./parallel_copy.py -t --dst=/home/simon/parallel_test ../hinting.py ../limit_skip_sort.py ../ProcessWhatcher.py ../upsert_pymongo.py ../insert_pymongo.py ../HelloWorld.py ../find_modify_pymongo.py ../mongo_regex.py ../PymongoLecture.py"

                User time (seconds): 0.01
                System time (seconds): 0.02
                Percent of CPU this job got: 95%
                Elapsed (wall clock) time (h:mm:ss or m:ss): 0:00.04
                Average shared text size (kbytes): 0
                Average unshared data size (kbytes): 0
                Average stack size (kbytes): 0
                Average total size (kbytes): 0
                Maximum resident set size (kbytes): 24976
                Average resident set size (kbytes): 0
                Major (requiring I/O) page faults: 0
                Minor (reclaiming a frame) page faults: 11037
                Voluntary context switches: 233
                Involuntary context switches: 29
                Swaps: 0
                File system inputs: 0
                File system outputs: 72
                Socket messages sent: 0
                Socket messages received: 0
                Signals delivered: 0
                Page size (bytes): 4096
                Exit status: 0

                User time (seconds): 0.03
                System time (seconds): 0.00
                Percent of CPU this job got: 86%
                Elapsed (wall clock) time (h:mm:ss or m:ss): 0:00.04
                Average shared text size (kbytes): 0
                Average unshared data size (kbytes): 0
                Average stack size (kbytes): 0
                Average total size (kbytes): 0
                Maximum resident set size (kbytes): 25168
                Average resident set size (kbytes): 0
                Major (requiring I/O) page faults: 0
                Minor (reclaiming a frame) page faults: 10962
                Voluntary context switches: 255
                Involuntary context switches: 28
                Swaps: 0
                File system inputs: 0
                File system outputs: 72
                Socket messages sent: 0
                Socket messages received: 0
                Signals delivered: 0
                Page size (bytes): 4096
                Exit status: 0

                User time (seconds): 0.02
                System time (seconds): 0.02
                Percent of CPU this job got: 86%
                Elapsed (wall clock) time (h:mm:ss or m:ss): 0:00.04
                Average shared text size (kbytes): 0
                Average unshared data size (kbytes): 0
                Average stack size (kbytes): 0
                Average total size (kbytes): 0
                Maximum resident set size (kbytes): 24960
                Average resident set size (kbytes): 0
                Major (requiring I/O) page faults: 0
                Minor (reclaiming a frame) page faults: 10965
                Voluntary context switches: 234
                Involuntary context switches: 25
                Swaps: 0
                File system inputs: 0
                File system outputs: 72
                Socket messages sent: 0
                Socket messages received: 0
                Signals delivered: 0
                Page size (bytes): 4096
                Exit status: 0

    # Ruby
        # Threads
            time ./parallel_copy.rb --dst=/home/simon/parallel_test ../hinting.py ../limit_skip_sort.py ../ProcessWhatcher.py ../upsert_pymongo.py ../insert_pymongo.py ../HelloWorld.py ../find_modify_pymongo.py ../mongo_regex.py ../PymongoLecture.py

                real  0m0.056s
                user  0m0.040s
                sys 0m0.008s

                real  0m0.060s
                user  0m0.044s
                sys 0m0.008s

                real  0m0.061s
                user  0m0.040s
                sys 0m0.012s

            /usr/bin/time -v ./parallel_copy.rb -t --dst=/home/simon/parallel_test ../hinting.py ../limit_skip_sort.py ../ProcessWhatcher.py ../upsert_pymongo.py ../insert_pymongo.py ../HelloWorld.py ../find_modify_pymongo.py ../mongo_regex.py ../PymongoLecture.py

            Command being timed: "./parallel_copy.rb -t --dst=/home/simon/parallel_test ../hinting.py ../limit_skip_sort.py ../ProcessWhatcher.py ../upsert_pymongo.py ../insert_pymongo.py ../HelloWorld.py ../find_modify_pymongo.py ../mongo_regex.py ../PymongoLecture.py"

                User time (seconds): 0.04
                System time (seconds): 0.01
                Percent of CPU this job got: 88%
                Elapsed (wall clock) time (h:mm:ss or m:ss): 0:00.06
                Average shared text size (kbytes): 0
                Average unshared data size (kbytes): 0
                Average stack size (kbytes): 0
                Average total size (kbytes): 0
                Maximum resident set size (kbytes): 33696
                Average resident set size (kbytes): 0
                Major (requiring I/O) page faults: 0
                Minor (reclaiming a frame) page faults: 7061
                Voluntary context switches: 93
                Involuntary context switches: 19
                Swaps: 0
                File system inputs: 0
                File system outputs: 72
                Socket messages sent: 0
                Socket messages received: 0
                Signals delivered: 0
                Page size (bytes): 4096
                Exit status: 0

                User time (seconds): 0.04
                System time (seconds): 0.01
                Percent of CPU this job got: 83%
                Elapsed (wall clock) time (h:mm:ss or m:ss): 0:00.06
                Average shared text size (kbytes): 0
                Average unshared data size (kbytes): 0
                Average stack size (kbytes): 0
                Average total size (kbytes): 0
                Maximum resident set size (kbytes): 33616
                Average resident set size (kbytes): 0
                Major (requiring I/O) page faults: 0
                Minor (reclaiming a frame) page faults: 7058
                Voluntary context switches: 88
                Involuntary context switches: 20
                Swaps: 0
                File system inputs: 0
                File system outputs: 72
                Socket messages sent: 0
                Socket messages received: 0
                Signals delivered: 0
                Page size (bytes): 4096
                Exit status: 0

                User time (seconds): 0.03
                System time (seconds): 0.01
                Percent of CPU this job got: 82%
                Elapsed (wall clock) time (h:mm:ss or m:ss): 0:00.05
                Average shared text size (kbytes): 0
                Average unshared data size (kbytes): 0
                Average stack size (kbytes): 0
                Average total size (kbytes): 0
                Maximum resident set size (kbytes): 33712
                Average resident set size (kbytes): 0
                Major (requiring I/O) page faults: 0
                Minor (reclaiming a frame) page faults: 7092
                Voluntary context switches: 78
                Involuntary context switches: 17
                Swaps: 0
                File system inputs: 0
                File system outputs: 72
                Socket messages sent: 0
                Socket messages received: 0
                Signals delivered: 0
                Page size (bytes): 4096
                Exit status: 0

```