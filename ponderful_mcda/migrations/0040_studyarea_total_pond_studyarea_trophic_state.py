# Generated by Django 4.0 on 2024-09-24 11:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ponderful_mcda', '0039_scenario_climate_scenario_landuse'),
    ]

    operations = [
        migrations.AddField(
            model_name='studyarea',
            name='total_pond',
            field=models.IntegerField(blank=True, null=True, verbose_name='Total number of existing ponds'),
        ),
        migrations.AddField(
            model_name='studyarea',
            name='trophic_state',
            field=models.CharField(blank=True, choices=[('oligotrophe', 'Oligotrophe'), ('mesotrophe', 'Mesotrophe'), ('eutrophe', 'Eutrophe'), ('hypertrophe', 'Hypertrophe'), ('hautement hypertrophe', 'Hautement hypertrophe')], max_length=255, verbose_name='Trophic Status'),
        ),
    ]