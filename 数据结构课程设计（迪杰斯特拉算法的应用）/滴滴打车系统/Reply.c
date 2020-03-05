#include <stdio.h>
#include <windows.h>
#include <string.h>
#include <stdlib.h>

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

LinkList AutoReply(LinkList L,int number,int ShortestPath)
{
    LinkList p;
    p =L;
    int Money,i;
    float NowStar;
    char information[60];
    char MoneyChar[20];
    //LinkList q = L;
    //MessageBox(NULL,"正在为您匹配离您最近的快车","Loding... ...",MB_OK);

    Sleep(600);
    printf("小娜已经在拼命的寻找，客官您稍等一下... ...\n\n");
    p=p->next;
    for(i=0;i<number;i++)
    {
        p=p->next;
    }
    strcpy(information,p->Model);
    strcat(information,"（");
    strcat(information,p->Color);
    strcat(information,")");
    strcat(information,p->Licenseplate);
    strcat(information,"    为您服务！");
    MessageBox(NULL,information,"客官，小娜给您找来马车了~",MB_OK);
    Money = Pay(ShortestPath);
    printf("\n %d￥\n",Money);
    /**求Money的位数和改为Char类型**/
    itoa(Money,MoneyChar,10);
    char ch[60]="预计您需要支付";
    strcat(ch,MoneyChar);
    strcat(ch,"元");
    MessageBox(NULL,ch,"请支付",MB_OK);
    int choose = MessageBox(NULL,"您要对本次服务做出评价吗？",p->Licenseplate,MB_YESNO);
    if(choose==IDYES)
    {
        printf("请输入此次评价:\n");
        scanf("%f",&NowStar);
        p->StarSUM+=NowStar;
        p->StarNUM++;
        p->Star = p->StarSUM/p->StarNUM;

    }
    if(choose==IDNO)
    {
        printf("默认好评！\n");
        p->StarNUM++;
        p->StarSUM+=5;
    }
    return L;
}

int Pay(int Kilometer)
{
    int pay;
    if(Kilometer<=20)
    {
        pay = 6;   //起步价
    }
    if(Kilometer>20)
    {
        pay = 6 + (Kilometer-3)*2;   //超路径每公里价
    }
    return pay;
}
