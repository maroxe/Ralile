{% extends "base.tpl" %}
{% load bootstrap_toolkit %}

{% block title %}Editer mon profile{% endblock %}

{% block content %}
<div class="bloc">
  <h1>Editer profile</h1>

    <form method="POST" class="form-horizontal well" enctype="multipart/form-data" "action" >
      {% csrf_token %}
          {{ form|as_bootstrap }}
          <input type="submit" value="Editer">
    </form>
</div>


{% endblock %}

