#include <stdio.h>
#include<stdlib.h>
typedef int ElemType;

typedef struct node{
    ElemType data;
    struct node *next;
}LNode,*LinkList;
bool LList_print(LinkList &L);
LinkList Tail_Insert(LinkList &L);
LinkList Merge(LinkList &La,LinkList &Lb,LinkList &Lc);
int main(void){
    LinkList La,Lb,Lc;
    La=Tail_Insert(La);
    Lb=Tail_Insert(Lb);
    Lc=Merge(La,Lb,Lc);
    LList_print(Lc);
    return 0;
}
LinkList Merge(LinkList &La,LinkList &Lb,LinkList &Lc){
    LNode *p1=La->next,*p2=Lb->next,*p3,*q;
    Lc=(LinkList)malloc(sizeof(LNode));
    Lc->next=NULL;
    q=Lc;
    while(p1!=NULL&&p2!=NULL){
        if(p1->data<p2->data){
            p3=p1->next;
            p1->next=q->next;
            q->next=p1;
            p1=p3;
        }
        else{
            p3=p2->next;
            p2->next=q->next;
            q->next=p2;
            p2=p3;
        }
        q=q->next;

    }
    while(p1!=NULL)
    {
        p3=p1->next;
        p1->next=q->next;
        q->next=p1;
        p1=p3;
        q=q->next;
    }
    while(p2!=NULL){
        p3=p2->next;
        p2->next=q->next;
        q->next=p2;
        p2=p3;
        q=q->next;
            }


    return Lc;
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
