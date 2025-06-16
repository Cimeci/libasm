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
int ft_atoi_check_base(const char *nptr, const char *base);

void test(char *str, char *base, int expected) {
	int result = ft_atoi_base(str, base);
	if (result == expected)
		printf("✅ \"%s\" | \"%s\" => %d\n", str, base, result);
	else
		printf("❌ \"%s\" | \"%s\" => %d (expected %d)\n", str, base, result, expected);
}

int main(void)
{
	char nb1[4] = "10";
	char nb2[5] = "-546";
	char nb3[5] = "+42";
	char nb4[7] = " +42 ";
	char nb5[10] = "\t\n\v\f\r -42";
	char nb6[10] = "\t\n\v\f\r -4B";
	char base_dec[11] = "0123456789";
	char base_hex[17] = "0123456789ABCDEF";
	char base_hex_err[17] = "0123456789ABCCEF";
	char base_bin[3] = "01";

	printf("\"%s\" : atoi= %d\n", nb1, ft_atoi(nb1));
	printf("\"%s\" : atoi_sign= %d\n", nb1, ft_atoi_sign(nb1));
	printf("\"%s\" : atoi_sign= %d\n", nb2, ft_atoi_sign(nb2));
	printf("\"%s\" : atoi_sign= %d\n", nb3, ft_atoi_sign(nb3));
	printf("\"%s\" : atoi_sign_space= %d\n", nb4, ft_atoi_sign_space(nb4));
	printf("\"\\t\\n\\v\\f\\r -42 \" : %d\n", ft_atoi_sign_space(nb5));
	printf("\"%s\" | \"%s\" : atoi_base= %d\n", nb4, base_dec, ft_atoi_base(nb4, base_dec));
	printf("\"%s\" | \"%s\" : atoi_base= %d\n", nb1, base_dec, ft_atoi_base(nb1, base_dec));
	printf("\"%s\" | \"%s\" : atoi_base= %d\n", nb1, base_hex, ft_atoi_base(nb1, base_hex));
	printf("\"\\t\\n\\v\\f\\r -4B \" | \"%s\" : atoi_base= %d\n", base_hex, ft_atoi_base(nb6, base_hex));
	printf("\"%s\" | \"%s\" : atoi_check_base= %d\n", nb1, base_hex_err, ft_atoi_check_base(nb1, base_hex_err));
	printf("\"%s\" | \"%s\" : atoi_check_base= %d\n", nb1, base_hex, ft_atoi_check_base(nb1, base_hex));
	printf("-------------------- atoi_base -----------------\n");
	printf("\"%s\" | \"%s\" : atoi_base= %d\n", nb1, base_hex_err, ft_atoi_base(nb1, base_hex_err));
	printf("\"\\t\\n\\v\\f\\r -42 \" | \"%s\" : atoi_base= %d\n", base_hex_err, ft_atoi_base(nb5, base_hex_err));
	printf("\"\\t\\n\\v\\f\\r -4B \" | \"%s\" : atoi_base= %d\n", base_hex, ft_atoi_base(nb6, base_hex));
	printf("\"%s\" | \"%s\" : atoi_base= %d\n", nb2, base_bin, ft_atoi_base(nb2, base_bin));
	printf("\"%s\" | \"%s\" : atoi_base= %d\n", nb1, base_bin, ft_atoi_base(nb1, base_bin));

	// dec
	test("42", "0123456789", 42);
	test("   +42", "0123456789", 42);
	test("   -42", "0123456789", -42);
	test("000123", "0123456789", 123);
	test("-000123", "0123456789", -123);

	// Hexa
	test("1A", "0123456789ABCDEF", 26);
	test("FF", "0123456789ABCDEF", 255);
	test("-4B", "0123456789ABCDEF", -75);
	test("  +10", "0123456789ABCDEF", 16);
	test("  -10", "0123456789ABCDEF", -16);

	// Binaire
	test("1010", "01", 10);
	test("-1010", "01", -10);
	test("   +11111111", "01", 255);

	// Base 8
	test("377", "01234567", 255);
	test("-377", "01234567", -255);

	// Base 36
	test("Z", "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ", 35);
	test("10", "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ", 36);

	// white space
	test(" \t\n\v\f\r123", "0123456789", 123);

	// err
	test("12AB", "0123456789", 12);
	test("ZZZ", "0123456789ABCDEF", 0);
	test("123!", "0123456789", 123);
	test("7FZ", "0123456789ABCDEF", 127);

	// nb to high
	test("7FFFFFFF", "0123456789ABCDEF", 2147483647);
	test("-80000000", "0123456789ABCDEF", -2147483648);

}