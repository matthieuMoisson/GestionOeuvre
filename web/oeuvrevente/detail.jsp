<%--
  Created by IntelliJ IDEA.
  User: Gaetan
  Date: 25/02/2017
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Catalogue des oeuvres</title>
    <link rel="stylesheet" type="text/css" href="style/main.css">
    <%-- Bootstrap --%>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <script src="script/main.js"></script>
    <%-- Data tables --%>    <%-- Jquery --%>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
</head>

<body>

      <div class="container">
        <h1>Détail d'une oeuvre</h1>
          <div class="row well">
              <img id="artwork_image" src="http://www.celestialseasonings.com/sites/celestialseasonings.com/files/artwork/SleepytimeRoom.jpg" class="img-responsive" alt="Cinque Terre">
              <br>
              <ul>
                  <li><b>ID : </b>${oeuvrevente.idOeuvrevente}</li>
                  <li><b>Titre : </b>${oeuvrevente.titreOeuvrevente}</li>
                  <li><b>Etat : </b>${oeuvrevente.etatOeuvrevente}</li>
                  <li><b>Prix : </b>${oeuvrevente.prixOeuvrevente}</li>
                  <li><b>Propriétaire : </b>${oeuvrevente.proprietaire.nomComplet}</li>
              </ul>
          </div>
        </div>

    <%-- JS --%>
    <%-- Bootstrap --%>
    <script type="javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <%-- End JS --%>

    <script language="JavaScript">

        function random_image() {
            var images = [];


            images[1] = "http://www.celestialseasonings.com/sites/celestialseasonings.com/files/artwork/BengelSpice.jpg";
            images[2] = "http://www.celestialseasonings.com/sites/celestialseasonings.com/files/artwork/CandyCaneLane.jpg";
            images[3] = "http://www.celestialseasonings.com/sites/celestialseasonings.com/files/artwork/RedZinger.jpg";
            images[4] = "http://www.celestialseasonings.com/sites/celestialseasonings.com/files/artwork/MintMagic.jpg";
            images[5] = "http://www.celestialseasonings.com/sites/celestialseasonings.com/files/artwork/TensionTamer.jpg";
            images[6] = "http://www.celestialseasonings.com/sites/celestialseasonings.com/files/artwork/SleepytimeRoom.jpg";

            var ry = Math.floor(Math.random() * images.length)
            if (ry == 0) ry = 1;

            document.getElementById("artwork_image").src= images[ry] ;

        }

        random_image();
    </script>


</body>
</html>
