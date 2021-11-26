from models.ID import ID


class Variable(ID):
    def __init__(self, nombre, tipo, inicializada, usada):
        super().__init__(nombre, tipo, inicializada, usada)

    def toString(self):
        dato="Variable --> Nombre: {}, Tipo: {}, Inicializada: {}, Usada: {}".format(self.nombre,self.tipo,self.inicializada,self.usada)
        return dato
