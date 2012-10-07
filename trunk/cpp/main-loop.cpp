#include<stdio.h>
#include <stdlib.h> //to call system() func
int main(){
printf("\nI am the main program\n");
printf("\nThere is nothing eles to do\n");
system("bash/update.sh");
for(;;);

printf("\nI won't be executed\n");
return true;
}
