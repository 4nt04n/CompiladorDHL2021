import sys
from antlr4 import *
from compiladorLexer import compiladorLexer
from compiladorParser import compiladorParser


def main(argv):
    input = FileStream(argv[1])
    lexer = compiladorLexer(input)
    stream = CommonTokenStream(lexer)
    parser = compiladorParser(stream)
    tree = parser.r()
    print(tree.toStringTree(recog=parser))

if __name__ == '__main__':
    main(sys.argv)