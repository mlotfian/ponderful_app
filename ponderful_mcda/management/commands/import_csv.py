import pandas as pd
from django.core.management.base import BaseCommand
from ponderful_mcda.models import amphi_accumulation, MI_accumulation, macrophyte_accumulation

class Command(BaseCommand):
    help = 'Import CSV data into database'

    def handle(self, *args, **kwargs):
        # Import file1.csv into Table1
        df1 = pd.read_csv('/app/accumulation/Amp_SAC_data.csv')
        for _, row in df1.iterrows():
            amphi_accumulation.objects.create(
                country=row['Country'],
                sp_richness=row['Amp_SAC'],
                pond_num=row['Pond_num']
            )
        
        # Import file2.csv into Table2
        df2 = pd.read_csv('/app/accumulation/MI_SAC_data.csv')
        for _, row in df2.iterrows():
            MI_accumulation.objects.create(
                country=row['Country'],
                sp_richness=row['MI_SAC'],
                pond_num=row['Pond_num']
            )

        # Import file3.csv into Table3
        df3 = pd.read_csv('/app/accumulation/Macrophyte_SAC_data.csv')
        for _, row in df3.iterrows():
            macrophyte_accumulation.objects.create(
                country=row['Country'],
                sp_richness=row['Macrophyte_SAC'],
                pond_num=row['Pond_num']
            )

        self.stdout.write(self.style.SUCCESS('Successfully imported all CSV files'))