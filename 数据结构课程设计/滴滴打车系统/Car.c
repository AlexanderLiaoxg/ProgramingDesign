#include <stdio.h>

#define MAXSIZE 16


typedef struct
{
    int Array[MAXSIZE];
    int length;
} Car;

typedef struct
{
    int Location;
    char Model[20];
    int V;
    char Color[20];
    float Star;
    float StarSUM;
    float StarNUM;
    int Licenseplate[20];
    struct LNODE *next;
} LNODE,*LinkList;

LinkList creat(LinkList L,int CarNum)
{
    int i;
    LinkList p,q;
    char buf[28];        //赋名中间函数
    char CarName[CarNum][28];
    FILE* fp = fopen("车俩信息.txt","a+");
    L = (LinkList)malloc(sizeof(LNODE));
    L->next =NULL; // 初始化链表 先建立一个带头结点的空链表
    //q= (LinkList)malloc(sizeof(LNODE)); //  q 本身是一个节点 （important）
    q=L;
    for(i=0; i<CarNum; i++)
    {
        p= (LinkList)malloc(sizeof(LNODE));
        if(!p)
        {
            exit(0);    //  异常判断
        }
        fscanf(fp,"%d",&p->Location);
        fscanf(fp,"%s",p->Model);
        fscanf(fp,"%d",&p->V);
        fscanf(fp,"%s",p->Color);
        fscanf(fp,"%f",&p->Star);
        p->StarNUM = 1;
        p->StarSUM = 5;
        fscanf(fp,"%s",p->Licenseplate);


        p->next=NULL;
        q->next=p;
        q=p;   //q指向新节点*P  （ p向右移一位）
//        p->next=L->next; // 整理p，使p不再指向自己
//        L->next=p;       //整理完后使L下一个节点指向p    // 前插法
    }
    return L;
}

LinkList insert(LinkList L,int* CarNum)
{
    LinkList p,q;
    int i=0;
    p=L;
    while(p&&i<CarNum)
    {
        p=p->next;
        i++;
    }
    q = (LinkList)malloc(sizeof(LNODE));
    printf("Please input the Location of Car\n");
    scanf("%d",&q->Location);
    printf("Please input the Model of Car\n");
    scanf("%s",q->Model);
    printf("Please input the V of Car\n");
    scanf("%d",&q->V);
    printf("Please input the Color of Car\n");
    scanf("%s",q->Color);
    printf("Please input the Star of Car\n");
    scanf("%f",&q->Star);
    printf("Please input the Licenseplate of Car\n");
    scanf("%s",q->Licenseplate);
    q->next = NULL;
    p->next = q;
    p=q;                 // p向右移一位
    return L;
}

void show(LinkList L,int* CarNum)
{
    int i;
    LinkList p;
    p = L->next;
    for(i=0; i<CarNum; i++)
    {
        printf("I am outputting:     ");
        printf("%s      %d      %s      (★)%.2f      %s       \n",p->Model,p->V,p->Color,p->Star,p->Licenseplate);
        p=p->next;
    }
}

LinkList delet(LinkList L,int* CarNum)
{
    int i,x;
    LinkList p,q;
    p=L;
    printf("Please enter your number of data to deletes:");
    scanf("%d",&x);
    for(i=0; i<x-1; i++)
    {
        p=p->next;
    }
    q=p->next;
    p->next = q->next;//q=q->next
    free(q);
    return L;
}






