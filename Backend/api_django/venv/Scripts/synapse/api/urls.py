from django.urls import path, include
from rest_framework import routers
from . import views
from rest_framework.documentation import include_docs_urls
from django.urls import path
from knox import views as knox_views


router = routers.DefaultRouter()
router.register(r'usuario', views.UsuarioViewSet)
router.register(r'ingreso', views.IngresoViewSet)
router.register(r'articulo', views.ArticuloViewSet)
router.register(r'categoria', views.CategoriaViewSet)
router.register(r'venta', views.VentaViewSet)




urlpatterns = [
    path('', include(router.urls)),
    #path('docs/', include_docs_urls(title='Synapse API')),
    path('login/', views.login_api),
    path('user/', views.get_user_data),
    path('register/', views.register_api),
    path('logout/', knox_views.LogoutView.as_view()),
    path('logoutall/', knox_views.LogoutAllView.as_view()), 
    path('api/reset/',include('django_rest_passwordreset.urls',namespace='password_reset')),
    path('retornarPagado/', views.retornarPagado.as_view(), name='retornarPagado'),
]
