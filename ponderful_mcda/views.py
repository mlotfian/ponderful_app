from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView

from django.http import HttpResponse, HttpResponseRedirect
from django.urls import reverse

from .forms import CustomUserCreationForm, StudyAreaForm, StudyAreaSelectionForm, CriteriaForm, CriteriaParamsForm
from .models import studyarea, CustomUser, criteria, criteria_params
from django.core.serializers import serialize
from django.contrib.gis.geos import Polygon
from django.contrib.gis.serializers import geojson
import json
from django.contrib.gis.geos import GEOSGeometry
from pygeoif import geometry

from django.forms import modelformset_factory


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
    print(type(study_area_all_names))
    study_area_all_names = list(study_area_all_names)
    if request.method == 'POST':
        study_area_name = request.POST.get('study_area_name')
        data = serialize("json", studyarea.objects.all())
        data_dict = json.loads(data)
        print(type(data_dict))
        try:
            #study_area = studyarea.objects.get(name=study_area_name)
            #polygon_geometry = serialize('geojson', [study_area], geometry_field='geom')
            #print(study_area.geom)
            for element in data_dict:
                if element['fields']['name'] == study_area_name:
                    #print(element)
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
    
    if not selected_criteria:
        return redirect('select_criteria')
        
    # Create a formset based on the selected criteria
   
    print(len(selected_criteria))
    CriteriaParamsFormSet = modelformset_factory(criteria_params, fields=['rank', 'weight_range', 'weight', 'user', 'study_area'], extra=len(selected_criteria))

    if request.method == 'POST':
        formset = CriteriaParamsFormSet(request.POST)
        
        if formset.is_valid():
            instances = formset.save(commit=False)
            print(instances)
            for i, criterion in enumerate(selected_criteria):
                instance = instances[i]
                print(instance)
                instance.criteria_id = criterion
                instance.save()
            
            # Redirect to the appropriate view after successful form submission
            return redirect('select_criteria')
        else:
            # If the formset is not valid, render the formset with errors
            return render(request, 'step2.html', {'formset': formset, 'selected_criteria': selected_criteria})
    else:
        # Initialize the formset and exclude displaying the exsiting records in the databse
        
        formset = CriteriaParamsFormSet(queryset = criteria_params.objects.exclude(pk__in=criteria_params.objects.all()))
        print(formset)
    
        return render(request, 'step2.html', {'formset': formset, 'selected_criteria': selected_criteria})

