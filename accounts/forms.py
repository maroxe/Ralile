from django import forms
from django.contrib.auth.models import User
from django.core.exceptions import ObjectDoesNotExist

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

class InvestisseurForm(forms.ModelForm):
    class Meta:
        model = Investisseur
        
class RegistrationForm(forms.Form):
    first_name = forms.CharField(max_length=250)
    last_name = forms.CharField(max_length=250)
    email = forms.CharField(max_length=250)
    confirm_email = forms.CharField(max_length=250)
    password = forms.CharField(max_length=250)

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
