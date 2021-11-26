from models.ID import ID


class Funcion(ID):

    def __init__(self, nombre, tipo, parametros=None):

        self.parametros = parametros
        self.nombre = nombre
        self.tipo = tipo

    def toString(self):
        dato = "Funcion --> Nombre: {}, Tipo:{}, Parametros: {}".format(
            self.nombre, self.tipo, self.parametros)
        return dato


# Parametros


    @property
    def parametros(self):
        return self.__parametros

    @parametros.setter
    def parametros(self, val):
        self.__parametros = val
