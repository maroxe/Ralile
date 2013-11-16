{% extends "base.tpl" %}

{% block title %}Profile de {{ entrepreneur.first_name }} {% endblock %}

{% block content %}
<script>
$( document ).ready(function() {

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

<div class="bloc">
{{ entrepreneur.id }}
    <h1>Profile de  {{ entrepreneur.first_name }} </h1>
    <a href="mailto:{{ entrepreneur.profile.user.email }}"><img src="{{ STATIC_URL }}img/mail.jpg" /></a> |
    <a href="{% url 'like' entrepreneur.pk %}" class="like"> J'aime ( {{ entrepreneur.likes.count }} ) </a> |
    <a href="{%  url 'mentor' entrepreneur.pk %}" class="mentor"> Je Mentor </a>

    <p>
    {% if entrepreneur.logo %}
        logo: <img src="/{{ entrepreneur.logo.url }}" />
    {% else %}
        logo: logo par défaut
    {% endif %}
    </p>
</div>
<div class="bloc">
    {%  if entrepreneur.get_user_pk == user.pk  %}
        <form method="POST" action="{%  url 'new_post' %}" >
            {% csrf_token %}
              {{ post_form.as_p }}
              <input type="submit" value="Poster">
        </form>
    {% endif %}
    Dernieres news:
    {% for news in  entrepreneur.get_news %}
        {{ news }}<br>
    {% endfor %}

    <p>
    Liste Des gens qui aiment le projet:


        <ul>
        {%  for inv in entrepreneur.likes.all %}
            <li>{{ inv }}</li>
        {% endfor %}
        </ul>

    </p>
    <p>
    Liste Des gens qui mentorenet le projet:

        <ul>
        {%  for inv in entrepreneur.mentors.all %}
            <li>{{ inv }}</li>
        {% endfor %}
        </ul>

    </p>
    <p>
    Description:
    <ul>
        <li>secteur: {{ entrepreneur.secteur }}</li>
        <li>CV: <a href="/{{ entrepreneur.resume.url }}">ICI</a></li>
        <li>date de création: {{ entrepreneur.date_creation }}</li>
    </p>
</div>
{% endblock %}

