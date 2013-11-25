{% extends "base.tpl" %}

{% block title %} {{ investisseur.first_name }} {{ investisseur.last_name }}{% endblock %}

{% block content %}

<div class="bloc">
    <h1>{{ investisseur.first_name }} {{ investisseur.last_name }} </h1>

    <p>
    Informations Personnelles:
    <ul>
        <li>Motivation: {{ investisseur.motivation }}</li>
        <li>Domaine: {{ investisseur.domaine }}</li>
        <li>Description: {{ investisseur.description }}</li>
    </ul>
    </p>
</div>
{% endblock %}

