
{% if user.is_authenticated %}

<div class="bloc">
<h2>News</h2>

<p>
voici la liste des derniers utilistateurs créés:<br/>
------------------------------------------------------------<br>
{% for inv in investisseurs %}
        <a href="/accounts/profile/{{inv.profile.user.id}}">Mr. inv  {{ inv.first_name }}</a> vient de s'enregistrer |  <a>J'aime</a><br/>
{% endfor %}
------------------------------------------------------------<br>
{% for ent in entrepreneurs %}
        <a href="/accounts/profile/{{ent.profile.user.id}}">Mr. ent {{ ent.first_name }}</a> vient de s'enregistrer |  <a>J'aime</a><br/>
{% endfor %}
</p>

</div>
<div class="bloc">
   Lorem ipsum dolor sit amet, consectetur adipiscing elit.
   Proin accumsan nisl quis nibh facilisis blandit. Curabitur aliquam
    arcu vel ullamcorper dignissim. Integer luctus orci pulvinar nibh
    consectetur rhoncus. Etiam iaculis ultrices erat, sit amet sodales
    orci ultrices eu. Aenean pulvinar convallis sapien, nec porta nisi
     malesuada sit amet. Interdum et malesuada fames ac ante ipsum primis in
      faucibus. Quisque facilisis odio ut faucibus adipiscing. Mauris mauris lacus
      , scelerisque eget turpis ut, auctor facilisis diam.
</div>



{% else %}

<div class="bloc">

<form action="{% url "login" %}" method="post">{% csrf_token %}

  {{ login_form.as_p }}

  <input type="submit" value="Login">

</form>

  
<div style="margin-top:30px;font-weight:bold;font-size:18px;color:#3f3f41;" align="center">     Creer un nouveau compte     </div>

<br /><br />

Je suis un <a href="/accounts/register/entrepreneur">Entrepreneur</a> | <a href="/accounts/register/investisseur">Investisseur</a> |

</div>

{% endif %}







