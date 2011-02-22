#ifndef __EXCEPT_H__
#define __EXCEPT_H__

#include <setjmp.h>
#include <string.h>
#include <stdlib.h>

#define THROW(str) \
	if (exception_count < 0) { \
		fprintf(stderr, "unhandled exception '%s' at line %d in %s\n", str, __LINE__, __FILE__); \
		exit(1); \
	} \
	exception_thrown = str; \
	longjmp(exception_stack[exception_count--], 0)
	
#define THROW_AGAIN THROW(exception_thrown)

#define TRY \
	{ \
		int exception_status; \
		if ((exception_status = setjmp(exception_stack[++exception_count])) == 0)
		
#define CATCH(str) else if (exception_status > 0 && strcmp(str, exception_thrown) == 0)

#define ENDTRY \
		else { \
			THROW_AGAIN; \
		} \
	} 0
	
extern jmp_buf	exception_stack[50];
extern int		exception_count;
extern char* 	exception_thrown;

#endif