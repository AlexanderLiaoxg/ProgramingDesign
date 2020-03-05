#include <stdio.h>

#define MAXSIZE 20
#define PLACENUM 12
#define INF 9999           // 此处定义999为无穷大

struct
{
    int vexnum,arcnum;  //节点数和边数
    int vexs[MAXSIZE];      // 节点名
    int arcs[MAXSIZE][MAXSIZE];   //俩个节点之间的值
} net;

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

void creatNet(char Place[PLACENUM][28])
{
    int i,j,k,power;
    char buf[28];
    FILE* fp = fopen("地名.txt","r");
    FILE* fp1 = fopen("距离.txt","r");

    for(i=0; i<PLACENUM; i++)
    {
        net.vexs[i] = i;
        for(j=0; j<PLACENUM; j++)
        {
            net.arcs[i][j]=999;        // 初始化边与边之间的关系
        }
    }

    net.vexnum = PLACENUM;

    for(i=0; i<PLACENUM; i++)
    {
        fscanf(fp,"%s", buf);
        strcpy(Place[i],buf);
    }
    /*输入点与其他点的距离*/
    for(i=0; i<PLACENUM; i++)
    {
        for(j=0; j<PLACENUM; j++)
        {
            if(i==j)
            {
                continue;
            }
            fscanf(fp1,"%d",&net.arcs[i][j]);
        }
    }
}

void findBG(char Place[PLACENUM][28],int *beginning,int *goal)  //
{
    int i,a;
    char b[28],g[28],ch;
    //   getchar()均为测试出来的，未深究
    printf("I am stay at :\n");
    scanf("%s",b);
    printf("I want to go :");
    scanf("%s",g);
    printf("\n");
    for(i=0; i<PLACENUM; i++)
    {
        if(!(strcmp(b,Place[i])))        //strcmp若相等返回0，b大于Place[i]返回正数，小于返回负数
        {
            *beginning = i;
        }
        else if(!(strcmp(g,Place[i])))
        {
            *goal = i;
        }
    }
    if((*beginning>PLACENUM||*beginning<0))
    {
        printf("您的所在地输入错误！");
        exit(0);
    }
    if(*goal>PLACENUM||*goal<0)
    {
        printf("没有找到你所要寻找的地名！");
        exit(0);
    }
    printf("本次行程：从 %s 到 %s\n\n",b,g);
}

int WhichCarCome(int b,int CarNum,char Place[PLACENUM][28],LinkList L)
{
    int i,min=INF,buf=0,number,distance;
    int flag1,flag2=b;
    LinkList p;
    p =L;
    /*遍历每一俩车，自动寻找匹配最近的车俩*/
    for(i=0; i<CarNum; i++)
    {
        p=p->next;
        flag1 = p->Location;
        Fixed2(&flag1,&flag2);                 //  只要求值无向，故只需要在此便可以了
        buf = Dijkstra(Place,p->Location,b,0,0);         // buf 中间值为 车到起点的最短路径
        if(min>buf)
        {
            min = buf;
            number = i;                    //  记录第i个车俩
        }
        if(b==(p->Location))
        {
            number = i;
            break;
        }
    }
    return number;
}

int Dijkstra(char Place[PLACENUM][28],int x,int y,int is_printf,int is_ReverseOut)   // printf参数是用来决定输出与否的要素
{
    int path[PLACENUM];
    int PATHINF = -1;
    int i,j,k;            //flag 用于路径递增
    int min;
    int u;   //下一个放入集合p的点
    int dis[PLACENUM];   //  最短路径
    int mark[PLACENUM];   //   遍历点集合p,未被mark的便是集合u
    /*首先进行最短路径初始化*/
    for(i=0; i<PLACENUM; i++)
    {
        mark[i] = 0;
        dis[i] = net.arcs[x][i];       // 已经赋予起点路径     重点!!!
        if(dis[i]<INF)
        {
            path[i]=x;
        }
        else
        {
            path[i] = -1;
        }

    }

    mark[x]=1;          // 初始点被放入p集合
    path[0]=x; // 记录path:  起点

    for(k=1; k<PLACENUM; k++)
    {
        min = INF;   //  min初始化最大值，便于后来数据替换（每一个点的出度入度判断）
        for(i=1; i<PLACENUM; i++)
        {
            if(u==y)
            {
                path[y]=y;                //   设置路径终点
                break;
            }

            if(mark[i]==0&&min>dis[i])      //min>dis[i]  判断已被源点初始化的最短路径，未被初始化的点应当min==dis[i]  //!!!可以多次比较
            {
                min = dis[i];                //在已知初始化路径中，寻找最短路径的点并将他作为下一个点u点
                u=i;
            }
        }

        mark[u]=1;      //标记u点,放入集合p


        for(i=0; i<PLACENUM; i++)
        {

            if(!mark[i]&&dis[i]>dis[u]+net.arcs[u][i])       // ！mark[i]判断不去走回头路，dis[i]>dis[u]+net.arcs[u][i]有俩个用途：①若u链接的是x源点没有赋值最短路径的点，那么这里可以赋值②若是赋值过的点，那么可以判断是上一个dis[i]（此时是被赋值过的）是不是真正的最短路径，即修正。
            {
                dis[i] = dis[u] + net.arcs[u][i];
                path[i]= u;                                                      // 路径名会重复，（原因是初始化下一个节点赋值的原因，A->D,A->E,A->F）
            }

        }
        //判断了最短路径  （俩个节点内），已经确定了的
        //随着修正最短路径修正值路径值
    }

  /**消除重复，不会经过的path赋值**/
    for(i=0; i<PLACENUM; i++)
    {
        for(j=i+1; j<PLACENUM; j++)
        {
            if(path[j]==path[i])
            {
                path[j]=PATHINF;
            }
        }
    }

 /**判断并输出**/
    if(is_printf)
    {
        if(is_ReverseOut)
        {
            printf("       ★★★★★★★最短路径为★★★★★★★       \n");
        for(i=y; i>=0; i--)
        {
            if(path[i]!=PATHINF||i==y)
            {
                if(i==y)
            {
                printf("%s",Place[y]);       //  前面消除把后面的消除了
                continue;
            }
                printf("->%s",Place[path[i]]);
            }

        }
        printf("\n");
        }
        else{
        printf("       ★★★★★★★最短路径为★★★★★★★       \n");
        for(i=0; i<=y; i++)
        {
            if(path[i]!=PATHINF)
            {
                if(i==0)
            {
                printf("%s",Place[path[i]]);
                continue;

            }
                printf("->%s",Place[path[i]]);
            }
        }
        }
       printf("\n");
    }

    return dis[y];
}


void display(char Place[PLACENUM][28])
{
    int i,j,flag1,flag2;
    printf("输出信息");
    for(i=0; i<PLACENUM; i++)
    {
        for(j=0; j<PLACENUM; j++)
        {
            if(i==j)
            {
                continue;
            }
            printf("%s %s %d\n",Place[net.vexs[i]],Place[net.vexs[j]],net.arcs[i][j]);
        }
    }

}

void Map(char Place[PLACENUM][28])
{
    int i;
    for(i=0; i<PLACENUM; i++)
    {
        printf("%s\n",Place[i]);
    }

}

