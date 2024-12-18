# production/views.py
from django.shortcuts import render

def home(request):
    return render(request, 'production/dashboard.html')  # Assurez-vous que le template existe
