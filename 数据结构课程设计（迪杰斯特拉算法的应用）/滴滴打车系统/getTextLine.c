#include <stdio.h>

void getLine(int* CarNum)
{
    FILE* fp = fopen("������Ϣ.txt","r");
    int i;
    char ch;
    while(!feof(fp))
    {
        ch=fgetc(fp);
        if(ch=='\n'){
            (*CarNum)++;
        }
    }
    (*CarNum)++;
    fclose(fp);
}
