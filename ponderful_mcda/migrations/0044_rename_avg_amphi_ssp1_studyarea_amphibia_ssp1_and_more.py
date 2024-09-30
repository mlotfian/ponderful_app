# Generated by Django 4.0 on 2024-09-26 16:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ponderful_mcda', '0043_studyarea_avg_amphi_ssp2_studyarea_avg_amphi_ssp3_and_more'),
    ]

    operations = [
        migrations.RenameField(
            model_name='studyarea',
            old_name='avg_amphi_ssp1',
            new_name='Amphibia_ssp1',
        ),
        migrations.RenameField(
            model_name='studyarea',
            old_name='co2_ssp1',
            new_name='CO2_ssp1',
        ),
        migrations.RemoveField(
            model_name='studyarea',
            name='avg_amphi_ssp2',
        ),
        migrations.RemoveField(
            model_name='studyarea',
            name='avg_amphi_ssp3',
        ),
        migrations.RemoveField(
            model_name='studyarea',
            name='co2_ssp2',
        ),
        migrations.RemoveField(
            model_name='studyarea',
            name='co2_ssp3',
        ),
        migrations.AddField(
            model_name='studyarea',
            name='Amphibia_ssp3',
            field=models.FloatField(blank=True, null=True, verbose_name='average_amph_ssp3'),
        ),
        migrations.AddField(
            model_name='studyarea',
            name='Amphibia_ssp5',
            field=models.FloatField(blank=True, null=True, verbose_name='average_amph_ssp5'),
        ),
        migrations.AddField(
            model_name='studyarea',
            name='CO2_ssp3',
            field=models.FloatField(blank=True, null=True, verbose_name='co2_ssp3'),
        ),
        migrations.AddField(
            model_name='studyarea',
            name='CO2_ssp5',
            field=models.FloatField(blank=True, null=True, verbose_name='co2_ssp5'),
        ),
    ]