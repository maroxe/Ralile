# Create your views here.
from django.shortcuts import get_object_or_404, render
from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse

from accounts.forms import *

def index(request):
    registration_form = RegistrationForm()
    login_form = LoginForm()

    return render(request, 'index.tpl', {
        'login_form': login_form,
        'registration_form': registration_form,
    })
    
