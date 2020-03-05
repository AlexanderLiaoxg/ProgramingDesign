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
    Sleep(888);       //  仿真
    system("cls");
        printf("\n\n\n\n\n\n\n                    ★★★★★★★★★★★★Please input 1~2 to choose★★★★★★★★★★★★\n\n\n");
        printf("                                                  ①嘀嘀打车(EOF)\n\n");
        printf("                                                  ②车俩管理\n");
    while((flag=getchar())!='1')
    {

        switch(flag)
         {
        case '2':
            Menu2(L,NUM);printf("\n\nOUT");
            break;
         }
        system("cls");
        printf("\n\n\n\n\n\n\n                    ★★★★★★★★★★★★Please input 1~2 to choose★★★★★★★★★★★★\n\n\n");
        printf("                                                  ①嘀嘀打车(EOF)\n\n");
        printf("                                                  ②车俩管理\n");

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
        printf("\n\n\n\n\n\n\n                    ★★★★★★★★★★★★Please input 1~3 to choose★★★★★★★★★★★★\n\n\n\n");
        printf("                                                  ①显示车俩信息\n");
        printf("                                                  ②加入车俩信息\n");
        printf("                                                  ③选择删除车俩信息\n");
        printf("                                                  ④返回主菜单(EOF)\n");
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
    printf("\n                               DEMO :      12 大众 270 土豪金 5 湘G67890\n");
}
