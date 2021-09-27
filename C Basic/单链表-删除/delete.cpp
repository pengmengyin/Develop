#include <stdio.h>
#include<stdlib.h>
typedef int ElemType;

typedef struct node{
    ElemType data;
    struct node *next;
}LNode,*LinkList;
bool LList_print(LinkList &L);
LinkList Tail_Insert(LinkList &L);
LinkList Delete(LinkList &L,ElemType);
int main(void){
    LinkList La,Lb;
    La=Tail_Insert(La);
    Lb=Delete(La,5);
    LList_print(Lb);
    return 0;
}
LinkList Delete(LinkList &L,ElemType x){
    LNode *p=L,*q=L->next,*temp;
    while(q!=NULL)
    {
        if(q->data==x){
            temp=q->next;
            p->next=q->next;
            free(q);
            q=temp;
        }
        else{
            p=p->next;
            q=q->next;
        }
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
