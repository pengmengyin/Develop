#include <stdio.h>
#include<stdlib.h>
typedef int ElemType;

typedef struct node{
    ElemType data;
    struct node *next;
}LNode,*LinkList;
LinkList Head_Insert(LinkList &L);
LinkList Tail_Insert(LinkList &L);
bool LList_print(LinkList &L);

int main(void){
    LinkList La;
    int choose;
    printf("please Switch Crate LinkList:\n");
    printf("1 Head_Insert:\n");
    printf("2 Tail_Insert:\n");
    scanf("%d",&choose);
    if(choose!=1&&choose!=2)
    {
        printf("Please Re-enter:\n");
        printf("please Switch Crate LinkList:\n");
    printf("1 Head_Insert:\n");
    printf("2 Tail_Insert:\n");
    scanf("%d",&choose);
    }
    switch(choose){
        case 1:
            La=Head_Insert(La);break;
        case 2:
            La=Tail_Insert(La);break;
        default:break;
    }

    LList_print(La);

}
LinkList Head_Insert(LinkList &L){
    int x;
    LNode *q,*p;
    L=(LinkList)malloc(sizeof(LNode));

    L->next=NULL;
    p=L;

    scanf("%d",&x);
    while(x!=999){
        q=(LNode*)malloc(sizeof(LNode));
        q->data=x;
        q->next=p->next;
        p->next=q;
        scanf("%d",&x);
    }
    return p;
}

LinkList Tail_Insert(LinkList &L){
    L=(LinkList)malloc(sizeof(LNode));
    int x;
    LNode *p,*q;
    p=L;
    L->next=NULL;
    scanf("%d",&x);
    while(x!=999){
        q=(LNode*)malloc(sizeof(LNode));
        q->data=x;
        q->next=p->next;
        p->next=q;
        p=q;
        scanf("%d",&x);
    }
<<<<<<< HEAD
<<<<<<< HEAD

=======
  return L;
>>>>>>> 39df828 (Algorithm)
=======
  return L;
>>>>>>> 39df828823fb1fd45c989133066f3fc337e170b8
}
bool LList_print(LinkList &L)
{
    LNode *p=L->next;
    if(p==NULL)
        return false;
    while(p){
        printf("%d ",p->data);
        p=p->next;
    }
    return true;
}
