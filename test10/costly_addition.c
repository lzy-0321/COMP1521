#include <stdlib.h>
#include <pthread.h>

void *increment_and_sleep(void *arg);

void costly_addition(int num)
{
    // Using pthread_create, create one thread for each call to increment_and_sleep so that all the sleeps can be done concurrently.
    pthread_t threads[num];
    for (int i = 0; i < num; i++) {
        pthread_create(&threads[i], NULL, increment_and_sleep, NULL);
    }
    for (int i = 0; i < num; i++) {
        pthread_join(threads[i], NULL);
    }
}
