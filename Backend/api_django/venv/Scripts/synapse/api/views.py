#from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets
from .serializers import UsuarioSerializer, IngresoSerializer, ArticuloSerializer, CategoriaSerializer, VentaSerializer, RegisterSerializer
from .models import Usuario, Ingreso, Articulo, Categoria, Venta
from rest_framework.response import Response
from knox.models import AuthToken
from rest_framework.decorators import api_view
from rest_framework.authtoken.serializers import AuthTokenSerializer
from knox.auth import AuthToken
from .serializers import RegisterSerializer
from django.dispatch import receiver
from django_rest_passwordreset.signals import reset_password_token_created

@receiver(reset_password_token_created)
def password_reset_token_created(sender, instance, reset_password_token, *args, **kwargs):
    print(f"\nRecupera la contraseña del correo '{reset_password_token.usuario.email}' usando el token '{reset_password_token.key}' desde la API http://localhost:8000/api/reset/confirm/.")


@api_view(['POST'])
def login_api(request):
    serializer = AuthTokenSerializer(data=request.data)
    serializer.is_valid(raise_exception=True)
    user=serializer.validated_data['user']
    _,token = AuthToken.objects.create(user)
    
    return Response({
        'user_info':{
            'id':user.id,
            'username': user.username,
            'email': user.email
        },
        'token':token
    })

@api_view(['GET'])
def get_user_data(request):
    user = request.user
    
    if user.is_authenticated:
        return Response({
            'user_info':{
            'id':user.id,
            'username': user.username,
            'email': user.email
        },
        })
        
    return Response ({'error': 'no autenticado'}, status=400)  

@api_view(['POST'])
def register_api(request):
    serializer = RegisterSerializer(data=request.data)
    serializer.is_valid(raise_exception=True)
    
    user = serializer.save()
    _, token = AuthToken.objects.create(user)
    
    return Response({
        'user_info':{
            'id':user.id,
            'username': user.username,
            'email': user.email
            },
        'token':token
        
        })

    

class UsuarioViewSet(viewsets.ModelViewSet):
    queryset = Usuario.objects.all()
    serializer_class = UsuarioSerializer

class IngresoViewSet(viewsets.ModelViewSet):
    queryset = Ingreso.objects.all()
    serializer_class = IngresoSerializer
    
class ArticuloViewSet(viewsets.ModelViewSet):
    queryset = Articulo.objects.all()
    serializer_class = ArticuloSerializer
    
class CategoriaViewSet(viewsets.ModelViewSet):
    queryset = Categoria.objects.all()
    serializer_class = CategoriaSerializer
    
class VentaViewSet(viewsets.ModelViewSet):
    queryset = Venta.objects.all()
    serializer_class = VentaSerializer

class RegistroViewSet(viewsets.ModelViewSet):
    queryset = Usuario.objects.all()
    serializer_class = RegisterSerializer
