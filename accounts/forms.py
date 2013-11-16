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
        fields = ('first_name', 'logo', 'progress')


class InvestisseurForm(forms.ModelForm):
    class Meta:
        model = Investisseur
        fields = ('motivation', 'description')

class RegistrationForm(forms.Form):

    first_name = forms.CharField(max_length=250)
    last_name = forms.CharField(max_length=250)
    email = forms.CharField(max_length=250)
    confirm_email = forms.CharField(max_length=250)
    password = forms.CharField(max_length=250)

    birth_date = forms.DateField(widget=forms.TextInput(attrs={'class':'datepicker'}))
    sex = forms.ChoiceField(choices=(('M', 'Male'), ('F', 'Female')))
    adresse = forms.CharField(max_length=300)

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
    motivation = forms.CharField(max_length=200)
    # - Dans quel domaine pouvez-vous transmettre des competences ?
    domaine = forms.CharField(max_length=200)
    # - Qui etes-vous ?
    description = forms.CharField(widget=forms.Textarea)
    fields = ('first_name', 'last_name', 'birth_date', 'sex', 'adresse', 'motivation', 'domaine', 'description')

class RegistrationEntrepreuneurForm(RegistrationForm):
 # - Qui etes-vous ?
    company_name = forms.CharField(max_length=200)
    #- Quel est votre projet ? (Court resume, env 4-5 lignes)
    description = forms.CharField()
    # - Quel est le marche vise ?
    market = forms.CharField(max_length=200)
    # - Quel est le differentiateur ?
    # - Quel est le niveau d'avancement du projet ?
    progress = forms.IntegerField()
    # - Quel chiffre d'affaire visez-vous dans 3 ans ?
    turnover = forms.IntegerField()
    # - Qu'attendez-vous de la communaute Galile360 ?
    expectation = forms.CharField()
    # - Upload CV
    resume = forms.FileField()
    logo = forms.ImageField()
    creation_date = forms.DateField(widget=forms.TextInput(attrs={'class':'datepicker'}))

    fields = ('first_name', 'last_name', 'birth_date', 'sex', 'adresse', 'company_name', 'description',
              'market', 'progress', 'turnover', 'expectation', 'resume', 'logo', 'creation_date')
