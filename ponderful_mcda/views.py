from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView

from django.http import HttpResponse, HttpResponseRedirect
from django.urls import reverse

from .forms import CustomUserCreationForm, StudyAreaForm, StudyAreaSelectionForm, CriteriaForm, WeightRangeForm,SliderRangeInput, CriteriaParamsForm
from .models import studyarea, CustomUser, criteria, criteria_params
from django.core.serializers import serialize
from django.contrib.gis.geos import Polygon
from django.contrib.gis.serializers import geojson
import json
from django.contrib.gis.geos import GEOSGeometry
from pygeoif import geometry

from django.forms import modelformset_factory
from floppyforms.widgets import RangeInput
from django import forms


# Create your views here.

class SignUpView(CreateView):
    form_class = CustomUserCreationForm
    success_url = reverse_lazy("login")
    template_name = "registration/signup.html"

def map_view(request):
    
    form = StudyAreaForm()

    if request.method == 'POST':
        form = StudyAreaForm(request.POST)
        if form.is_valid():
            study_area = form.save(commit=False)
            study_area.user = CustomUser.objects.get(username=request.user)
            study_area.save()
            return HttpResponseRedirect(reverse('criteria'))

    return render(request, 'map.html', {'form': form})


def study_area_detail(request):
    study_area_all_names = studyarea.objects.values_list('name', flat=True)
    #study_area_id = studyarea.objects.values_list('id', flat=True)
    print(type(study_area_all_names))
    study_area_all_names = list(study_area_all_names)
    if request.method == 'POST':
        study_area_name = request.POST.get('study_area_name')
        data = serialize("json", studyarea.objects.all())
        data_dict = json.loads(data)
        print(data_dict)
        try:
            #study_area = studyarea.objects.get(name=study_area_name)
            #polygon_geometry = serialize('geojson', [study_area], geometry_field='geom')
            #print(study_area.geom)
            for element in data_dict:
                if element['fields']['name'] == study_area_name:
                    #get study area id in the session
                    study_area_id = element['pk']
                    request.session['study_area_id'] = study_area_id


                    polygon_geometry = element['fields']['geom']
                    print(polygon_geometry)
                    #polygon_geometry = serialize('geojson', polygon_geometry)
                    polygon_geometry = GEOSGeometry(polygon_geometry).geojson
                    #polygon_geometry = polygon_geometry.exterior
                    #polygon_geometry = polygon_geometry.to_wkt()
                    print(polygon_geometry)
            
    
            
            return render(request, 'map.html', {'polygon_geometry': polygon_geometry, 'study_area_all_names': study_area_all_names})
        except studyarea.DoesNotExist:
            error_message = 'Study area not found.'
            return render(request, 'map.html', {'error_message': error_message, 'study_area_all_names': study_area_all_names})
    else:
        return render(request, 'map.html', {'study_area_all_names': study_area_all_names})

# the criteria params form

def select_criteria(request):
    if request.method == 'POST':
        form = CriteriaForm(request.POST)
        if form.is_valid():
            selected_criteria = form.cleaned_data['criteria_choices'].values_list('id', flat=True)
            request.session['selected_criteria'] = list(selected_criteria)
            
            #request.session['selected_criteria'] = selected_criteria
            return redirect('add_params')
        else:
            form = CriteriaForm()
            return render(request, 'step1.html', {'form': form})
    else:  # Handle GET requests
        form = CriteriaForm()
        return render(request, 'step1.html', {'form': form})

def add_params(request):
    selected_criteria = request.session.get('selected_criteria', [])
    study_area_id = request.session.get('study_area_id')

    
    
    if not selected_criteria:
        return redirect('select_criteria')
        
    # Create a formset based on the selected criteria
   
    print(len(selected_criteria))
    
    CriteriaParamsFormSet = modelformset_factory(criteria_params, fields=['rank'], extra=len(selected_criteria), widgets = {'rank': forms.TextInput(attrs={'type': 'range', 'step': '1', 'min': '1', 'max': '15', 'class':'slider', 'id':'myRange'})})

    if request.method == 'POST':
        formset = CriteriaParamsFormSet(request.POST)
        
        if formset.is_valid():
            instances = formset.save(commit=False)
            rank_data = [instance.rank for instance in instances]
            request.session['rank_data'] = rank_data
            # Redirect to the appropriate view after successful form submission
            print(len(rank_data))
            if len(rank_data) == len(selected_criteria):
                return redirect('add_weight')
            else:
                print("not right length")
                formset_data = [{'criteria_name': criteria.objects.get(pk=criterion_id).name} for criterion_id in selected_criteria]
                formset = CriteriaParamsFormSet(queryset = criteria_params.objects.exclude(pk__in=criteria_params.objects.all()), initial=formset_data)
                return render(request, 'step2.html', {'formset': formset, 'selected_criteria': selected_criteria})
        else:
            # If the formset is not valid, render the formset with errors
            formset_data = [{'criteria_name': criteria.objects.get(pk=criterion_id).name} for criterion_id in selected_criteria]
            formset = CriteriaParamsFormSet(queryset = criteria_params.objects.exclude(pk__in=criteria_params.objects.all()), initial=formset_data)
            return render(request, 'step2.html', {'formset': formset, 'selected_criteria': selected_criteria})
    else:
        # Initialize the formset and exclude displaying the exsiting records in the databse
        formset_data = [{'criteria_name': criteria.objects.get(pk=criterion_id).name} for criterion_id in selected_criteria]
        formset = CriteriaParamsFormSet(queryset = criteria_params.objects.exclude(pk__in=criteria_params.objects.all()), initial=formset_data)
        
        return render(request, 'step2.html', {'formset': formset, 'selected_criteria': selected_criteria})


def add_weight(request):
    selected_criteria = request.session.get('selected_criteria', [])
    study_area_id = request.session.get('study_area_id')
    rank_data = request.session.get('rank_data', [])

    if not selected_criteria:
        return redirect('select_criteria')
        
   
    print(len(selected_criteria))
    CriteriaParamsFormSet = modelformset_factory(criteria_params, fields=['weight_range'], extra=1)
    #CriteriaParamsFormSet = modelformset_factory(criteria_params, fields=['rank'], extra=len(selected_criteria))

    if request.method == 'POST':
        formset = CriteriaParamsFormSet(request.POST)
        
        if formset.is_valid():
            instances = formset.save(commit=False)
            weight_range = instances[0].weight_range
            print(instances)
            for i, criterion in enumerate(selected_criteria):
                instance = criteria_params(
                    criteria_id=criterion,
                    study_area_id=study_area_id,
                    user_id=request.user.id,
                    rank=rank_data[i],
                    weight_range=weight_range,
                )
                if rank_data[i]==max(rank_data):
                    instance.weight = min(instance.weight_range)
                elif rank_data[i]==min(rank_data):
                    instance.weight = max(instance.weight_range)
                else:
                    instance.weight = 1 + ((max(instance.weight_range)-min(instance.weight_range))*(max(rank_data)-rank_data[i])/(max(rank_data)-min(rank_data)))
                print(max(instance.weight_range), min(instance.weight_range))
                instance.save()
            
            # Redirect to the appropriate view after successful form submission
            return redirect('map')
        else:
            # If the formset is not valid, render the formset with errors
            return render(request, 'weight.html', {'formset': formset, 'selected_criteria': selected_criteria})
    else:
        # Initialize the formset and exclude displaying the exsiting records in the databse
        
        formset_data = [{'criteria_name': criteria.objects.get(pk=criterion_id).name} for criterion_id in selected_criteria]
        print(formset_data)
        formset = CriteriaParamsFormSet(queryset = criteria_params.objects.exclude(pk__in=criteria_params.objects.all()), initial=formset_data)
        
        #print(formset)
    
        return render(request, 'weight.html', {'formset': formset, 'selected_criteria': selected_criteria})
