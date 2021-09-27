#include<stdio.h>
int find_d(int fn,int e);
int pow_mod(int a,int x,int n);
int main(void){
    int p=1111111111;
    int q=2111111111;
    int n=p*q;
    int fn=(p-1)*(q-1);
    int e=65537;
    int d=find_d(fn,e);
    int m=201;
    int c=pow_mod(m,e,n);
    printf("%d\n",c);
    c=pow_mod(c,d,n);
    printf("%d",c);
    return 0;
}

int find_d(int fn,int e){
    int d;
	for(int i=0;i<9000000;i++){
		if((i*fn+1)%e==0){

			d=(i*fn+1);

			return d;
			}
			}
}
int pow_mod(int a,int x,int n){

	int res = 1;
	while (x){
		if (x & 1){
			res = (res * a) % n;}
        x>>=1;
        a = (a * a) % n ;
	}

	return res;
}
