# Generated by Django 4.0 on 2024-10-04 08:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ponderful_mcda', '0063_alter_studyarea_name'),
    ]

    operations = [
        migrations.AddField(
            model_name='criteria',
            name='ncp',
            field=models.CharField(blank=True, max_length=255, null=True, verbose_name='NCP Name'),
        ),
    ]
