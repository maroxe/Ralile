{% extends "base.tpl" %}
{% load bootstrap_toolkit %}

{% block title %}Connexion{% endblock %}

{% block content %}
<div class="bloc">
   <h1>Connexion</h1>
  <form enctype="multipart/form-data" class="form-horizontal" action="" method="post">{% csrf_token %}
      {{ form|as_bootstrap  }}
      <input type="submit" class="btn btn-default btn-lg pull-right" value="Se connecter">
      <div class="clearfix"></div>
  </form>

</div>

{% endblock %}

