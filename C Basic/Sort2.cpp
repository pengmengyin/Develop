#include <stdio.h>
void swap(int *a,int *b);
void Sort_Bubble(int A[],int n);
void Sort_Insert(int A[],int n);
void Sort_Shell(int A[],int n);
void Sort_Quick(int A[],int low,int high);
void Sort_Choose(int A[],int n);
void Sort_Merge(int A[],int n);
int main(void){
    int B[10];
    int i=0;
    while(1){
        scanf("%d",&B[i]);
        i++;
        if(B[i-1]==-1)
            break;

    }
    //Sort_Insert(B,i-1);
    //Sort_Shell(B,i-1);
    //Sort_Quick(B,0,i-2);
    Sort_Choose(B,i-1);
    for(int j=0;j<i-1;j++){
    printf("%d ",B[j]);}

    return 0;
}


void Sort_Shell(int A[],int n){  //Ï£¶ûÅÅÐò
    int x=n/2,i=0,j,k,temp;
    while(x>0){
        j=i+x;
        while(j<n){

            if(A[j-x]>A[j]){
            temp=A[j];
            printf("%d",temp);
            k=j-x;
            while(k>i){
                A[k+x]=A[k];
                k=k-x;
            }
            A[k]=temp;
            }
            j=j+x;
        }
        i++;
        if(i>=n/2){
            x=x-1;
            i=0;
        }
    }
}
void Sort_Merge(int A[],int n){
    int low=0,high=mid+1,mid=n/2;
    int C[n];
    while(low<high){
        if(A[low]<A[high])
    }
}
void Sort_Quick(int A[],int low,int high){  //¿ìËÙÅÅÐò
    int i=low,j=high;
    if(i<j){
    int temp=A[i];
    while(i<j){
        while(j>i&&A[j]>temp)j--;
        A[i]=A[j];
        while(i<j&&A[i]<temp)i++;
        A[j]=A[i];
    }
    A[i]=temp;
    Sort_Quick(A,low,i-1);
    Sort_Quick(A,i+1,high);
    }
}
void Sort_Insert(int A[],int n){ //²åÈë
    int i,j;
    int temp;
    for(i=1;i<n;i++)
    {
       temp=A[i];
       j=i;
       while(j>0&&temp<A[j-1]){j--;A[j+1]=A[j];}
       A[j]=temp;
    }
}
void Sort_Bubble(int A[],int n){ //Ã°ÅÝ
    int i,j;
    for(i=0;i<n;i++){
        for(j=n-1;j>=i;j--){
                if(A[j]>A[j+1])
                {
                swap(&A[j],&A[j+1]);
                }
            }
    }

}
void Sort_Choose(int A[],int n){ //Ñ¡Ôñ
    int i=0,j;
    int min;
    for(i=0;i<n;i++)
    {
        min=i;
        for(j=i+1;j<n;j++){
                if(A[j]<A[min]){
                    min=j;
                }
            swap(&A[min],&A[i]);
        }
    }
}
void swap(int *a,int *b){
    int temp;
    temp=*a;
    *a=*b;
    *b=temp;
}
