
class Pregunta:
    def __Init__(self,id_pregunta,titulo,descripcion,fechaCreacion,etiqueta):
        self.__Id_Pregunta = id_pregunta
        self.__Titulo = titulo
        self.__Descripcion = descripcion
        self.__FechaCreacion = fechaCreacion
        self.__Etiqueta = etiqueta

                #Get
    @property
    def Titulo(self):
        return self.__Titulo

#Set
    @Titulo.setter
    def Titulo(self,valor):
        self.__Titulo=valor

    #Get
    @property
    def Descripcion(self):
        return self.__Descripcion

#Set
    @Descripcion.setter
    def Descripcion(self,valor):
        self.__Descripcion=valor

   #Get
    @property
    def FechaCreacion(self):
        return self.__FechaCreacion

#Set
    @FechaCreacion.setter
    def FechaCreacion(self,valor):
         self.__FechaCreacion=valor

    #Get
    @property
    def Etiqueta(self):
        return self.__Etiqueta

#Set
    @Etiqueta.setter
    def FechaCreacion(self,valor):
         self.__Etiqueta=valor
        
    def Crear(self):
        pass
    def Modificar(self):
        pass
    def Eliminar(self):
        pass
    def Listar(self):
        pass