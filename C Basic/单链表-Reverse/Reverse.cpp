#include <stdio.h>
#include<stdlib.h>
typedef int ElemType;

typedef struct node{
    ElemType data;
    struct node *next;
}LNode,*LinkList;
bool LList_print(LinkList &L);
LinkList Tail_Insert(LinkList &L);
LinkList Reverse(LinkList &L);
int main(void){
    LinkList La,Lb;
    La=Tail_Insert(La);
    Lb=Reverse(La);
    LList_print(Lb);
    return 0;
}
LinkList Reverse(LinkList &L){
    LNode *q,*q2;
    q=L->next;
    L->next=NULL;
    while(q!=NULL){
        q2=q->next;
        q->next=L->next;
        L->next=q;
        q=q2;
    }

    return L;
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
    return L;
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
