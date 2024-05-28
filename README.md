# Kernel Threads Project

## Introduction
Welcome to the Kernel Threads project! In this project, you'll be adding real kernel threads to the xv6 operating system. This is an exciting step in becoming a proficient kernel developer.

## Objectives
In this project, you will:
1. Define a new system call `clone()` to create a kernel thread.
2. Define a new system call `join()` to wait for a thread.
3. Build a thread library using `clone()`, with functions `thread_create()`, `lock_acquire()`, and `lock_release()`.

## System Calls

### clone()
The `clone()` system call creates a new kernel thread that shares the calling process's address space. The function prototype is:
```c
int clone(void (*fcn)(void *, void *), void *arg1, void *arg2, void *stack);
```
- **fcn**: Function pointer to the thread function.
- **arg1**: First argument to the thread function.
- **arg2**: Second argument to the thread function.
- **stack**: User stack for the new thread.

### join()
The `join()` system call waits for a child thread to exit. The function prototype is:
```c
int join(void **stack);
```
- **stack**: Pointer to the child thread's user stack location.

## Thread Library

### thread_create()
The `thread_create()` function creates a new thread.
```c
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2);
```
- **start_routine**: Function pointer to the thread function.
- **arg1**: First argument to the thread function.
- **arg2**: Second argument to the thread function.

### thread_join()
The `thread_join()` function waits for a thread to exit.
```c
int thread_join();
```

### Lock Functions
- **lock_acquire(lock_t *)**: Acquires the lock.
- **lock_release(lock_t *)**: Releases the lock.
- **lock_init(lock_t *)**: Initializes the lock.

## Implementation Details

### Building clone() from fork()
To implement `clone()`, study and adapt the `fork()` system call. The `fork()` implementation in `kernel/proc.c` serves as a template for `clone()`. The key differences include:
- Sharing the address space between parent and child threads.
- Setting up the kernel stack for the new thread.
- Passing arguments to the new thread function.

### Address Space Management
Ensure proper handling of address space growth in a multi-threaded process, especially when calling `malloc()` which may trigger `sbrk()`.

## Files
- **syscall.h**: Header file for system calls.
- **syscall.c**: Implementation of system calls.
- **ulib.c**: User library implementation.
- **user.h**: User library header.
- **test_thread.c**: Test file for threads.
- **sysproc.c**: System process implementation.

## Resources
- Refer to the book chapter on ticket locks for implementing `lock_acquire()` and `lock_release()`.
- For atomic fetch-and-add, see the Wikipedia page on x86 `xaddl` instruction.
- Understand x86 calling conventions from "Programming From The Ground Up", specifically Chapter 4.

## Conclusion
Follow the instructions and implement the required functionalities to complete the Kernel Threads project. Happy coding and enjoy your journey into kernel development!

## Usage
Compile and run your xv6 environment with the new system calls and thread library to test your implementation. Use `test_thread.c` to verify the correctness of your thread library functions.
