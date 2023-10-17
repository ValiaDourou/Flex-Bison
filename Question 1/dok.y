%{
#include<stdio.h>
#include <stdlib.h>
#include<string.h>
extern int yyval;
extern FILE *yyin;								
extern FILE *yyout;
int yylex();
extern int yylineno;
int errf=0;

%}

%locations
%union {
    char *ch;
    int IN;  
    float F;
}

%token <ch> FAA
%token <ch> FAD
%token <ch> AT
%token <ch> AAA
%token <ch> ADA
%token <ch> C
%token <IN> POSI 
%token <F> POSR 
%token <IN> NEGI 
%token <F> NEGR 
%token <ch> WORD 


%%

START: FAA LASTW LAST C ACTIVEW ACTIVE FAD;
LASTW: WORD AT FAA {char target[]={'"','l','a','s','t','"','\0'};if((strcmp($1,target)!=0)){yyerror(":wrong sequence");YYERROR;};};
LAST: GAMEID DRAWID DRAWTIME STATUS DRAWBREAK VISUALDRAW PPW PRICEPOINTS WNW WINNINGNUMBERS PRIZECATW PRIZECAT WSW WAGERSTATISTICS FAD ;
ACTIVEW: WORD AT FAA {char target[]={'"','a','c','t','i','v','e','"','\0'};if((strcmp($1,target)!=0)){yyerror(":wrong sequence");YYERROR;};};
ACTIVE: GAMEID DRAWID DRAWTIME STATUS DRAWBREAK VISUALDRAW PPW PRICEPOINTS PRIZECATW PRIZECAT WSW WAGERSTATISTICS FAD ;
GAMEID:  WORD AT POSI C {char target[]={'"','g','a','m','e','I','d','"','\0'};if(strcmp($1,target)!=0){yyerror(":wrong sequence");YYERROR;};};
DRAWID:  WORD AT POSI C{char target[]={'"','d','r','a','w','I','d','"','\0'};if(strcmp($1,target)!=0){yyerror(":wrong sequence");YYERROR;};};
DRAWTIME:  WORD AT POSI C {char target[]={'"','d','r','a','w','T','i','m','e','"','\0'};if(strcmp($1,target)!=0){yyerror(":wrong sequence");YYERROR;};};
STATUS:  WORD AT WORD C {char target[]={'"','s','t','a','t','u','s','"','\0'};if(strcmp($1,target)!=0){yyerror(":wrong sequence");YYERROR;};};
DRAWBREAK:  WORD AT POSI C {char target[]={'"','d','r','a','w','B','r','e','a','k','"','\0'};if(strcmp($1,target)!=0){yyerror(":wrong sequence");YYERROR;};};
VISUALDRAW:  WORD AT POSI C {char target[]={'"','v','i','s','u','a','l','D','r','a','w','"','\0'};if(strcmp($1,target)!=0){yyerror(":wrong sequence");YYERROR;};};
PPW: WORD AT FAA{char target[]={'"','p','r','i','c','e','P','o','i','n','t','s','"','\0'};if(strcmp($1,target)!=0){yyerror(":wrong sequence");YYERROR;};};
PRICEPOINTS:  AMOUNT FAD C ;
AMOUNT: WORD AT POSR {char target[]={'"','a','m','o','u','n','t','"','\0'};if(strcmp($1,target)!=0){yyerror(":wrong sequence");YYERROR;};};
WNW: WORD AT FAA {char target[]={'"','w','i','n','n','i','n','g','N','u','m','b','e','r','s','"','\0'};if((strcmp($1,target)!=0)){yyerror(":wrong sequence");YYERROR;};};
WINNINGNUMBERS: LISTW LIST BONUSW BONUS FAD C ;
LISTW: WORD AT AAA {char target[]={'"','l','i','s','t','"','\0'};if((strcmp($1,target)!=0)){yyerror(":wrong sequence");YYERROR;};};
LIST: LARRAY ADA C ;
LARRAY: POSI| POSI C LARRAY;
BONUSW: WORD AT AAA {char target[]={'"','b','o','n','u','s','"','\0'};if(strcmp($1,target)!=0){yyerror(":wrong sequence");YYERROR;};};
BONUS: POSI ADA ;
PRIZECATW: WORD AT AAA FAA{char target[]={'"','p','r','i','z','e','C','a','t','e','g','o','r','i','e','s','"','\0'};if(strcmp($1,target)!=0){yyerror(":wrong sequence");YYERROR;};};
PRIZECAT:  PRIZECATEGORIES1 FAD C PARRAY ADA C;
PARRAY: FAA PRIZECATEGORIES FAD| FAA PRIZECATEGORIES FAD C PARRAY;
PRIZECATEGORIES1: PRIZECATEGORIES C MINIMUMDISTRIBUTED;
PRIZECATEGORIES: ID DIVIDENT WINNERS DISTRIBUTED JACKPOT FIXED CATEGORYTYPE GAMETYPE;
ID: WORD AT POSI C {char target[]={'"','i','d','"','\0'};if(strcmp($1,target)!=0){yyerror(":wrong sequence");YYERROR;};if(($3!=1)&&($3!=2)&&($3!=3)&&($3!=4)&&($3!=5)&&($3!=6)&&($3!=7)&&($3!=8)){yyerror(":wrong sequence");YYERROR;};};
DIVIDENT: WORD AT POSR C{char target[]={'"','d','i','v','i','d','e','n','t','"','\0'};if(strcmp($1,target)!=0){yyerror(":wrong sequence");YYERROR;};};
WINNERS: WORD AT POSI C{char target[]={'"','w','i','n','n','e','r','s','"','\0'};if(strcmp($1,target)!=0){yyerror(":wrong sequence");YYERROR;};};
DISTRIBUTED: WORD AT POSR C {char target[]={'"','d','i','s','t','r','i','b','u','t','e','d','"','\0'};if(strcmp($1,target)!=0){yyerror(":wrong sequence");YYERROR;};};
JACKPOT: WORD AT POSR C {char target[]={'"','j','a','c','k','p','o','t','"','\0'};if(strcmp($1,target)!=0){yyerror(":wrong sequence");YYERROR;};};
FIXED: WORD AT POSR C {char target[]={'"','f','i','x','e','d','"','\0'};if(strcmp($1,target)!=0){yyerror(":wrong sequence");YYERROR;};};
CATEGORYTYPE: WORD AT POSI C {char target[]={'"','c','a','t','e','g','o','r','y','T','y','p','e','"','\0'};if(strcmp($1,target)!=0){yyerror(":wrong sequence");YYERROR;};};
GAMETYPE: WORD AT WORD {char target[]={'"','g','a','m','e','T','y','p','e','"','\0'};if(strcmp($1,target)!=0){yyerror(":wrong sequence");YYERROR;};};
MINIMUMDISTRIBUTED: WORD AT POSR {char target[]={'"','m','i','n','i','m','u','m','D','i','s','t','r','i','b','u','t','e','d','"','\0'};if(strcmp($1,target)!=0){yyerror(":wrong sequence");YYERROR;};};
WSW: WORD AT FAA {char target[]={'"','w','a','g','e','r','S','t','a','t','i','s','t','i','c','s','"','\0'};if((strcmp($1,target)!=0)){yyerror(":wrong sequence");YYERROR;};};
WAGERSTATISTICS: COLUMNS WAGERS ADDON FAD ;
COLUMNS: WORD AT POSI C {char target[]={'"','c','o','l','u','m','n','s','"','\0'};if(strcmp($1,target)!=0){yyerror(":wrong sequence");YYERROR;};};
WAGERS: WORD AT POSI C {char target[]={'"','w','a','g','e','r','s','"','\0'};if(strcmp($1,target)!=0){yyerror(":wrong sequence");YYERROR;};};
ADDON: WORD AT AAA ADDONEXP ADA | WORD AT AAA ADA {char target[]={'"','a','d','d','O','n','"','\0'};if((strcmp($1,target)!=0)){yyerror(":wrong sequence");YYERROR;};};
ADDONEXP: ADDONAR| ADDONAR C ADDONEXP;
ADDONAR: WORD| POSI| NEGI| NEGR| POSR;



%%

void yyerror(char *s)
{
errf=1;
   printf("Error in line %d. Type of error %s\n", yylineno,s);

}
int main () 
  {

char ch;

  yyin=fopen("last_result.json","r");
  ch=fgetc(yyin);
  while(ch!=EOF){
  printf("%c",ch);
  ch=fgetc(yyin);
  } 
  fclose(yyin);
    yyin = fopen("last_result.json","r");
  
  yyparse ();	

  fclose(yyin);
    if(errf==0)
  {
  printf("The input is correct.\n");
  }
  return 0;
  }   




