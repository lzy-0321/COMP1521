
#include <pthread.h>
#include "thread_chain.h"

// create 50 child threads
// each thread run the function thread_hello()
void *my_thread(void *data) {
    int n_increments = * (int *) data;
    
    return NULL;
}

void my_main(void) {
    pthread_t thread_handle;
    pthread_create(&thread_handle, NULL, my_thread, NULL);

    pthread_join(thread_handle, NULL);
}

void thread_hello(int *p) {
	printf ("Hello this is thread #%d: i=%d\n", *p, i);
}
