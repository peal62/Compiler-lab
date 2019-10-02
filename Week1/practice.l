%{
int tokencount = 0;
int h = 1;
int count_int = 1;
int count_double = 1;
int count_char = 1;
%}

%%
[ ]+ {printf("White spaces ignored\n");}
(int)[ ]+[a-zA-Z]+[a-zA-Z0-9]* {printf("%s is a integer token\nTotal integer: %d",yytext, count_int);count_int++;}
(double)[ ]+[a-zA-Z]+[a-zA-Z0-9]* {printf("%s is a double token\nTotal double %d",yytext,count_double);count_double++;}
(char)[ ]+[a-zA-Z]+[a-zA-Z0-9]* {printf("%s is a char token\nTotal char %d",yytext,count_char);count_char++;}
-(-1)[0-4]\.[0-9]+ {printf("%s - Found a double number.\n",yytext);}
([0-9]|[0-9][0-9]|1[0-1][0-9]|12[0-7])(\.(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[0-9][0-9]|[0-9])){3} {printf("%s - Found a class A IP address.\n",yytext);}
^[AEIOU][a-zA-Z]* {printf("%s - Found an alphabet string that starts with a capital letter vowel.\n",yytext);}
[a-zA-Z]*[aeiou]$ {printf("%s - Found an alphabet string that ends with a small letter vowel.\n",yytext);}
[a-zA-Z0-9]*[0-9]+[a-zA-Z0-9]* {printf("%s - Found a string that has a number in it.\n",yytext);}
(abc){1,3} {printf("%s is a abc token\n",yytext);tokencount++;}
[a-zA-Z]+ {printf("%s is a normal token\n",yytext);tokencount++;}
^[^a-z][a-zA-Z]* {printf("%s does not start with small letter token\n",yytext);tokencount++;}
. {printf("Unexpected\n");}
%%
int yywrap()
{
return 1;
}
int main(){
	yylex();
	printf("Number of tokens is : %d\n",tokencount);
}
