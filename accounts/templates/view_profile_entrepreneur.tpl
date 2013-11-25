{% extends "base.tpl" %}

{% block title %}Profile de   {{ entrepreneur.first_name }} {% endblock %}

{% block content %}
    {% if entrepreneur.logo %}
         <img style="float: left" height="100" width="100" src="/{{ entrepreneur.logo.url }}" />
    {% else %}
        logo: logo par défaut
    {% endif %}
    <h2>{{ entrepreneur }} </h1>
    <ul class="inline profile-options">
        <li><a href="mailto:{{ entrepreneur.profile.user.email }}">Message</a></li>
        {% if user.get_profile.is_investisseur %}
        <li><a href="{% url 'like' entrepreneur.pk %}" class="like">
            {% if user.get_profile.investisseur in entrepreneur.likes.all %}Je n'aime plus{% else %}J'aime{% endif %}
            ({{ entrepreneur.likes.count }}) </a></li>
        <li><a href="{%  url 'mentor' entrepreneur.pk %}" class="mentor">
            {% if user.get_profile.investisseur in entrepreneur.mentors.all %}Je ne mentor plus{% else %}Je mentor{% endif %}
            ({{ entrepreneur.mentors.count }})</a></li>
        {% endif %}
    </ul>

    <div class="bloc profile-desc">
    <p>{{ entrepreneur.presentation }}</p>
        <b>Informations supplémentaires:</b>
        <ul>
            <li>Nom de l'entreprise: {{ entrepreneur.company_name }}, créée le {{ entrepreneur.creation_date }}.</li>
            <li>Description: {{ entrepreneur.description  }} </li>
            <li>Marché visé: {{ entrepreneur.market }}</li>
            <li>Chiffre d'affaire visé: {{ entrepreneur.turnover }} €</li>
            <li>Ce que j'attends de la communauté de Galilé360: {{ entrepreneur.expectation }}</li>
        </ul>


    </div>

<div class="bloc">
    <h2>Dernieres news:</h2>
    {% for news in  entrepreneur.get_news %}
        <h3>{{ news.title }}</h3>
        <p>{{ news.body }}</p>
    {% endfor %}
</div>
<div class="bloc">
    <p>
    Liste Des gens qui aiment le projet:
        <ul>
        {%  for inv in entrepreneur.likes.all %}
            <li>{{ inv }}</li>
        {% empty %}
            <li>Personne pour l'instant.</li>
        {% endfor %}
        </ul>

    </p>
    <p>
    Liste Des gens qui mentorent le projet:
        <ul>
        {%  for inv in entrepreneur.mentors.all %}
            <li>{{ inv }}</li>
        {% empty %}
            <li>Personne pour l'instant.</li>
        {% endfor %}
        </ul>

    </p>

</div>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>

<script>
$(function() {
    $( ".like" ).click(function( event ) {
        event.preventDefault();
        $.ajax({
        type: "GET",
        url: $(this).attr('href'),
        data: {},
        success: function(data) {
            $(".like").text(data);
        },
        error: function(xhr, textStatus, errorThrown) {
            alert("Please report this error: "+errorThrown+xhr.status+xhr.responseText);
        }
        });
    });


    $( ".mentor" ).click(function( event ) {
        event.preventDefault();
        $.ajax({
        type: "GET",
        url: $(this).attr('href'),
        data: {},
        success: function(data) {
            $(".mentor").text(data);
        },
        error: function(xhr, textStatus, errorThrown) {
            alert("Please report this error: "+errorThrown+xhr.status+xhr.responseText);
        }
        });
    });
});</script>
{% endblock %}

