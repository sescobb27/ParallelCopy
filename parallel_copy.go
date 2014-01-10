package main

import (
	"flag"
	"fmt"
	"io"
	"os"
	"path/filepath"
	"regexp"
	"syscall"
)

const (
	SYS_TYPE        = "_system_type"
	REGEX           = "(?i)linux"
	PROCESSOR_REGEX = "processor\t:"
	CPU_INFO_PATH   = "/proc/cpuinfo"
	CP_PATH         = "/bin/cp"
)

func verifyDir(dir *string) {

}

func searchFile(file *string) {
	// file_path, _errorDir := os.Getwd()
	// file_path += "/" + *file

	if _, _errorExist := os.Stat(*file); os.IsNotExist(_errorExist) {
		file_path, _ := filepath.Abs(*file)
		if _, _errorExist = os.Stat(file_path); os.IsNotExist(_errorExist) {
			fmt.Fprintf(os.Stderr, "%s Doesn't exist\n", *file)
			syscall.Exit(1)
		} else {
			file = &file_path
		}
	}
}

func verifyFiles(files *[]string) {
	for _, file := range *files {
		searchFile(&file)
		fmt.Fprintf(os.Stdout, "Exists: %s\n", file)
	}
}

func countProcessors(count_processors *uint) {
	env := os.Getenv(SYS_TYPE)
	regex := regexp.MustCompile(REGEX)
	if regex.MatchString(env) {
		file, _fileError := os.Open(CPU_INFO_PATH)
		if _fileError != nil {
			fmt.Fprint(os.Stderr, "Error: %s", _fileError)
			syscall.Exit(1)
		}
		buf := make([]byte, 1024)
		regex = regexp.MustCompile(PROCESSOR_REGEX)
		for {
			bytes, _readError := file.Read(buf)
			if _readError != nil && _readError != io.EOF {
				fmt.Fprintf(os.Stderr, "Error: %s", _readError)
				syscall.Exit(1)
			}

			if bytes == 0 {
				break
			}

			matches := regex.FindAllString(string(buf[:bytes]), -1)
			*count_processors += uint(len(matches))
		}
	}
}

func copyWithForks() {

}

func copyWithThreads() {

}

func main() {
	thread := flag.Bool("t", false, "Parallel Copy using threads")
	fork := flag.Bool("f", true, "Parallel Copy using processes")
	dir := flag.Bool("d", false, "Copy a directory in Parallel")
	src := flag.String("src", "", "Source Directory")
	dst := flag.String("dst", "", "Destination Directory")
	processor_count := flag.Uint("p", 0, "Number of processes or threads created (Use this option with precaution you can run out of memory ), by default the maximum number of threads and processes created is the number of cores your pc have")
	flag.Parse()

	files := flag.Args()

	if !*dir && len(files) == 0 {
		fmt.Fprintf(os.Stderr, "No Files supplied\n")
		syscall.Exit(1)
	}

	verifyFiles(&files)

	if len(*dst) == 0 {
		fmt.Fprintf(os.Stderr, "Destination must be supplied.\n")
		syscall.Exit(1)
	} else if *dir {
		verifyDir(src)
	}

	verifyDir(dst)

	if *dir && len(*src) == 0 {
		fmt.Println("Error on Source Directory")
		syscall.Exit(1)
	}

	if *processor_count == 0 {
		countProcessors(processor_count)
	}

	if *thread {
		*fork = false
	}

	if *fork {
		copyWithForks()
	} else {
		copyWithThreads()
	}
}
