{% extends "base.tpl" %}

{% block title %}Create an account{% endblock %}

{% block content %}
<div class="bloc">
  <h1>un nouveau compte</h1>

  <form enctype="multipart/form-data" action="" method="post">{% csrf_token %}
      {{ form.as_p }}
      <input type="submit" value="S'enregistrer">
  </form>
</div>
{% endblock %}

