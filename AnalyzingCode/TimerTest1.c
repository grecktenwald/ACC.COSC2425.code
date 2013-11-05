#include <stdio.h>
#include <time.h>
    
// timing empty loops

int main(int argc, char * argv[]) {
    long    count = 1000000000L;
    clock_t start, finish;
    double  duration;
        
    // Measure the duration of an event.
    printf("Time to do %ld empty loops is ", count);
    start = clock();

    // the empty loop
    while( count-- ) ;

    finish = clock();
    duration = (double)(finish - start) / CLOCKS_PER_SEC;
    printf("%f seconds\n", duration);
}
