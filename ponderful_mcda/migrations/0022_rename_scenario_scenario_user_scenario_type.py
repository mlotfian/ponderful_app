# Generated by Django 4.0 on 2024-02-21 10:42

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('ponderful_mcda', '0021_scenario_scenario_user'),
    ]

    operations = [
        migrations.RenameField(
            model_name='scenario_user',
            old_name='scenario',
            new_name='scenario_type',
        ),
    ]