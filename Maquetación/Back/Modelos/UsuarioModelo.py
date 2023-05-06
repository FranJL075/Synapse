
from .Entidades.Usuario import Usuario
import pymysql

class UsuarioModelo():
    
    # el @classmethod es un decorador que me permite instanciar el metodo sin instanciarlo
    @classmethod
    def login(self, conn, usuario):
        conn=pymysql.connect(host='127.0.0.1',user='Matias',passwd='Silas_2021',db='Datask-db')
        try:
            cursor = conn.cursor()
            sql = """SELECT id, Contraseña, Email FROM Usuario
                    WHERE Email = '{}'""".format(usuario.email)
            cursor.execute(sql)
            row = cursor.fetchone()
            if row != None:
                print(row)               
                usuario = Usuario(row[0],None,None,None,None,None,None,None,Usuario.check_password(row[1], usuario.contraseña),row[2])
                return usuario
            else:
                return None
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def get_id(self, db, id):
        
        try:
            conn=pymysql.connect(host='127.0.0.1',user='Matias',passwd='Silas_2021',db='Datask-db')
            cursor = conn.cursor()
            sql = "SELECT id,Username, Email FROM usuario WHERE id= {}".format(id)
            cursor.execute(sql)
            row = cursor.fetchone()
            if row != None:
                return Usuario(row[0],None,None,row[1],None,None,None,None,None,row[2])
            else:
                return None
        except Exception as ex:
            raise Exception(ex)
            
