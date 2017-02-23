<%--
  Created by IntelliJ IDEA.
  User: seljo
  Date: 19/02/2017
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <div>
        <p>
            <a class="btn btn-success"  role="button" href="Controleur?action=listerAdherent">
                Retour vers la liste des adherents
            </a>
        </p>

        <div class="container">
            <h2>Modifier un adherent</h2>
            <form class="form-horizontal"  method="post" action="Controleur?action=editAdherent">
                <div class="form-group">
                    <div class="col-sm-10">
                        <input type="hidden" class="form-control" name="txtid" id="id" value="${adherent.idAdherent}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="nom">Nom:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="txtnom" id="nom" placeholder="Entrez votre nom" value="${adherent.nomAdherent}" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="prenom">Prenom:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="txtprenom" id="prenom" placeholder="Entrez votre prénom" value="${adherent.prenomAdherent}" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="ville">Ville:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="txtville" id="ville" placeholder="Enter votre ville" value="${adherent.villeAdherent}">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-info">Modifier</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

</body>
