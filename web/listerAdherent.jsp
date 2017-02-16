<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Affichage de tous les adhérents</title>
	<link href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>

</head>
<body>

<script>
    $(document).ready(function () {
        $('#tableAdherents').DataTable();
    });
</script>

<p>
	<a href="index.jsp">Retour Accueil</a>
</p>

<h2>Tableau des Adhérents ! </h2>

<table id="tableAdherents">
	<thead>
	<th>Numero</th>
	<th>Nom</th>
	<th>Prénom</th>
	<th>Ville</th>

	</thead>

	<c:forEach items="${mesAdherents}" var="item">
		<tr>
			<td>${item.idAdherent}</td>
			<td>${item.nomAdherent}</td>
			<td>${item.prenomAdherent}</td>
			<td>${item.villeAdherent}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>