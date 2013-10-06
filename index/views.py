# Create your views here.
from django.shortcuts import get_object_or_404, render
from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse

from accounts.forms import *

def index(request):
    registration_form = RegistrationForm()
    login_form = LoginForm()
    users = User.objects.all()

    try:
        entrepreneurs = [u.get_profile().entrepreneur for u in users if u.get_profile().get_type() == 'E']
    except UserProfile.DoesNotExist:
        entrepreneurs = []
    try:
        investisseurs = [u.get_profile().investisseur for u in users if u.get_profile().get_type() == 'I']
    except UserProfile.DoesNotExist:
        investisseurs = []


    return render(request, 'index.tpl', {
        'login_form': login_form,
        'registration_form': registration_form,
        'entrepreneurs': entrepreneurs,
        'investisseurs': investisseurs
    })
    
