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
    //MessageBox(NULL,"����Ϊ��ƥ����������Ŀ쳵","Loding... ...",MB_OK);

    Sleep(600);
    printf("С���Ѿ���ƴ����Ѱ�ң��͹����Ե�һ��... ...\n\n");
    p=p->next;
    for(i=0;i<number;i++)
    {
        p=p->next;
    }
    strcpy(information,p->Model);
    strcat(information,"��");
    strcat(information,p->Color);
    strcat(information,")");
    strcat(information,p->Licenseplate);
    strcat(information,"    Ϊ������");
    MessageBox(NULL,information,"�͹٣�С�ȸ�����������~",MB_OK);
    Money = Pay(ShortestPath);
    printf("\n %d��\n",Money);
    /**��Money��λ���͸�ΪChar����**/
    itoa(Money,MoneyChar,10);
    char ch[60]="Ԥ������Ҫ֧��";
    strcat(ch,MoneyChar);
    strcat(ch,"Ԫ");
    MessageBox(NULL,ch,"��֧��",MB_OK);
    int choose = MessageBox(NULL,"��Ҫ�Ա��η�������������",p->Licenseplate,MB_YESNO);
    if(choose==IDYES)
    {
        printf("������˴�����:\n");
        scanf("%f",&NowStar);
        p->StarSUM+=NowStar;
        p->StarNUM++;
        p->Star = p->StarSUM/p->StarNUM;

    }
    if(choose==IDNO)
    {
        printf("Ĭ�Ϻ�����\n");
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
        pay = 6;   //�𲽼�
    }
    if(Kilometer>20)
    {
        pay = 6 + (Kilometer-3)*2;   //��·��ÿ�����
    }
    return pay;
}
