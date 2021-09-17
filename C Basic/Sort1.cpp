#include <stdio.h>
int fab(int n);
int main(void){
    printf("%d",fab(10));
}
int fab(int n){
    if(n>2){
        printf("%d ",fab(n-2));
        return fab(n-2)+n;
    }
   else
    return 1;
}
