# Generated by Django 4.0 on 2023-12-20 15:59

import django.contrib.postgres.fields
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ponderful_mcda', '0009_criteria_params_weight_range_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='criteria_params',
            name='weight_range',
            field=django.contrib.postgres.fields.ArrayField(base_field=models.FloatField(), default=list, size=2, verbose_name='Weight Range'),
        ),
    ]
