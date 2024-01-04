from django.contrib.auth.forms import UserCreationForm, UserChangeForm

from .models import CustomUser

import floppyforms as forms
from django import forms
from django.contrib.gis import forms as gis_forms
from .models import studyarea, criteria_params, criteria
from django.forms import ModelForm
from django.forms import modelformset_factory

# forms.py
import floppyforms as forms

class CustomUserCreationForm(UserCreationForm):

    class Meta:
        model = CustomUser
        fields = ("username", "email","organization" )

class CustomUserChangeForm(UserChangeForm):

    class Meta:
        model = CustomUser
        fields = ("username", "email", "organization")


class StudyAreaForm(ModelForm):
    class Meta:
        model = studyarea
        fields = ['landuseintensity', 'num_small_pond', 'num_avg_pond', 'num_big_pond', 'geom']
        widgets = {'geom': gis_forms.OSMWidget}

class StudyAreaSelectionForm(forms.Form):
    study_area_name = forms.ModelChoiceField(
        queryset=studyarea.objects.all(),
        empty_label='Select a Study Area',
        widget=forms.Select(attrs={'onchange': 'this.form.submit();'}),
    )


class CriteriaForm(forms.Form):
    criteria_choices = forms.ModelMultipleChoiceField(
        queryset=criteria.objects.all(),
        widget=forms.CheckboxSelectMultiple,
        label="Select Criteria"
    )



class CriteriaParamsForm(forms.ModelForm):
    class Meta:
        model = criteria_params
        fields = ['weight_range', 'weight', 'rank', 'user', 'study_area']



        

