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

        <h1>Catalogue des oeuvres en prêt</h1>

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
                    <td>${oeuvrepret.titreOeuvrevente}</td>
                    <td>${oeuvrepret.proprietaire.nomComplet}</td>
                    <!-- Modifier button -->
                    <td>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
