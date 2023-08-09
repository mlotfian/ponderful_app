from django.db import models
from django.contrib.gis.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.

class CustomUser(AbstractUser):
    organization = models.CharField(max_length=255, verbose_name="Organization",default='none')
    

    def __str__(self):
        return self.username



