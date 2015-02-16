#include <stdio.h>

int c;
void print_hello(void)
{
	puts("Hello world\n");
}

void print_str_some(const char *s)
{
	c = 0;
	while(*s && *(s+1))
	{
		putchar(*s);
		s += 2;
		c++;
	}

}

int main(int argc, char **argv)
{
	if (argc <= 1)
		print_hello();
	else
		print_str_some(argv[1]);
	printf("n/2: %d\n", c);
	return 0;
}
