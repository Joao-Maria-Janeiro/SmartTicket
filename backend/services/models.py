from django.db import models

# Create your models here.
class Service(models.Model):
    name = models.CharField(max_length=200)
    latest_retrived_ticket = models.IntegerField()
    current_ticket = models.IntegerField()
