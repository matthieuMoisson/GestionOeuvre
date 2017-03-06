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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>Catalogue des oeuvres</title>
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

        <h1>
            Catalogue des oeuvres
            <br>
            <a class="btn btn-info" href="OeuvreventeController?action=add">
                <span class="glyphicon glyphicon-plus"></span> Ajout d'une nouvelle Oeuvre
            </a>
        </h1>
        <div class="flashMessages">${flashMessages}</div>

        <table id="tableOeuvres">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Titre</th>
                    <th>Etat</th>
                    <th>Prix</th>
                    <th>Propriétaire</th>
                    <th>Actions</th>
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
                            <a href="#reservationModal" data-toggle="modal" data-id="${oeuvrevente.idOeuvrevente}"
                               class="btn btn-info" role="button"><span class="glyphicon glyphicon-shopping-cart"></span></a>
                            <a href="OeuvreventeController?action=detail&id=${oeuvrevente.idOeuvrevente}"
                               class="btn btn-warning" role="button"><span class="glyphicon glyphicon-eye-open"></span></a>
                            <a href="OeuvreventeController?action=editer&idOeuvrevente=${oeuvrevente.idOeuvrevente}"
                               class="btn btn-success" role="button"><span class="glyphicon glyphicon-pencil"></span></a>
                            <a href="OeuvreventeController?action=delete&id=${oeuvrevente.idOeuvrevente}"
                               class="btn btn-danger" role="button"><span class="glyphicon glyphicon-remove"></span></a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="container">
        <!-- Modal -->
        <div class="modal fade" id="reservationModal" role="dialog">
            <form class="form-horizontal" action="OeuvreventeController?action=liste" method="post">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Réservation d'une oeuvre destinée à la vente</h4>
                    </div>
                    <div class="modal-body container">
                            <input type="hidden" id="idOeuvrevente" name="idOeuvrevente" value=""/>
                            <div class="form-group">
                                <label class="col-sm-2" for="idAdherent">Sélectionner l'adhérent</label>
                                <div class="col-sm-10">
                                    <select id="idAdherent" name="idAdherent">
                                        <c:forEach items="${adherents}" var="adherent">
                                            <option value="${adherent.idAdherent}">${adherent.nomComplet}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Annuler</button>
                        <input type="submit" class="btn btn-info" value="Réserver">
                    </div>
                </div>
            </div>
            </form>
        </div>

    </div>

</body>
</html>
