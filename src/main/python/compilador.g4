grammar compilador;

// Solo para Java
// @header{
// package compiladores;
// }

PA : '(' ;
PC : ')' ;

LETRA : [A-Za-z] ;
DIGITO : [0-9] ;

// ID : (LETRA | '_') (LETRA | DIGITO | '_')* ;

WS : [ \t\n\r] -> skip ;

si : s ;

s : PA s PC s
  |
  ;

// s : LETRA  {print("Letra  = " + $LETRA.text)} s
//   | DIGITO {print("Digito = " + $DIGITO.text)} s
//   | EOF
//   ;
