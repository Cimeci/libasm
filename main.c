/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: inowak-- <inowak--@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/06 20:46:50 by inowak--          #+#    #+#             */
/*   Updated: 2025/06/07 17:04:26 by inowak--         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>

size_t  ft_strlen(const char *s);
char    *ft_strcpy(char *dst, const char *src);
int     ft_strcmp(const char *s1, const char *s2);
// ssize_t ft_write(int fd, const void *buf, size_t count);
// ssize_t ft_read(int fd, void *buf, size_t count);
// char    *ft_strdup(const char *s);

int main(void)
{
    char buffer[100];
    char *src = "Hello, libasm!";
    char *dup;
    ssize_t ret;

    printf("ft_strlen(\"%s\") = %zu\n", src, ft_strlen(src));

    ft_strcpy(buffer, src);
    printf("ft_strcpy: buffer = \"%s\"\n", buffer);

    printf("ft_strcmp(\"abc\", \"abd\") = %d\n", ft_strcmp("abc", "abd"));
    printf("ft_strcmp(\"abc\", \"abc\") = %d\n", ft_strcmp("abc", "abc"));

    // ret = ft_write(1, "ft_write test\n", 14);
    // printf("ft_write wrote %zd bytes\n", ret);

    // printf("Type something (max 50 chars): ");
    // ret = ft_read(0, buffer, 50);
    // if (ret > 0) {
    //     buffer[ret] = '\0';
    //     printf("ft_read read: \"%s\"\n", buffer);
    // } else {
    //     printf("ft_read error\n");
    // }

    // dup = ft_strdup(src);
    // printf("ft_strdup: \"%s\"\n", dup);
    // free(dup);

    return 0;
}
