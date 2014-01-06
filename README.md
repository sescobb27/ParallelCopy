## Author
#### Simon Escobar Benitez

### Options
> --dst= Destination

> -d or --dir Parallel Copy a directory

> --src= Source Directory for Parallel Copy ( Must be a Directory -d )

> -t or --with-threads Parallel Copy using threads

> -f or --with-forks Parallel Copy using forks (processes)

### Usage
```bash
chmod +x parallel_copy.py
# copy two files (text.txt Errors.go) using threads into `/home/simon` directory
./parallel_copy.py --dst=/home/simon -t /home/simon/Documents/texto.txt /home/simon/Documents/Go/Errors.go

```
