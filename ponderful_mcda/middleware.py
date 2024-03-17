from django.http import HttpResponse
from django.template.loader import render_to_string

class SuperuserDebugMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        # Code to be executed for each request before
        # the view (and later middleware) are called.
        response = self.get_response(request)
        return response

    def process_exception(self, request, exception):
        # Check if the user is a superuser
        if request.user.is_authenticated and request.user.is_superuser:
            # Reraises the exception to be caught by Django's default debug handler
            raise
        else:
            # Show a custom error message to non-superusers
            content = render_to_string('under_development.html')
            return HttpResponse(content, status=500)