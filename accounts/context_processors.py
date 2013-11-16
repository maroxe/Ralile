
from django.contrib.auth.models import User

def domain(request):
    users = User.objects.all()

    try:
        entrepreneurs = [u.get_profile().entrepreneur for u in users if u.get_profile().get_type() == 'E']
    except UserProfile.DoesNotExist:
        entrepreneurs = []
    try:
        investisseurs = [u.get_profile().investisseur for u in users if u.get_profile().get_type() == 'I']
    except UserProfile.DoesNotExist:
        investisseurs = []


    return {
        'entrepreneurs': entrepreneurs,
        'investisseurs': investisseurs
    }

