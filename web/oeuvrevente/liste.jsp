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

        <h1>Catalogue des oeuvres</h1>

        <div class="flashMessages">${flashMessages}</div>

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
                            <a href="#reservationModal" data-toggle="modal" data-id="${oeuvrevente.idOeuvrevente}" class="btn btn-info" role="button">Réserver</a>
                            <a href="#" class="btn btn-info" role="button">Modifier</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="container">
        <!-- Modal -->
        <div class="modal fade" id="reservationModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Réservation d'une oeuvre destinée à la vente</h4>
                    </div>
                    <div class="modal-body">
                        <form action="OeuvreventeController?action=liste" method="post">
                            <input type="hidden" id="idOeuvrevente" name="idOeuvrevente" value=""/>
                            <select id="idAdherent" name="idAdherent">
                                <c:forEach items="${adherents}" var="adherent">
                                    <option value="${adherent.idAdherent}">${adherent.nomComplet}</option>
                                </c:forEach>
                            </select>
                            <input type="submit" value="Réserver">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                    </div>
                </div>

            </div>
        </div>

    </div>

</body>
</html>
