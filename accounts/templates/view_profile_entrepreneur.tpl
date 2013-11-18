{% extends "base.tpl" %}

{% block title %}Profile de   {{ entrepreneur.first_name }} {% endblock %}

{% block content %}
    {% if entrepreneur.logo %}
         <img style="float: left" height="100" width="100" src="/{{ entrepreneur.logo.url }}" />
    {% else %}
        logo: logo par défaut
    {% endif %}
    <h2>{{ entrepreneur.first_name }} </h1>
    <ul class="inline profile-options">
        <li><a href="mailto:{{ entrepreneur.profile.user.email }}">Message</a></li>
        <li><a href="{% url 'like' entrepreneur.pk %}" class="like"> J'aime ( {{ entrepreneur.likes.count }} ) </a></li>
        <li><a href="{%  url 'mentor' entrepreneur.pk %}" class="mentor"> Je Mentor ( {{ entrepreneur.mentors.count }} )</a></li>
    </ul>

    <div class="bloc profile-desc">
        Description:
        <ul>
            <li>Nom de l'entreprise: {{ entrepreneur.company_name }}</li>
            <li>Description: {{ entrepreneur.description  }} </li>
            <li>date de création: {{ entrepreneur.creation_date }}</li>
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
        {% endfor %}
        </ul>

    </p>
    <p>
    Liste Des gens qui mentorent le projet:
        <ul>
        {%  for inv in entrepreneur.mentors.all %}
            <li>{{ inv }}</li>
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

