# Generated by Django 4.0 on 2024-10-01 09:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ponderful_mcda', '0052_alter_studyarea_trophic_state'),
    ]

    operations = [
        migrations.AddField(
            model_name='trophicstate',
            name='rank_2',
            field=models.IntegerField(blank=True, null=True),
        ),
    ]
