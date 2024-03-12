# Generated by Django 4.0 on 2024-02-21 16:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ponderful_mcda', '0022_rename_scenario_scenario_user_scenario_type'),
    ]

    operations = [
        migrations.CreateModel(
            name='Test',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(choices=[('Sustainability', 'Sustainability'), ('Regional rivalry', 'Regional rivalry'), ('Fossil-fueled development', 'Fossil-fueled development')], max_length=255, verbose_name='Climate Change Scenario')),
            ],
        ),
    ]
