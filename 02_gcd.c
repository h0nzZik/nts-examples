#include <stdbool.h>

unsigned int gcd (unsigned int a, unsigned int b)
{
	// assume a > b
	// gcd | a, gcd | b	
	// a = b * c + d
	// => gcd | b, gcd | d, b > d
	unsigned int d;

	do {
		d = a % b;
		a = b;
		b = d;
	} while(b);
	return a;

	// d == 0 ==> old(b) | old(a)
}

int add(int x)
{
	return 1 + x;
}

unsigned int addu(unsigned int x)
{
	return 1 + x;
}

bool neg(bool b)
{
	return !b;
}
