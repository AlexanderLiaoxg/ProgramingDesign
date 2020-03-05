#include <stdio.h>
#include <stdlib.h>

#define MAXSIZE 20
#define PLACENUM 12
#define INF 9999           // 此处定义999为无穷大

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

int main()
{
    int beginning=99,goal=99,ShortestPath,is_ReverseOut;
    int NUM=0;  // 车俩数量
    int number;  // 找到的车的编号
    char Place[PLACENUM][28];
    LinkList L;
    int flag;
    char flag2;
    getLine(&NUM);    // 获得车俩数
    L = creat(L,NUM);
    //show(L,NUM);
    Menu(L,NUM);
    creatNet(Place);
    //display(Place);
    while(flag2!=EOF)
    {
    Map(Place);
    findBG(Place,&beginning,&goal);
    number = WhichCarCome(beginning,NUM,Place,L);
    is_ReverseOut = Fixed(&beginning,&goal);   //如果需要转换起始点和终点
    ShortestPath = Dijkstra(Place,beginning,goal,0,is_ReverseOut);  //得值
    L = AutoReply(L,number,ShortestPath);
    ShortestPath = Dijkstra(Place,beginning,goal,1,is_ReverseOut);  //输出路径
    printf("       最短路径值为：             %d",ShortestPath);
    printf("\n\nEnter EOF to out\n\n");
    printf("            Please enter anything to continue...");getchar();flag2 = getchar();system("cls");
    }
    Menu(L,NUM);
    return 0;
}
