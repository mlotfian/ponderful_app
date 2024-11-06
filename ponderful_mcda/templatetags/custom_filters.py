from django import template
import re

register = template.Library()

@register.filter(name='get')
def get(d, key):
    """Attempt to get a value from a dictionary with a given key."""
    return d.get(key)

@register.filter
def add_subscript(value):
    # Replace CH4 and CO2 patterns with HTML for subscripts
    value = re.sub(r'CH4', 'CH<sub>4</sub>', value)
    value = re.sub(r'CO2', 'CO<sub>2</sub>', value)
    return value



@register.filter
def index(sequence, position):
    return sequence[position]
