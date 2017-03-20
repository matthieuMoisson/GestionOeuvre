# Projet Gestion Oeuvres
Projet s'inscrivant dans le cadre du cours de Programmation Répartie (Polytech de 4ème année)
## Membres du groupe
* Jensen JOYMANGUL
* Gaëtan MARTIN
* Matthieu MOISSON
## Objectifs
* J2EE
* Lancer un projet Maven
* Implémenter la couche présentation (JSP)
* Compléter les fonctionnalités
## Installation

Un accès internet est requis pour exploiter les pleines 
fonctionnalités du site (ex Bootsrap CDN)

Depuis git (clone) : 
https://github.com/matthieuMoisson/GestionOeuvre
1. Cliquez sur Import Changes

2. Edit Configuration
 * Ajouter un nouveau TomCat Server Local
 * Cliquez sur Fix puis sur OK

3. Ajouter les librairies de tomcat
 * Project Settings / Libraries
 
4. Ne pas oublier de lancer la base de données (identifiants inchangés)

## Réalisations
Afin de simplifier le code initial, nous avons implémenté un controlleur 
générique permettant d'alléger le code des méthodes doPost, doGet. 
Ainsi une abstraction a été créée, grâce à une convention de nommage sur 
les méthodes des controlleurs, les actions sont automatiquement appelées.
Ainsi pour avoir le détail des oeuvres ventes par exemple, le simple code 
suivant est employé :

Appel de la fonction détail dans une vue :
```html
<a href="OeuvreventeController?action=detail&id=${oeuvrevente.idOeuvrevente}" ...
```
Gestion de la requête dans le controlleur OeuvreventeController :
```java
public void detailAction() {
     int id = parseInt(this.request.getParameter("id"));
     Oeuvrevente oeuvrevente = this.oeuvreventeDAO.find(id);
     this.request.setAttribute("oeuvrevente", oeuvrevente);
     this.render();
 }
 ```
 Une abstraction dans les emplacements des fichiers est aussi faite. 
 La méthode render permet d'afficher la page jsp correspondant à l'action, 
 ainsi le fichier web/oeuvrevente/detail.jsp sera automatiquement appelé. 
 Note: il est aussi possible de spécifier la page comme par exemple : 
 ```java
 public void listeAction() {
     this.request.setAttribute("mesAdherents", adherentDAO.findAll());
       this.render("adherent/liste");
   }
```

Pour utiliser ces fonctions, il suffit ensuite d'étendre la classe Controller :
 ```java
@WebServlet("/AdherentController")
public class AdherentController extends Controller
```

Tout le code des fonctions écrites permettant ce système se trouve
 dans la classe Controller.
 
 


