## Author
#### Simon Escobar Benitez

#### Python version: 2.7.3
#### Ruby version: 2.1.0

### Options
> --dst=[Destination]

> -d or --dir # Copy a directory in Parallel, not implemented yet

> --src=\[Source Directory\]( Must be a Directory -d )

> -t or --with-threads # Parallel Copy using threads

> -f or --with-forks # Parallel Copy using forks (processes), not finished yet

### Usage
```bash

# copy two files (file1 file2 ... ) using threads/processes into `[DIR]` directory

# Python
  python parallel_copy.py --dst=[DIR] -t file1 file2 ...  # using threads
  python parallel_copy.py --dst=[DIR] -f file1 file2 ...  # using processes
  
  chmod +x parallel_copy.py
  ./parallel_copy.py --dst=[DIR] -t file1 file2 ...  # using threads
  ./parallel_copy.py --dst=[DIR] -f file1 file2 ...  # using processes
  
# Ruby
  ruby parallel_copy.rb -t --dst=[DIR] file1 file2 ... # using threads
  ruby parallel_copy.rb -f --dst=[DIR] file1 file2 ... # using processes
  
  chmod +x parallel_copy.rb
  ./parallel_copy.rb -t --dst=[DIR] file1 file2 ... # using threads
  ./parallel_copy.rb -f --dst=[DIR] file1 file2 ... # using processes

```
