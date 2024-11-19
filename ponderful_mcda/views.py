import requests
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

import rasterio
import numpy as np
from shapely.geometry import shape
from rasterio.mask import mask
from django.contrib.gis.gdal import SpatialReference
from shapely.geometry import box
import geopandas as gpd
from pyproj import Transformer
from shapely.geometry import Point
from shapely.geometry import Point as ShapelyPoint

# Create your views here.

class SignUpView(CreateView):
    form_class = CustomUserCreationForm
    success_url = reverse_lazy("login")
    template_name = "registration/signup.html"

@login_required
def start_analysis_newpondscape(request):
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
        return redirect(reverse('map2'))  # Adjust the redirection as needed
    else:
        # Redirect back or show an error if the method is not GET
        return redirect('/')

@login_required
def start_analysis_samepondscape(request):
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
        return redirect(reverse('create_alternatives'))  # Adjust the redirection as needed
    else:
        # Redirect back or show an error if the method is not GET
        return redirect('/')

"""@login_required
def map_view(request):
    
    form = StudyAreaForm()

    if request.method == 'POST':
        form = StudyAreaForm(request.POST)
        if form.is_valid():
            study_area = form.save(commit=False)
            study_area.user = CustomUser.objects.get(username=request.user)
            study_area.save()
            return HttpResponseRedirect(reverse('criteria'))

    return render(request, 'map.html', {'form': form})"""

def calculate_avg_raster_value(raster_path, geom):
    # Open the raster file to get its CRS
    with rasterio.open(raster_path) as src:
        raster_crs = src.crs
        raster_epsg = int(raster_crs.to_epsg()) 
        #print(raster_epsg) # Convert the CRS to EPSG integer
        #print(f"Raster NoData value: {src.nodata}")
        
    
    # Get the current CRS of the polygon (assuming it's defined in geom.srid)
    geom_crs = geom.srid

    # Reproject the geometry to match the raster CRS if necessary
    if geom_crs != raster_epsg:
        geom.transform(raster_epsg)  # Reproject to match the raster's CRS

    with rasterio.open(raster_path) as src:
        # Convert the GEOSGeometry to a Shapely geometry
        geom_shape = shape(json.loads(geom.geojson))

        # Clip the raster with the polygon geometry
        out_image, out_transform = mask(src, [geom_shape], crop=True)

        # Check the NoData value
        nodata_value = src.nodata
        #print(f"NoData value in the raster: {nodata_value}")

        # Mask NaN values explicitly
        out_image = np.ma.masked_invalid(out_image)
        #print(f"Masked image (with NaNs removed): {out_image}")
        #print(out_image)

        # Calculate the mean, ignoring NaN and 0 values
        mean_value = out_image.mean()
        #print(f"Mean pixel value: {mean_value}")

    return mean_value
def reverse_geocode_country(lat, lon):
    """
    Use Nominatim (OpenStreetMap) to reverse geocode the latitude and longitude
    to get the country name.
    """
    try:
        url = f"https://nominatim.openstreetmap.org/reverse?format=json&lat={lat}&lon={lon}&zoom=5&addressdetails=1&accept-language=en"
        response = requests.get(url, headers={'User-Agent': 'your-app-name'})
        if response.status_code == 200:
            data = response.json()
            country = data.get('address', {}).get('country')
            return country
        return None
    except Exception as e:
        print(f"Error during reverse geocoding: {e}")
        return None

def transform_point_crs(point, from_crs, to_crs):
    """
    Transform a Shapely Point from one CRS to another using pyproj.
    
    Args:
        point (Point): The Shapely Point geometry.
        from_crs (str or int): Source CRS (e.g., "EPSG:4326").
        to_crs (str or int): Target CRS (e.g., "EPSG:3857").
        
    Returns:
        Point: Transformed Shapely Point in the target CRS.
    """
    transformer = Transformer.from_crs(from_crs, to_crs, always_xy=True)
    x, y = transformer.transform(point.x, point.y)
    return Point(x, y)

def get_country_from_nearest_point(centroid, gpkg_path, geom_crs):
    """
    Find the nearest point to the centroid in a GPKG file and reverse geocode its location.

    Args:
        centroid (django.contrib.gis.geos.Point): The centroid geometry (Django Point).
        gpkg_path (str): Path to the GPKG file containing points.
        geom_crs (str): CRS of the input geometry (e.g., "EPSG:4326").

    Returns:
        str: Country name based on reverse geocoding of the nearest point.
    """
    # Convert the centroid (Django Point) to a Shapely Point
    shapely_centroid = ShapelyPoint(centroid.x, centroid.y)

    # Load the GPKG file as a GeoDataFrame
    gdf = gpd.read_file(gpkg_path)

    # Ensure the GPKG GeoDataFrame is in the same CRS as the centroid
    gpkg_crs = gdf.crs.to_string()  # CRS of the GPKG
    if gpkg_crs != geom_crs:
        gdf = gdf.to_crs(geom_crs)

    # Calculate distances from the Shapely centroid to each point in the GPKG
    gdf['distance'] = gdf.geometry.distance(shapely_centroid)

    # Find the closest point
    nearest_point = gdf.loc[gdf['distance'].idxmin()]

    # Extract the coordinates of the nearest point
    nearest_lat = nearest_point.geometry.y
    nearest_lon = nearest_point.geometry.x

    # Use reverse geocoding on the nearest point's coordinates
    country_name = reverse_geocode_country(nearest_lat, nearest_lon)

    return country_name

@login_required
def map_view(request):
    form = StudyAreaForm()

    if request.method == 'POST':
        form = StudyAreaForm(request.POST)

        if form.is_valid():
            study_area = form.save(commit=False)
            study_area.user = CustomUser.objects.get(username=request.user)

            # Capture the geometry from the form (GeoJSON) and convert it to a GEOSGeometry object
            geom_json = request.POST.get('geom')
            #print(geom_json)
            if geom_json:
                geom = GEOSGeometry(geom_json)
                
            
             # Check if the geometry has a Z dimension and remove it
                 # Remove Z-dimension if present
                if geom.hasz:
                    if geom.geom_type == 'Polygon':
                        new_rings = []
                        for ring in geom.coords:
                            # Remove Z-dimension from the coordinates
                            new_ring = [(x, y) for x, y, *rest in ring]

                            # Ensure the first and last points are the same to form a valid LinearRing
                            if new_ring[0] != new_ring[-1]:
                                new_ring.append(new_ring[0])

                            # Ensure the ring has at least 4 points
                            if len(new_ring) >= 4:
                                new_rings.append(new_ring)
                            else:
                                print(f"Skipping invalid ring with {len(new_ring)} points.")

                        # Reconstruct the Polygon with the new rings
                        if new_rings:
                            geom = Polygon(*new_rings, srid=geom.srid)
                        else:
                            raise ValueError("Polygon has no valid rings.")

                 # Calculate the centroid of the polygon
                centroid = geom.centroid

                # Use the centroid to find the country using reverse geocoding
                country_name = reverse_geocode_country(centroid.y, centroid.x)  # Latitude and Longitude

                # Accepted country list
                accepted_countries = [
                    "Belgium", "Denmark", "Germany",
                    "Spain", "Switzerland", "Turkey",
                    "United Kingdom"
                ]

                # CRS of the geometry
                geom_crs = f"EPSG:{geom.srid}"  # GEOSGeometry CRS

                # If the country is not in the accepted list, use the nearest GPKG point
                if not country_name or country_name not in accepted_countries:
                    gpkg_path = '/app/all_ponds/all_ponds.gpkg'
                    country_name = get_country_from_nearest_point(centroid, gpkg_path, geom_crs)


                if country_name:
                    study_area.country = country_name
                
                study_area.geom = geom

                study_area.save()
                # Assuming you have your raster file path accessible
                variables = {
                    'Amphibian species': {
                        'Land Use: SSP1, Climate Change: SSP1': '/app/combinedCC_LU/Amphibia_SSP1_percent_difference.tif',
                        'Land Use: SSP3, Climate Change: SSP3': '/app/combinedCC_LU/Amphibia_SSP3_percent_difference.tif',
                        'Land Use: SSP5, Climate Change: SSP5': '/app/combinedCC_LU/Amphibia_SSP5_percent_difference.tif',
                        'Land Use: No Change, Climate Change: SSP1': '/app/only_CC/Amphibia_CC_SSP1_percent_difference.tif',
                        'Land Use: No Change, Climate Change: SSP3': '/app/only_CC/Amphibia_CC_SSP3_percent_difference.tif',
                        'Land Use: No Change, Climate Change: SSP5': '/app/only_CC/Amphibia_CC_SSP5_percent_difference.tif',

                                },
                    'Aquatic plant species':
                        {'Land Use: SSP1, Climate Change: SSP1': '/app/combinedCC_LU/Macrophyte_SSP1_percent_difference.tif',
                        'Land Use: SSP3, Climate Change: SSP3': '/app/combinedCC_LU/Macrophyte_SSP3_percent_difference.tif',
                        'Land Use: SSP5, Climate Change: SSP5': '/app/combinedCC_LU/Macrophyte_SSP5_percent_difference.tif',
                        'Land Use: No Change, Climate Change: SSP1': '/app/only_CC/Macrophyte_CC_SSP1_percent_difference.tif',
                        'Land Use: No Change, Climate Change: SSP3': '/app/only_CC/Macrophyte_CC_SSP3_percent_difference.tif',
                        'Land Use: No Change, Climate Change: SSP5': '/app/only_CC/Macrophyte_CC_SSP5_percent_difference.tif',},
                    
                    'Macroinvertebrates':
                        {'Land Use: SSP1, Climate Change: SSP1': '/app/combinedCC_LU/MI_Biofam_SSP1_percent_difference.tif',
                        'Land Use: SSP3, Climate Change: SSP3': '/app/combinedCC_LU/MI_Biofam_SSP3_percent_difference.tif',
                        'Land Use: SSP5, Climate Change: SSP5': '/app/combinedCC_LU/MI_Biofam_SSP5_percent_difference.tif',
                        'Land Use: No Change, Climate Change: SSP1': '/app/only_CC/MI_Biofam_CC_SSP1_percent_difference.tif',
                        'Land Use: No Change, Climate Change: SSP3': '/app/only_CC/MI_Biofam_CC_SSP3_percent_difference.tif',
                        'Land Use: No Change, Climate Change: SSP5': '/app/only_CC/MI_Biofam_CC_SSP5_percent_difference.tif',},
                
                    'GHG emission (CH4, CO2)':
                        {'Land Use: SSP1, Climate Change: SSP1': '/app/combinedCC_LU/GHG_SSP1_percent_difference.tif',
                        'Land Use: SSP3, Climate Change: SSP3': '/app/combinedCC_LU/GHG_SSP3_percent_difference.tif',
                        'Land Use: SSP5, Climate Change: SSP5': '/app/combinedCC_LU/GHG_SSP5_percent_difference.tif',
                        'Land Use: No Change, Climate Change: SSP1': '/app/only_CC/GHG_CC_SSP1_percent_difference.tif',
                        'Land Use: No Change, Climate Change: SSP3': '/app/only_CC/GHG_CC_SSP3_percent_difference.tif',
                        'Land Use: No Change, Climate Change: SSP5': '/app/only_CC/GHG_CC_SSP5_percent_difference.tif',},
                    
                    'Water quality':
                        {'Land Use: SSP1, Climate Change: SSP1': '/app/combinedCC_LU/TN_SSP1_percent_difference.tif',
                        'Land Use: SSP3, Climate Change: SSP3': '/app/combinedCC_LU/TN_SSP3_percent_difference.tif',
                        'Land Use: SSP5, Climate Change: SSP5': '/app/combinedCC_LU/TN_SSP5_percent_difference.tif',
                        'Land Use: No Change, Climate Change: SSP1': '/app/only_CC/TN_CC_SSP1_percent_difference.tif',
                        'Land Use: No Change, Climate Change: SSP3': '/app/only_CC/TN_CC_SSP3_percent_difference.tif',
                        'Land Use: No Change, Climate Change: SSP5': '/app/only_CC/TN_CC_SSP5_percent_difference.tif',},
                    
                }
                # missing scenarios for water storage, to be checked with Tuba...

                # Iterate over the variables and SSPs to calculate average raster values
                for variable, ssps in variables.items():
                    criteria_name = criteria.objects.get(name=variable)
                    for ssp, raster_path in ssps.items():
                        scenario_name = scenario.objects.get(name=ssp)  # Assuming your scenario names match the keys
                        avg_value = calculate_avg_raster_value(raster_path, geom)

                        # Save the result in the new StudyAreaResult model
                        StudyAreaResult.objects.create(
                            study_area=study_area,
                            scenario=scenario_name,
                            criteria=criteria_name,
                            average_value=avg_value
                        )

            
            request.session['study_area_id'] = study_area.id
            return HttpResponseRedirect(reverse('create_alternatives'))

    return render(request, 'map2.html', {'form': form})

@login_required
def study_area_detail(request):
    study_area_all_names = studyarea.objects.values_list('name', flat=True)
    
    study_area_all_names = list(study_area_all_names)
    if request.method == 'POST':
        study_area_name = request.POST.get('study_area_name')
        data = serialize("json", studyarea.objects.all())
        data_dict = json.loads(data)
        
        try:
       
            for element in data_dict:
                if element['fields']['name'] == study_area_name:
                    study_area_id = element['pk']
                    request.session['study_area_id'] = study_area_id
                    polygon_geometry = element['fields']['geom']
                    polygon_geometry = GEOSGeometry(polygon_geometry).geojson

            return render(request, 'map.html', {'polygon_geometry': polygon_geometry, 'study_area_all_names': study_area_all_names})
        except studyarea.DoesNotExist:
            error_message = 'Study area not found.'
            return render(request, 'map.html', {'error_message': error_message, 'study_area_all_names': study_area_all_names})
    else:
        return render(request, 'map.html', {'study_area_all_names': study_area_all_names})

# create alternatives 

@login_required
def create_alternatives(request):
    analysis_run_id = request.session.get('analysis_run_id')

    if analysis_run_id is not None:
        # Get the AnalysisRun instance from the database
        analysis_run = get_object_or_404(AnalysisRun, id=analysis_run_id)

    AlternativesParamsFormSet = modelformset_factory(alternatives_params, fields=['action', 'pond_min', 'pond_max'], extra=1)

    if request.method == 'POST':
        formset = AlternativesParamsFormSet(request.POST)

        # Validate that at least one action is selected
        if formset.is_valid():
            has_action = False
            instances = formset.save(commit=False)

            for inst in instances:
                if inst.action:  # If there's an action selected
                    has_action = True
                    instance = alternatives_params(
                        action=inst.action,
                        pond_min=inst.pond_min,
                        pond_max=inst.pond_max,
                        user=request.user,
                        analysis_run=analysis_run,
                    )
                    instance.save()

            # If no action is selected, prevent submission
            if not has_action:
                formset._non_form_errors = ['Please select at least one action.']
            else:
                return redirect('select_criteria')  # Redirect to next step if valid

    else:
        formset = AlternativesParamsFormSet(queryset=alternatives_params.objects.none())
        # Translate actions based on language preference
        for form in formset:
             form.fields['action'].choices = [(choice[0], _(choice[1])) for choice in form.fields['action'].choices]

    return render(request, 'alternatives.html', {'formset': formset})
# the criteria params form

@login_required
def select_criteria(request):
    criteria_queryset = criteria.objects.all().order_by('id')  # Get the queryset
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
            'ncp': crt.ncp,
            'name': crt.name,
            'unit_of_measure': crt.unit_of_measure,
            'objective': crt.objective,
            'handbook': crt.handbook_page,
        })

    return render(request, 'step1.html', {'form': form, 'criteria_data': criteria_data})

@login_required
def add_params(request):
    selected_criteria = request.session.get('selected_criteria', [])
    study_area_id = request.session.get('study_area_id')
    analysis_run_id = request.session.get('analysis_run_id')

    if not selected_criteria:
        return redirect('select_criteria')

    CriteriaParamsFormSet = modelformset_factory(criteria_params, fields=['rank'], extra=len(selected_criteria), widgets={
        'rank': forms.TextInput(attrs={'type': 'range', 'step': '1', 'min': '1', 'max': '15', 'class': 'slider', 'id': 'myRange'})
    })

    if request.method == 'POST':
        formset = CriteriaParamsFormSet(request.POST)
        if formset.is_valid():
            # Get rank data from formset
            rank_data = [form.cleaned_data['rank'] for form in formset.forms]
            # Calculate weights based on rank
            max_rank = max(rank_data)
            min_rank = min(rank_data)
            all_weights = [
                rank if rank == max_rank else (rank if rank == min_rank else 1 + ((max_rank - 1) * (max_rank - rank) / (max_rank - min_rank)))
                for rank in rank_data
            ]
            # Store rank and weight data in session for later use
            request.session['rank_data'] = rank_data
            request.session['weights'] = all_weights
            return redirect('add_thresholds')
        else:
            return render(request, 'step2.html', {'formset': formset, 'selected_criteria': selected_criteria})
    else:
        formset_data = [{'criteria_name': criteria.objects.get(pk=criterion_id).name} for criterion_id in selected_criteria]
        formset = CriteriaParamsFormSet(queryset=criteria_params.objects.none(), initial=formset_data)
        return render(request, 'step2.html', {'formset': formset, 'selected_criteria': selected_criteria})

@login_required
def add_thresholds(request):
    selected_criteria = request.session.get('selected_criteria', [])
    analysis_run_id = request.session.get('analysis_run_id')
    study_area_id = request.session.get('study_area_id')
    rank_data = request.session.get('rank_data', [])
    weights = request.session.get('weights', [])

    if not selected_criteria or not rank_data or not weights:
        return redirect('select_criteria')

    # Retrieve criteria names for display
    criteria_names = [criteria.objects.get(pk=criterion_id).name for criterion_id in selected_criteria]

    #default_tr_min = [criteria.objects.get(pk=criterion_id).s_threshold_min for criterion_id in select_criteria]
    #default_tr_max = [criteria.objects.get(pk=criterion_id).s_threshold_max for criterion_id in select_criteria]

    criteria_info = [
        {
            "id": criterion.id,
            "name": criterion.name,
            "default_min": criterion.s_threshold_min,
            "default_max": criterion.s_threshold_max,
            "NCP": criterion.ncp,
            "Description": criterion.description,
        }
        for criterion in criteria.objects.filter(id__in=selected_criteria).order_by('id')
    ]
    form_initial_data = [
    {
        'threshold_min': criterion['default_min'],
        'threshold_max': criterion['default_max']
    }
    for criterion in criteria_info
    ]
    print(criteria_info)

    # Formset for thresholds
    CriteriaThresholdFormSet = modelformset_factory(criteria_params, form=CriteriaThresholdForm, extra=len(selected_criteria))

    if request.method == 'POST':
        formset = CriteriaThresholdFormSet(request.POST)
        if formset.is_valid():
            threshold_data = [(form.cleaned_data['threshold_min'], form.cleaned_data['threshold_max']) for form in formset.forms]

            # Save `criteria_params` in the database for each selected criterion
            for i, criterion_id in enumerate(selected_criteria):
                criteria_params.objects.create(
                    criteria_id=criterion_id,
                    study_area_id=study_area_id,
                    user_id=request.user.id,
                    rank=rank_data[i],
                    weight=weights[i],
                    weight_percentage=(weights[i] / sum(weights)) * 100,
                    threshold_min=threshold_data[i][0],
                    threshold_max=threshold_data[i][1],
                    analysis_run_id=analysis_run_id
                )
            return redirect('select_scenario')
        else:
            
            return render(request, 'step3_thresholds.html', {'formset': formset, 'criteria_names': criteria_names, 'criteria_info': criteria_info})
    else:
        # Initialize formset without querying the database
        formset = CriteriaThresholdFormSet(queryset=criteria_params.objects.none(), initial=form_initial_data)
        return render(request, 'step3_thresholds.html', {'formset': formset, 'criteria_names': criteria_names, 'criteria_info': criteria_info})

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
                return redirect('mcda_result')
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
def mcda_results(request):
    selected_criteria = request.session.get('selected_criteria', [])
    study_area_id = request.session.get('study_area_id')
    analysis_run_id = request.session.get('analysis_run_id')
    analysis_run = get_object_or_404(AnalysisRun, id=analysis_run_id)

    # get the country name, current ponds, and trophic state

    study_area = studyarea.objects.get(id=study_area_id)
    country = study_area.country
    current_ponds = study_area.total_pond
    trophic_state = study_area.trophic_state
    

    
    # getting all scenario ids
    all_scenario_ids = scenario.objects.all().values_list('id', flat=True)
    
    # get action, pund min and pund max values from alternative params
    alt_param = alternatives_params.objects.filter(analysis_run=analysis_run_id).values_list('action','pond_min','pond_max').distinct()
    print("alt_param, ", list(alt_param))

    action_pond = []
    for ac in alt_param:
        # if it is creation
        if ac[0] == 47:
            pond_avg = round((ac[1]+ac[2])/2)
            action_pond.append((ac[0],ac[1]))
            action_pond.append((ac[0],ac[2]))
            action_pond.append((ac[0],pond_avg))
        else:
            action_pond.append((ac[0], 'None'))

    
    # getting output from modeling_result table per criteria
    all_values = []
    for indicator in selected_criteria:
        #weight = criteria_params.objects.filter(criteria=indicator, analysis_run=analysis_run_id).values_list('weight_percentage', flat=True).distinct().first()
        
        #satisfaction_n = criteria_params.objects.filter(criteria_id=indicator, analysis_run=analysis_run_id).values_list('threshold_min', flat=True).distinct().first()
        #satisfaction_c = criteria_params.objects.filter(criteria_id=indicator, analysis_run=analysis_run_id).values_list('threshold_max', flat=True).distinct().first()
            # Fetch the weight and thresholds for the current indicator and analysis run
        criteria_param = criteria_params.objects.filter(criteria=indicator, analysis_run=analysis_run_id).first()
    
    # If a matching criteria_params record exists, retrieve the weight and thresholds
        if criteria_param:
            weight = criteria_param.weight_percentage
            satisfaction_n = criteria_param.threshold_min  # Minimum satisfaction threshold
            satisfaction_c = criteria_param.threshold_max  # Maximum satisfaction threshold
        
        # Debugging: print the values to verify
            print(f"Indicator {indicator}: Threshold Min {satisfaction_n}, Threshold Max {satisfaction_c}, Weight {weight}")
    
        else:
            # Handle the case where no criteria_params record is found for this indicator and analysis run
            print(f"No criteria_params found for Indicator {indicator} and Analysis Run {analysis_run_id}")
            continue  # Skip to the next indicator if no data is found
                        
        #satisfaction_n = satisfaction_threshold.objects.filter(criteria_id=indicator).values_list('threshold_min', flat=True).distinct().first()
        print("satmin",satisfaction_n)
        #satisfaction_c = satisfaction_threshold.objects.filter(criteria_id=indicator).values_list('threshold_max', flat=True).distinct().first()
        print("satmax",satisfaction_c)

        for nbs_action in action_pond:
            for scenario_id in all_scenario_ids:
                #creation
                if nbs_action[0] == 47:
                    #print(indicator)
                    if indicator not in [19,18,55]: #['GHG emission (CH4, CO2)', 'Water quantity', 'Water quality']:
                        #ncp_indicator = criteria.objects.get(name=indicator)

                        # check if the number of current and future ponds is bigger than 100, then use acuu for 100
                        new_numb_ponds = nbs_action[1]+current_ponds
                        if current_ponds>100 or new_numb_ponds>100:
                            current_ponds = 100
                            new_numb_ponds = 100
                        # get current and future spcies richness from the accumulation curves based on the number of current and future ponds
                        ncp_current = accumulation.objects.get(country = country, pond_num = current_ponds, indicator = indicator)
                        ncp_future = accumulation.objects.get(country = country, pond_num = new_numb_ponds, indicator = indicator)
                        
                        current_richness = ncp_current.sp_richness
                        future_richness = ncp_future.sp_richness
                        # get average values for scenario
                        scenario_change_obj = StudyAreaResult.objects.get(study_area = study_area_id, scenario = scenario_id, criteria = indicator)
                        scenario_change = scenario_change_obj.average_value

                        # calculate output 
                        if current_ponds ==0:
                            #current_richness =1
                            output = ((future_richness + (future_richness*scenario_change/100))-current_richness)/current_richness*100
                        else:
                            output = ((future_richness + (future_richness*scenario_change/100))-current_richness)/current_richness*100
                        #print(output)
                        all_values.append((indicator,_("Creation of ") + str(nbs_action[1]) + _(" Clean Water Ponds"), output, satisfaction_c, satisfaction_n, weight, scenario_id))
                    # water quantity
                    if indicator == 19:
                        if current_ponds ==0:
                            output = ((nbs_action[1]+current_ponds)-current_ponds)/0.000001*100
                        else:
                            output = ((nbs_action[1]+current_ponds)-current_ponds)/current_ponds*100
                        #print(output)
                        all_values.append((indicator,_("Creation of ") + str(nbs_action[1]) + _(" Clean Water Ponds"), output, satisfaction_c, satisfaction_n, weight, scenario_id))
                    
                    # water quality
                    if indicator == 55:
                        if current_ponds != 0:
                            future_ponds = nbs_action[1]

                            # get value for Eutrophic state from 
                            # eutrophic id=4
                            clean_water_tn = IndicatorTrophicData.objects.get(indicator=indicator, trophic_state=4)
                            clean_water_tn = clean_water_tn.average

                            # get value for current trophic state chosen by the user
                            current_tn = IndicatorTrophicData.objects.get(indicator=indicator, trophic_state=trophic_state.id)
                            current_tn = current_tn.average

                            # get average values for scenario
                            scenario_change_obj = StudyAreaResult.objects.get(study_area = study_area_id, scenario = scenario_id, criteria = indicator)
                            scenario_change = scenario_change_obj.average_value

                            future_tn_avg = (future_ponds * clean_water_tn + current_tn * current_ponds)/(future_ponds + current_ponds)

                            output = (((future_tn_avg + (future_tn_avg*(scenario_change/100)))-current_tn)/current_tn)*100
                            all_values.append((indicator,_("Creation of ") + str(nbs_action[1]) + _(" Clean Water Ponds"), output*(-1), satisfaction_c, satisfaction_n, weight, scenario_id))
                    
                
                    #output = modeling_result.objects.filter(action=nbs_action[0],criteria=indicator, pond_num=ap[1], scenario=scenario_id).values_list('output', flat=True).distinct().first()
                    #print("here", ap[0])
                    
                # water management
                elif nbs_action[0] == 14:
                    if indicator not in [19,18,55]:

                        # Check if the trophic state is 'unknown' and set it to 'hypertrophic' if true
                        if trophic_state.trophic_state == 'unknown':
                        # Retrieve the 'hypertrophic' TrophicState record
                            hypertrophic_state = TrophicState.objects.get(trophic_state='hypertrophic')
                            trophic_state = hypertrophic_state  # Set trophic_state to hypertrophic

                        # Get the IndicatorTrophicData record for the indicator and trophic state
                        current_ncp_wq = IndicatorTrophicData.objects.get(indicator=indicator, trophic_state=trophic_state.id)
        
                        # Get the current trophic state's rank
                        current_rank = trophic_state.rank
                        print('trophic', trophic_state.degree)

                        # Check if the current state is already at the lowest degree (degree 1)
                        if current_rank == 1:
                        # No previous trophic state exists, so we keep the current trophic state as it is
                            print("The current trophic state is already at the minimum degree (1).")
                            future_ncp_wq = current_ncp_wq  # Retain the current trophic state data
                        else:
                        # Retrieve the previous trophic state by rank, excluding 'unknown' if it exists at the same rank
                            previous_trophic_state = TrophicState.objects.filter(degree=current_rank - 1).exclude(trophic_state='unknown').first()
                            if previous_trophic_state:
                                print('trophic_oneback', previous_trophic_state.degree)
            
                                # Get the IndicatorTrophicData for the previous trophic state
                                future_ncp_wq = IndicatorTrophicData.objects.get(indicator=indicator, trophic_state=previous_trophic_state.id)
                            else:
                                print("No valid previous trophic state found.")

                        scenario_change_obj = StudyAreaResult.objects.get(study_area = study_area_id, scenario = scenario_id, criteria = indicator)
                        scenario_change = scenario_change_obj.average_value

                        # calculate output 
                        output = (((future_ncp_wq.average + (future_ncp_wq.average*(scenario_change/100)))-current_ncp_wq.average)/current_ncp_wq.average)*100
                        all_values.append((indicator,_("Management of Water Quality"), output, satisfaction_c, satisfaction_n, weight, scenario_id))
                        #print(output)

                    # if emmissions
                    if indicator in [18,55]:
                        # Check if the trophic state is 'unknown' and set it to 'hypertrophic' if true
                        if trophic_state.trophic_state == 'unknown':
                        # Retrieve the 'hypertrophic' TrophicState record
                            hypertrophic_state = TrophicState.objects.get(trophic_state='hypertrophic')
                            trophic_state = hypertrophic_state  # Set trophic_state to hypertrophic

                        # Get the IndicatorTrophicData record for the indicator and trophic state
                        current_ncp_wq = IndicatorTrophicData.objects.get(indicator=indicator, trophic_state=trophic_state.id)
        
                        # Get the current trophic state's rank
                        current_rank = trophic_state.rank
                        print('trophic', trophic_state.degree)

                        # Check if the current state is already at the lowest degree (degree 1)
                        if current_rank == 1:
                        # No previous trophic state exists, so we keep the current trophic state as it is
                            print("The current trophic state is already at the minimum degree (1).")
                            future_ncp_wq = current_ncp_wq  # Retain the current trophic state data
                        else:
                        # Retrieve the previous trophic state by rank, excluding 'unknown' if it exists at the same rank
                            previous_trophic_state = TrophicState.objects.filter(degree=current_rank - 1).exclude(trophic_state='unknown').first()
                            if previous_trophic_state:
                                print('trophic_oneback', previous_trophic_state.degree)
            
                                # Get the IndicatorTrophicData for the previous trophic state
                                future_ncp_wq = IndicatorTrophicData.objects.get(indicator=indicator, trophic_state=previous_trophic_state.id)
                            else:
                                print("No valid previous trophic state found.")

                        scenario_change_obj = StudyAreaResult.objects.get(study_area = study_area_id, scenario = scenario_id, criteria = indicator)
                        scenario_change = scenario_change_obj.average_value

                        # calculate output 
                        output = (((future_ncp_wq.average + (future_ncp_wq.average*(scenario_change/100)))-current_ncp_wq.average)/current_ncp_wq.average)*100
                        #output = output*(-1)
                            #satisfaction_c = satisfaction_c*(-1)
                            #satisfaction_n = satisfaction_n*(-1)

                        all_values.append((indicator,_("Management of Water Quality"), output*(-1), satisfaction_c, satisfaction_n, weight, scenario_id))
        

                # no action
                else:
                    if indicator not in [19,18,55]:
                        scenario_change_obj = StudyAreaResult.objects.get(study_area = study_area_id, scenario = scenario_id, criteria = indicator)
                        scenario_change = scenario_change_obj.average_value
                        output = scenario_change
                        all_values.append((indicator,_("No action"), output, satisfaction_c, satisfaction_n, weight, scenario_id))
                        # if emmissions
                    if indicator in [18,55]:
                        scenario_change_obj = StudyAreaResult.objects.get(study_area = study_area_id, scenario = scenario_id, criteria = indicator)
                        scenario_change = scenario_change_obj.average_value
                        output = scenario_change
                        #print(output)
                            #satisfaction_c = satisfaction_c*(-1)
                            #satisfaction_n = satisfaction_n*(-1)
                        #print(ap[0])
                        all_values.append((indicator,"No action", output*(-1), satisfaction_c, satisfaction_n, weight, scenario_id))
    

    if request.method == 'POST':

        for element in all_values:
            print(element[1], element[2], element[3], element[4], element[6])
            # element[2] = model output
            # element[4] = satisfaction _n
            # element[3] = satisfaction_c
            if element[2]<=element[4]:
                partial_satisfaction = 0
                weighted_avg = partial_satisfaction * element[5]
            elif (element[2]>element[4] and element[2]<element[3]):
                partial_satisfaction = (element[2]-element[4])/(element[3]-element[4])*100
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
    #criteria_titles = sorted({result.criteria.name for result in results_sample})
    # Order criteria by ID and extract only the names
    criteria_titles = list(
    dict.fromkeys(
        [result.criteria.name for result in results_sample.order_by('criteria__id')]
        )
    )
    
    alternatives = sorted(set(result.alternative for result in results_sample))
    # order alternatives
    prioritized_order = ['No action', 'Management of Water Quality']
    existing_prioritized = [alt for alt in prioritized_order if alt in alternatives]  # Only include if they exist
    remaining_alternatives = [alt for alt in alternatives if alt not in prioritized_order]
    
    # Combine the prioritized and remaining alternatives
    alternatives = existing_prioritized + remaining_alternatives
    #print(alternatives)
    
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
        results_by_scenario[(scen.description, scen.id)] = scenario_data

    context = {
        'all_scenarios': all_scenarios,
        'selected_scenarios': scenarios,
        'data': results_by_scenario,
        'criteria_titles': criteria_titles,
        'alternatives': alternatives,
    }

    return render(request, 'show_mcda_results.html', context)








    


