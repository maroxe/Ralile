{% extends "base.tpl" %}
{% load bootstrap_toolkit %}

{% block title %}Créer un compte{% endblock %}

{% block content %}
<div class="bloc">
    <h2>Inscription</h2>
    <form enctype="multipart/form-data" class="form-horizontal" action="" method="post">{% csrf_token %}
    {{ form|as_bootstrap  }}
    <input type="submit" class="btn btn-default btn-lg pull-right" value="S'enregistrer">
    <div class="clearfix"></div>
    </form>

</div>

{% endblock %}

