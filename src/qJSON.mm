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

#include "qJSON.h"
#include "qAssert.h"

NSDictionary* qJSON::LoadAndParseJSON(NSString* path)
{
	NSData* data = [NSData dataWithContentsOfFile:path];
	NSError* error = nil;
	NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
	qASSERTM(error == nil && json != nil, "Couldn't parse JSON %s with error %s", [path UTF8String], [[error description] UTF8String]);
	return json;
}

NSArray* qJSON::Array(NSDictionary* JSON, NSString* key, NSArray* defaultValue)
{
	NSArray* array = [JSON objectForKey:key];
	return (array != nil) ? array : defaultValue;
}

NSString* qJSON::String(NSDictionary* JSON, NSString* key, NSString* defaultValue)
{
	NSString* string = [JSON objectForKey:key];
	return ((string != nil) && (string.length != 0)) ? string : defaultValue;
}

float qJSON::Float(NSDictionary* JSON, NSString* key, float defaultValue)
{
	NSNumber* number = [JSON objectForKey:key];
	return (number != nil) ? number.floatValue : defaultValue;
}

NSInteger qJSON::Int(NSDictionary* JSON, NSString* key, NSInteger defaultValue)
{
	NSNumber* number = [JSON objectForKey:key];
	return (number != nil) ? number.intValue : defaultValue;
}

NSUInteger qJSON::UInt(NSDictionary* JSON, NSString* key, NSUInteger defaultValue)
{
	NSNumber* number = [JSON objectForKey:key];
	return (number != nil) ? number.unsignedIntegerValue : defaultValue;
}

bool qJSON::Bool(NSDictionary* JSON, NSString* key, bool defaultValue)
{
	NSNumber* boolean = [JSON objectForKey:key];
	return (boolean != nil) ? boolean.boolValue : defaultValue;
}
