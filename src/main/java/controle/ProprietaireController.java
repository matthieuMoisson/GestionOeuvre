package controle;

import dao.ProprietaireDAO;
import dao.Service;
import meserreurs.MonException;
import metier.Proprietaire;
import utilitaires.FlashMessage;
import utilitaires.FlashMessageStatut;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ProprietaireController")
public class ProprietaireController extends Controller {

    private final ProprietaireDAO proprietaireDAO;

    public ProprietaireController() {
        super();
        this.proprietaireDAO = new ProprietaireDAO();
    }

    public void listeAction() {
        this.request.setAttribute("owners", proprietaireDAO.findAll());
        this.render("proprietaire/liste");
    }

    public void editAction() {
        int idProprietaire = Integer.parseInt(this.request.getParameter("idProprietaire"));
        Proprietaire proprietaire = proprietaireDAO.find(idProprietaire);

        String nom, prenom;
        if ((nom = this.request.getParameter("txtnom")) != null && (prenom = this.request.getParameter("txtprenom")) != null) {
            proprietaire.setNomProprietaire(nom);
            proprietaire.setPrenomProprietaire(prenom);
            proprietaireDAO.update(proprietaire);
            this.request.setAttribute("owners", proprietaireDAO.findAll());
            this.clearFlashMessages();
            this.addFlashMessages(new FlashMessage("Modification effectuee", FlashMessageStatut.SUCCESS));
            this.render("proprietaire/liste");
        } else {
            this.request.setAttribute("owner", proprietaire);
            this.render();
        }
    }

    public void addAction() {
        Proprietaire proprietaire = new Proprietaire();
        String nom, prenom;
        if ((nom = this.request.getParameter("txtnom")) != null && (prenom = this.request.getParameter("txtprenom")) != null) {
            proprietaire.setNomProprietaire(nom);
            proprietaire.setPrenomProprietaire(prenom);
            proprietaireDAO.insert(proprietaire);
            this.clearFlashMessages();
            this.addFlashMessages(new FlashMessage("Proprietaire ajoute", FlashMessageStatut.SUCCESS));
            listeAction();
        } else {
            this.render();
        }
    }

    public void deleteAction() {
        int idProprietaire = Integer.parseInt(this.request.getParameter("idProprietaire"));
        proprietaireDAO.delete(idProprietaire);
        this.clearFlashMessages();
        this.addFlashMessages(new FlashMessage("Proprietaire supprime", FlashMessageStatut.SUCCESS));
        listeAction();
    }
}
