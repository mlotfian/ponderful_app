# Generated by Django 4.0 on 2024-10-04 07:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ponderful_mcda', '0062_alter_criteria_params_threshold_max_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='studyarea',
            name='name',
            field=models.CharField(max_length=255, verbose_name='Study Area Name'),
        ),
    ]
