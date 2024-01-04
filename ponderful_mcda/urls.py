# accounts/urls.py
from django.urls import path

from .views import SignUpView, map_view, study_area_detail, select_criteria, add_params, add_weight

urlpatterns = [
    path("signup/", SignUpView.as_view(), name="signup"),
    path('map/', study_area_detail, name='map'),
    path('select_criteria/', select_criteria, name='select_criteria'),
    path('add_params/', add_params, name='add_params'),
    path('add_weight/', add_weight, name='add_weight'),
    
]