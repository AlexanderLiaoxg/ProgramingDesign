#include <stdio.h>

/*�ú��������ж��Ƿ���Ҫ�������1 or 0*/
int Fixed(int* x,int* y){
   int t;
   if((*x)>(*y))
   {
       t = (*x);
       (*x) = (*y);
       (*y) = t;
       return 1;
   }else{
     return 0;
   }

}

void Fixed2(int* x,int* y){
   int t;
   if((*x)>(*y))
   {
       t = (*x);
       (*x) = (*y);
       (*y) = t;

   }
return 0;
}
