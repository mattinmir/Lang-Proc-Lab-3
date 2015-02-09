%option noyywrap
%{
#include <iostream>

using namespace std;
%}

INT 			[0-9]+
LINE_COMMENT 		[\s\w]*\/\/.*$
STRING			\".*\"
EXTRACTION_OPERATOR	<<
DIRECTIVE		"using namespace ".*
ID			[a-zA-Z_][a-zA-Z_0-9]*


%%

{ID}			cout << "ID("<< YYText() << ")" << endl;
{INT} 			cout << "INT("<< YYText() << ")"<< endl;
{LINE_COMMENT} 		cout << "COMMENT"<< endl;
{STRING}		cout << "STRING(" << YYText() << ")"<< endl;
{EXTRACTION_OPERATOR}	cout << "EXTRACTION(" << YYText() << ")"<< endl;
{DIRECTIVE} 		cout << "DIRECTIVE(" << YYText() << ")" << endl;

%%

int main()
{
    yyFlexLexer lexer;
    while(lexer.yylex() != 0);

    return 0;
}
