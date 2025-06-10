#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <signal.h>
#include <setjmp.h>
#include <string.h>

int ft_atoi_base(const char *nptr);

int main(void)
{
	char nb[4] = "546";
	printf("\"%s\" : atoi= %d\n", nb, ft_atoi_base("456"));
}