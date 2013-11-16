<!DOCTYPE html>
<html>

    <head>
        <title>Accueil</title>
        <!--<script src="{{ STATIC_URL}}js/jquery-1.10.2.min.js"></script> -->
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        <script src="{{ STATIC_URL }}bootstrap/js/bootstrap.js"></script>
        <script src="{{ STATIC_URL }}js/datewidget.js"></script>

        <link rel="stylesheet" type="text/css" media="screen" href="{{ STATIC_URL }}bootstrap/css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="{{ STATIC_URL }}css/style.css" />

        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link rel="start" title="Accueil" href="index.php"/>
        {{ form.media }}
    </head>

  <body>
    <div id="document" class="broke-endless-pages">
      <div id="bloc">
	<div id="entete">
	  {%include "entete.tpl" %}
	  {% if user.is_authenticated %}
	  Welcome {{ user.username }}, <a href="{% url 'logout' %}">Deconnexion</a>
	  {% endif %}
	</div>

	<div id="sommaire">
	  {%include "sommaire.tpl" %}
	</div>


	{% if messages %}
	  <ul id="messages">
	    {% for message in messages %}
	    <li{% if message.tags %} class="{{ message.tags }}"{% endif %}>{{ message }}</li>
	    {% endfor %}
	  </ul>
	  {% endif %}

	<div id="corps">
	  {% block content %}
	  {%include "corps.tpl" %}
	  {% endblock content %}
	</div>

	<div id="pied">
	  {%include "pied.tpl" %}
	</div>

      </div>
    </div>

  </body>

</html>
