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

#include "qCore.h"

static NSString* qGetPath(const char* filename)
{    
    NSString *nsFileName = [NSString stringWithCString:filename encoding:NSASCIIStringEncoding];
    
    NSRange extensionRange = [nsFileName rangeOfString:@"." options:NSBackwardsSearch];
    NSString *nsFileNameNoExtension = [nsFileName substringToIndex:extensionRange.location];
    NSString *nsExtension = [nsFileName substringFromIndex:(extensionRange.location+1)];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:nsFileNameNoExtension ofType:nsExtension];
    return path;
}

void qLoadFile(const char* filename, char * buffer, const uint bufferLength)
{
    NSString *path = qGetPath(filename);
            
    NSError *error = nil;
    NSString *file = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];  
    
    qASSERTM(error == nil, "qLoadFile: error loading %s", filename);
    qASSERT(file != nil);
    
    qASSERTM([file lengthOfBytesUsingEncoding:NSUTF8StringEncoding] < bufferLength, "Buffer for file %s of size %u is not large enough (loaded size is %lu)", filename, bufferLength, (unsigned long)[file lengthOfBytesUsingEncoding:NSUTF8StringEncoding]);
    
    strncpy(buffer, [file cStringUsingEncoding:NSUTF8StringEncoding], bufferLength);    
}

const void* qLoadData(const char* filename, uint &bytes)
{
    NSString *path = qGetPath(filename);
    
    NSData *data = [[NSData alloc] initWithContentsOfFile:path]; 
    
    qASSERTM(data != nil, "qLoadData: error loading %s", filename);
    
    bytes = (uint)[data length];
    
    return [data bytes];
}

