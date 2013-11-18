<a class="element_sommaire" href={% url "update_profile" %} >&#9658; Mon profil</a><br/>
( {{ user.username }} | <a href="{% url 'logout' %}">se déconnecter</a> )
<div class="element_sommaire">&#9658; INVESTISSEURS
<br>
{% for inv in investisseurs %}
        <a class="element_sommaire" href="/accounts/profile/{{inv.profile.user.id}}" >{{ inv.first_name }}</a><br>
{% endfor %}
</div>

<div class="element_sommaire">&#9658; Entrepreneur
<br>
{% for ent in entrepreneurs %}
        <a class="element_sommaire" href="/accounts/profile/{{ent.profile.user.id}}">{{ ent.first_name }}</a> <br/>
{% endfor %}
</div>



