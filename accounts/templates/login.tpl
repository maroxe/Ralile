{% extends "base.tpl" %}
{% load bootstrap_toolkit %}

{% block title %}Connexion{% endblock %}

{% block content %}
<div class="bloc">
    <b>Vous  devez vous connecter pour visualiser cette page.
        Si vous n'avez pas de compte, rendez-vous à <a href="{% url 'home' %}">la page d'accueil</a> pour créer un compte.</b>
   <h2>Connexion</h2>
  <form enctype="multipart/form-data" class="form-horizontal well" action="" method="post">{% csrf_token %}
      {{ form|as_bootstrap  }}
      <input type="submit" class="btn btn-default btn-lg pull-right" value="Se connecter">
      <div class="clearfix"></div>
  </form>

</div>

{% endblock %}

