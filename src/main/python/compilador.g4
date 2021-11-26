grammar compilador;

fragment LETRA: [A-Za-z];
fragment DIGITO: [0-9];

ENTERO: DIGITO+;
WS: [ \t\n\r] -> skip;

// <--- ASIGNACION DE SIMBOLOS Y PALABRAS CLAVES --->

// ...Operadores Comienzo y fin De un Bloque...
PA: '(';
PC: ')';
LLA: '{';
LLC: '}';
PYC: ';';
COMA: ',';
//...Operadores Aritmeticos...
MAS: '+';
MENOS: '-';
MUL: '*';
DIV: '/';
MOD: '%';
//...Operadores Logicos...
TRUE: 'true';
FALSE: 'false';
AND: '&&';
OR: '||';
EQUIVALENCIA: '==';
DISTINTO: '!=';

//... Comparadores...
IGUAL: '=';
MENOR: '<';
MAYOR: '>';

// Operadores unarios //
UMAS: '++';
UMENOS: '--';

//...Sentencia ...
IF: 'if';

// ...Estructura de Bucle...
WHILE: 'while';
FOR: 'for';

// ...Funciones...
RETURN: 'return';

// ...Permisos...
PUBLIC: 'public';
PRIVATE: 'private';

// ...Return...
VOID: 'void';

// <--- Declaro Variables --->
INT: 'int';
DOUBLE: 'double';
CHAR: 'char';
BOOL: 'bool';

// INICIO DEL PROGRAMA \\

// Codigo esta compuesto por lineas
codigo: lineas;

//Estructura de las lineas
lineas: instruccion lineas | | EOF;

//Estructura De una instruccion
instruccion: bloque | variable PYC | estructuras | funcion;

bloque: LLA lineas LLC;

estructuras: declaracion | asignacion | iwhile | ifor | bloque;

//<---Declaracion de una variable--->
ID: (LETRA | '_') (LETRA | DIGITO | '_')*;
tipoDato: INT | DOUBLE | CHAR | BOOL;
boolValor: TRUE | FALSE | '0' | '1';
tipoAsignacion: | COMA asignacion | IGUAL asignacion |;

variable: declaracion | asignacion;

declaracion: tipoDato asignacion;

//ES ASIGNABLE Y COMO ASIGNARLO
asignacion:
	ID IGUAL asignable tipoAsignacion
	| operacion_unaria tipoAsignacion
	| ID tipoAsignacion;

asignable: ID | ENTERO | boolValor | expresion | llamadaFuncion;

operacion_unaria: ID (UMAS | UMENOS);
//<---FIN:  Declaracion de una variable--->

// <--- Operadores Logicos --->
operadoresLogicos: (IGUAL IGUAL)
	| MAYOR
	| MENOR
	| (MAYOR IGUAL)
	| (MENOR IGUAL)
	| AND
	| OR;
//<<<<Estructura Comparacion>>>>
comparacion:
	ID operadoresLogicos ENTERO
	| ID operadoresLogicos ID
	| ENTERO operadoresLogicos ENTERO
	| ENTERO operadoresLogicos ID;

igualacion: EQUIVALENCIA | DISTINTO;
//Ver esto de Expresion y termino
expresion:
	expresion MAS termino
	| expresion MENOS termino
	| expresion AND termino
	| expresion OR termino
	| expresion igualacion termino
	| termino;
termino:
	termino MUL factor
	| termino DIV factor
	| termino MOD factor
	| factor;
factor: PA expresion PC | ID | ENTERO | boolValor;
//<---FIN: Operadores Logicos ---> <--- iif --->
iif:
	IF PA comparacion PC
	| IF PA ENTERO PC
	| IF PA ID PC
	| IF PA boolValor PC;
//<---FIN:  iif ---> 

// <--- while--->
iwhile:
	WHILE PA comparacion PC
	| WHILE PA ENTERO PC
	| WHILE PA ID PC
	| WHILE PA boolValor PC;
//<---FIN: while ---> <--- for --->
ifor:
	FOR PA (variable |) PYC (comparacion | boolValor |) PYC (
		variable
		|
	) PC;
//<---FIN: for ---> <---- Estructura Funciones --->
retorno: VOID | tipoDato;
visibilidad: PUBLIC | PRIVATE;

parametro: tipoDato ID;
//(int var, double var2)
listaParametros: parametro COMA listaParametros | parametro;
listaAsignables: asignable COMA listaAsignables | asignable;

firmaFuncion: visibilidad retorno ID PA listaParametros PC;

prototipoFuncion: firmaFuncion PYC;
declaracionFuncion: firmaFuncion bloque;
llamadaFuncion: ID PA (listaAsignables)* PC PYC;

retornoFuncion: RETURN asignable PYC;

funcion: prototipoFuncion | declaracionFuncion | llamadaFuncion;
//<---- FIN: Estructura Funciones --->