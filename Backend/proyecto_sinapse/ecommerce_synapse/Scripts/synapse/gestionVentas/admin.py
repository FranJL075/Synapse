from django.contrib import admin
from .models import Usuario
from .models import Ingreso
from .models import Detalle_ingreso
from .models import Articulo
from .models import Categoria
from .models import Persona
from .models import Venta
from .models import Detalle_venta

# Register your models here.
class UsuarioAdmin(admin.ModelAdmin):
    list_display = ("nombre", "apellido","documento","numero_documento","direccion","telefono","email","estado")

class IngresoAdmin(admin.ModelAdmin):
    list_display = ("tipo_comprobante","serie_comprobante","num_comprobante","fecha","impuesto","total","estado")
    
class Detalle_ingresoAdmin(admin.ModelAdmin):
    list_display = ("cantidad","precio")

class ArticuloAdmin(admin.ModelAdmin):
    list_display = ("nombre", "precio_venta", "stock", "descripcion","imagen","estado")   

class CategoriaAdmin(admin.ModelAdmin):
    list_display = ("nombre", "descripcion","estado")
    
class PersonaAdmin(admin.ModelAdmin):
    list_display = ("nombre","tipo_documento", "num_documento", "cuit", "direccion", "telefono")
    
class VentaAdmin(admin.ModelAdmin):
    list_display = ("tipo_comprobante", "serie_comprobante", "num_comprobante", "fecha", "impuesto", "total", "estado")
    
class Detalle_ventaAdmin(admin.ModelAdmin):
    list_display = ("cantidad", "precio", "descuento") 
    
admin.site.register(Usuario,UsuarioAdmin)
admin.site.register(Ingreso,IngresoAdmin)
admin.site.register(Detalle_ingreso,Detalle_ingresoAdmin)
admin.site.register(Articulo,ArticuloAdmin)
admin.site.register(Categoria,CategoriaAdmin)
admin.site.register(Persona,PersonaAdmin)
admin.site.register(Venta,VentaAdmin)
admin.site.register(Detalle_venta,Detalle_ventaAdmin)


