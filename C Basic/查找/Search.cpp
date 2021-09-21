#include<stdio.h>
int BinarySearch(int A[],int m,int a);
int SequenceSearch(int A[],int m, int a);
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
    printf("%d\n",BinarySearch(B,i,5));
    printf("%d\n",SequenceSearch(B,i,5));

    return 0;
}

//二分查找,适用于递增序列,时间复杂度O(log2n)
int BinarySearch(int A[],int m,int a){
    int low=0,high=m-1,mid=(low+high)/2;
    while((low<=high)&&(A[mid]!=a)){
        if(A[mid]>a){
                high=mid-1;}
        else {
                low=mid+1;}
        mid=(low+high)/2;
    }
    if(low<=high)
        return low;
    else
        return -1;
}

//顺序查找，时间复杂度O(n)
int SequenceSearch(int A[],int m,int a){
    int i=0;
    while(A[i]!=-1){
        if(A[i]==a){
            return i;
        }
        i++;
    }
    return -1;
}



