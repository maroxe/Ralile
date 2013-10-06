{% extends "index.tpl" %}

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
        <li>secteur: {{ investisseur.secteur }}</li>
        <li>bref résumé du projet: {{ investisseur.resume }}</li>
        <li>date de création: {{ investisseur.date_creation }}</li>
    </p>
</div>
{% endblock %}

