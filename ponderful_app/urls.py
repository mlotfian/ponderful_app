"""ponderful_app URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls.i18n import i18n_patterns
from django.contrib import admin
from django.urls import path, include
from django.views.generic.base import TemplateView


urlpatterns =  i18n_patterns(
    path("home/", TemplateView.as_view(template_name="home.html"), name="home"),
    #path('criteria/',TemplateView.as_view(template_name="criteria.html"), name='criteria'),
    #path('index', TemplateView.as_view(template_name='index.html'), name='index'),
    path('admin/', admin.site.urls),
    path("ponderful_mcda/", include("ponderful_mcda.urls")),
    path("ponderful_mcda/", include("django.contrib.auth.urls")),
    path('i18n/', include('django.conf.urls.i18n')),
)
