# Generated by Django 4.0 on 2024-08-07 15:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ponderful_mcda', '0035_alter_criteria_params_rank_alter_scenario_name'),
    ]

    operations = [
        migrations.AlterField(
            model_name='scenario',
            name='name',
            field=models.CharField(choices=[('Land Use: SSP1, Climate Change: SSP1', 'Land Use: SSP1, Climate Change: SSP1'), ('Land Use: SSP3, Climate Change: SSP3', 'Land Use: SSP3, Climate Change: SSP3'), ('Utilisation des sols : SSP5, Changement climatique : SSP5', 'Land Use: SSP5, Climate Change: SSP5'), ('Utilisation des sols : Pas de changement, changement climatique : SSP1', 'Land Use: No Change, Climate Change: SSP1'), ('Utilisation des sols : Pas de changement, changement climatique : SSP3', 'Land Use: No Change, Climate Change: SSP3'), ('Utilisation des sols : Pas de changement, changement climatique : SSP5', 'Land Use: No Change, Climate Change: SSP5'), ('Utilisation des sols : Pas de changement, changement climatique : Pas de changement', 'Land Use: No Change, Climate Change: No Change')], max_length=255, verbose_name='Climate Change Scenario'),
        ),
    ]
