grammar compilador;

// Solo para Java
// @header{
// package compiladores;
// }

fragment LETRA : [A-Za-z] ;
fragment DIGITO : [0-9] ;

PA : '(' ;
PC : ')' ;
LLA : '{' ;
LLC : '}' ;
ASIGN : '=' ;
PYC : ';' ;

INT : 'int' ;
WHILE : 'while' ;
FOR : 'for' ;

ID : (LETRA | '_') (LETRA | DIGITO | '_')* ;

ENTERO : DIGITO+ ;

WS : [ \t\n\r] -> skip ;


prog : instrucciones EOF ;

instrucciones : instruccion instrucciones
              |
              ;

instruccion : declaracion
            | asignacion
            | iwhile
            // | ifor
            | bloque
            ;

bloque : LLA instrucciones LLC ;

asignacion : ID ASIGN ENTERO PYC ;

iwhile : WHILE PA cond PC instruccion;

// ifor : FOR PA ? PYC ? PYC ? PC instruccion ;

cond : ID ; // No corresponde

declaracion : tipodato ID PYC
            // | tipodato ID EQ algo PYC
            ;

tipodato : INT
         ;

// instruccion : ENTERO
//             | ID
//             ;

// si : s ;

// s : PA s PC s
//   |
//   ;

// s : LETRA  {print("Letra  = " + $LETRA.text)} s
//   | DIGITO {print("Digito = " + $DIGITO.text)} s
//   | EOF
//   ;
