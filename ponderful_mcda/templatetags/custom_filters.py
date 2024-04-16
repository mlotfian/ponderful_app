from django import template

register = template.Library()

@register.filter(name='get')
def get(d, key):
    """Attempt to get a value from a dictionary with a given key."""
    return d.get(key)
