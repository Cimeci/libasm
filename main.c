#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <signal.h>
#include <setjmp.h>
#include <string.h>

int ft_atoi(const char *nptr);
int ft_atoi_base(const char *nptr);

int main(void)
{
	char nb1[4] = "546";
	char nb2[5] = "-546";

	printf("\"%s\" : atoi= %d\n", nb1, ft_atoi(nb1));
	printf("\"%s\" : atoi_base= %d\n", nb1, ft_atoi(nb1));
	printf("\"%s\" : atoi_base= %d\n", nb2, ft_atoi_base(nb2));
}