<%--
  Created by IntelliJ IDEA.
  User: Matthieu
  Date: 25/02/2017
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>Catalogue des oeuvres prêt</title>
    <link rel="stylesheet" type="text/css" href="style/main.css">
    <script src="script/main.js"></script>

    <%-- Bootstrap & JQuery --%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <%-- Data tables --%>
    <link href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css" rel="stylesheet">
    <script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>

</head>

<body>

    <script>
        $(document).ready(function () {
            $('#tableOeuvres').DataTable({
                language: fr_language
            });

            $('a[data-toggle=modal], button[data-toggle=modal]').click(function () {
                $('#idOeuvrepret').val($(this).data('id'));
            });
        });
    </script>

    <div class="container">

        <p>
            <a class="btn btn-success" href="index.jsp" role="button">Retour Accueil</a>
        </p>

        <h1>
            Catalogue des oeuvres en prêt
            <br>
            <a class="btn btn-info" href="OeuvrepretController?action=add">
                <span class="glyphicon glyphicon-plus"></span> Ajout d'une nouvelle Oeuvre
            </a>
        </h1>

        <div class="flashMessages">${flashMessages}</div>

        <table id="tableOeuvres">
            <thead>
            <tr>
                <th>Titre oeuvre</th>
                <th>Propriétaire</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${oeuvreprets}" var="oeuvrepret">
                <tr>
                    <td>${oeuvrepret.titreOeuvrepret}</td>
                    <td>${oeuvrepret.proprietaire.nomComplet}</td>
                    <td>
                        <a href="OeuvrepretController?action=detail&idOeuvrepret=${oeuvrepret.idOeuvrepret}"
                           class="btn btn-warning" role="button"><span class="glyphicon glyphicon-eye-open"></span></a>
                        <a href="OeuvrepretController?action=editer&idOeuvrepret=${oeuvrepret.idOeuvrepret}"
                           class="btn btn-success" role="button"><span class="glyphicon glyphicon-pencil"></span></a>
                        <a href="OeuvrepretController?action=delete&idOeuvrepret=${oeuvrepret.idOeuvrepret}"
                           class="btn btn-danger" role="button"><span class="glyphicon glyphicon-remove"></span></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
