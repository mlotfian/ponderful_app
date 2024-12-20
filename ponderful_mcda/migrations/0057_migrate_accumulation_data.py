# Generated by Django 4.0 on 2024-10-01 10:39

from django.db import migrations



def migrate_accumulation_data(apps, schema_editor):
    # Get models via the 'apps' object to ensure it works with historical migrations
    Accumulation = apps.get_model('ponderful_mcda', 'accumulation')
    AmphiAccumulation = apps.get_model('ponderful_mcda', 'amphi_accumulation')
    MIAccumulation = apps.get_model('ponderful_mcda', 'MI_accumulation')
    MacrophyteAccumulation = apps.get_model('ponderful_mcda', 'macrophyte_accumulation')
    Criteria = apps.get_model('ponderful_mcda', 'criteria')

    # Get criteria objects
    amphibia_criteria = Criteria.objects.get(name="Amphibian species")
    MI_criteria = Criteria.objects.get(name="Macroinvertebrates")
    macrophyte_criteria = Criteria.objects.get(name="Aquatic plant species")

    # Migrate amphi_accumulation data
    for amphi in AmphiAccumulation.objects.all():
        Accumulation.objects.create(
            country=amphi.country,
            sp_richness=amphi.sp_richness,
            pond_num=amphi.pond_num,
            indicator=amphibia_criteria
        )

    # Migrate MI_accumulation data
    for mi in MIAccumulation.objects.all():
        Accumulation.objects.create(
            country=mi.country,
            sp_richness=mi.sp_richness,
            pond_num=mi.pond_num,
            indicator=MI_criteria
        )

    # Migrate macrophyte_accumulation data
    for macrophyte in MacrophyteAccumulation.objects.all():
        Accumulation.objects.create(
            country=macrophyte.country,
            sp_richness=macrophyte.sp_richness,
            pond_num=macrophyte.pond_num,
            indicator=macrophyte_criteria
        )

class Migration(migrations.Migration):

    dependencies = [
        ('ponderful_mcda', '0056_accumulation'),  # Keep this dependency correct
    ]

    operations = [
        migrations.RunPython(migrate_accumulation_data),
    ]