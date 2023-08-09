from django.db import models
from django.contrib.gis.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.

class CustomUser(AbstractUser):
    organization = models.CharField(max_length=255, verbose_name="Organization",default='none')
    

    def __str__(self):
        return self.username


class Species(models.Model):
    species_choices = [
    ('tree', 'Tree'),
    ('bird', 'Bird'),
    ('flower','Flower'),
    ('butterfly','Butterfly'),
]

    name = models.CharField(max_length=255, verbose_name="Name",)
    obs_type = models.CharField(max_length=255, choices = species_choices,default='none' )
    def __str__(self):
        return '{} {}'.format(self.name, self.obs_type)

