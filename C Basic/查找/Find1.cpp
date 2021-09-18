#include<stdio.h>
int find(int A[],int m,int a);
int main(void){
      int B[10];
    int i=0;
    while(1){
        scanf("%d",&B[i]);
        i++;
        if(B[i-1]==-1)
            break;
    }
    i=i-1;
    printf("%d\n",find(B,i,5));

    return 0;
}
int find(int A[],int m,int a){
    int low=0,high=m-1,mid=(low+high)/2;
    while((low<=high)&&(A[mid]!=a)){
        if(A[mid]>a){
                high=mid-1;}
        else {
                low=mid+1;}
        mid=(low+high)/2;
    }
    if(low<=high)
        return mid;
    else
        return -1;
}



