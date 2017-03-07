<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<jsp:include page="header.jsp">
	<jsp:param name="titre" value="Affichage adhérants"/>
</jsp:include>

	<script>
		$(document).ready(function () {
			$('#tableAdherents').DataTable({
			    language: fr_language,
			});
		});
	</script>

		<h2>Tableau des Adhérents ! <a class="btn btn-success" href="Controleur?action=ajouterAdherent" role="button">Ajouter un adherent</a></h2>

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
					<!-- Modifier button -->
					<td>
						<form  name='identification' method="post" action="Controleur?action=getAdherent" onsubmit="">
							<INPUT type="hidden" name="txtidAdherent" id ="idAdherent" value="${item.idAdherent}" >
							<INPUT type="submit" class="btn btn-info"  value="Modifier" >
						</form>
					</td>
					<!-- Delete button -->
					<td>
						<form  name='identification' method="post" action="Controleur?action=deleteAdherent" onsubmit="">
							<INPUT type="hidden" name="txtidAdherent" value="${item.idAdherent}" >
							<INPUT type="submit" class="btn btn-danger"  value="Supprimer" >
						</form>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>

<jsp:include page="footer.jsp">
	<jsp:param name="titre" value="Expo : Médiathèque De POLYTECH"/>
</jsp:include>
