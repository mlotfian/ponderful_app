# Generated by Django 4.0 on 2024-10-01 08:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ponderful_mcda', '0050_remove_studyarea_amphibia_ssp1_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='TrophicState',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('trophic_state', models.CharField(blank=True, choices=[('oligotrophic', 'Oligotrophic'), ('mesotrophic', 'Mesotrophic'), ('eutrophic', 'Eutrophic'), ('hypertrophic', 'Hypertrophic'), ('highly hypertrophic', 'Highly Hypertrophic'), ('unknown', 'I do not know')], max_length=50, verbose_name='Trophic State')),
            ],
        ),
    ]