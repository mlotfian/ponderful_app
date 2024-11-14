# myapp/management/commands/import_csv.py
import pandas as pd
from django.core.management.base import BaseCommand
from ponderful_mcda.models import IndicatorTrophicData, criteria, TrophicState

class Command(BaseCommand):
    help = 'Import CSV data into IndicatorTrophicData model using pandas'

    def handle(self, *args, **kwargs):
        # Path to your CSV file inside the container
        csv_file_path = '/app/trophic_state/Percent_change_improvement_2.csv'

        # Read the CSV file using pandas
        df = pd.read_csv(csv_file_path)

        # Iterate over the rows of the DataFrame
        for _, row in df.iterrows():
            # Get or create the criteria (indicator) object
            indicator_name = row['Indicator']
            indicator, created = criteria.objects.get_or_create(name=indicator_name)

            # Get the corresponding TrophicState object
            trophic_state_name = row['Trophic state'].lower()
            try:
                trophic_state = TrophicState.objects.get(trophic_state=trophic_state_name)
            except TrophicState.DoesNotExist:
                self.stdout.write(self.style.WARNING(f"Trophic state '{trophic_state_name}' does not exist. Skipping..."))
                continue

            # Get the average value from the DataFrame row
            average = row['Average']

            # Create or update the IndicatorTrophicData record
            IndicatorTrophicData.objects.create(
                indicator=indicator,
                trophic_state=trophic_state,
                average=average
            )

        self.stdout.write(self.style.SUCCESS("CSV import completed using pandas."))