# Generated by Django 4.0 on 2024-01-30 16:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ponderful_mcda', '0015_alter_action_types_name'),
    ]

    operations = [
        migrations.AlterField(
            model_name='action_types',
            name='name',
            field=models.CharField(choices=[('Creation', 'Creation'), ('Restoration', 'Restoration'), ('Water management', 'Water management'), ('Land management', 'Land management'), ('No action', 'No action')], max_length=255, verbose_name='Action Name'),
        ),
    ]