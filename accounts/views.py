# coding=utf8
# -*- coding: utf8 -*-

from httplib import HTTPResponse
from django.http import HttpResponseRedirect, HttpResponse, Http404
from django.contrib.auth.decorators import login_required
from django.contrib import auth
from django.contrib.auth.forms import UserCreationForm
from django.contrib import messages
from django.shortcuts import render

from forms import *
from models import *

from news.forms import *

def login(request):
        template = "login.tpl"
        success_msg = "Vous êtes maintenant connecté."
        fail_msg = "Email ou mot de passe non reconnu."
        
        if request.method == 'POST':
                form = LoginForm(request.POST)
                email = request.POST['email']
                password = request.POST['password']
                user = auth.authenticate(username=email, password=password)
                if user is not None:
                        auth.login(request, user)
                        messages.add_message(request, messages.INFO, success_msg)
                        url = request.GET.get('next', '/')
                        return HttpResponseRedirect(url)
                else:
                        messages.add_message(request, messages.ERROR, fail_msg)
                        return HttpResponseRedirect('/accounts/login/')
        else:
                form = LoginForm()
                return render(request, template, {'form': form,})

def logout(request):
        auth.logout(request)
        return HttpResponseRedirect("/")
        
def register(request, user_type):
        template = "registration.tpl"
        success_msg = "Bienvenue parmi nous."
        fail_msg = "Vous avez fait des erreurs en remplissant le formulaire."

        if  user_type == 'I':
            profile_class = Investisseur
            registration_form_class = RegistrationInvestisseurForm

        else:
            profile_class = Entrepreneur
            registration_form_class = RegistrationEntrepreuneurForm
        fields = registration_form_class.fields

        if request.method == 'POST':
                form = registration_form_class(request.POST, request.FILES)
                if form.is_valid():
                        user = User.objects.create_user(
                                form.cleaned_data['email'],
                                form.cleaned_data['email'],
                                form.cleaned_data['password']
                        )
                        user.save()
                        up = UserProfile(user=user)
                        up.save()

                        try:
                            # Fill in model fields
                            specific_profile = profile_class(profile=up)
                            for f in fields:
                                setattr(specific_profile, f, form.cleaned_data[f])
                            specific_profile.save()
                        except Exception as e :
                            up.delete()
                            user.delete()
                            raise
                        else:
                            user = auth.authenticate(username=form.cleaned_data['email'],
                                                password=form.cleaned_data['password'])
                            auth.login(request, user)
                            messages.info(request, success_msg)

                        return HttpResponseRedirect("/")
                else:
                    messages.error(request, fail_msg)
        else:
                form = registration_form_class()
                        
        return render(request, template, {
                'form': form,
        })

@login_required
def update_profile(request):
        template = "update_profile.tpl"

        if request.user.get_profile().get_type() == 'I':
                formClass = InvestisseurForm
                instance = request.user.get_profile().investisseur
        else:
                formClass = EntrepreneurForm
                instance = request.user.get_profile().entrepreneur

        if request.method == 'POST':
                form = formClass(request.POST, request.FILES, instance=instance)
                if form.is_valid():
                        form.save()
                        messages.info(request, "Profile edited ;) ")
                        return HttpResponseRedirect("/")
        else:
                form = formClass(instance=instance)

        post_form = PostForm()

        return render(request, template, {'form': form, 'post_form': post_form})

@login_required
def view_profile(request, user_id):
    profile = User.objects.get(id=user_id).get_profile()

    if profile.get_type() == 'I':
            template = "view_profile_investisseur.tpl"
            template_data = {'investisseur': profile.investisseur}

    else:
        template = "view_profile_entrepreneur.tpl"
        template_data = {'entrepreneur': profile.entrepreneur, 'post_form': PostForm()}

    return render(request, template, template_data)


# Ajax views

@login_required
def like(request, entrepreneur_id):
    if request.is_ajax():
        try:
            inv = request.user.get_profile().investisseur
        except:
            return HttpResponse("Vous n'avez pas les droits suffisants.")

        ent = Entrepreneur.objects.get(pk=entrepreneur_id)


        if inv in ent.likes.all():
            ent.likes.remove(inv)
            msg = "J'aime " + "(" + str(ent.likes.count()) + ")"
        else:
            ent.likes.add(inv)
            msg = "Je n'aime plus " + "(" + str(ent.likes.count()) + ")"
        return HttpResponse(msg)

    else:
        raise Http404

@login_required
def mentor(request, entrepreneur_id):
    if request.is_ajax():
        try:
            inv = request.user.get_profile().investisseur
        except:
            return HttpResponse("Vous n'avez pas les droits suffisants.")

        ent = Entrepreneur.objects.get(pk=entrepreneur_id)

        if inv in ent.mentors.all():
            ent.mentors.remove(inv)
            msg = "Je mentor " + "(" + str(ent.mentors.count()) + ")"
        else:
            ent.mentors.add(inv)
            msg = "Je ne mentor plus " + "(" + str(ent.mentors.count()) + ")"

        return HttpResponse(msg)
    else:
        raise Http404
