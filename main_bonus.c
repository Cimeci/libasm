#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <signal.h>
#include <setjmp.h>
#include <string.h>

typedef struct s_list {
    void          *data;
    struct s_list *next;
} t_list;

void	ft_list_push_front(t_list **begin_list, void *data);
int     ft_list_size(t_list *begin_list);
void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));
void	ft_list_sort(t_list **begin_list, int (*cmp)());

int cmp(void *data, void *data_ref)
{
    return (*(int *)data != *(int *)data_ref);
}

void free_fct(void *data)
{
    free(data);
}

int main(void) {
    t_list *list = NULL;

    int *a = malloc(sizeof(int));
    int *a1 = malloc(sizeof(int));
    int *a2 = malloc(sizeof(int));
    int *a3 = malloc(sizeof(int));
    int *b = malloc(sizeof(int));
    int *c = malloc(sizeof(int));
    *a = 10;
    *a1 = 10;
    *a2 = 10;
    *a3 = 10;
    *b = 20;
    *c = 30;
    
    ft_list_push_front(&list, a);
    ft_list_push_front(&list, a1);
    ft_list_push_front(&list, a2);
    ft_list_push_front(&list, a3);
    ft_list_push_front(&list, b);
    ft_list_push_front(&list, c);

    t_list *tmp = list;
    while (tmp)
    {
        printf("node: %p, data ptr: %p, value: %d\n", tmp, tmp->data, *(int *)(tmp->data));
        tmp = tmp->next;
    }

    printf("size: %d\n", ft_list_size(list));

    // ft_list_remove_if(&list, a, cmp, free_fct);

    tmp = list;
    while (tmp)
    {
        printf("node: %p, data ptr: %p, value: %d\n", tmp, tmp->data, *(int *)(tmp->data));
        tmp = tmp->next;
    }

    return 0;
}