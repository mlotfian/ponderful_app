from leaflet.admin import LeafletGeoAdmin
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

from .forms import CustomUserCreationForm, CustomUserChangeForm
from .models import *
from modeltranslation.translator import register, TranslationOptions
from modeltranslation.admin import TranslationAdmin
# Register your models here.

class CustomUserAdmin(UserAdmin):
    add_form = CustomUserCreationForm
    form = CustomUserChangeForm
    model = CustomUser
    list_display = ["email", "username","organization",]

def copy_records(modeladmin, request, queryset):
    for obj in queryset:
        obj.pk = None  # Clear the primary key to create a new record
        obj.save()

copy_records.short_description = "Copy selected records with new IDs"



admin.site.register(CustomUser, CustomUserAdmin)

admin.site.register(AnalysisRun)

admin.site.register(studyarea, LeafletGeoAdmin)

admin.site.register(criteria)



class CriteriaParamsAdmin(admin.ModelAdmin):
    list_display = ['id', 'criteria','weight_percentage' ,'analysis_run', 'rank']  # Adapt field names as needed
    
admin.site.register(criteria_params, CriteriaParamsAdmin)


admin.site.register(action_types)

admin.site.register(alternatives_params)

admin.site.register(scenario)


admin.site.register(scenario_user)

class ModelingResultAdmin(admin.ModelAdmin):
    list_display = ['id','action' ,'scenario','pond_num', 'criteria','output']  # Adapt field names as needed
    list_editable = ['action','scenario','pond_num', 'criteria','output']
    #list_editable_links = ['id']  # Adapt field names as needed
    actions = [copy_records]

admin.site.register(modeling_result, ModelingResultAdmin)


class SatisfactionAdmin(admin.ModelAdmin):
    list_display = ['id','criteria_id' ,'threshold_min','threshold_max', 'user','study_area']  # Adapt field names as needed
    list_editable = ['criteria_id' ,'threshold_min','threshold_max', 'user','study_area']
    #list_editable_links = ['id']  # Adapt field names as needed
    actions = [copy_records]

admin.site.register(satisfaction_threshold, SatisfactionAdmin)

class MCDAResultAdmin(admin.ModelAdmin):
    list_display = ['id','alternative',
    'scenario',
    'criteria',
    'analysis_run',
    'model_result',
    'partial_satisfaction',
    'weighted_avg'
]  # Adapt field names as needed
    

admin.site.register(mcda_result, MCDAResultAdmin)

#@admin.register(scenario)



