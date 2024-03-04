# Parallel Buffer Management with POSIX Threads

This repository contains a C implementation demonstrating the use of POSIX threads (pthreads) for managing a circular buffer in a multi-threaded environment. The project is part of practical work assigned in the "Architecture of Operating Systems" class during the 3d year of my Bachelor's degree (Computer Science degree at University of Strasbourg). It showcases thread synchronization mechanisms like mutexes, condition variables, and barriers to coordinate access to a shared buffer between multiple producer and consumer threads. You can access the assignement description in the root of this repository.

The initial code framework was provided by the instructors, and my contribution begins with implementing the thread function `un_thread` and the main control flow in `main`. The goal was to deepen my understanding of thread synchronization in C using pthreads.

## Overview

The application simulates a scenario where multiple threads (consumers) wait for integers to be added to a shared circular buffer by the main thread (producer). Each consumer thread reads an integer, simulates work by sleeping for a number of seconds equal to the integer value, and then waits for all threads to finish their work before displaying a synchronization message. The main thread populates the buffer with work items and coordinates shutdown by signaling consumer threads to terminate.

## Features

- Demonstrates the use of mutexes to protect access to a shared resource in a multi-threaded environment.
- Uses condition variables to efficiently block and wake threads based on buffer full and empty conditions.
- Employs a barrier to synchronize thread completion before proceeding.
- Implements a circular buffer for efficient FIFO data handling between threads.

## Usage

Compile the program with:
```
gcc -o thr_sync thr_sync.c -lpthread
```

Run the program by specifying the number of consumer threads and the buffer size, followed by a series of integers representing the workload for each thread:
```
./thr_sync <nthreads> <szbuf> <v1> <v2> ... <vn>
```

- `<nthreads>`: Number of consumer threads.
- `<szbuf>`: Size of the circular buffer.
- `<v1> ... <vn>`: Workload integers; each consumer thread will sleep for these many seconds.

## Example

Run the program with 4 consumer threads and a buffer size of 2, with a workload of 1, 2, 3, and 4 seconds:
```
./thr_sync 4 2 1 2 3 4
```

3 test scripts are also provided, you can run them with :
```
sh test1.sh
sh test2.sh
sh test3.sh
```

## Additional Notes

- This README.md was created with the assistance of ChatGPT 3.5.

- This program was tested on Linux only.
