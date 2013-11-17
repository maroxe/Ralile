{% extends "base.tpl" %}
{% load bootstrap_toolkit %}

{% block title %}Créer un compte{% endblock %}

{% block content %}
<div class="bloc">

  <form enctype="multipart/form-data" class="form-horizontal " action="" method="post">{% csrf_token %}
      {{ form|as_bootstrap  }}
      <input type="submit" value="S'enregistrer">
  </form>

</div>

{% endblock %}

