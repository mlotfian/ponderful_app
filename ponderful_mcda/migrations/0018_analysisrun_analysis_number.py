# Generated by Django 4.0 on 2024-02-20 14:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ponderful_mcda', '0017_analysisrun'),
    ]

    operations = [
        migrations.AddField(
            model_name='analysisrun',
            name='analysis_number',
            field=models.IntegerField(default=1),
        ),
    ]
