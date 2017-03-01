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
    <link href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css" rel="stylesheet">
    <script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
</head>

<body>

    <script>
        $(document).ready(function () {
            $('#tableOeuvres').DataTable({
                language: fr_language
            });
        });
    </script>

    <div class="container">

        <p>
            <a class="btn btn-success" href="index.jsp" role="button">Retour Accueil</a>
        </p>

        <h1>Catalogue des oeuvres</h1>
        <table id="tableOeuvres">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Titre</th>
                    <th>Etat</th>
                    <th>Prix</th>
                    <th>Propriétaire</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${oeuvreventes}" var="oeuvrevente">
                    <tr>
                        <td>${oeuvrevente.idOeuvrevente}</td>
                        <td>${oeuvrevente.titreOeuvrevente}</td>
                        <td>${oeuvrevente.etatOeuvrevente}</td>
                        <td>${oeuvrevente.prixOeuvrevente}</td>
                        <td>${oeuvrevente.proprietaire.nomComplet}</td>
                        <!-- Modifier button -->
                        <td>
                            <a href="OeuvreventeController?action=detail&id=${oeuvrevente.idOeuvrevente}" class="btn btn-info" role="button">Consulter</a>
                            <a href="#" class="btn btn-info" role="button">Réserver</a>
                            <a href="#" class="btn btn-info" role="button">Modifier</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <%-- JS --%>
    <%-- Bootstrap --%>
    <script type="javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <%-- End JS --%>
</body>
</html>
