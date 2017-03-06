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
    <title>Edition d'une oeuvre</title>
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
            $('#idOeuvrevente').val($(this).data('id'));
        });
    });
</script>

<div class="container">

    <p>
        <a class="btn btn-success" href="index.jsp" role="button">Retour Accueil</a>
    </p>
    <div class="container">
        <h1>Edition d'une oeuvre</h1>
        <form class="form-horizontal" name='identification' method="post" action="OeuvreventeController?action=add">
            <div class="form-group">
                <label class="control-label col-sm-2">Titre de l'oeuvre :</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="txttitre" id="txttitre" placeholder="Entrez le titre ..." value="${txttitre}" required>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2">Prix de l'oeuvre :</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" name="numberprix" id="numberprix" value="${numberprix}" required>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2">Proprietaire de l'oeuvre :</label>
                <div class="col-sm-10">
                    <select id="idProprietaire" name="idProprietaire">
                        <c:forEach items="${proprietaires}" var="proprietaire">
                            <option value="${proprietaire.idProprietaire}">${proprietaire.nomComplet}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-info pull pull-right">Modifier</button>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>
