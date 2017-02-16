<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="refresh" content="0;URL=javascript:fermer();">
	<title>Expo : Médiathèque De POLYTECH</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"
			integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
			crossorigin="anonymous"></script>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>


<script language="JavaScript">
    function fermer() {
    }
</script>

<body>
<p align="center"></p>
<p align="center">
	<font face="Arial" size="4"><u>Médiathèque de POLYTECH </u></font>
</p>
<p align="center">
	<font color="#004080" face="Arial" size="4">Gestion de
		l'exposition 2016</font>
</p>
<p align="left">
	<font color="#004080" face="Arial"><u>Sélectionnez la
		fonctionnalité voulue:</u></font>
</p>
<ul>
	<li><a href="Controleur?action=ajouterAdherent"><font
			face="Arial">Ajout Adhérent</font></a></li>
	<li><a href="Controleur?action=listerAdherent"><font
			face="Arial">lister les adhérents</font></a><font face="Arial"> </font></li>
	<li><a href="javascript:fermer()"><font face="Arial">Quitter</font></a><font
			face="Arial"> </font></li>
</ul>

<script type="javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>