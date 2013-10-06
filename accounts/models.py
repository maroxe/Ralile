from datetime import datetime

from django.db import models
from django.contrib.auth.models import User

class UserProfile(models.Model):
        USER_TYPES = (
                ('I', 'Investisseur'),
                ('E', 'Entrepreneur'),
        )
        
        user = models.OneToOneField(User, primary_key=True)


        def get_type(self):
                try:
                        self.investisseur
                        return 'I'
                except:
                        return 'E'

        def is_investisseur(self):
            return self.get_type() == 'I'

        def __unicode__(self):
                return self.user.email


class Investisseur(models.Model):
    """
        Mentors
    """

    profile = models.OneToOneField(UserProfile, primary_key=True, related_name='investisseur')
    first_name = models.CharField(max_length=200, blank=True)
    last_name = models.CharField(max_length=200, blank=True)
    logo = models.ImageField(upload_to='avatars/', blank=True)
    secteur = models.CharField(max_length=200, blank=True)


    def __unicode__(self):
        return "investisseur: " + self.first_name + " - profile"


        
class Entrepreneur(models.Model):
    profile = models.OneToOneField(UserProfile, primary_key=True, related_name='entrepreneur')

    first_name = models.CharField(max_length=200, blank=True)
    last_name = models.CharField(max_length=200, blank=True)
    logo = models.ImageField(upload_to='avatars/', blank=True)
    secteur = models.CharField(max_length=200, blank=True)
    date_creation = models.DateField(default=datetime.now, blank=True)
    resume = models.TextField(blank=True)
    company_name = models.CharField(max_length=200, blank=True)

    mentors = models.ManyToManyField(Investisseur, related_name='mentors', blank=True)
    # Investisseur liked by the mentor
    likes = models.ManyToManyField(Investisseur, related_name='likes', blank=True)

    def __unicode__(self):
        return "entrepreneur: " + self.first_name + "   - profile"

    def get_news(self):
        return self.profile.user.post_set.all()

    def get_user_pk(self):
        return self.profile.user.pk
