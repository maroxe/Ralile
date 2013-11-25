{%  load bootstrap_toolkit %}
<!DOCTYPE html>
<html>
    <head>
        <title>Accueil</title>
        <script src="{{ STATIC_URL}}js/jquery-1.10.2.min.js"></script>

        <link rel="stylesheet" type="text/css" media="screen" href="{{ STATIC_URL }}bootstrap/css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="{{ STATIC_URL }}css/guest-style.css" />

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="start" title="Accueil" href="index.php"/>
    </head>

    <body>

    <div class="container">

        <div class="page-header">
            <div class="row-fluid">
                <div class="span4">
                    <img src="{{ STATIC_URL }}img/logo.jpg" />
                </div>
                <div id="description" class="span4 offset4">
                    LINE UP EXPLICATIF DU SITE, PHRASE DʼACCROCHE LINE UP EXPLICATIF DU SITE,
                    PHRASE DʼACCROCHE.
                </div>
            </div>
        </div>

        {% block content %}
        <div class="row-fluid">

           <div id="form" class="span6 offset3">
               <h2>Déjà inscrit?</h2>

                <form action="{% url "login" %}" method="post" class="form-horizontal well" role="form" >{% csrf_token %}
                    {{  login_form | as_bootstrap }}
                    <div class="offset8"><input class="btn" type="submit" value="Login"></div>
                </form>
            </div>
        </div>


         <div class="row-fluid" id="inscription">
            <div class="span3 offset2">
                <div class="well">
                    <h3>Je suis Entrepreneur</h3>
                    <p>Donec sed odio dui. Cras justortor mauris condimentum nibh, ut fermentum massa.</p>
                </div>
                <div class="span8 offset1"><a class="btn btn-block btn-success" href="{% url 'register-entrepreneur' %}">S'inscrire &raquo;</a></div>
            </div>

            <div class="span3 offset2">
                <div class="well">
                    <h3>Je suis Investisseur</h3>
                    <p>Donec sed odio dui. Cras justortor mauris condimentum nibh, ut fermentum massa.</p>
                </div>
                <div class="span8 offset1"><a class="btn  btn-block btn-success" href="{% url 'register-investisseur' %}">S'inscrire &raquo;</a></div>
            </div>

         </div>
        {% endblock content %}
    </div>

    </body>

</html>
