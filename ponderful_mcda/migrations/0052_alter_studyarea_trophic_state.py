# Generated by Django 4.0 on 2024-10-01 09:01

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('ponderful_mcda', '0051_trophicstate'),
    ]

    operations = [
        migrations.AlterField(
            model_name='studyarea',
            name='trophic_state',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ponderful_mcda.trophicstate'),
        ),
    ]
