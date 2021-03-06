# Create your views here.
from django.shortcuts import get_object_or_404, render
from django.contrib.auth.decorators import login_required

from accounts.forms import *
from news.forms import *
from news.models import *

def index(request):
    registration_form = RegistrationForm()
    login_form = LoginForm()
    post_form = PostForm()
    news = Post.objects.all()

    return render(request, 'index.tpl', {
        'login_form': login_form,
        'registration_form': registration_form,
        'post_form': post_form,
        'news': news,
    })

@login_required
def about(request):
    template_name = 'about.tpl'
    return render(request, 'about.tpl')
