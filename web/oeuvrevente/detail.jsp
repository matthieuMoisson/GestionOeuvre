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

        <p>
            <a class="btn btn-success" href="index.jsp" role="button">Retour Accueil</a>
        </p>

        <h1>Détail d'une oeuvre</h1>
            <p>ID : ${oeuvrevente.idOeuvrevente}</p>
            <p>Titre : ${oeuvrevente.titreOeuvrevente}</p>
            <p>Etat : ${oeuvrevente.etatOeuvrevente}</p>
            <p>Prix : ${oeuvrevente.prixOeuvrevente}</p>
            <p>Propriétaire : ${oeuvrevente.proprietaire.nomComplet}</p>
        </div>

    <%-- JS --%>
    <%-- Bootstrap --%>
    <script type="javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <%-- End JS --%>
</body>
</html>
