%{
#include<stdio.h>
#include <stdlib.h>
#include<string.h>
#include "dok.tab.h" 
extern int yyerror(char *s);

%}
%option noyywrap
%option yylineno

%%

"," {yylval.ch=strdup(yytext);return C;}
"{" {yylval.ch=strdup(yytext);return FAA;}
"}" {yylval.ch=strdup(yytext);return FAD;}
":" {yylval.ch=strdup(yytext);return AT;}
"[" {yylval.ch=strdup(yytext);return AAA;}
"]" {yylval.ch=strdup(yytext);return ADA;}
[0-9]+ {yylval.IN=atoi(yytext);return POSI;}
[-][0-9]+ {yylval.IN=atoi(yytext);return NEGI;}
[0-9]+[.][0-9]+ {yylval.F=atof(yytext);return POSR;}
[-][0-9]+[.][0-9]+  {yylval.F=atof(yytext);return NEGR;}
\"(\\.|[^"\\])*\" {yylval.ch=strdup(yytext);return WORD;}
\n {}
[ \t]+ /*ignore whitespace*/
. { yyerror("Undefined symbol"); exit(1); } 

%%



