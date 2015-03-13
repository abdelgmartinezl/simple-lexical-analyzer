# simple-lexical-analyzer
This code converts a sequence of characters into a sequence of tokens. It uses Flex and C.

## Flex Installation
To install Flex on Fedora/CentOS/RedHat execute the following command:
 ```yum install flex```

## Flex Usage
To create a C source file from a Lex file execute the following command:
 ```flex -o file.c file.l```

## Compile C Source File
To compile a C source file execute the following command:
 ```gcc -o file file.c```
