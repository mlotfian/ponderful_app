from leaflet.admin import LeafletGeoAdmin
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

from .forms import CustomUserCreationForm, CustomUserChangeForm
from .models import CustomUser , studyarea, criteria, criteria_params

# Register your models here.

class CustomUserAdmin(UserAdmin):
    add_form = CustomUserCreationForm
    form = CustomUserChangeForm
    model = CustomUser
    list_display = ["email", "username","organization",]



admin.site.register(CustomUser, CustomUserAdmin)


admin.site.register(studyarea, LeafletGeoAdmin)

admin.site.register(criteria)

admin.site.register(criteria_params)
