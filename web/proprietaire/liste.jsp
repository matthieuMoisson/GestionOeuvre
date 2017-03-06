<%--
  Created by IntelliJ IDEA.
  User: seljo
  Date: 20/02/2017
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Affichage de tous les adhérents</title>
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
        $('#tablePropriétaires').DataTable({
            language: fr_language
        });
    });
</script>
<p>
    <a class="btn btn-success" href="index.jsp" role="button">Retour Accueil</a>
</p>

<div class="container">
    <h1>Tableau des Propriétaires ! <a class="btn btn-success" href="ProprietaireController?action=add" role="button">Ajouter un propriétaire</a></h1>
    <div class="flashMessages">${flashMessages}</div>
    <table id="tablePropriétaires">
        <thead>
        <th>Numero</th>
        <th>Nom</th>
        <th>Prénom</th>
        <th>Actions</th>

        </thead>

        <c:forEach items="${owners}" var="item">
            <tr>
                <td>${item.idProprietaire}</td>
                <td>${item.nomProprietaire}</td>
                <td>${item.prenomProprietaire}</td>
                <!-- Modifier button -->
                <td>
                    <a href="ProprietaireController?action=edit&idProprietaire=${item.idProprietaire}"
                       class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span></a>
                    <a href="ProprietaireController?action=delete&idProprietaire=${item.idProprietaire}"
                       class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span></a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
