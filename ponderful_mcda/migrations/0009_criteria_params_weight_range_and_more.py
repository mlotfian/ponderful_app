# Generated by Django 4.0 on 2023-12-20 15:58

import django.contrib.postgres.fields
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ponderful_mcda', '0008_satisfaction_threshold'),
    ]

    operations = [
        migrations.AddField(
            model_name='criteria_params',
            name='weight_range',
            field=django.contrib.postgres.fields.ArrayField(base_field=models.FloatField(), default=[0, 1], size=2, verbose_name='Weight Range'),
        ),
        migrations.AlterField(
            model_name='criteria_params',
            name='rank',
            field=models.IntegerField(verbose_name='Importance Rank'),
        ),
    ]
