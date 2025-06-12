#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <signal.h>
#include <setjmp.h>
#include <string.h>

int ft_atoi(const char *nptr);
int ft_atoi_sign(const char *nptr);
int ft_atoi_sign_space(const char *nptr);
int ft_atoi_base(const char *nptr, const char *base);

int main(void)
{
	char nb1[4] = "546";
	char nb2[5] = "-546";
	char nb3[5] = "+42";
	char nb4[7] = " +42 ";
	char nb5[10] = "-42 \t\n\v\f\r";
	char base_dec[10] = "0123456789";
	char base_hex[16] = "0123456789ABCDEF";

	printf("\"%s\" : atoi= %d\n", nb1, ft_atoi(nb1));
	printf("\"%s\" : atoi_sign= %d\n", nb1, ft_atoi_sign(nb1));
	printf("\"%s\" : atoi_sign= %d\n", nb2, ft_atoi_sign(nb2));
	printf("\"%s\" : atoi_sign= %d\n", nb3, ft_atoi_sign(nb3));
	printf("\"%s\" : atoi_sign_space= %d\n", nb4, ft_atoi_sign_space(nb4));
	printf("%d\n", ft_atoi_sign_space(nb5));
	printf("\"%s\" | \"%s\" : atoi_base= %d", nb4, base_dec, ft_atoi_atoi(nb4, base_dec));
	printf("\"%s\" | \"%s\" : atoi_base= %d", nb1, base_hex, ft_atoi_atoi(nb1, base_hex));
}