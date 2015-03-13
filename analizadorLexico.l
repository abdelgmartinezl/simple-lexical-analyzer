%option noyywrap
  
%{
#define SUMA		1
#define RESTA		2
#define MULT		3
#define DIV		4
#define PORCENTAJE	5
#define AND		11
#define OR		12
#define NOT		13
#define BITAND		14
#define BITOR		15
#define BITXOR		16
#define MENORQUE	21
#define MAYORQUE 	22
#define MENORIGUAL	23		
#define MAYORIGUAL	24
#define IGUAL		25		
#define DISTINTO	26
#define ASIGNAR		27
#define PARIZQ		31
#define PARDER		32
#define CORIZQ		33
#define CORDER		34
#define LLAIZQ		35
#define LLADER		36
#define COMA		41
#define PUNTOCOMA	42
#define DOSPUNTOS	43
#define CARACTER	51
#define ENTERO		52
#define VACIO		53
#define SI		54
#define SINO		55
#define MIENTRAS	56
#define PARA		57
#define CONTINUAR	58
#define ROMPER		59
#define REGRESAR	60
#define IDENTIFICADOR	100
#define ENTERO_		101
#define CADENA_		102
#define IMPRIMIR	103
#define LEER		104
#define INCLUDE		105
#define PUNTO		106
#define NUMERAL		107
#define STDIO		108
#define MAIN		109
#define T_INT		200

const char* decHex(const char* numero) {
	char *temp;
	char *buffer;
	int largo, i;
	
	temp = malloc(sizeof(char) * 11);
	buffer = malloc(sizeof(char) * 8);
	sprintf(buffer, "%x", atoi(numero));
	sprintf(temp, "0x");
	largo = strlen(buffer);
	
	for (i=2; i<10-largo; i++)
		temp[i] = '0';
	
	strncat(temp, buffer, largo);
	return temp;
	free(buffer);
	free(temp);
}

const char* quitarComilla(const char* str) {
	char *temp;
	int largo;
	largo = strlen(str);
	temp = malloc(sizeof(char) * (largo-1));
	strncpy(temp, (++str), largo-1);
	temp[largo-2] = '\0';
	return temp;
	free(temp);
}

%}

UCN            (\\u[0-9a-fA-F]{4}|\\U[0-9a-fA-F]{8}) 
DIGITO	       [0-9] 
LETRA	       [A-Za-z] 
DELIMITADOR    [ \t\n] 
IDENTIFICADOR  ([_a-zA-Z]|{UCN})([_a-zA-Z0-9]|{UCN})* 
ENTERO	       0|([1-9][0-9]*) 
CADENA	       L?\"([^"\\]|\\['"?\\abfnrtv]|\\[0-7]{1,3}|\\[Xx][0-9a-fA-F]+|{UCN})*\"
COMENTARIO     ("/*"[_a-zA-Z]|[0-9]|[!@$]="*/")|("//".*)

%%
"+"		{ printf("%d\n", SUMA); }
"-" 		{ printf("%d\n", RESTA); }
"*"		{ printf("%d\n", MULT); }
"/"		{ printf("%d\n", DIV); }
"%"		{ printf("%d\n", PORCENTAJE); }
"&&"		{ printf("%d\n", AND); }
"||"		{ printf("%d\n", OR); }
"!"		{ printf("%d\n", NOT); }
"<"		{ printf("%d\n", MENORQUE); }
">"		{ printf("%d\n", MAYORQUE); }
"<="		{ printf("%d\n", MENORIGUAL); }
">="		{ printf("%d\n", MAYORIGUAL); }
"=="		{ printf("%d\n", IGUAL); }
"!="		{ printf("%d\n", DISTINTO); }
"&"		{ printf("%d\n", BITAND); }
"|"		{ printf("%d\n", BITOR); }
"^"		{ printf("%d\n", BITXOR); }
"("		{ printf("%d\n", PARIZQ); }
")"		{ printf("%d\n", PARDER); }
"["		{ printf("%d\n", CORIZQ); }
"]"		{ printf("%d\n", CORDER); }
"{"		{ printf("%d\n", LLAIZQ); }
"}"		{ printf("%d\n", LLADER); }
","		{ printf("%d\n", COMA); }
";"		{ printf("%d\n", PUNTOCOMA); }
":"		{ printf("%d\n", DOSPUNTOS); }
"="		{ printf("%d\n", ASIGNAR); }
"char"	    	{ printf("%d\n", CARACTER); }
"int"	    	{ printf("%d\n", ENTERO); }
"void"	    	{ printf("%d\n", VACIO); }
"if"	    	{ printf("%d\n", SI); }
"else"	    	{ printf("%d\n", SINO); }
"while"	    	{ printf("%d\n", MIENTRAS); }
"for" 	    	{ printf("%d\n", PARA); }
"continue"  	{ printf("%d\n", CONTINUAR); }
"break"	    	{ printf("%d\n", ROMPER); }
"return"    	{ printf("%d\n", REGRESAR); }
"printf"    	{ printf("%d\n", IMPRIMIR); }
"scanf"    	{ printf("%d\n", LEER); }
"include"    	{ printf("%d\n", INCLUDE); }
"."    		{ printf("%d\n", PUNTO); }
"#"   	 	{ printf("%d\n", NUMERAL); }
"stdio"    	{ printf("%d\n", STDIO); }
"main"    	{ printf("%d\n", MAIN); }
"%d"    	{ printf("%d\n", T_INT); }
{IDENTIFICADOR} { printf("%d\t%s\n", IDENTIFICADOR, yytext); }
{ENTERO}    	{ printf("%d\t%s\n", ENTERO_, decHex(yytext)); }
{CADENA}    	{ printf("%d\t%s\n", CADENA_, quitarComilla(yytext)); }
{DELIMITADOR}+
{COMENTARIO}

%%
main(argc, argv)
int argc;
char **argv;
{
	YY_BUFFER_STATE buffer;
	extern FILE* yyin;
	if (argc>1) yyin = fopen(argv[1],"r");
	else {
		yyin = stdin;
		buffer = yy_create_buffer(yyin, YY_BUF_SIZE);
		yy_switch_to_buffer(buffer);
	}
	yylex();
}
