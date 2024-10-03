# accounts/urls.py
from django.urls import path

#from .views import SignUpView, start_analysis, map_view, study_area_detail, select_criteria, add_params, create_alternatives
from .views import *

urlpatterns = [
    path("signup/", SignUpView.as_view(), name="signup"),
    path('map2/', map_view, name='map2'),
    path('map/', study_area_detail, name='map'),
    path('select_criteria/', select_criteria, name='select_criteria'),
    path('add_params/', add_params, name='add_params'),
    path('add_thresholds/', add_thresholds, name='add_thresholds'),
    path('create_alternatives', create_alternatives, name='create_alternatives'),
    path('start-analysis/', start_analysis, name='start_analysis'),
    path('select_scenario/', select_scenario, name='select_scenario'),
    path('mcda_result/', mcda_results, name='mcda_result'),
    path('show_results/', show_results, name='show_results')

]