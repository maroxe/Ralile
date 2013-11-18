from django import forms

import models

class PostForm(forms.ModelForm):
    class Meta:
        model = models.Post
        exclude = ('user', 'date')
