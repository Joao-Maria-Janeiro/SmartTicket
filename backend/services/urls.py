from django.urls import path, include
from . import views
from rest_framework import routers

router = routers.DefaultRouter()
router.register('services', views.ServiceView)

urlpatterns = [
    path('', include(router.urls)),
    path('update/<str:name>', views.incrementCurrentTicket, name="incrementCurrentTicket"),
    path('take/<str:name>', views.incrementLatestRetriviedTicket, name = "incrementLatestRetriviedTicket"),
]
