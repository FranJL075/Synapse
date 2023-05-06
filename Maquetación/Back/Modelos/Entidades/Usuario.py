from werkzeug.security import check_password_hash,generate_password_hash
from flask_login import UserMixin

class Usuario(UserMixin):   
    def __init__(self,id, nombre, apellido,username,descripcion,fechaAlta,ciudad,imagenPerfil, contraseña,email)-> None:
        self.__id=id
        self.__Nombre=nombre
        self.__Apellido=apellido
        self.__Username=username
        self.__email=email
        self.__contraseña=contraseña
        self.__Descripcion=descripcion
        self.__FechaAlta=fechaAlta
        self.__Ciudad=ciudad
        self.__ImagenPerfil=imagenPerfil
        
    
    @classmethod
    def check_password(self, hashed_password, contraseña):
        return check_password_hash(hashed_password, contraseña)

# print(generate_password_hash('admin123'))
        
    @property
    def id(self):
         return self.__id

# #Set
    @id.setter
    def id(self,valor):
        self.__id=valor



    @property
    def Nombre(self):
         return self.__Nombre

# #Set
    @Nombre.setter
    def Nombre(self,valor):
        self.__Nombre=valor

     #Get
    @property
    def Apellido(self):
         return self.__Apellido

 #Set
    @Apellido.setter
    def Apellido(self,valor):
        self.__Apellido=valor

    #Get
    @property
    def Username(self):
         return self.__Username

 #Set
    @Username.setter
    def Username(self,valor):
        self.__Username=valor

   #Get
    @property
    def email(self):
         return self.__email
# #Set
    @email.setter
    def Email(self,valor):
        self.__email=valor

     #Get
    @property
    def contraseña(self):
         return self.__contraseña
 #Set
    @contraseña.setter
    def Contraseña(self,valor):
        self.__contraseña=valor

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
    def FechaAlta(self):
        return self.__FechaAlta

 #Set
    @FechaAlta.setter
    def FechaAlta(self,valor):
        self.__FechaAlta=valor

    
     #Get
    @property
    def Ciudad(self):
         return self.__Ciudad

 #Set
    @Ciudad.setter
    def Ciudad(self,valor):
        self.__Ciudad=valor


