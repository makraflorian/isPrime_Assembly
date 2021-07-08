# include <stdio.h>

extern int is_prime(int value) ;
//gcc -m32 -g -o prog feladat.S prog.c

int main () {

int result = is_prime(7);
printf ("Prim? %d\n", result);

return 0;
}