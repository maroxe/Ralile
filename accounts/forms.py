# coding=utf8
# -*- coding: utf8 -*-

from django import forms, contrib
from django.contrib.auth.models import User
from django.core.exceptions import ObjectDoesNotExist

from datetimewidget.widgets import DateTimeWidget

from models import *

class LoginForm(forms.Form):
    email = forms.CharField()
    password = forms.CharField(widget=forms.PasswordInput) 

class UserProfileForm(forms.ModelForm):
    class Meta:
        model = UserProfile

class EntrepreneurForm(forms.ModelForm):
    class Meta:
        model = Entrepreneur
        fields = ('company_name', 'logo', 'progress')


class InvestisseurForm(forms.ModelForm):
    class Meta:
        model = Investisseur
        fields = ('motivation', 'domaine')

class RegistrationForm(forms.Form):

    first_name = forms.CharField(max_length=250, label='Prénom')
    last_name = forms.CharField(max_length=250, label='Nom')
    email = forms.CharField(max_length=250, label='Email')
    confirm_email = forms.CharField(max_length=250, label='Confirmer votre email')
    password = forms.CharField(widget=forms.PasswordInput(), max_length=250, label='Mot de passe')

    birth_date = forms.DateField(widget=forms.TextInput(attrs={'class':'datepicker'}), label='Date de naissance')
    sex = forms.ChoiceField(choices=(('M', 'Homme'), ('F', 'Femme')), label='Sexe')
    adresse = forms.CharField(max_length=300, label='Adresse')

    def clean(self):
        cleaned_data = self.cleaned_data
        username = cleaned_data.get('email')
        email = cleaned_data.get('email')
        confirm_email = cleaned_data.get('confirm_email')

        # Username is unique
        try:
            user_with_the_same_name = User.objects.get(username=username)
        except ObjectDoesNotExist:
            pass
        else:
            msg = 'Username already picked '  + username
            self._errors['email'] = self.error_class([msg])
            
        # Email matching
        if email != confirm_email:
            msg = 'Email dismatch'
            self._errors['confirm_email'] = self.error_class([msg])

        return cleaned_data

class RegistrationInvestisseurForm(RegistrationForm):
    #- Pourquoi voulez-vous etre mentor ?
    motivation = forms.CharField(max_length=200, label='Pourquoi voulez-vous etre mentor ?')
    # - Dans quel domaine pouvez-vous transmettre des competences ?
    domaine = forms.CharField(max_length=200, label='Dans quel domaine pouvez-vous transmettre des competences ?')
    # - Qui etes-vous ?
    description = forms.CharField(widget=forms.Textarea, label='Qui etes-vous ?')
    fields = ('first_name', 'last_name', 'birth_date', 'sex', 'adresse', 'motivation', 'domaine', 'description')

class RegistrationEntrepreuneurForm(RegistrationForm):
 # - Qui etes-vous ?
    company_name = forms.CharField(max_length=200, label='Qui etes-vous ?')
    #- Quel est votre projet ? (Court resume, env 4-5 lignes)
    description = forms.CharField(label='Quel est votre projet ? (Court resume, env 4-5 lignes)')
    # - Quel est le marche vise ?
    market = forms.CharField(max_length=200, label='Quel est le marche vise ?')
    # - Quel est le differentiateur ?
    # - Quel est le niveau d'avancement du projet ?
    progress = forms.IntegerField( label='Quel est le niveau d\'avancement du projet ?')
    # - Quel chiffre d'affaire visez-vous dans 3 ans ?
    turnover = forms.IntegerField( label='Quel chiffre d\'affaire visez-vous dans 3 ans ?')
    # - Qu'attendez-vous de la communaute Galile360 ?
    expectation = forms.CharField(label='Qu\'attendez-vous de la communaute Galile360 ?')
    # - Upload CV
    resume = forms.FileField(label='Votre CV')
    logo = forms.ImageField(label='Le logo de votre enreprise')
    creation_date = forms.DateField(widget=forms.TextInput(attrs={'class':'datepicker'}), label='Date de création de votre entreprise')

    fields = ('first_name', 'last_name', 'birth_date', 'sex', 'adresse', 'company_name', 'description',
              'market', 'progress', 'turnover', 'expectation', 'resume', 'logo', 'creation_date')
