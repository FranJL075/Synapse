from django.db import models

# Create your models here.
class Usuario(models.Model):
    id_usuario= models.AutoField(primary_key=True)
    name = models.CharField(max_length=50, blank=False)
    lastname = models.CharField(max_length=40, blank=False)
    username = models.CharField(max_length=40, blank=False)
    dni = models.CharField(max_length=30, blank=True)
    adress = models.CharField(max_length=100)
    telefono = models.CharField(max_length=100)
    email = models.EmailField(blank=True)
    imagen = models.ImageField(blank=' ', default=' ',upload_to="media/")
    estado = models.CharField(max_length=20, blank=False)
    
    class Meta:
        db_table= "usuario"
        verbose_name = "categorias de usuarios"
        verbose_name_plural= "usuarios"
    def __unicode__(self):
        return self.name 
    def __str__(self):
        return self.name
    
    

class Ingreso(models.Model):
    id_ingreso= models.AutoField(primary_key=True)
    tipo_comprobante = models.CharField(max_length=100, blank=False)
    serie_comprobante = models.CharField(max_length=100, blank=False)
    num_comprobante = models.CharField(max_length=100, blank=False)
    fecha = models.DateField(null=False)
    impuesto = models.IntegerField(blank= False, default= 0)
    total = models.IntegerField(blank= False, default= 0)
    estado = models.CharField(max_length=20, blank=False)
    id_usuario = models.ForeignKey(Usuario,to_field="id_usuario",on_delete=models.CASCADE)
    class Meta:
        db_table= "ingreso"
        verbose_name = "total de ingresos"
        verbose_name_plural= "ingresos"
    def __unicode__(self):
        return self.num_comprobante 
    def __str__(self):
        return self.num_comprobante


class Detalle_ingreso(models.Model):
    id_detalleingreso=models.AutoField(primary_key=True)
    cantidad = models.CharField(max_length=100, blank=False)
    precio = models.IntegerField(blank= False, default= 0)
    id_ingreso = models.ForeignKey(Ingreso,to_field="id_ingreso",on_delete=models.CASCADE)
    class Meta:
        db_table= "detalle del ingreso"
        verbose_name = "cantidad de ingresos"
        verbose_name_plural= "detalles de los ingresos"
    def __unicode__(self):
        return self.cantidad 
    def __str__(self):
        return self.cantidad

class Articulo(models.Model):
    codigo = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=40, blank=False)
    precio_venta = models.IntegerField(blank= False, default= 0)
    stock = models.IntegerField(blank= False, default= 0)
    descripcion = models.CharField(max_length=300, blank=False)
    imagen = models.ImageField(blank=' ', default=' ',upload_to="media/")
    estado = models.CharField(max_length=30, blank=False)
    id_detalleingreso = models.ForeignKey(Detalle_ingreso,to_field="id_detalleingreso",on_delete=models.CASCADE)
    class Meta:
        db_table= "articulo"
        verbose_name = "nombre de los articulos"
        verbose_name_plural= "articulos"
    def __unicode__(self):
        return self.nombre 
    def __str__(self):
        return self.nombre


class Categoria(models.Model):
    id_categoria= models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100, blank=False)
    descripcion = models.CharField(max_length=300, blank=False)
    estado = models.CharField(max_length=20, blank=False)
    codigo = models.ForeignKey(Articulo,to_field="codigo",on_delete=models.CASCADE)
    class Meta:
        db_table= "categoria"
        verbose_name = "nombre de las categorias"
        verbose_name_plural= "categorias"
    def __unicode__(self):
        return self.nombre 
    def __str__(self):
        return self.nombre
    


class Persona(models.Model):
    id_persona= models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100, blank=False)
    tipo_documento = models.CharField(max_length=20, blank=False)
    dni = models.IntegerField(blank= False, default= 0)
    cuit = models.CharField(max_length=100, blank=False)
    direccion = models.CharField(max_length=100, blank=False)
    telefono = models.CharField(max_length=100, blank=False)
    id_usuario = models.ForeignKey(Usuario,to_field="id_usuario",on_delete=models.CASCADE)
    class Meta:
        db_table= "persona"
        verbose_name = "registro de las personas"
        verbose_name_plural= "personas"
    def __unicode__(self):
        return self.nombre 
    def __str__(self):
        return self.nombre
    


class Venta(models.Model):
    id_venta=models.AutoField(primary_key=True)
    tipo_comprobante = models.CharField(max_length=100, blank=False)
    serie_comprobante = models.CharField(max_length=100, blank=False)
    num_comprobante = models.IntegerField(blank= False, default= 0)
    fecha = models.DateField(null=False)
    impuesto = models.IntegerField(blank= False, default= 0)
    total = models.IntegerField(blank= False, default= 0)
    estado = models.CharField(max_length=20, blank=False)
    id_Persona = models.ForeignKey(Persona,to_field="id_persona",on_delete=models.CASCADE)
    class Meta:
        db_table= "venta"
        verbose_name = "cantidad de ventas"
        verbose_name_plural= "ventas"
    def __unicode__(self):
        return self.estado 
    def __str__(self):
        return self.estado
    


class Detalle_venta(models.Model):
    id_detalleventa= models.AutoField(primary_key=True)
    cantidad = models.CharField(max_length=100, blank=False)
    precio = models.IntegerField(blank= False, default= 0)
    descuento = models.IntegerField(blank= False, default= 0)
    id_venta = models.ForeignKey(Venta,to_field="id_venta",on_delete=models.CASCADE)
    class Meta:
        db_table= "detalle de venta"
        verbose_name = "cantidad de ventas"
        verbose_name_plural= "detalle de ventas"
    def __unicode__(self):
        return self.cantidad 
    def __str__(self):
        return self.cantidad