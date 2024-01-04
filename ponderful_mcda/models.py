from django.db import models
from django.contrib.gis.db import models
from django.contrib.auth.models import AbstractUser
from django.contrib.auth import get_user_model
from django.conf import settings
from djgeojson.fields import PolygonField
from django.contrib.postgres.fields import ArrayField

# Create your models here.

class CustomUser(AbstractUser):
    organization = models.CharField(max_length=255, verbose_name="Organization",default='none')
    

    def __str__(self):
        return self.username


class studyarea(models.Model):

    landuseintensity_choices = [
    ('low', 'Low'),
    ('average', 'Average'),
    ('high','High'),
]
    name = models.CharField(max_length=255, verbose_name="Study Area Name", unique=True)
    landuseintensity = models.CharField(max_length=255, choices = landuseintensity_choices,blank=True, verbose_name='Landuse Intensity')
    num_small_pond = models.IntegerField(verbose_name="Number of curret small size ponds", blank=True, null=True)
    num_avg_pond = models.IntegerField(verbose_name="Number of curret average size ponds", blank=True, null=True)
    num_big_pond = models.IntegerField(verbose_name="Number of curret big size ponds", blank=True, null=True)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, blank=True, null=True)
    geom = models.PolygonField(srid=4326)

    def __str__(self):
        return self.name


class criteria(models.Model):

    name = models.CharField(max_length=255, verbose_name="Criteria Name")
    unit_of_measure = models.CharField(max_length=255, verbose_name="Unit of Measure")

    def __str__(self):
        return self.name
 
class criteria_params(models.Model):

    criteria = models.ForeignKey(criteria, on_delete=models.CASCADE)
    weight_range = ArrayField(
        models.FloatField(),
        size=2,
        verbose_name="Weight Range",
        default=list,
    )
    weight = models.FloatField(verbose_name="Weight")
    rank = models.IntegerField(verbose_name="Importance Rank")
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    study_area = models.ForeignKey(studyarea, on_delete=models.CASCADE, default=0)


class satisfaction_threshold(models.Model):

    criteria_id = models.ForeignKey(criteria, on_delete=models.CASCADE)
    threshold_min = models.FloatField(verbose_name="minimum satisfaction threshold")
    threshold_max = models.FloatField(verbose_name="maximum satisfaction threshold")
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    study_area = models.ForeignKey(studyarea, on_delete=models.CASCADE, default=0)

