from os import write
from antlr4 import *
from models.ToTxt import ToTxt
from models.ID import ID
from models.Tabla import Tabla
from models.Variable import Variable
from models.Funcion import Funcion
if __name__ is not None and "." in __name__:
    from .compiladorParser import compiladorParser
else:
    from compiladorParser import compiladorParser

# This class defines a complete listener for a parse tree produced by compiladorParser.


class miListener(ParseTreeListener):

    tabla = Tabla()
    inFor = False
    inWhile = False

    # Enter a parse tree produced by compiladorParser#codigo.
    def enterCodigo(self, ctx: compiladorParser.CodigoContext):
        self.tabla.addContexto()
        ToTxt.ResetTxt()

    # Exit a parse tree produced by compiladorParser#codigo.
    def exitCodigo(self, ctx: compiladorParser.CodigoContext):
        ToTxt.NuevoContexto(self.tabla.getContext())

    # Enter a parse tree produced by compiladorParser#bloque.

    def enterBloque(self, ctx: compiladorParser.BloqueContext):
        self.tabla.addContexto()

    # Exit a parse tree produced by compiladorParser#bloque.

    def exitBloque(self, ctx: compiladorParser.BloqueContext):
        ToTxt.NuevoContexto(self.tabla.getContext())
        self.tabla.delContexto()

    # Exit a parse tree produced by compiladorParser#declaracion.

    def exitDeclaracion(self, ctx: compiladorParser.DeclaracionContext):
        yaAsignada = ctx.asignacion().IGUAL() != None

        var = Variable(ctx.asignacion().ID().getText(),
                       ctx.tipoDato().getText(), yaAsignada, False)
        self.tabla.addID(var)

    # Enter a parse tree produced by compiladorParser#asignacion.from models.Variable import *
    def enterAsignacion(self, ctx: compiladorParser.AsignacionContext):
        pass

    # Exit a parse tree produced by compiladorParser#asignacion.

    def eneterDeclaracionFuncion(self, ctx: compiladorParser.DeclaracionFuncionContext):
        # self.tabla.addContexto()
        pass

    # Exit a parse tree produced by compiladorParser#declaracionFuncion.
    def exitDeclaracionFuncion(self, ctx: compiladorParser.DeclaracionFuncionContext):

        varId = ctx.firmaFuncion().ID().getText()
        varRetorno = ctx.firmaFuncion().retorno().getText()
        varParametros = ctx.firmaFuncion().listaParametros().getText().split(",")
        
        defFuncion = Funcion(varId, varRetorno, varParametros)
        ToTxt.NuevoContexto(self.tabla.getContext())
        self.tabla.delContexto()

        self.tabla.addContexto()
        self.tabla.addID(defFuncion)

        # ToTxt.NuevoContexto(self.tabla.getContext())


del compiladorParser
