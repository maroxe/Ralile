{% load bootstrap_toolkit %}

<div class="bloc">
<h2>Fil d'actualité</h2>

<div class="container-fluid">
<div class="span6">

<ul>
{% for inv in investisseurs %}
    <li><a href="{{ inv.get_absolute_url }}"> {{ inv.last_name }} {{ inv.first_name }}</a>
    vient de s'enregistrer en tant qu'investisseur.<br/></li>
{% empty %}
    <b>Aucun investisseur n'est enregistré pour l'instant.</b>
{% endfor %}
</ul>
</div>
<div class="span6">
<ul>

{% for ent in entrepreneurs|dictsort:"registration_date" %}
    <li><a href="{{ ent.get_absolute_url }}">{{ ent.last_name }} {{ ent.first_name }}</a>
    vient de s'enregistrer en tant qu'entrepreneur.<br/></li>
{% empty %}
    <b>Aucun entrepreneur n'est enregistré pour l'instant.</b>
{% endfor %}
</ul>

</div>
</div>

</div>
<div class="bloc">
    <h2>Les dernières news</h2>
    {% for post in news|dictsortreversed:"date" %}

     <blockquote class="post">

        <h3>{{ post.title }}</h3>
        <p>
        {{ post.body }}{{ post.body }}{{ post.body }}
        </p>
        <small class="pull-right"><a href="{% url 'view_profile' post.user.pk%}">{{ post.user.get_profile }}</a> , le {{ post.date }}</small>
     </blockquote>

    {% endfor %}
</div>

<div class="bloc">
    <h2>Poster une news</h2>
    <form method="POST" class="form-horizontal well" action="{%  url 'new_post' %}" >
        {% csrf_token %}
         {{ post_form |as_bootstrap  }}
        <input class="btn btn-default btn-lg pull-right" type="submit" value="Poster">
        <div class="clearfix"></div>
    </form>
</div>







