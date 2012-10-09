#include<stdio.h> 
#include <stdlib.h> //to call system() func
#include <pthread.h> //for threads
#include <unistd.h> //for usleep
void * update_thread(void * seconds); //thread header
static int counter = 0;
int main(){
	printf("\nI am the main program\n");
	
	pthread_t thread;
	int ret;
  int update_time = 5; //recheck every n seconds
  static int counter = 0;
	printf("\nStarted the update thread.It will run each %d seconds\n", update_time);
	if ((ret = pthread_create(& thread, NULL, update_thread, (void *) update_time)) != 0) {
		printf("\nERROR creating thread\n");
    exit(EXIT_FAILURE);
	}


printf("\nThere is nothing eles to do\n");
	for(;;);
	
	printf("\nI won't be executed\n");	
	return true;
}

void * update_thread(void * seconds) {
    int sleep = (int) seconds;
    while (true) {
        usleep(sleep * 1000000);
				fprintf(stdout, "Checking for updates ....");        
				system("bash/update.sh");
				fprintf(stdout, "\n");        
    }
    pthread_exit(NULL);
}
