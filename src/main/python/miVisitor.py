from antlr4 import *
if __name__ is not None and "." in __name__:
    from .compiladorParser import compiladorParser
else:
    from compiladorParser import compiladorParser
from compiladorVisitor import compiladorVisitor

class miVisitor (compiladorVisitor) :
    def visitProg(self, ctx:compiladorParser.ProgContext):
        print (" ... Comienza el recorrido")
        print ("   ++++ Cant nodos ", ctx.getChildCount())
        return self.visitChildren(ctx)

    def visitDeclaracion(self, ctx:compiladorParser.DeclaracionContext):
        print (" ... Declaracion |", ctx.getText(),"|")
        print ("   ++++ Cant nodos ", ctx.getChildCount())
        return self.visitChildren(ctx)

