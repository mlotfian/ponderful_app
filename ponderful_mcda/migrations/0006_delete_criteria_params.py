# Generated by Django 4.0 on 2023-12-20 13:46

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('ponderful_mcda', '0005_alter_studyarea_name'),
    ]

    operations = [
        migrations.DeleteModel(
            name='criteria_params',
        ),
    ]