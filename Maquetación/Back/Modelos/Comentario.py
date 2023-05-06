
class Comentario:
    def Init(self,id_comentario,texto,fechaCreacion):
        self.__id_Comentario = id_comentario
        self.__Texto = texto
        self.__FechaCreacion = fechaCreacion
       
        #Get
    @property
    def Texto(self):
        return self.__Texto

#Set
    @Texto.setter
    def Texto(self,valor):
        self.__Texto=valor


   #Get
    @property
    def FechaCreacion(self):
        return self.__FechaCreacion

#Set
    @FechaCreacion.setter
    def FechaCreacion(self,valor):
         self.__FechaCreacion=valor

    def Crear(self):
        pass
    def Modificar(self):
        pass
    def Eliminar(self):
        pass
    def Listar(self):
        pass