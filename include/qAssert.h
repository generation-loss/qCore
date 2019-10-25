/*
Copyright (c) 2019 Generation Loss Interactive

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/
 
#ifndef __Q_ASSERT_H__
#define __Q_ASSERT_H__

#ifdef DEBUG
    #define Q_ASSERT_ENABLED (1)
#else
    #define Q_ASSERT_ENABLED (0)
#endif

#if (Q_ASSERT_ENABLED)

	#include <assert.h>
    #include <stdio.h>
    
    #define qASSERT(cond)                 assert(cond)
	#define qASSERTM(cond, message, ...)  if(!(cond)) { printf(message "\n", ## __VA_ARGS__); assert(0); }
	#define qWARNING(cond, message, ...)  if(!(cond)) { printf(message "\n", ## __VA_ARGS__); }
    #define qBREAK(message, ...)          printf(message "\n", ## __VA_ARGS__); assert(0);
    #define qSPAM(message, ...)           { printf(message "\n", ## __VA_ARGS__); }

#else

    #define qASSERT(cond)
    #define qASSERTM(cond, message, ...)
	#define qWARNING(cond, message, ...)
    #define qBREAK(message, ...)
    #define qSPAM(message, ...)

#endif

#endif //__Q_ASSERT_H__

