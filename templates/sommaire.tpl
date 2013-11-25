{% if user.is_authenticated %}

{% if user.is_staff %}<div class="element_sommaire"><a style="color: red" href="/admin">&#9658; Admin</a></div> {% endif %}

<div class="element_sommaire"> <a href={% url "update_profile" %} >&#9658; Mon profil</a></div>
( {{ user.username }} | <a href="{% url 'logout' %}">se déconnecter</a> )


{% if user.get_profile.is_investisseur %}
    <div class="element_sommaire">&#9658; Entreprise qui pourrait vous intéresser:</div><br>
    <div class="text-center">
    {% if entrepreneurs %}
        {% with entrepreneurs|random as ent %}  <a href="{{ ent.get_absolute_url }}"> <img height="100" width="100" src="/{{ ent.logo.url }}" /></a> {% endwith %}
    {% else %}
        Aucun entrepreneur n'est actuellement enregistré.
    {% endif %}
    </div>
{% else %}
{% endif %}

<div class="element_sommaire">&#9658; INVESTISSEURS
<br>
<ul>
{% for inv in investisseurs %}
        <li><a class="element_sommaire" href="/accounts/profile/{{inv.profile.user.id}}" >{{ inv.first_name }}</a><br></li>
{% endfor %}
</ul>
</div>


<div class="element_sommaire">&#9658; Entrepreneur
<br>
<ul>

{% for ent in entrepreneurs %}
        <li><a class="element_sommaire" href="/accounts/profile/{{ent.profile.user.id}}">{{ ent.first_name }}</a> <br/></li>
{% endfor %}
</ul>
</div>
{% else %}
    <p>« J’ai rapidement constaté, sur le terrain, le potentiel de création d’entreprises ainsi que l’existence de
    nombreuses entreprises qui connaissaient un avenir incertain. Et pourtant, l’envie des jeunes est bien là mais
    les difficultés sont aussi réelles : formation incomplète, obstacles administratifs, financement, etc.
    J’ai donc voulu proposer à tous les jeunes créateurs motivés un appui véritable, un engagement humain,
    de long terme, aux côtés  d’entrepreneurs aguerris et désireux de partager leurs savoirs et leur expérience. »
     Mot d’Éric Michoux.
{%  endif %}


