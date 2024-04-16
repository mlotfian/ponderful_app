from django.apps import AppConfig





class PonderfulMcdaConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'ponderful_mcda'




#@register(criteria)


    
    def ready(self):
        from modeltranslation.translator import translator, TranslationOptions,register
        from .models import criteria
        
        class CriteriaTranslationOptions(TranslationOptions):
            fields = ('name', 'unit_of_measure')
        translator.register(criteria, CriteriaTranslationOptions)
