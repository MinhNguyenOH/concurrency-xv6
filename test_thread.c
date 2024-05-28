/*
Teammates: Greg, Shawn, Minh
CS372 - HW6
Date 11/10/2022
*/

#include "types.h"
#include "user.h"
#include "stat.h"
#include "param.h"


int test_number = 21;
int number = 0;
lock_t myLock;

void thread_func(void *s, void *i) {
  printf(1, "First arg: %s, second arg: %d\n", s, (int)i); // how to dereference void data type
  printf(1, "test_number in thread: %d\n", test_number);   // make sure number in thread is not changed
  printf(1, "thread pid: %d\n", getpid());
  exit();
}

void addVar(void * ptrVal, void * secondArg) {
  for (int i = 0; i < 100; i++) 
  {
    // add lock to critical section to avoid race condition
    lock_aquire(&myLock);
    *(int *)ptrVal += 1;
    printf(1, "No race condition allowed\n");
    lock_release(&myLock);
  }
  printf(1, "Value: %d\n", *(int *)ptrVal);
  exit();
}

int main(){
  char * s = "Hello";
  int a = 0;
  int * i = &a;
  lock_t myLock;
  lock_init(&myLock);
  thread_create(addVar, i, s);
  thread_create(addVar, i, s);
  thread_create(addVar, i, s);
  thread_create(addVar, i, s);
  thread_join();
  thread_join();
  thread_join();
  thread_join();
  printf(1, "This should print after lock is released\n");
  exit();
  return 0;
}