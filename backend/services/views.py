from django.shortcuts import render
from rest_framework import viewsets
from .models import Service
from .serializers import ServiceSerializer
from django.http import JsonResponse


# Create your views here.
class ServiceView(viewsets.ModelViewSet):
    queryset = Service.objects.all()
    serializer_class = ServiceSerializer

def incrementCurrentTicket(request, name):
    service = Service.objects.get(name=name)
    service.current_ticket += 1
    service.save()

def incrementLatestRetriviedTicket(request, name):
    service = Service.objects.get(name=name)
    service.latest_retrived_ticket += 1
    service.save()
    return JsonResponse({'ticket':service.latest_retrived_ticket-1})
