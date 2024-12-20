# Generated by Django 4.0 on 2024-09-24 15:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ponderful_mcda', '0041_alter_studyarea_trophic_state'),
    ]

    operations = [
        migrations.AddField(
            model_name='studyarea',
            name='avg_amphi_ssp1',
            field=models.FloatField(blank=True, null=True, verbose_name='average_amph_ssp1'),
        ),
        migrations.AlterField(
            model_name='studyarea',
            name='trophic_state',
            field=models.CharField(blank=True, choices=[('oligotrophic', 'Oligotrophic'), ('mesotrophic', 'Mesotrophic'), ('eutrophic', 'Eutrophic'), ('hypertrophic', 'Hypertrophic'), ('highly hypertrophic', 'Highly hypertrophic'), ('I do not know', 'I do not know')], max_length=255, verbose_name='Trophic Status'),
        ),
    ]
