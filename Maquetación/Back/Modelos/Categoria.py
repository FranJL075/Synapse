class Categoria:
    def Init(self,id_categoria,nombre):
        self.__Id_Categoria = id_categoria
        self.__Nombre = nombre

        #Get
    @property
    def Nombre(self):
        return self.__Nombre

#Set
    @Nombre.setter
    def Nombre(self,valor):
        self.__Nombre=valor



    def Crear(self):
        pass
    def Modificar(self):
        pass
    def Eliminar(self):
        pass
    def Listar(self):
        pass
