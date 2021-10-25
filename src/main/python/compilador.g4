grammar compilador;

// Solo para Java
// @header{
// package compiladores;
// }

LETRA : [A-Za-z] ;
DIGITO : [0-9] ;

WS : [ \t\n\r] -> skip ;


s : LETRA  {print("Letra  = " + $LETRA.text)} s
  | DIGITO {print("Digito = " + $DIGITO.text)} s
  | EOF
  ;
