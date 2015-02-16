all:
	clang -S -emit-llvm 01_hello.c
	clang -S -emit-llvm 02_gcd.c
