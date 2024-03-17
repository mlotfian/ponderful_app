# Generated by Django 4.0 on 2024-01-17 12:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ponderful_mcda', '0014_action_types_alter_criteria_params_weight_percentage_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='action_types',
            name='name',
            field=models.CharField(choices=[('creation', 'Creation'), ('restoration', 'Restoration'), ('water management', 'Water management'), ('Land management', 'Land management'), ('No action', 'No action')], max_length=255, verbose_name='Action Name'),
        ),
    ]