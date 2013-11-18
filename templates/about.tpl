{% extends "base.tpl" %}
{% load webdesign %}
{% block title %}A propos de Galilé{% endblock %}

{% block content %}

<div class="bloc">

    <h1>Notre concept: </h1>
    <h3>Nous croyons en: </h3>
    {% lorem 2 p random %}
</div>

<div class="bloc">
    <h1>News du projet</h1>
    {% lorem 2 p random %}
</div>

<script>
$( ".container" ).css( "background-color", "#861138" );

</script>

{% endblock %}

