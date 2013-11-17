<!DOCTYPE html>
<html>

    <head>
        <title>{% block title %}Accueil{% endblock %}</title>
        <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        <script src="{{ STATIC_URL }}bootstrap/js/bootstrap.js"></script>
        <script src="{{ STATIC_URL }}js/datewidget.js"></script>

        <link rel="stylesheet" type="text/css" media="screen" href="{{ STATIC_URL }}bootstrap/css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="{{ STATIC_URL }}css/style2.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="{{ STATIC_URL }}css/bootstrap-hack.css" />


        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="start" title="Accueil" href="index.php"/>
        {{ form.media }}
    </head>

    <body>
    <div class="container">
        {% include "entete.tpl" %}
        <div class="row-fluid">
            <div class="span3" id="sommaire">{% include "sommaire.tpl" %}</div>
            <div class="span9" id="corps">{% block content %}{% include "corps.tpl" %}{% endblock content %}</div>
        </div>
        <div class="row-fluid" id="pied">
            {% include "pied.tpl" %}
        </div>
    </div>



  </body>
</html>

