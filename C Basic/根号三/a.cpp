#include <stdio.h>
#include <math.h>
int main(void){
    int i=0;
    double low=1.5,high=2,mid=(low+high)/2,c=3.0;
    while(i<200){
        if(pow(low,2)<c){
            low=(low+mid)/2;}
        if(pow(high,2)>c)
        {
            high=(high+mid)/2;
        }
        i++;
    }
    printf("%.100lf\n",(low+high)/2);
    return 0;
}
