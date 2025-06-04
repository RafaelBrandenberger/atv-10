/* Definicão: secao para codigo do usuário. */
import java_cup.runtime.Symbol;

%%
/* Opções e Declaracões: seção para diretivas e macros. */
%cup
%unicode
%line
%column
%class MeuScanner

// macros:
digito = [0-9]
inteiro = {digito}+

%%

/* Regras e Ações Associadas: seção de instruções para o analisador léxico. */

{inteiro} {
            Integer numero = Integer.valueOf(yytext());
            return new Symbol(sym.INTEIRO, yyline, yycolumn, numero);
          }
"+"       { return new Symbol(sym.MAIS); }
"-"       { return new Symbol(sym.MENOS); }
"*"       { return new Symbol(sym.MULT); }      // adicionado suporte para multiplicacao
"/"       { return new Symbol(sym.DIV); }       // adicionado suporte para divisao
"%"       { return new Symbol(sym.RESTO); }     // adicionado suporte para resto da divisao
"^"       { return new Symbol(sym.POT); }       // adicionado suporte para potenciacao
"("       { return new Symbol(sym.PARENTESQ); }
")"       { return new Symbol(sym.PARENTDIR); }
";"       { return new Symbol(sym.PTVIRG); }
\n        { /* ignora nova linha. */ }
[ \t\r]+  { /* ignora espacos. */ }
.         { System.err.println("\n caractere invalido: " + yytext() +
                               "\n linha: " + yyline +
                               "\n coluna: " + yycolumn + "\n"); 
            return null; 
          }