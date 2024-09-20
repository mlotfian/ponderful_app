from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView

from django.http import HttpResponse, HttpResponseRedirect
from django.urls import reverse

from .forms import *
from .models import studyarea, CustomUser, criteria, criteria_params, action_types, alternatives_params, scenario, scenario_user
from django.core.serializers import serialize
from django.contrib.gis.geos import Polygon
from django.contrib.gis.serializers import geojson
import json
from django.contrib.gis.geos import GEOSGeometry
from pygeoif import geometry

from django.forms import modelformset_factory
from django.forms import formset_factory
#from floppyforms.widgets import RangeInput
from django import forms
from django.contrib.auth.decorators import login_required
from .models import AnalysisRun
from django.db.models import Max
from django.shortcuts import get_object_or_404

from collections import defaultdict
from django.db.models import F
from django.utils.translation import gettext_lazy as _
from django.utils import translation


# Create your views here.

class SignUpView(CreateView):
    form_class = CustomUserCreationForm
    success_url = reverse_lazy("login")
    template_name = "registration/signup.html"

@login_required
def start_analysis(request):
    if request.method == "GET":
        # Create a new AnalysisRun instance for the current user
        max_run_number = AnalysisRun.objects.filter(user=request.user).aggregate(Max('analysis_number'))['analysis_number__max']
        next_run_number = 1 if max_run_number is None else max_run_number + 1

        # Create a new AnalysisRun instance with the next run_number
        new_run = AnalysisRun.objects.create(
            user=request.user,
            analysis_number=next_run_number,
            # Add any other fields as necessary
        )
        # add analysis run number to session
        request.session['analysis_run_id'] = new_run.id 
        # Redirect to the first step of the analysis or a management page
        return redirect(reverse('map'))  # Adjust the redirection as needed
    else:
        # Redirect back or show an error if the method is not GET
        return redirect('/')

@login_required
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

@login_required
def study_area_detail(request):
    study_area_all_names = studyarea.objects.values_list('name', flat=True)
    #study_area_id = studyarea.objects.values_list('id', flat=True)
    #print(type(study_area_all_names))
    study_area_all_names = list(study_area_all_names)
    if request.method == 'POST':
        study_area_name = request.POST.get('study_area_name')
        data = serialize("json", studyarea.objects.all())
        data_dict = json.loads(data)
        #print(data_dict)
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
                    #print(polygon_geometry)
                    #polygon_geometry = serialize('geojson', polygon_geometry)
                    polygon_geometry = GEOSGeometry(polygon_geometry).geojson
                    #polygon_geometry = polygon_geometry.exterior
                    #polygon_geometry = polygon_geometry.to_wkt()
                    #print(polygon_geometry)
            
    
            
            return render(request, 'map.html', {'polygon_geometry': polygon_geometry, 'study_area_all_names': study_area_all_names})
        except studyarea.DoesNotExist:
            error_message = 'Study area not found.'
            return render(request, 'map.html', {'error_message': error_message, 'study_area_all_names': study_area_all_names})
    else:
        return render(request, 'map.html', {'study_area_all_names': study_area_all_names})

# the criteria params form

@login_required
def select_criteria(request):
    criteria_queryset = criteria.objects.all()  # Get the queryset
    for crt in criteria_queryset:
        print(f"Name: {crt.name}, Unit of Measure: {crt.unit_of_measure}")

    if request.method == 'POST':
        form = CriteriaForm(request.POST, criteria_queryset=criteria_queryset)
        if form.is_valid():
            selected_criteria = form.cleaned_data['criteria_choices']
            criteria_ids = [c.id for c in selected_criteria]
            request.session['selected_criteria'] = criteria_ids
            return redirect('add_params')
    else:
        form = CriteriaForm(criteria_queryset=criteria_queryset)  # Pass the queryset to the form

    # Preprocess data for the template
    criteria_data = []
    for crt in form.fields['criteria_choices'].queryset:
        checkbox_html = f'<input type="checkbox" name="criteria_choices" value="{crt.id}" id="id_criteria_choices_{crt.id}">'
        criteria_data.append({
            'checkbox_html': checkbox_html,
            'name': crt.name,
            'unit_of_measure': crt.unit_of_measure,
        })

    return render(request, 'step1.html', {'form': form, 'criteria_data': criteria_data})

@login_required
def add_params(request):
    selected_criteria = request.session.get('selected_criteria', [])
    study_area_id = request.session.get('study_area_id')
    analysis_run_id = request.session.get('analysis_run_id')

    if analysis_run_id is not None:
        # Get the AnalysisRun instance from the database
        analysis_run = get_object_or_404(AnalysisRun, id=analysis_run_id)
    
    
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

            # compute the weight

            all_weights = []

            for i, criterion in enumerate(selected_criteria):
                instance = criteria_params(
                    criteria_id=criterion,
                    study_area_id=study_area_id,
                    user_id=request.user.id,
                    rank=rank_data[i],
                    analysis_run=analysis_run,
                    #weight_range=weight_range,
                )
                if rank_data[i]==max(rank_data):
                    instance.weight = rank_data[i] #min(rank_data) # least important criteria
                    all_weights.append(instance.weight)
                elif rank_data[i]==min(rank_data):
                    instance.weight = rank_data[i] #max(rank_data) # most important criteria
                    all_weights.append(instance.weight)
                else:
                    instance.weight = 1 + ((max(rank_data)-1)*(max(rank_data)-rank_data[i])/(max(rank_data)-min(rank_data)))
                    all_weights.append(instance.weight)
                instance.save()
                
            # now calculating the weights in percentage
            total_weight_sum = sum(all_weights)
            for instance in criteria_params.objects.filter(criteria_id__in=selected_criteria, user_id=request.user.id, study_area_id=study_area_id):
                instance.weight_percentage = (instance.weight / total_weight_sum) * 100
                instance.save()
            # Redirect to the appropriate view after successful form submission
            print(len(rank_data))
            if len(rank_data) == len(selected_criteria):
                return redirect('select_scenario')
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


@login_required
def select_scenario(request):
    analysis_run_id = request.session.get('analysis_run_id')

    if analysis_run_id is not None:
        # Get the AnalysisRun instance from the database
        analysis_run = get_object_or_404(AnalysisRun, id=analysis_run_id)
    #print(analysis_run)
    if request.method == 'POST':
        form = ScenarioForm(request.POST)
        if form.is_valid():
            try:
                instance = form.save(commit=False)
                print(instance)
                selected_scenario = instance.scenario_type.name
                request.session['selected_scenario'] = selected_scenario
                print(selected_scenario)
                instance.analysis_run = analysis_run
                instance.save()  # Commit changes only after successful validation
                return redirect('create_alternatives')
            except Exception as e:
                print(f"Error saving scenario_user instance: {e}")
                form.add_error(None, "An error occurred. Please try again.")  # Inform user
        else:
            print(f"Form validation failed: {form.errors}")  # Log errors for debugging
    else:
        form = ScenarioForm()
    
    scenarios = scenario.objects.all().order_by('name')  # Sorting by name or any other attribute as needed

    scenario_data = []
    for s in scenarios:
        radio_html = f'<input type="radio" name="scenario_type" value="{s.id}" id="id_scenario_type_{s.id}">'
        scenario_data.append({
            'radio_html': radio_html,
            'name': s.name,
            'description': s.description,
            'landuse': s.landuse,
            'climate': s.climate,
        })

    return render(request, 'scenario_user.html', {'scenario_data': scenario_data})

@login_required
def create_alternatives(request):
    
    analysis_run_id = request.session.get('analysis_run_id')

    if analysis_run_id is not None:
        # Get the AnalysisRun instance from the database
        analysis_run = get_object_or_404(AnalysisRun, id=analysis_run_id)

    AlternativesParamsFormSet = modelformset_factory(alternatives_params, fields = ['action','pond_min', 'pond_max', 'pond_size'], extra=1)

    if request.method == 'POST':
        formset = AlternativesParamsFormSet(request.POST)
        if formset.is_valid():
            instances = formset.save(commit=False)

            for inst in instances:
                instance = alternatives_params(
                    action = inst.action,
                    pond_min = inst.pond_min,
                    pond_max = inst.pond_max,
                    pond_size = inst.pond_size,
                    user = request.user,
                    analysis_run=analysis_run,

                )
                instance.save()


            return redirect('mcda_result')  # Redirect to a success page after submission
    else:
        formset = AlternativesParamsFormSet(queryset = alternatives_params.objects.exclude(pk__in=alternatives_params.objects.all()))
        # this is done to switch the translation of actions between french and english, other languages can be added later on 
        for form in formset:
            form.fields['action'].choices = [(choice[0], _(choice[1])) for choice in form.fields['action'].choices]

    return render(request, 'alternatives.html', {'formset': formset})

@login_required
def mcda_results(request):
    selected_criteria = request.session.get('selected_criteria', [])
    study_area_id = request.session.get('study_area_id')
    analysis_run_id = request.session.get('analysis_run_id')
    analysis_run = get_object_or_404(AnalysisRun, id=analysis_run_id)

    # getting scenario_id from analysis_run_id
    #scenario_id = scenario_user.objects.filter(analysis_run=analysis_run_id).values_list('scenario_type_id', flat=True).distinct().first()
    #scenario_instance = scenario.objects.get(pk=scenario_id)
    #print("scenario, ", scenario_id)
    all_scenario_ids = scenario.objects.all().values_list('id', flat=True)
    #request.session['scenario_ids']=all_scenario_ids
    # get action, pund min and pund max values from alternative params

    alt_param = alternatives_params.objects.filter(analysis_run=analysis_run_id).values_list('action','pond_min','pond_max').distinct()
    print("alt_param, ", list(alt_param))

    action_pond = []
    for ac in alt_param:
        if ac[0] != 11:
            pond_avg = round((ac[1]+ac[2])/2)
            action_pond.append((ac[0],ac[1]))
            action_pond.append((ac[0],ac[2]))
            action_pond.append((ac[0],pond_avg))
        else:
            action_pond.append((ac[0], 'None'))
            
    
    # getting output from modeling_result table per criteria
    all_values = []
    for indicator in selected_criteria:
        weight = criteria_params.objects.filter(criteria=indicator, analysis_run=analysis_run_id).values_list('weight_percentage', flat=True).distinct().first()
        
        satisfaction_n = satisfaction_threshold.objects.filter(study_area=study_area_id,criteria_id=indicator).values_list('threshold_min', flat=True).distinct().first()
        satisfaction_c = satisfaction_threshold.objects.filter(study_area=study_area_id,criteria_id=indicator).values_list('threshold_max', flat=True).distinct().first()
                
        for ap in action_pond:
            for scenario_id in all_scenario_ids:
                if ap[0] != 11:
                
                    output = modeling_result.objects.filter(action=ap[0],criteria=indicator, pond_num=ap[1], scenario=scenario_id).values_list('output', flat=True).distinct().first()
                    #print("here", ap[0])
                    all_values.append((indicator,_("Creation of ") + str(ap[1]) + _(" Ponds"), output, satisfaction_c, satisfaction_n, weight, scenario_id))
                else:
                    output = modeling_result.objects.filter(action=ap[0],criteria=indicator, scenario=scenario_id).values_list('output', flat=True).distinct().first()
                    #print(ap[0])
                    all_values.append((indicator,"No action", output, satisfaction_c, satisfaction_n, weight, scenario_id))
    

    if request.method == 'POST':

        for element in all_values:
            #print(element[2], element[3], element[4])
            if element[2]<=element[4]:
                partial_satisfaction = 0
                weighted_avg = partial_satisfaction * element[5]
            elif (element[2]>element[4] and element[2]<element[3]):
                partial_satisfaction = (abs(element[2])-abs(element[4]))/(abs(element[3])-abs(element[4]))*100
                weighted_avg = partial_satisfaction * element[5]/100
            else:
                partial_satisfaction = 100
                weighted_avg = partial_satisfaction * element[5]/100
            
            criteria_instance = criteria.objects.get(pk=element[0])
            
            mcda_result.objects.create(
                alternative = element[1],
                scenario = scenario.objects.get(pk=element[6]),
                criteria = criteria_instance,
                user = request.user,
                analysis_run=analysis_run,
                model_result = element[2],
                weight = element[5],
                partial_satisfaction=partial_satisfaction,
                weighted_avg = weighted_avg,

            )
        return redirect('show_results')
    
    
    
    return render(request, 'results.html')



@login_required
def show_results(request):
    # Retrieve the analysis_run ID and scenario_name from the session
    analysis_run_id = request.session.get('analysis_run_id')
    session_scenario_name = request.session.get('selected_scenario')
    
    # Adapt the retrieval of scenarios based on session data or query parameters
    #scenario_ids = request.GET.getlist('scenario_ids')
    
    # Get all scenarios to display in the form
    all_scenarios = scenario.objects.all().order_by('-id')
    
    # Handle selected scenarios from GET parameters
    selected_scenario_ids = request.GET.getlist('scenario_ids')
    if selected_scenario_ids:
        scenarios = all_scenarios.filter(id__in=selected_scenario_ids)
    else:
        # If no scenarios are selected, optionally display results for the session scenario
        session_scenario = all_scenarios.filter(name=session_scenario_name).first()
        scenarios = [session_scenario] if session_scenario else all_scenarios
        print(scenarios[0].id)

    # Assuming all scenarios within an analysis run share the same criteria and alternatives
    results_sample = mcda_result.objects.filter(scenario=scenarios[0], analysis_run=analysis_run_id).select_related('criteria')
    criteria_titles = sorted({result.criteria.name for result in results_sample})
    alternatives = sorted(set(result.alternative for result in results_sample))
    
    # Fetch mcda_result entries for selected scenarios within the analysis_run
    results_by_scenario = {}
    
    for scen in scenarios:
        results = mcda_result.objects.filter(scenario=scen, analysis_run=analysis_run_id).select_related('criteria')
        scenario_data = {alternative: {'values': [], 'values2': [], 'sum': 0} for alternative in alternatives}
        for alternative in alternatives:
            sum_values = 0
            for title in criteria_titles:
                result = next((r.weighted_avg for r in results if r.alternative == alternative and r.criteria.name == title), 'N/A')
                scenario_data[alternative]['values'].append(result)
                partial_s = next((r.partial_satisfaction for r in results if r.alternative == alternative and r.criteria.name == title), 'N/A')
                scenario_data[alternative]['values2'].append(partial_s)
                if isinstance(result, (int, float)):
                    sum_values += result
            scenario_data[alternative]['sum'] = sum_values
        results_by_scenario[(scen.name, scen.id)] = scenario_data

    context = {
        'all_scenarios': all_scenarios,
        'selected_scenarios': scenarios,
        'data': results_by_scenario,
        'criteria_titles': criteria_titles,
        'alternatives': alternatives,
    }

    return render(request, 'show_mcda_results.html', context)








    


