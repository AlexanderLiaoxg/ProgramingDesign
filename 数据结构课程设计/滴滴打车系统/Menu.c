#include <stdio.h>

typedef struct
{
    int Location;
    char Model[20];
    int V;
    char Color[20];
    float Star;
    int StarSUM;
    int StarNUM;
    int Licenseplate[20];
    struct LNODE *next;
} LNODE,*LinkList;

void Menu(LinkList L,int NUM)
{

    char flag;
    printf("\n\n\n\n\n\n\n\n\n\n\n\n                               Openning the system of DIDI,Please wait for a minute... ...");
    Sleep(888);       //  ����
    system("cls");
        printf("\n\n\n\n\n\n\n                    �������������Please input 1~2 to choose�������������\n\n\n");
        printf("                                                  �����ִ�(EOF)\n\n");
        printf("                                                  �ڳ�������\n");
    while((flag=getchar())!='1')
    {

        switch(flag)
         {
        case '2':
            Menu2(L,NUM);printf("\n\nOUT");
            break;
         }
        system("cls");
        printf("\n\n\n\n\n\n\n                    �������������Please input 1~2 to choose�������������\n\n\n");
        printf("                                                  �����ִ�(EOF)\n\n");
        printf("                                                  �ڳ�������\n");

    }
    system("cls");
}

void Menu2(LinkList L,int NUM)
{
    char flag;
    printf("Please input 1~3 to choose:\n");
    while((flag=getchar())!='4')
    {

        system("cls");printf("%d",flag);
        printf("\n\n\n\n\n\n\n                    �������������Please input 1~3 to choose�������������\n\n\n\n");
        printf("                                                  ����ʾ������Ϣ\n");
        printf("                                                  �ڼ��복����Ϣ\n");
        printf("                                                  ��ѡ��ɾ��������Ϣ\n");
        printf("                                                  �ܷ������˵�(EOF)\n");
        switch(flag)
         {
        case '1':
            show(L,NUM);getchar();printf("            Please enter anything to continue...");
            break;
        case '2':
            Demo();
            L = insert(L);
            NUM++;
            break;
        case '3':
            L = delet(L);
            NUM--;
            break;
        case '4':
            break;
        }

    }
}

void Demo()
{
    printf("\n                               DEMO :      12 ���� 270 ������ 5 ��G67890\n");
}
