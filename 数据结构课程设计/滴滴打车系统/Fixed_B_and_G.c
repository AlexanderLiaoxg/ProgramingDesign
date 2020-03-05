#include <stdio.h>

/*该函数用来判断是否需要逆向输出1 or 0*/
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
