#include<stdio.h>
#include<stdlib.h>
typedef char elemtype;
typedef struct binode{
  char data;
  struct binode *lchild,*rchild;
}binode,*bitree;
Create_BinaryTree(bitree &T){
  char c;
  scanf("%c",&c);
  if(c==' '){
    T=NULL;
}
  else{
     T=(bitree)malloc(sizeof(binode));

     T->data=c;
     Create_BinaryTree(T->lchild);
     Create_BinaryTree(T->rchild);

}
}
visit(char c){
  printf("%c ",c);
}

preordertraverse(bitree &T)

{

if( T )

{

visit(T->data);

preordertraverse(T->lchild);

preordertraverse(T->rchild);


}

}
midordertraverse(bitree &T)
{

if( T )

{



midordertraverse(T->lchild);

visit(T->data);
midordertraverse(T->rchild);


}

}
postordertraverse(bitree &T)

{

if( T )

{
postordertraverse(T->lchild);
postordertraverse(T->rchild);
visit(T->data);

}
}
int main(void){
    bitree B1;
    Create_BinaryTree(B1);
    midordertraverse(B1);
    printf("\n");
    midordertraverse(B1);
     printf("\n");
     postordertraverse(B1);
    return 0;
}
