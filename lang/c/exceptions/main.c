#include <stdio.h>
#include "except.h"

char*	exception_to_throw;

int bar() {
	THROW(exception_to_throw);
}

int foo() {
	printf("IN foo()\n");
	TRY {
		bar();
	} CATCH("foo") {
		printf("caught a foo in foo()\n");
		THROW_AGAIN;
	} CATCH("bar") {
		printf("caught a bar in foo()\n");
	} ENDTRY;
	printf("OUT foo()\n");
}

int main(int argc, char *argv[]) {
	if (argc != 2) {
		fprintf(stderr, "Usage: except exception_to_throw\n");
		exit(1);
	}
	exception_to_throw = argv[1];
	
	TRY {
		foo();
	} CATCH("foo") {
		printf("caught a foo in main()\n");
	} ENDTRY;
	
	return 0;
}