# Generated by Django 4.0 on 2024-01-17 12:28

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('ponderful_mcda', '0013_criteria_params_weight_percentage'),
    ]

    operations = [
        migrations.CreateModel(
            name='action_types',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, verbose_name='Action Name')),
            ],
        ),
        migrations.AlterField(
            model_name='criteria_params',
            name='weight_percentage',
            field=models.FloatField(default=100, verbose_name='Weight in percentage'),
        ),
        migrations.CreateModel(
            name='alternatives_params',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('pond_min', models.IntegerField(verbose_name='Minimum number of ponds')),
                ('pond_max', models.IntegerField(verbose_name='Maximum number of ponds')),
                ('pond_size', models.CharField(choices=[('small', 'Small'), ('average', 'Average'), ('big', 'Big')], default='none', max_length=255)),
                ('action', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ponderful_mcda.action_types')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ponderful_mcda.customuser')),
            ],
        ),
    ]