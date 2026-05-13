/* Imports */
import java_cup.runtime.*;

%%

/* Configurações */
%class Scanner
%unicode
%cup
%line
%column
%cupsym Tokens

%{

private Symbol symbol(int type) {
    return new Symbol(type, yyline, yycolumn);
}

private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline, yycolumn, value);
}

%}

/* Definições */
WHITESPACE = [\s]+
IDENT      = [a-zA-Z][a-zA-Z0-9]*

%%

/* Regras Léxicas */

"SELECT"        { return symbol(Tokens.SELECT, yytext()); }
"FROM"          { return symbol(Tokens.FROM, yytext()); }
"WHERE"         { return symbol(Tokens.WHERE, yytext()); }

"="             { return symbol(Tokens.EQ, yytext()); }
";"             { return symbol(Tokens.SEMI, yytext()); }
","     { return symbol(Tokens.COMMA, yytext()); }
"*"     { return symbol(Tokens.STAR, yytext()); }
">="    { return symbol(Tokens.GE, yytext()); }
"<="    { return symbol(Tokens.LE, yytext()); }
"!="    { return symbol(Tokens.NE, yytext()); }

">"     { return symbol(Tokens.GT, yytext()); }
"<"     { return symbol(Tokens.LT, yytext()); }


{IDENT}         { return symbol(Tokens.IDENT, yytext()); }

[0-9]+          {
                    return symbol(
                        Tokens.NUMBER,
                        Integer.parseInt(yytext())
                    );
                }

{WHITESPACE}    { /* ignora espaços */ }

/* Caracteres inválidos */
[^] {
    System.out.println(
        "Caractere inválido: <" + yytext() +
        "> na linha " + (yyline + 1) +
        ", coluna " + (yycolumn + 1)
    );
}
