#define _POSIX_C_SOURCE 200809L

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <signal.h>
#include <setjmp.h>
#include <string.h>

jmp_buf jump_buffer;

void segfault_handler(int sig)
{
	(void)sig;
	longjmp(jump_buffer, 1);
}

#define TRY(fn_call)                                      \
	do {                                                  \
		if (setjmp(jump_buffer) == 0) {                   \
			fn_call;                                      \
		} else {                                          \
			printf("❌ Segfault caught during: %s\n", #fn_call); \
		}                                                 \
	} while (0)

size_t	ft_strlen(const char *s);
char	*ft_strcpy(char *dst, const char *src);
int		ft_strcmp(const char *s1, const char *s2);
ssize_t	ft_write(int fd, const void *buf, size_t count);
ssize_t	ft_read(int fd, void *buf, size_t count);
char	*ft_strdup(const char *s);

void test_strlen()
{
	printf("=== ft_strlen ===\n");
	printf("✅ \"Hello\" → %zu\n", ft_strlen("Hello"));
	TRY((void)ft_strlen(NULL));
	printf("\n");
}

void test_strcpy()
{
	printf("=== ft_strcpy ===\n");
	char buffer[100];
	printf("✅ Copy: %s\n", ft_strcpy(buffer, "Copy this!"));
	TRY((void)ft_strcpy(buffer, NULL));
	TRY((void)ft_strcpy(NULL, "Hello"));
	printf("\n");
}

void test_strcmp()
{
	printf("=== ft_strcmp ===\n");
	printf("✅ Compare 'abc'/'abc': %d\n", ft_strcmp("abc", "abc"));
	printf("✅ Compare 'abc'/'abd': %d\n", ft_strcmp("abc", "abd"));
	TRY((void)ft_strcmp(NULL, "hello"));
	TRY((void)ft_strcmp("hello", NULL));
	printf("\n");
}

void test_write()
{
	printf("=== ft_write ===\n");
	ft_write(1, "✅ Writing OK\n", 14);
	TRY((void)ft_write(1, NULL, 5));
	TRY((void)ft_write(-1, "bad fd\n", 7));
	printf("\n");
}

void test_read()
{
	printf("=== ft_read ===\n");
	char buffer[100];
	int fd = open("main.c", O_RDONLY);
	if (fd >= 0)
	{
		ssize_t ret = ft_read(fd, buffer, 100);
		if (ret >= 0)
		{
			buffer[ret] = '\0';
			printf("✅ Read Makefile:\n%s\n", buffer);
		}
		else
			printf("❌ Read failed\n");
		}
		else
		printf("❌ Cannot open Makefile\n");
		
	char *nullbuf = NULL;
	TRY((void)ft_read(0, nullbuf, 10));
	close(fd);
	printf("\n");
}

void test_strdup()
{
	printf("=== ft_strdup ===\n");
	char *s = ft_strdup("Hello!");
	printf("✅ ft_strdup: %s\n", s);
	free(s);
	TRY((void)ft_strdup(NULL));
	printf("\n");
}

int main(void)
{
	struct sigaction sa;
	sa.sa_handler = segfault_handler;
	sigemptyset(&sa.sa_mask);
	sa.sa_flags = SA_NODEFER;
	sigaction(SIGSEGV, &sa, NULL);

	test_strlen();
	test_strcpy();
	test_strcmp();
	test_write();
	test_read();
	test_strdup();

	return 0;
}
