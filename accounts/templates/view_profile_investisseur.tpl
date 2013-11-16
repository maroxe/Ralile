{% extends "base.tpl" %}

{% block title %} {{ investisseur.first_name }} {{ investisseur.last_name }}{% endblock %}

{% block content %}
<div class="bloc">
    <h1>{{ investisseur.first_name }} {{ investisseur.last_name }} </h1>
    <p>
    {% if investisseur.logo %}
        logo: <img height="100" src="/{{ investisseur.logo.url }}" />
    {% else %}
        logo: logo par défaut
    {% endif %}
    </p>
    <p>
    Description:
    <ul>
        <li>motivation: {{ investisseur.motivation }}</li>
        <li>domaine: {{ investisseur.domaine }}</li>
        <li>description: {{ investisseur.description }}</li>
    </p>
</div>
{% endblock %}

