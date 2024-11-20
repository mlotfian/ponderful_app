import pandas as pd
from django.core.management.base import BaseCommand
from ponderful_mcda.models import accumulation, criteria
import csv

class Command(BaseCommand):
    help = "Import data from CSV file into the accumulation model"

    def add_arguments(self, parser):
        parser.add_argument('/app/accumulation/accu.csv', type=str, help="Path to the CSV file")

    def handle(self, *args, **options):
        file_path = options['/app/accumulation/accu.csv']

        try:
            # Load CSV file
            data = pd.read_csv(file_path)

            # Iterate over rows and create entries
            for _, row in data.iterrows():
                try:
                    # Fetch the indicator object based on some column, e.g., 'indicator_name'
                    indicator_obj = criteria.objects.get(name=row['indicator_name'])

                    # Create or update accumulation entry
                    accumulation_obj, created = accumulation.objects.update_or_create(
                        country=row['country'],
                        sp_richness=row['sp_richness'],
                        pond_num=row['pond_num'],
                        indicator=indicator_obj
                    )

                    status = "Created" if created else "Updated"
                    self.stdout.write(self.style.SUCCESS(f"{status}: {accumulation_obj}"))

                except criteria.DoesNotExist:
                    self.stdout.write(self.style.ERROR(f"Indicator not found: {row['indicator_name']}"))
        except Exception as e:
            self.stdout.write(self.style.ERROR(f"Error importing data: {str(e)}"))