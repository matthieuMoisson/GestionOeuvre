<%@ page language="java" contentType="text/html; charset=UTF-8"	 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Expo : Médiathèque De POLYTECH</title>

	<link rel="stylesheet" type="text/css" href="style/main.css">
	<%-- Bootstrap --%>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>


<body>

<div class="container">
	<h1>Médiathèque de POLYTECH ! </h1>
	<h2>Gestion de l'exposition 2016</h2>
	<h3>Sélectionnez la fonctionnalité voulue :</h3>
	<div class="row">
		<ul>
			<li><a href="Controleur?action=ajouterAdherent">Ajout Adhérent</a></li>
			<li><a href="Controleur?action=listerAdherent">lister les adhérents</a></li>
			<li><a href="ProprietaireController?action=liste">lister les propriétaires</a></li>
			<li><a href="OeuvreventeController?action=liste">Consulter le catalogue des Oeuvres à vendre</a></li>
			<li><a href="OeuvrepretController?action=liste">Consulter le catalogue des Oeuvres à prêter</a></li>
			<li><a href="#" onclick="close_window();return false;">Quitter</a></li>
		</ul>
	</div>
</div>

<%-- JS --%>
	<%-- Jquery --%>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
	<%-- Bootstrap --%>
	<script type="javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%-- End JS --%>
</body>
</html>
