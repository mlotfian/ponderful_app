from modeltranslation.translator import translator, TranslationOptions
from .models import scenario

class ScenarioTranslationOptions(TranslationOptions):
    fields = ('description',)  # List all fields that need translation

translator.register(scenario, ScenarioTranslationOptions)