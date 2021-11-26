

class Tabla():

    # Singleton
    class __Tabla:
        def __init__(self):
            self.ts = []
            self.len=0

        def buscarID(self, ID):
            for d in self.ts[::-1]:
                if ID.nombre in d:
                    return True

        def buscarIDlocal(self, ID):
            return ID.nombre in self.ts[-1]

        def addID(self, ID):
            self.ts[-1].update({ID.nombre: ID})
            self.len+=1
            # self.ts[-1][ID.nombre] = ID

        def addContexto(self):
            self.ts.append({})

        def delContexto(self):
            del self.ts[-1]

        def getContext(self):
            return self.ts[-1]

         
                   

    instance = None

    def __init__(self):
        if not Tabla.instance:
            Tabla.instance = Tabla.__Tabla()

    def __getattr__(self, name):
        return getattr(self.instance, name)
