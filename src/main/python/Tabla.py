class Tabla :
    ts = list()


    # Se invoca al comenzar un nuevo contexto.
    # Cada bloque es un contexto
    def addContexto (self) :
        pass

    # Se invoca al cerrarse un contexto.
    # Cada bloque es un contexto
    def delContexto (self) :
        pass

    # Se invoca al querer averiguar la existencia
    # de un ID en cualquier contexto
    def buscarID (self, id) :
        pass

    # Se invoca al querer incorporar un ID en el
    # contexto actual
    def buscarIDlocal (self, id) :
        pass

    # Se invoca al incorporar un ID en el
    # contexto actual
    def addID (self, id) :
        pass
