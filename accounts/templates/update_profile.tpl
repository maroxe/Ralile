{% extends "base.tpl" %}

{% block title %}Update my profile{% endblock %}

{% block content %}
<div class="bloc">
  <h1>Editer profile</h1>

    <form method="POST" enctype="multipart/form-data" "action" >
      {% csrf_token %}
          {{ form.as_p }}
          <input type="submit" value="Editer">
    </form>
</div>

<div class="bloc">

<h1>Ajouter une news</h1>
<form method="POST" action="{%  url 'new_post' %}" >
    {% csrf_token %}
      {{ post_form.as_p }}
      <input type="submit" value="Poster">
    </form>

</div>
{% endblock %}

