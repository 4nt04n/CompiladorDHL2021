grammar compilador;

LETRA : [A-Za-z] ;
DIGITO : [0-9] ;


s : LETRA s
  | DIGITO s
  | EOF
  ;
