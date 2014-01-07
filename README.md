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
chmod +x parallel_copy.py
# copy two files (text.txt Errors.go) using threads into `/home/simon` directory
./parallel_copy.py --dst=/home/simon -t /home/simon/Documents/texto.txt /home/simon/Documents/Go/Errors.go

```
