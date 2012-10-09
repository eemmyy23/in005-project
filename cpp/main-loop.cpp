#include<stdio.h> 
#include <stdlib.h> //to call system() func
#include <pthread.h> //for threads
#include <unistd.h> //for usleep
void * fn_thread(void * number); //thread header
static int counter = 0;
int main(){
	printf("\nI am the main program\n");
	printf("\nThere is nothing eles to do\n");
	//system("bash/update.sh");

	pthread_t thread;
	int ret;
  int i = 5*10; //ecah 5 seconds
  static int counter = 0;

	if ((ret = pthread_create(& thread, NULL, fn_thread, (void *) i)) != 0) {
		printf("\nERROR creating thread\n");
    exit(EXIT_FAILURE);
        }

	for(;;);
	
	printf("\nI won't be executed\n");	
	return true;
}

void * fn_thread(void * num) {
    int number = (int) num;
    while (true) {
        usleep(number * 100000);
        //XXXXXX
        counter++;
        fprintf(stdout, "Thread %d : counter = %d\n", number, counter);
    }
    pthread_exit(NULL);
}
