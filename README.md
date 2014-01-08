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

```