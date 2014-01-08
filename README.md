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
* -f or --with-forks # => Parallel Copy using forks (processes), not finished yet
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

# Python
  # Using processes
    time  ./parallel_copy.py --dst=/home/simon/parallel_test ../hinting.py ../limit_skip_sort.py ../ProcessWhatcher.py ../upsert_pymongo.py ../insert_pymongo.py ../HelloWorld.py ../find_modify_pymongo.py ../mongo_regex.py ../PymongoLecture.py

    real  0m0.078s
    user  0m0.024s
    sys 0m0.036s

    real  0m0.086s
    user  0m0.040s
    sys 0m0.028s

    real  0m0.082s
    user  0m0.036s
    sys 0m0.028s

    /usr/bin/time -v  ./parallel_copy.py --dst=/home/simon/parallel_test ../hinting.py ../limit_skip_sort.py ../ProcessWhatcher.py ../upsert_pymongo.py ../insert_pymongo.py ../HelloWorld.py ../find_modify_pymongo.py ../mongo_regex.py ../PymongoLecture.py

      Command being timed: "./parallel_copy.py --dst=/home/simon/parallel_test ../hinting.py ../limit_skip_sort.py ../ProcessWhatcher.py ../upsert_pymongo.py ../insert_pymongo.py ../HelloWorld.py ../find_modify_pymongo.py ../mongo_regex.py ../PymongoLecture.py"
      User time (seconds): 0.03
      System time (seconds): 0.02
      Percent of CPU this job got: 75%
      Elapsed (wall clock) time (h:mm:ss or m:ss): 0:00.08
      Average shared text size (kbytes): 0
      Average unshared data size (kbytes): 0
      Average stack size (kbytes): 0
      Average total size (kbytes): 0
      Maximum resident set size (kbytes): 24256
      Average resident set size (kbytes): 0
      Major (requiring I/O) page faults: 0
      Minor (reclaiming a frame) page faults: 18271
      Voluntary context switches: 61
      Involuntary context switches: 40
      Swaps: 0
      File system inputs: 0
      File system outputs: 72
      Socket messages sent: 0
      Socket messages received: 0
      Signals delivered: 0
      Page size (bytes): 4096
      Exit status: 0

      Command being timed: "./parallel_copy.py --dst=/home/simon/parallel_test ../hinting.py ../limit_skip_sort.py ../ProcessWhatcher.py ../upsert_pymongo.py ../insert_pymongo.py ../HelloWorld.py ../find_modify_pymongo.py ../mongo_regex.py ../PymongoLecture.py"
      User time (seconds): 0.04
      System time (seconds): 0.02
      Percent of CPU this job got: 78%
      Elapsed (wall clock) time (h:mm:ss or m:ss): 0:00.08
      Average shared text size (kbytes): 0
      Average unshared data size (kbytes): 0
      Average stack size (kbytes): 0
      Average total size (kbytes): 0
      Maximum resident set size (kbytes): 24256
      Average resident set size (kbytes): 0
      Major (requiring I/O) page faults: 0
      Minor (reclaiming a frame) page faults: 18293
      Voluntary context switches: 61
      Involuntary context switches: 39
      Swaps: 0
      File system inputs: 0
      File system outputs: 72
      Socket messages sent: 0
      Socket messages received: 0
      Signals delivered: 0
      Page size (bytes): 4096
      Exit status: 0



  # Using threads
    time  ./parallel_copy.py --dst=/home/simon/parallel_test -t ../hinting.py ../limit_skip_sort.py ../ProcessWhatcher.py ../upsert_pymongo.py ../insert_pymongo.py ../HelloWorld.py ../find_modify_pymongo.py ../mongo_regex.py ../PymongoLecture.py

    real  0m0.048s
    user  0m0.032s
    sys 0m0.012s

    real  0m0.044s
    user  0m0.028s
    sys 0m0.016s

    real  0m0.048s
    user  0m0.032s
    sys 0m0.012s

    /usr/bin/time -v  ./parallel_copy.py -t --dst=/home/simon/parallel_test ../hinting.py ../limit_skip_sort.py ../ProcessWhatcher.py ../upsert_pymongo.py ../insert_pymongo.py ../HelloWorld.py ../find_modify_pymongo.py ../mongo_regex.py ../PymongoLecture.py

      Command being timed: "./parallel_copy.py -t --dst=/home/simon/parallel_test ../hinting.py ../limit_skip_sort.py ../ProcessWhatcher.py ../upsert_pymongo.py ../insert_pymongo.py ../HelloWorld.py ../find_modify_pymongo.py ../mongo_regex.py ../PymongoLecture.py"
      User time (seconds): 0.02
      System time (seconds): 0.00
      Percent of CPU this job got: 87%
      Elapsed (wall clock) time (h:mm:ss or m:ss): 0:00.04
      Average shared text size (kbytes): 0
      Average unshared data size (kbytes): 0
      Average stack size (kbytes): 0
      Average total size (kbytes): 0
      Maximum resident set size (kbytes): 24912
      Average resident set size (kbytes): 0
      Major (requiring I/O) page faults: 0
      Minor (reclaiming a frame) page faults: 11076
      Voluntary context switches: 203
      Involuntary context switches: 33
      Swaps: 0
      File system inputs: 0
      File system outputs: 72
      Socket messages sent: 0
      Socket messages received: 0
      Signals delivered: 0
      Page size (bytes): 4096
      Exit status: 0

      Command being timed: "./parallel_copy.py -t --dst=/home/simon/parallel_test ../hinting.py ../limit_skip_sort.py ../ProcessWhatcher.py ../upsert_pymongo.py ../insert_pymongo.py ../HelloWorld.py ../find_modify_pymongo.py ../mongo_regex.py ../PymongoLecture.py"
      User time (seconds): 0.01
      System time (seconds): 0.02
      Percent of CPU this job got: 90%
      Elapsed (wall clock) time (h:mm:ss or m:ss): 0:00.04
      Average shared text size (kbytes): 0
      Average unshared data size (kbytes): 0
      Average stack size (kbytes): 0
      Average total size (kbytes): 0
      Maximum resident set size (kbytes): 25040
      Average resident set size (kbytes): 0
      Major (requiring I/O) page faults: 0
      Minor (reclaiming a frame) page faults: 11081
      Voluntary context switches: 236
      Involuntary context switches: 49
      Swaps: 0
      File system inputs: 0
      File system outputs: 72
      Socket messages sent: 0
      Socket messages received: 0
      Signals delivered: 0
      Page size (bytes): 4096
      Exit status: 0


# Ruby
  # Using threads
     time  ./parallel_copy.rb -t --dst=/home/simon/parallel_test ../hinting.py ../limit_skip_sort.py ../ProcessWhatcher.py ../upsert_pymongo.py ../insert_pymongo.py ../HelloWorld.py ../find_modify_pymongo.py ../mongo_regex.py ../PymongoLecture.py

    real  0m0.057s
    user  0m0.036s
    sys 0m0.012s

    real  0m0.061s
    user  0m0.036s
    sys 0m0.016s

    real  0m0.059s
    user  0m0.044s
    sys 0m0.008s

    /usr/bin/time -v  ./parallel_copy.rb -t --dst=/home/simon/parallel_test ../hinting.py ../limit_skip_sort.py ../ProcessWhatcher.py ../upsert_pymongo.py ../insert_pymongo.py ../HelloWorld.py ../find_modify_pymongo.py ../mongo_regex.py ../PymongoLecture.py

      Command being timed: "./parallel_copy.rb -t --dst=/home/simon/parallel_test ../hinting.py ../limit_skip_sort.py ../ProcessWhatcher.py ../upsert_pymongo.py ../insert_pymongo.py ../HelloWorld.py ../find_modify_pymongo.py ../mongo_regex.py ../PymongoLecture.py"
      User time (seconds): 0.04
      System time (seconds): 0.00
      Percent of CPU this job got: 86%
      Elapsed (wall clock) time (h:mm:ss or m:ss): 0:00.06
      Average shared text size (kbytes): 0
      Average unshared data size (kbytes): 0
      Average stack size (kbytes): 0
      Average total size (kbytes): 0
      Maximum resident set size (kbytes): 33568
      Average resident set size (kbytes): 0
      Major (requiring I/O) page faults: 0
      Minor (reclaiming a frame) page faults: 7057
      Voluntary context switches: 84
      Involuntary context switches: 18
      Swaps: 0
      File system inputs: 0
      File system outputs: 72
      Socket messages sent: 0
      Socket messages received: 0
      Signals delivered: 0
      Page size (bytes): 4096
      Exit status: 0

      Command being timed: "./parallel_copy.rb -t --dst=/home/simon/parallel_test ../hinting.py ../limit_skip_sort.py ../ProcessWhatcher.py ../upsert_pymongo.py ../insert_pymongo.py ../HelloWorld.py ../find_modify_pymongo.py ../mongo_regex.py ../PymongoLecture.py"
      User time (seconds): 0.04
      System time (seconds): 0.00
      Percent of CPU this job got: 88%
      Elapsed (wall clock) time (h:mm:ss or m:ss): 0:00.05
      Average shared text size (kbytes): 0
      Average unshared data size (kbytes): 0
      Average stack size (kbytes): 0
      Average total size (kbytes): 0
      Maximum resident set size (kbytes): 33600
      Average resident set size (kbytes): 0
      Major (requiring I/O) page faults: 0
      Minor (reclaiming a frame) page faults: 7065
      Voluntary context switches: 88
      Involuntary context switches: 18
      Swaps: 0
      File system inputs: 0
      File system outputs: 72
      Socket messages sent: 0
      Socket messages received: 0
      Signals delivered: 0
      Page size (bytes): 4096
      Exit status: 0
```