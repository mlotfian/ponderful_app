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

class AnalysisRun(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    analysis_number = models.IntegerField(default=1)
    
    def __str__(self):
        return f"{self.user.username} - Analysis {self.analysis_number}"

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
        null=True, 
        blank=True,
    )
    weight = models.FloatField(verbose_name="Weight")
    weight_percentage = models.FloatField(verbose_name="Weight in percentage", default=100)
    rank = models.IntegerField(verbose_name="Importance Rank")
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    study_area = models.ForeignKey(studyarea, on_delete=models.CASCADE, default=0)
    analysis_run = models.ForeignKey(AnalysisRun, on_delete=models.CASCADE)

class satisfaction_threshold(models.Model):

    criteria_id = models.ForeignKey(criteria, on_delete=models.CASCADE)
    threshold_min = models.FloatField(verbose_name="minimum satisfaction threshold")
    threshold_max = models.FloatField(verbose_name="maximum satisfaction threshold")
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    study_area = models.ForeignKey(studyarea, on_delete=models.CASCADE, default=0)

# add discription to the NBS 
class action_types(models.Model):
    actions_types = [
    ('Creation', 'Creation'),
    ('Restoration', 'Restoration'),
    ('Water management','Water management'), # quantity 
    ('Land management','Land management'), # pollution? or change the land cover?  
    ('No action','No action'),
    ('Management','Management'), 
    ]
    name = models.CharField(max_length=255, choices = actions_types, verbose_name="Action Name")
    

    def __str__(self):
        return self.name

class alternatives_params(models.Model):
    action = models.ForeignKey(action_types, on_delete=models.CASCADE)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    pond_min = models.IntegerField(verbose_name="Minimum number of ponds")
    pond_max = models.IntegerField(verbose_name="Maximum number of ponds")
    pond_sizes = [
    ('small', 'Small'),
    ('average', 'Average'),
    ('big','Big'),
    ]

    pond_size = models.CharField(max_length=255, choices = pond_sizes,default='none' )
    analysis_run = models.ForeignKey(AnalysisRun, on_delete=models.CASCADE)

# to be discussed with WP3 
# add without land use change to all the other scenarios, e.g., sus + without lu change..
class scenario(models.Model):
    scenario_category = [
    ('Sustainability', 'Sustainability'),
    ('Regional rivalry', 'Regional rivalry'),
    ('Fossil-fueled development','Fossil-fueled development'),
    ('Without land use change','Without land use change'),]
    #'With land use improvement? check with WP3']

    name = models.CharField(max_length=255, choices = scenario_category, verbose_name="Climate Change Scenario")
    description = models.TextField(null=True, blank=True)
    
    def __str__(self):
        return self.name

class scenario_user(models.Model):
    #scenario = models.ForeignKey(scenario, on_delete=models.CASCADE)
    scenario_type = models.ForeignKey(scenario, on_delete=models.CASCADE)
    analysis_run = models.ForeignKey(AnalysisRun, on_delete=models.CASCADE)

class modeling_result(models.Model):
    action = models.ForeignKey(action_types, on_delete=models.CASCADE)
    scenario = models.ForeignKey(scenario, on_delete=models.CASCADE)
    pond_num = models.IntegerField(verbose_name="Number of ponds", blank=True, null=True)
    criteria = models.ForeignKey(criteria, on_delete=models.CASCADE)
    output = models.FloatField(verbose_name="Modeling output")

class mcda_result(models.Model):
    alternative = models.CharField(max_length=255, verbose_name="Alternative actions")
    scenario = models.ForeignKey(scenario, on_delete=models.CASCADE)
    criteria = models.ForeignKey(criteria, on_delete=models.CASCADE)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    analysis_run = models.ForeignKey(AnalysisRun, on_delete=models.CASCADE)
    model_result = models.FloatField(verbose_name="Modeling output")
    weight = models.FloatField(verbose_name="weight")
    partial_satisfaction = models.FloatField(verbose_name="Partial satisfaction")
    weighted_avg = models.FloatField(verbose_name="Partial weighted average")
