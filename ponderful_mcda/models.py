from django.db import models
from django.contrib.gis.db import models
from django.contrib.auth.models import AbstractUser
from django.contrib.auth import get_user_model
from django.conf import settings
from djgeojson.fields import PolygonField
from django.contrib.postgres.fields import ArrayField
from django.core.validators import MaxValueValidator, MinValueValidator 
from django.utils.translation import gettext_lazy as _
from modeltranslation.translator import register, TranslationOptions

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
    landuseintensity = models.CharField(max_length=255, choices = landuseintensity_choices,blank=True, verbose_name=_('Landuse Intensity'))
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
    rank = models.IntegerField(verbose_name="rank")
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
    ('Creation', _('Creation')),
    ('Restoration', _('Restoration')),
    ('Water management',_('Water management')), # quantity 
    ('Land management',_('Land management')), # pollution? or change the land cover?  
    ('No action',_('No action')),
    ]
    name = models.CharField(max_length=255, choices = actions_types, verbose_name="Action Name")
    

    def __str__(self):
        return self.name

class alternatives_params(models.Model):
    action = models.ForeignKey(action_types, on_delete=models.CASCADE, verbose_name=_("NBS implementation type"))
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    pond_min = models.IntegerField(verbose_name=_("Minimum number of ponds"), validators=[MinValueValidator(1), MaxValueValidator(20)])
    pond_max = models.IntegerField(verbose_name=_("Maximum number of ponds"), validators=[MinValueValidator(1), MaxValueValidator(20)])
    pond_sizes = [
    ('small', _('Small')),
    ('average', _('Average')),
    ('big',_('Big')),
    ]

    pond_size = models.CharField(max_length=255, choices = pond_sizes,default='none',verbose_name=_("Pond Size") )
    analysis_run = models.ForeignKey(AnalysisRun, on_delete=models.CASCADE)

# to be discussed with WP3 
# add without land use change to all the other scenarios, e.g., sus + without lu change..
class scenario(models.Model):
     
    scenario_category = [
    ('Land Use: SSP1, Climate Change: SSP1', _('Land Use: SSP1, Climate Change: SSP1')),
    ('Land Use: SSP3, Climate Change: SSP3', _('Land Use: SSP3, Climate Change: SSP3')),
    ('Land Use: SSP5, Climate Change: SSP5',_('Land Use: SSP5, Climate Change: SSP5')),
    ('Land Use: No Change, Climate Change: SSP1',_('Land Use: No Change, Climate Change: SSP1')),
    ('Land Use: No Change, Climate Change: SSP3',_('Land Use: No Change, Climate Change: SSP3')),
    ('Land Use: No Change, Climate Change: SSP5',_('Land Use: No Change, Climate Change: SSP5')),
    ('Land Use: No Change, Climate Change: No Change',_('Land Use: No Change, Climate Change: No Change'))]
    #'With land use improvement? check with WP3']

    level_category= [
        ('No Change', _('No Change')),
        ('Slight', _('Slight')),
        ('Moderate', _('Moderate')),
        ('Strong', _('Strong'))
    ]

    name = models.CharField(max_length=255, choices = scenario_category, verbose_name="Climate Change Scenario")
    description = models.TextField(null=True, blank=True)
    landuse = models.CharField(max_length=255, choices = level_category, verbose_name="Land Use", null=True, blank=True)
    climate = models.CharField(max_length=255, choices = level_category, verbose_name="Climate Change", null=True, blank=True)
    
    def __str__(self):
        return self.name

class scenario_user(models.Model):
    #scenario = models.ForeignKey(scenario, on_delete=models.CASCADE)
    scenario_type = models.ForeignKey(scenario, on_delete=models.CASCADE, verbose_name=_("Scenario Type"))
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
