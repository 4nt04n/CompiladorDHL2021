from abc import ABC


class ID(ABC):
    def __init__(self, nombre, tipo, inicializada, usada):
        self.nombre = nombre
        self.tipo = tipo
        self.inicializada = inicializada
        self.usada = usada

# nombre
    @property
    def nombre(self):
        return self.__nombre

    @nombre.setter
    def nombre(self, val):
        self.__nombre = val

# tipo
    @property
    def tipo(self):
        return self.__tipo

    @tipo.setter
    def tipo(self, val):
        self.__tipo = val

# inicializada
    @property
    def inicializada(self):
        return self.__inicializada

    @inicializada.setter
    def inicializada(self, val):
        self.__inicializada = val

# usada
    @property
    def usada(self):
        return self.__usada

    @usada.setter
    def usada(self, val):
        self.__usada = val
