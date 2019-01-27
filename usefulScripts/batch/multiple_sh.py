#!/usr/bin/env python
# https://docs.python.org/2/library/threading.html

import sys 
import time
import threading

nWorker = 4 
gateTime = 0.5 

import os
def worker(iArg):
    os.system(iArg)

if len(sys.argv) == 2:
    f = open(sys.argv[1],"r")
    for iLine in f.readlines():
        iLine = iLine.lstrip().rstrip('\n')
        t = threading.Thread(target=worker, args=(iLine,))
        while True:
            if threading.activeCount() < nWorker:
                t.start()
                break
            else:
                time.sleep(gateTime)
