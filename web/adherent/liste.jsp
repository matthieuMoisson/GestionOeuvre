<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<title>Affichage de tous les adhérents</title>
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
			$('#tableAdherents').DataTable({
			    language: fr_language,
			});
		});
	</script>

	<div class="container">

		<p>
			<a class="btn btn-success" href="index.jsp" role="button">Retour Accueil</a>
		</p>

		<h2>Tableau des Adhérents ! <a class="btn btn-success" href="AdherentController?action=add" role="button">Ajouter un adherent</a></h2>

		<table id="tableAdherents">
			<thead>
			<tr>
				<th>Numero</th>
				<th>Nom</th>
				<th>Prénom</th>
				<th>Ville</th>
				<th>Modifier</th>
				<th>Supprimer</th>
			</tr>
			</thead>

			<tbody>
			<c:forEach items="${mesAdherents}" var="item">
				<tr>
					<td>${item.idAdherent}</td>
					<td>${item.nomAdherent}</td>
					<td>${item.prenomAdherent}</td>
					<td>${item.villeAdherent}</td>
					<td>
						<a href="AdherentController?action=edit&idAdherent=${item.idAdherent}"
						   class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span></a>
						<a href="AdherentController?action=delete&idAdherent=${item.idAdherent}"
						   class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span></a>
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
