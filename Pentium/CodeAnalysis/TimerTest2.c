#include <stdio.h>
#include <time.h>
    
// timing data sort

void sort(int A[], int count);

// test data
int data[] = { 5, 2, 8, 10, 45, 32, 2, 5, 7, 100 };
int test[10];

int main(int argc, char * argv[]) {
    long    count = 100000000L;
    clock_t start, finish;
    double  duration;
    int i;
        
    // Measure the duration of an event.
    printf("Time to do %ld sorts is ", count);
    start = clock();
    while(count--) {
        for(i=0;i<10;i++)
            test[i] = data[i];
        sort(test,10);
    }
    finish = clock();
    duration = (double)(finish - start) / CLOCKS_PER_SEC;
    printf("%f seconds\n", duration);
}

