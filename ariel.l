%{
  #include <stdio.h>
  #include <stdlib.h>

  #include "calc02.tab.h"
  
  void abrirArquivo();
  int palavra_reservada(char[]);
  int lineno = 0;
  
%}

digit      [0-9]
letter     [a-zA-Z]
integer    {digit}+
exponente  [eE][+-]?{integer}
real       {integer}("."{integer})?{exponente}?
identifier {letter}+
newline    \n
espaco     [ \t]+

%option yylineno

%%


"if"         { return IF; }
"else"       { return ELSE; }
"void"       { return VOID; }
"return"     { return RETURN; }
"while"      { return WHILE; }
"for"        { return FOR; }
fat|FAT      { return FATORIAL; }
abs|ABS      { return MODULO; }
cos|COS      { return COSSENO; }
sen|SEN      { return SENO; }
tan|TAN      { return TANGENTE; }
log|LOG      { return LOG; }
sqrt|SQRT    { return RAIZ; }
e            { return EXP; }
{identifier} { if (palavra_reservada(yytext))
                 return(PAL_RES);
               else
                 return VARIAVEL; 
             }
{espaco}     { /* faz nada */ }
{real}       { yylval.vd = atof(yytext);  return NUMERO; }
"+"          { return ADICAO; }
"-"          { return SUBTRACAO; }
"*"          { return MULTIPLICACAO; }
"("          { return ABRE_PAR; }
")"          { return FECHA_PAR; }
"/"          { return DIVISAO; }
"^"          { return POTENCIACAO; }
"%"          { return RESTO; }
"="          { return IGUAL; }
"<"          { return LT; }
"<="         { return LE; }
">"          { return GT; }
">="         { return GE; }
"=="         { return EQ; }
"!="         { return NE; }
";"          { return SEMI; }
","          { return COMMA; }
"["          { return LBRACKET; }
"]"          { return RBRACKET; }
"{"          { return LBRACE; }
"}"          { return RBRACE; }
{newline}    { lineno++; }
"/*"         { char c;
               while (1) {
                 c = input();
                 if (c == EOF) break;
                 if (c == '\n') lineno++;
                 while ((c = input()) == '*');
                 if (c == '/') break;
               }
             }
"//"         { char c;
               while (1) {
                 c = input();
                 if (c == EOF) break;
                 if (c == '\n') {
                   lineno++;
                   break;
                 }
               }
             }
.            { printf("Erro lexico : %s\n",yytext); return ERROR;}

%%


int palavra_reservada(char pal[])
{
 if ((!strcmp(pal, "Ariel")) ||
     (!strcmp(pal, "def"))   ||
     strcmp("import",input)  ||
     strcmp("as",input)      ||
     strcmp("def",input)     ||
     strcmp("class",input)   ||
     strcmp("main()",input)    ||
     strcmp("print",input))
  return(1);
 else
  return(0);
}


void abrirArquivo()
{
  yyin = fopen("teste.txt", "r");
}
