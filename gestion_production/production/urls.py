# production/urls.py
from django.urls import path
from . import views  # Assurez-vous d'importer vos vues

urlpatterns = [
    path('', views.home, name='home'),  # Route pour la page d'accueil
]
