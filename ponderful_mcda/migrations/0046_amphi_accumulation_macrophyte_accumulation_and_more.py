# Generated by Django 4.0 on 2024-09-27 15:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ponderful_mcda', '0045_studyarea_country_alter_studyarea_amphibia_ssp1_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='amphi_accumulation',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('country', models.CharField(max_length=255)),
                ('sp_richness', models.IntegerField()),
                ('pond_num', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='macrophyte_accumulation',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('country', models.CharField(max_length=255)),
                ('sp_richness', models.IntegerField()),
                ('pond_num', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='MI_accumulation',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('country', models.CharField(max_length=255)),
                ('sp_richness', models.IntegerField()),
                ('pond_num', models.IntegerField()),
            ],
        ),
    ]
