# coding=utf8
# -*- coding: utf8 -*-

from django.http import HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from django.shortcuts import render,  get_object_or_404
from django.contrib import messages

from models import *
from forms import *

@login_required
def new_post(request):
    template = 'new_post.tpl'
    success_msg = 'News ajoutée avec succès.'

    if request.method == "POST":
        post = Post(user=request.user)
        form = PostForm(request.POST, instance=post)

        if form.is_valid():
            form.save()
            messages.info(request, success_msg)
            return HttpResponseRedirect("/")
    else:
        form = PostForm()
    return render(request, template)

@login_required
def edit_post(request, post_id):
    template = 'edit_post.tpl'
    success_msg = 'entry edited'

    post = get_object_or_404(Post, pk=post_id)

    if request.method == "POST":
        form = PostForm(request.POST, instance=post)
        if form.is_valid():
            form.save()
            messages.info(request, success_msg)
            return HttpResponseRedirect("/")
    else:
        form = PostForm(instance=post)

    return render(request, template)