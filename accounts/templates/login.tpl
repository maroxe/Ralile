{% extends "index.tpl" %}

{% block title %}Connexion{% endblock %}

{% block content %}
  <h1>Login</h1>
<div class="bloc">
  <form action="" method="post">{% csrf_token %}
      {{ form.as_p }}
      <input type="submit" value="Login">
  </form>
  
{% endblock %}
