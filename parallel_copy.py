#!/usr/bin/env python

import os
import stat
import sys
import getopt
import threading
from subprocess import call

thread = False
fork = True
src = None
dst = None
_dir = False
files = None
children = []

# PATHS
CP_PATH = "/bin/cp"
# END PATHS

def copy( _file ):
    _str = "%(path)s %(file)s %(dst)s" % { "path": CP_PATH, "file": _file, "dst": dst }
    call(_str, stdin=None, shell=True)

def copy_with_threads():
    if not _dir:
        current_thread = threading.currentThread()

        for _file in files:
            print _file, "\n"
            child_thread = threading.Thread(target=copy, name= _file, args=( _file, ))
            child_thread.start()

        for thread in threading.enumerate():
            if thread is current_thread:
                continue
            thread.join()

def copy_with_forks():
    global children
    os.setpgid(os.getpid(), os.getpid())
    if not _dir:
        for _file in files:
            if os.fork() == 0:
                children.append(os.getpid())
                copy( _file )

        for child in children:
            os.waitpid(child, 0)

def search_file( _file ):
    file_path = os.getcwd() + "/"+ _file
    if os.path.exists(file_path):
        return file_path
    elif os.path.exists(_file):
        return _file
    else:
        print _file, "Doesn't exist"
        raise Exception(_file + " Doesn't exist")

def verify_files():
    for _file in files:
        _file = search_file(_file)

def parse_options():
    global thread, fork, src, dst, files, _dir

    try:
        opts, args = getopt.getopt(sys.argv[1:], "h t f d", ["help", "with-threads", "with-forks", "dir", "src=", "dst="])

        for opt, arg in opts:
            if opt in ("-h", "--help"):
                pass
            elif opt in ("-d","--dir"):
                _dir = True
            elif opt == "--src":
                src = arg
            elif opt == "--dst":
                dst = arg
            elif opt in ("-t","--with-threads"):
                thread, fork = True, False
                pass
            elif opt in ("-f", "--with-forks"):
                thread, fork = False, True
                pass
            else:
                raise getopt.GetoptError("Unknown option\n")

        if len(args) == 0:
            raise Exception("No Files supplied\n")
        else:
            files = args
            verify_files()
    except getopt.GetoptError as err:
        print str(err)

if __name__ == '__main__':
    parse_options()
    if dst == None or len(dst) == 0:
        raise Exception("Destination must be supplied.\n")
    elif _dir == True and src == None:
        raise Exception("if -d or --dir flag is true source path must be supplied.\n")
    elif thread:
        copy_with_threads()
    elif forks:
        copy_with_forks()
