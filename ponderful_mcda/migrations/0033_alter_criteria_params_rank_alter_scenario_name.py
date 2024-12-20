# Generated by Django 4.0 on 2024-03-17 19:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ponderful_mcda', '0032_alter_scenario_name'),
    ]

    operations = [
        migrations.AlterField(
            model_name='criteria_params',
            name='rank',
            field=models.IntegerField(verbose_name='Priority Rank'),
        ),
        migrations.AlterField(
            model_name='scenario',
            name='name',
            field=models.CharField(choices=[('Land Use: SSP1, Climate Change: SSP1', 'Land Use: SSP1, Climate Change: SSP1'), ('Land Use: SSP3, Climate Change: SSP3', 'Land Use: SSP3, Climate Change: SSP3'), ('Land Use: SSP5, Climate Change: SSP5', 'Land Use: SSP5, Climate Change: SSP5'), ('Land Use: No Change, Climate Change: SSP1', 'Land Use: No Change, Climate Change: SSP1'), ('Land Use: No Change, Climate Change: SSP3', 'Land Use: No Change, Climate Change: SSP3'), ('Land Use: No Change, Climate Change: SSP5', 'Land Use: No Change, Climate Change: SSP5'), ('Land Use: No Change, Climate Change: No Change', 'Land Use: No Change, Climate Change: No Change')], max_length=255, verbose_name='Climate Change Scenario'),
        ),
    ]
