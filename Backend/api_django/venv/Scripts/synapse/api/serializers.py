from rest_framework import serializers
from .models import Usuario, Ingreso, Articulo, Categoria, Venta, Persona, Detalle_ingreso, Detalle_venta
from rest_framework import serializers,validators
from django.contrib.auth.models import User

class RegisterSerializer(serializers.ModelSerializer):
    class Meta:
        model= User
        fields= ('username', 'password', 'email', 'name', 'dni', 'dateOfBirth', 'gender', 'last_name')
        
        extra_kwargs = {
            'password': {'write_only': True},
            'email': {
                'required': True,
                'allow_blank': False,
                'validators': [
                    validators.UniqueValidator(
                        User.objects.all(), 'ya existe un usuario con esa dirección de correo electrónico'
                    )
                ]
            }
        }
    
    def create(self, validated_data):
        username = validated_data.get('username')
        password = validated_data.get('password')
        email = validated_data.get('email')
        name = validated_data.get('name')
        dni = validated_data.get('dni')
        dateOfBirth = validated_data.get('dateOfBirth')
        gender = validated_data.get('gender')
        last_name = validated_data.get('last_name')
        
        user = User.objects.create(
            username = username,
            password = password,
            email = email,
            name = name,
            dni = dni,
            dateOfBirth = dateOfBirth,
            gender = gender,
            last_name = last_name,
        )
        
        return user



class UsuarioSerializer(serializers.ModelSerializer):
    class Meta:
        model = Usuario
        fields = '__all__'

class IngresoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ingreso
        fields = '__all__'
        
class ArticuloSerializer(serializers.ModelSerializer):
    class Meta:
        model = Articulo
        fields = '__all__'
        
class CategoriaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Categoria
        fields = '__all__'
        
class VentaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Venta
        fields = '__all__'
        
class Detalle_ingresoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Detalle_ingreso
        fields = '__all__'
        
class PersonaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Persona
        fields = '__all__'
        
class Detalle_ventaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Detalle_venta
        fields = '__all__'