# Generated by Django 4.0 on 2024-11-18 14:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ponderful_mcda', '0071_alter_action_types_name'),
    ]

    operations = [
        migrations.AlterField(
            model_name='action_types',
            name='name',
            field=models.CharField(choices=[('Creation of Clean Water Ponds', 'Creation of Clean Water Ponds'), ('Management of Water Quality', 'Management of Water Quality'), ('No action', 'No action')], max_length=255, verbose_name='Action Name'),
        ),
    ]
