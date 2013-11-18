from datetime import datetime
from django.db import models
from django.contrib.auth.models import User

class Post(models.Model):
    user = models.ForeignKey(User)
    title = models.CharField(max_length=250, verbose_name='titre')
    body = models.TextField(verbose_name='message')
    date = models.DateTimeField(default=datetime.now)

    def __unicode__(self):
        return "Post de " + self.user.email + " - " + self.title


