import sys
from antlr4 import *
from compiladorLexer import compiladorLexer
from compiladorParser import compiladorParser
from miVisitor import miVisitor
from miListener import miListener


def main(argv):
    archivo = "src/programa.txt"
    if len(argv) > 1 :
        archivo = argv[1]
    input = FileStream(archivo)
    lexer = compiladorLexer(input)
    stream = CommonTokenStream(lexer)
    parser = compiladorParser(stream)
    escucha = miListener()
    parser.addParseListener(escucha)
    tree = parser.prog()
    print(tree.toStringTree(recog=parser))
    walker = miVisitor()
    walker.visit(tree)

if __name__ == '__main__':
    main(sys.argv)