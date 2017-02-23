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
    <link href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<script>
    $(document).ready(function () {
        $('#tablePropriétaires').DataTable();
    });
</script>
<p>
    <a class="btn btn-success" href="index.jsp" role="button">Retour Accueil</a>
</p>

<h2>Tableau des Propriétaires ! <a class="btn btn-success" href="OwnerController?action=gotoAddOwners" role="button">Ajouter un propriétaire</a></h2>
<table id="tablePropriétaires">
    <thead>
    <th>Numero</th>
    <th>Nom</th>
    <th>Prénom</th>

    </thead>

    <c:forEach items="${owners}" var="item">
        <tr>
            <td>${item.idProprietaire}</td>
            <td>${item.nomProprietaire}</td>
            <td>${item.prenomProprietaire}</td>
            <!-- Modifier button -->
            <td>
                <form  name='identification' method="post" action="OwnerController?action=getOwner" onsubmit="">
                    <INPUT type="hidden" name="txtidOwner" id ="idAdherent" value="${item.idProprietaire}" >
                    <INPUT type="submit" class="btn btn-info"  value="Modifier" >
                </form>
            </td>
            <!-- Delete button -->
            <td>
                <form  name='identification' method="post" action="OwnerController?action=deleteOwner" onsubmit="">
                    <INPUT type="hidden" name="txtidOwner" value="${item.idProprietaire}" >
                    <INPUT type="submit" class="btn btn-danger"  value="Supprimer" >
                </form>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
