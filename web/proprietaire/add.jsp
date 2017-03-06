<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ajouter un propriétaire</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>


<body>
<div>
    <p>
        <a class="btn btn-success"  role="button" href="ProprietaireController?action=liste">
            Retour vers la liste des propriétaires
        </a>
    </p>

    <div class="container">
        <h2>Ajout d'un propriétaire</h2>
        <form class="form-horizontal" name='identification' method="post" action="ProprietaireController?action=add">
            <div class="form-group">
                <label class="control-label col-sm-2" for="nom">Nom:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="txtnom" id="nom" placeholder="Entrez votre nom" value="" required>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="prenom">Prenom:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="txtprenom" id="prenom" placeholder="Entrez votre prénom" value="" required="true">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-info">Ajouter</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>