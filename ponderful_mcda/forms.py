from django.contrib.auth.forms import UserCreationForm, UserChangeForm

from .models import CustomUser

import floppyforms as forms
from django import forms
from django.contrib.gis import forms as gis_forms
from .models import studyarea, criteria_params, criteria
from django.forms import ModelForm
from django.forms import modelformset_factory
from django.forms import widgets

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

class SliderRangeInput(widgets.NumberInput):
    def __init__(self, min_value=0, max_value=100, step=1):
        super().__init__()
        self.min_value = min_value
        self.max_value = max_value
        self.step = step

    def render(self, name, value, attrs=None, renderer=None):
        html = '<input type="range" name="%s" min="%s" max="%s" step="%s" value="%s" id="%s" class="range-slider">' % (
            name, self.min_value, self.max_value, self.step, value
        )
        return mark_safe(html)

class CriteriaParamsForm(forms.ModelForm):
    rank = forms.IntegerField(widget=SliderRangeInput(min_value=0, max_value=100))

    class Meta:
        model = criteria_params
        fields = ['rank']


