<!DOCTYPE html>
<html>
    <head>
        <title>Accueil</title>
        <script src="{{ STATIC_URL}}js/jquery-1.10.2.min.js"></script>

        <link rel="stylesheet" type="text/css" media="screen" href="{{ STATIC_URL }}css/index-style.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="start" title="Accueil" href="index.php"/>
    </head>

    <body>

    <div id="logo">
        <div id="description">
            LINE UP EXPLICATIF DU SITE, PHRASE DʼACCROCHE LINE UP EXPLICATIF DU SITE,
            PHRASE DʼACCROCHE.
        </div>
        <img src="{{ STATIC_URL }}img/logo.jpg" />
    </div>

    <div id="corps">
        <div class="block">
            <div class="shadow">
            <h1>Déjà inscrit?</h1>
            </div>
            <div class="shadow2">
            <form action="{% url "login" %}" method="post">{% csrf_token %}
                First name: <input type="text" name="firstname"><br>
                Last name: <input type="text" name="lastname">
                <input type="submit" value="Login">
            </form>
            </div>
        </div>
        <div class="block">bla bla</div>

    </div>


    </body>

</html>
