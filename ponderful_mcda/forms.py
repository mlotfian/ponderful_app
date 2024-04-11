from django.contrib.auth.forms import UserCreationForm, UserChangeForm

from .models import CustomUser

#import floppyforms as forms
from django import forms
from django.contrib.gis import forms as gis_forms
from .models import *
from django.forms import ModelForm
#from floppyforms.models import ModelForm
from django.forms import modelformset_factory
from django.forms import widgets

# forms.py
#import floppyforms as forms

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
        label="Select the NCP Indicators of Your Interest:"
    )



class WeightRangeForm(forms.ModelForm):
    class Meta:
        model = criteria_params
        fields = ['weight_range']

"""class RankSliderWidget(forms.widgets.NumberInput):
    template_name = 'widgets/rank_slider_widget.html' 
  
    def render(self, name, value, attrs=None, renderer=None):
        if value is not None:
            attrs['value'] = str(value)
        return super().render(name, value, attrs=attrs, renderer=renderer)"""

      

"""class RankSliderWidget(forms.NumberInput):
    input_type = 'range'
    input_id = 'myRange'
    template_name = 'widgets/rank_slider_widget.html'"""

class RangeSliderWidget(forms.MultiWidget):
    def __init__(self, attrs=None):
        widgets = (forms.TextInput(attrs=attrs), forms.TextInput(attrs=attrs))
        super().__init__(widgets, attrs)

    def decompress(self, value):
        if value:
            return [value[0], value[1]]
        return [None, None]

    def format_output(self, rendered_widgets):
        return f'{rendered_widgets[0]} to {rendered_widgets[1]}'

"""class CriteriaParamsForm(forms.ModelForm):
    rank = forms.IntegerField(widget=SliderRangeInput(min_value=0, max_value=100))

    class Meta:
        model = criteria_params
        fields = ['rank']"""


class AlternativesParamsForm(forms.ModelForm):
    class Meta:
        model = alternatives_params
        fields = ['action','pond_min', 'pond_max', 'pond_size']

class ScenarioForm(forms.ModelForm):
    class Meta:
        model = scenario_user
        fields = ['scenario_type']
        labels = {
            'scenario': 'Select Climate Change Scenario',
        }
        
    def __init__(self, *args, **kwargs):
        super(ScenarioForm, self).__init__(*args, **kwargs)
        # Adjust the queryset for scenario_type field
        self.fields['scenario_type'].queryset = scenario.objects.all().order_by('-id')

