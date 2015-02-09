%option noyywrap
%{
#include <iostream>

using namespace std;
%}


PREPROCESSOR_INCLUDE	"#"include <\w*>$
ID			[a-zA-Z_][a-zA-Z_0-9]*
INT 			[0-9]+
TYPE			int|bool|string
LINE_COMMENT 		[\s\w]*\/\/.*$
STRING			\".*\"
EXTRACTION_OPERATOR	<<


%%

{PREPROCESSOR_INCLUDE}	cout << "INCLUDE" << YYText()<< endl;
{ID}			cout << "ID"<< YYText() << endl;
{INT} 			cout << "INT"<< YYText() << endl;
{TYPE}			cout << "TYPE"<< YYText() << endl;
{LINE_COMMENT} 		cout << "COMMENT"<< YYText() << endl;
{STRING}		cout << "STRING" << YYText() << endl;
{EXTRACTION_OPERATOR}	cout << "EXTRACTION" << YYText()<< endl;

%%

int main()
{
    yyFlexLexer lexer;
    while(lexer.yylex() != 0);

    return 0;
}
