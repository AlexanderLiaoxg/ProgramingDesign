#include <stdio.h>

#define MAXSIZE 20
#define PLACENUM 12
#define INF 9999           // �˴�����999Ϊ�����

struct
{
    int vexnum,arcnum;  //�ڵ����ͱ���
    int vexs[MAXSIZE];      // �ڵ���
    int arcs[MAXSIZE][MAXSIZE];   //�����ڵ�֮���ֵ
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
    FILE* fp = fopen("����.txt","r");
    FILE* fp1 = fopen("����.txt","r");

    for(i=0; i<PLACENUM; i++)
    {
        net.vexs[i] = i;
        for(j=0; j<PLACENUM; j++)
        {
            net.arcs[i][j]=999;        // ��ʼ�������֮��Ĺ�ϵ
        }
    }

    net.vexnum = PLACENUM;

    for(i=0; i<PLACENUM; i++)
    {
        fscanf(fp,"%s", buf);
        strcpy(Place[i],buf);
    }
    /*�������������ľ���*/
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
    //   getchar()��Ϊ���Գ����ģ�δ�
    printf("I am stay at :\n");
    scanf("%s",b);
    printf("I want to go :");
    scanf("%s",g);
    printf("\n");
    for(i=0; i<PLACENUM; i++)
    {
        if(!(strcmp(b,Place[i])))        //strcmp����ȷ���0��b����Place[i]����������С�ڷ��ظ���
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
        printf("�������ڵ��������");
        exit(0);
    }
    if(*goal>PLACENUM||*goal<0)
    {
        printf("û���ҵ�����ҪѰ�ҵĵ�����");
        exit(0);
    }
    printf("�����г̣��� %s �� %s\n\n",b,g);
}

int WhichCarCome(int b,int CarNum,char Place[PLACENUM][28],LinkList L)
{
    int i,min=INF,buf=0,number,distance;
    int flag1,flag2=b;
    LinkList p;
    p =L;
    /*����ÿһ�������Զ�Ѱ��ƥ������ĳ���*/
    for(i=0; i<CarNum; i++)
    {
        p=p->next;
        flag1 = p->Location;
        Fixed2(&flag1,&flag2);                 //  ֻҪ��ֵ���򣬹�ֻ��Ҫ�ڴ˱������
        buf = Dijkstra(Place,p->Location,b,0,0);         // buf �м�ֵΪ �����������·��
        if(min>buf)
        {
            min = buf;
            number = i;                    //  ��¼��i������
        }
        if(b==(p->Location))
        {
            number = i;
            break;
        }
    }
    return number;
}

int Dijkstra(char Place[PLACENUM][28],int x,int y,int is_printf,int is_ReverseOut)   // printf���������������������Ҫ��
{
    int path[PLACENUM];
    int PATHINF = -1;
    int i,j,k;            //flag ����·������
    int min;
    int u;   //��һ�����뼯��p�ĵ�
    int dis[PLACENUM];   //  ���·��
    int mark[PLACENUM];   //   �����㼯��p,δ��mark�ı��Ǽ���u
    /*���Ƚ������·����ʼ��*/
    for(i=0; i<PLACENUM; i++)
    {
        mark[i] = 0;
        dis[i] = net.arcs[x][i];       // �Ѿ��������·��     �ص�!!!
        if(dis[i]<INF)
        {
            path[i]=x;
        }
        else
        {
            path[i] = -1;
        }

    }

    mark[x]=1;          // ��ʼ�㱻����p����
    path[0]=x; // ��¼path:  ���

    for(k=1; k<PLACENUM; k++)
    {
        min = INF;   //  min��ʼ�����ֵ�����ں��������滻��ÿһ����ĳ�������жϣ�
        for(i=1; i<PLACENUM; i++)
        {
            if(u==y)
            {
                path[y]=y;                //   ����·���յ�
                break;
            }

            if(mark[i]==0&&min>dis[i])      //min>dis[i]  �ж��ѱ�Դ���ʼ�������·����δ����ʼ���ĵ�Ӧ��min==dis[i]  //!!!���Զ�αȽ�
            {
                min = dis[i];                //����֪��ʼ��·���У�Ѱ�����·���ĵ㲢������Ϊ��һ����u��
                u=i;
            }
        }

        mark[u]=1;      //���u��,���뼯��p


        for(i=0; i<PLACENUM; i++)
        {

            if(!mark[i]&&dis[i]>dis[u]+net.arcs[u][i])       // ��mark[i]�жϲ�ȥ�߻�ͷ·��dis[i]>dis[u]+net.arcs[u][i]��������;������u���ӵ���xԴ��û�и�ֵ���·���ĵ㣬��ô������Ը�ֵ�����Ǹ�ֵ���ĵ㣬��ô�����ж�����һ��dis[i]����ʱ�Ǳ���ֵ���ģ��ǲ������������·������������
            {
                dis[i] = dis[u] + net.arcs[u][i];
                path[i]= u;                                                      // ·�������ظ�����ԭ���ǳ�ʼ����һ���ڵ㸳ֵ��ԭ��A->D,A->E,A->F��
            }

        }
        //�ж������·��  �������ڵ��ڣ����Ѿ�ȷ���˵�
        //�����������·������ֵ·��ֵ
    }

  /**�����ظ������ᾭ����path��ֵ**/
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

 /**�жϲ����**/
    if(is_printf)
    {
        if(is_ReverseOut)
        {
            printf("       �����������·��Ϊ��������       \n");
        for(i=y; i>=0; i--)
        {
            if(path[i]!=PATHINF||i==y)
            {
                if(i==y)
            {
                printf("%s",Place[y]);       //  ǰ�������Ѻ����������
                continue;
            }
                printf("->%s",Place[path[i]]);
            }

        }
        printf("\n");
        }
        else{
        printf("       �����������·��Ϊ��������       \n");
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
    printf("�����Ϣ");
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

