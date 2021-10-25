grammar expReg ;

fragment SLASH : '/';
fragment COLON : ':';


//SPECIFIC RULES-
// No hace falta filtrar por año
// fragment YEAR: ('199'[89]) | ('200'[0-8]);
// Hay que definir la hora en tres partes
// fragment HOUR : ('11' COLON [3-5][0-9]
//      | '1' [2-9] COLON [0-5][0-9]
//      | '20'COLON ([0-3][0-9] | '4' [0-5])) COLON [0-5][0-9];

// entre las 10:30 y las 16:30
fragment HOUR : ('10:3'[0-9])
              | ('1'[1-5] COLON [0-5][0-9])
              | (('16:'[0-2][0-9]) | '16:30')
              ;
// fragment DAY: [1][0-9];
// Los meses van del 01 al 12, son dos partes
// No existen los meses 16 y 18
fragment MONTH: ('0'[2468]) | ('1'[02]) ; // [0-1][2468];

SEARCH_DATE : DAY_GEN SLASH MONTH SLASH YEAR_GEN '\t' HOUR ;

//GENERAL RULES
// Los dias van del 01 al 31, se debe definir en tres partes
fragment DAY_GEN: '0'[1-9] | ([12][0-9]) | ('3'[01]) ; // [0-1][0-9];
// Los meses van del 01 al 12, son dos partes
fragment MONTH_GEN: ('0'[1-9]) | ('1'[0-2]) ;  // [0-1][1-9];
//  OK
fragment YEAR_GEN: [0-9][0-9][0-9][0-9];
// Las horas deben definirse tambien por partes
fragment HH : ([01][0-9]) | ('2'[0-3]) ;
fragment MM : [0-5][0-9] ;
fragment HOUR_GEN: HH COLON MM ; // [0-9]|COLON|[0-9]|COLON|[0-9]|COLON|[0-9];
DATE : DAY_GEN SLASH MONTH_GEN SLASH YEAR_GEN '\t'+ HOUR_GEN;


//DISCARD SPACES AND NON EXCPECTED INPUTS
SPACES : [ \n\t\r]-> skip;
OTRO : . -> skip;


//GRAMMAR RULE: FIRST OF ALL, THE EXPECTED MATCH WITH PRINT. THEN, THE GENERAL RULE IN ORDER TO DISCARD DATA
// s: DAY{print($DAY.text);} SLASH MONTH{print($MONTH.text);} SLASH YEAR{print($YEAR.text);} HOUR {print($HOUR.text);} s
s : SEARCH_DATE {print(" ==> " + $SEARCH_DATE.text + " <==");} s
  | DATE {print("Discard -> " + $DATE.text);} s
  | EOF
  ;


