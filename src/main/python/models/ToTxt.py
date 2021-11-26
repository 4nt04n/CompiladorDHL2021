from models.ID import ID


class ToTxt:

    def NuevoContexto(diccionario):
        keys = diccionario.keys()
        try:
            file = open("src/TablaSimbolos.txt", mode="a", encoding="utf-8")
            for dato in keys:
                file.write(diccionario[dato].toString())
                file.write(" | ")
            file.write("\n ----------------------------------------\n")
            file.close
        except:
            print("Error en el archivo")

    def ResetTxt():
        try:
            file = open("src/TablaSimbolos.txt", mode="w", encoding="utf-8")
            file.write("")
            file.close
        except:
            print("Error en el archivo")
