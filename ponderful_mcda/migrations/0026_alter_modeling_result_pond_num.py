# Generated by Django 4.0 on 2024-02-28 13:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ponderful_mcda', '0025_modeling_result'),
    ]

    operations = [
        migrations.AlterField(
            model_name='modeling_result',
            name='pond_num',
            field=models.IntegerField(blank=True, null=True, verbose_name='Number of ponds'),
        ),
    ]