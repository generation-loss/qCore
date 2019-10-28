# qCore
qCore is a collection of core utilities to support the other rendering-focuses qLibraries. It contains 
1. type definitions (uint, byte, ubyte, half, half2, half3, and half4)
1. Assert helpers that compile out in non-DEBUG builds: qASSERT, qASSERTM, qWARNING, qBREAK, and qSPAM
1. JSON helpers to load and parse JSON (using NSJSONSerialization) to retrieve NSArray, NSString, float, NSInteger, NSUInteger, and bool data from JSON files
1. A scoped timer for basic targeted measuring of CPU performance
