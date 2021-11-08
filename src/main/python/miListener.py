from antlr4 import *
if __name__ is not None and "." in __name__:
    from .compiladorParser import compiladorParser
else:
    from compiladorParser import compiladorParser
from compiladorListener import compiladorListener

# This class defines a complete listener for a parse tree produced by compiladorParser.
class miListener (compiladorListener):
    numDecl = 0

    # Enter a parse tree produced by compiladorParser#prog.
    def enterProg(self, ctx:compiladorParser.ProgContext):
        print(" ===> Comienza la compilacion")

    # Exit a parse tree produced by compiladorParser#prog.
    def exitProg(self, ctx:compiladorParser.ProgContext):
        print(" ===> Terminamos")
        print("  ==> Se hicieron ", self.numDecl, "declaraciones")

    # Enter a parse tree produced by compiladorParser#declaracion.
    def enterDeclaracion(self, ctx:compiladorParser.DeclaracionContext):
        self.numDecl += 1
        print(" -----> Declaracion (in) -> " + ctx.getText())

    # Exit a parse tree produced by compiladorParser#declaracion.
    def exitDeclaracion(self, ctx:compiladorParser.DeclaracionContext):
        print(" -----> Declaracion (out) -> " + ctx.getText())

