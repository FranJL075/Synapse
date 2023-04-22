from sqlite3 import Cursor
from ssl import SSLSession
from config import config
from flask import Flask, render_template,redirect,url_for,flash,request
from flask_login import LoginManager, login_user, logout_user, login_required
import pymysql



#Modelos
from Modelos.UsuarioModelo import UsuarioModelo

#Entidades
from Modelos.Entidades.Usuario import Usuario


app = Flask(__name__)

#db=MySQL(app)

#SETTINGS/Session
app.secret_key='mynewsecretKey'

#Logueo de usuario
login_manager_app=LoginManager(app)

@login_manager_app.user_loader
def load_user(id):   
    conn=pymysql.connect(host='127.0.0.1',user='Matias',passwd='Silas_2021',db='Datask-db')
    return UsuarioModelo.get_id(conn, id)




# RUTEO
#INDEX
@app.route('/')
def Index():
   return redirect (url_for('Login'))

#INDEX
@app.route('/Home')
def Home():
  return render_template('index.html')



#CREAR/AGREGAR
@app.route('/AgregarArticulo',  methods=['POST', 'GET'])
#@login_required
def AgregarArticulo():
    # GET (consulto los datos guardados de articulos y las categorias)
    conn=pymysql.connect(host='127.0.0.1',user='Matias',passwd='Silas_2021',db='Datask-db')
    cur=conn.cursor()
    cur.execute('SELECT * FROM articulo')
    listaArticulos= cur.fetchall()
    cur.execute('SELECT * FROM categoria')
    dataCat=cur.fetchall()

    # POST (Paso por parametro los datos del formulario de creación de articulos)
    if request.method=='POST':
        Titulo= request.form['Titulo']
        Texto= request.form['Texto']
        Fecha= request.form['Fecha']
        Categoria= request.form['Categoria']
        Administrador= request.form['Administrador']
        cur=conn.cursor()

        cur.execute('INSERT INTO articulo (Titulo, Texto, FechaCreacion,Categoria_Id_Categoria,Usuario_Id_Usuario) VALUES (%s, %s,%s,%s,%s)',
        (Titulo,Texto,Fecha,Categoria,Administrador)),
        conn.commit()
        flash('Articulo agregado correctamente')
        return redirect(url_for('AgregarArticulo'))

    return render_template("crearArticulos.html", articulos=listaArticulos,listaCategorias=dataCat)


#EDITAR
@app.route('/EditarArticulo/<string:id>')
@login_required
def ObtenerArticulo(id):

    # GET (traigo los datos guardados de los articulos creados en una nueva vista para poder editarlos)    
    conn=pymysql.connect(host='127.0.0.1',user='Matias',passwd='Silas_2021',db='Datask-db')
    cur=conn.cursor()
    cur.execute('SELECT * FROM articulo WHERE Id_Articulo= {0}'.format(id))
    data=cur.fetchall()
    return render_template('editarArticulo.html', articulosEditar=data[0])

#POST -- METODO DONDE ACTUALIZO LOS DATOS CREADOS PREVIAMENTE
@app.route('/ActualizarArticulo/<id>', methods= ['POST'])
@login_required
def actualizar_articulo(id):
    if request.method=='POST':
        Titulo= request.form['Titulo']
        Texto= request.form['Texto']
        Fecha= request.form['Fecha']
        Categoria= request.form['Categoria']
        Administrador= request.form['Administrador']        
        conn=pymysql.connect(host='127.0.0.1',user='Matias',passwd='Silas_2021',db='Datask-db')
        cur=conn.cursor()
        cur.execute("""UPDATE articulo SET Titulo =%s,
        Texto=%s,FechaCreacion=%s,Categoria_Id_Categoria=%s,Usuario_Id_Usuario=%s Where Id_Articulo=%s""",(Titulo, Texto, Fecha,Categoria,Administrador,id))
        conn.commit()
        flash("Articulo actualizado correctamente")
        return redirect(url_for('AgregarArticulo'))


#ELIMINAR
@app.route('/EliminarArticulo/<string:id>')
def EliminarArticulo(id):  
    conn=pymysql.connect(host='127.0.0.1',user='Matias',passwd='Silas_2021',db='Datask-db')
    cur=conn.cursor()  
    cur.execute('DELETE FROM articulo WHERE Id_Articulo={0}'.format(id))
    conn.commit()
    flash('Articulo eliminado correctamente')
    return redirect(url_for('AgregarArticulo'))


# RUTA DEL FORMULARIO DE CONTACTO
@app.route('/Contacto',methods=['POST','GET'])
def Contacto():
    return render_template("contacto.html")

# RUTA DEL FORMULARIO DE LOGIN
@app.route('/Login',  methods=['POST', 'GET'])
def Login():
    conn=pymysql.connect(host='127.0.0.1',user='Matias',passwd='Silas_2021',db='Datask-db')
    if request.method=='POST':
        user = Usuario(0,None,None,None,None,None,None,None,request.form['contraseña'],request.form['email'])
        usuario_logueado= UsuarioModelo.login(conn, user)

        if usuario_logueado != None:
            if usuario_logueado.contraseña:
                login_user(usuario_logueado)

                return redirect(url_for('Home'))
            else:
                flash("Contraseña inválida...")
                return render_template('ingresar.html')
        else:
            flash("Usuario no encontrado...")
            return render_template('ingresar.html')
    else:
        return render_template('ingresar.html')

@app.route('/logout')
def logout():
    logout_user()
    return redirect(url_for('Login'))

# RUTA DEL FORMULARIO DE REGISTRO
@app.route('/Registrarse',methods=['post','GET'])
def Registrarse():
    return render_template("registrarse.html")


#Puerto desde donde corremos nuestra aplicacion
if __name__=='__main__':
    app.config.from_object(config['development'])
    app.run()