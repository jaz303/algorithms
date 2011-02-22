#include "except.h"

jmp_buf	exception_stack[50];
int		exception_count		= -1;
char* 	exception_thrown	= NULL;
