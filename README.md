# simple-lexical-analyzer
This code converts a sequence of characters into a sequence of tokens. It uses Flex and C.

## Flex Installation
To install Flex on Fedora/CentOS/RedHat execute the following command:

```su -c 'yum install flex -y'```

## Flex Usage
To create a C source file from a Lex file execute the following command:

```flex -o file.c file.l```

## Compile C Source File
To compile a C source file execute the following command:

```gcc -o file file.c```

## Token Category Table
SUMA		1
RESTA		2
MULT		3
DIV		4
PORCENTAJE	5
AND		11
OR		12
NOT		13
BITAND		14
BITOR		15
BITXOR		16
MENORQUE	21
MAYORQUE 	22
MENORIGUAL	23		
MAYORIGUAL	24
IGUAL		25		
DISTINTO	26
ASIGNAR		27
PARIZQ		31
PARDER		32
CORIZQ		33
CORDER		34
LLAIZQ		35
LLADER		36
COMA		41
PUNTOCOMA	42
DOSPUNTOS	43
CARACTER	51
ENTERO		52
VACIO		53
SI		54
SINO		55
MIENTRAS	56
PARA		57
CONTINUAR	58
ROMPER		59
REGRESAR	60
IDENTIFICADOR	100
ENTERO_		101
CADENA_		102
IMPRIMIR	103
LEER		104
INCLUDE		105
PUNTO		106
NUMERAL		107
STDIO		108
MAIN		109
T_INT		200 
