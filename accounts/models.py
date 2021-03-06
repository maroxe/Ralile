# coding=utf8
# -*- coding: utf8 -*-

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
            try:
                return self.investisseur.__unicode__()
            except:
                return self.entrepreneur.__unicode__()

class BaseProfile(models.Model):
    class Meta:
        abstract = True
    first_name = models.CharField(max_length=200)
    last_name = models.CharField(max_length=200)
    birth_date = models.DateField()
    sex = models.CharField(max_length=1, choices=(('M', 'Male'), ('F', 'Female')))
    adresse = models.CharField(max_length=300)

    registration_date = models.DateTimeField(default=datetime.now)

    def get_absolute_url(self):
        from django.core.urlresolvers import reverse
        return reverse('accounts.views.view_profile', args=[str(self.profile.user.id)])

class Investisseur(BaseProfile):
    """
        Mentors
    """

    profile = models.OneToOneField(UserProfile, primary_key=True, related_name='investisseur')

    #- Pourquoi voulez-vous etre mentor ?
    motivation = models.CharField(max_length=200)
    # - Dans quel domaine pouvez-vous transmettre des competences ?
    domaine = models.CharField(max_length=200)
    # - Qui etes-vous ?
    description = models.CharField(max_length=200)
    photo = models.ImageField(upload_to='photos/')

    def __unicode__(self):
        return  self.first_name + ' ' + self.last_name


        
class Entrepreneur(BaseProfile):
    profile = models.OneToOneField(UserProfile, primary_key=True, related_name='entrepreneur')

    # - Qui etes-vous ?
    presentation = models.CharField(max_length=200, verbose_name='Qui etes-vous ?')
    company_name = models.CharField(max_length=200, verbose_name='Nom de votre entreprise')
    #- Quel est votre projet ? (Court resume, env 4-5 lignes)
    description = models.TextField(verbose_name='Quel est votre projet ? (Court resume, env 4-5 lignes)')
    # - Quel est le marche vise ?
    market = models.CharField(max_length=200, verbose_name='Quel est le marche visé ?')
    # - Quel est le differentiateur ?
    # - Quel est le niveau d'avancement du projet ?
    progress = models.TextField(verbose_name='Quel est le niveau d\'avancement du projet ?')
    # - Quel chiffre d'affaire visez-vous dans 3 ans ?
    turnover = models.IntegerField(verbose_name='Quel chiffre d\'affaire visez-vous dans 3 ans ?')
    # - Qu'attendez-vous de la communaute Galile360 ?
    expectation = models.TextField(verbose_name='Qu\'attendez-vous de la communauté Galilé360 ?')
    # - Upload CV
    resume = models.FileField(upload_to='cv/')
    logo = models.ImageField(upload_to='avatars/')
    creation_date = models.DateField(default=datetime.now)


    # Mentors and likes
    mentors = models.ManyToManyField(Investisseur, related_name='mentors')
    likes = models.ManyToManyField(Investisseur, related_name='likes')

    def __unicode__(self):
        return  self.first_name + ' ' + self.last_name

    def get_news(self):
        return self.profile.user.post_set.all()

    def get_user_pk(self):
        return self.profile.user.pk
