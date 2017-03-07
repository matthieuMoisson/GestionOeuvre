package controle;

import dao.AdherentDAO;
import metier.Adherent;
import utilitaires.FlashMessage;
import utilitaires.FlashMessageStatut;

import javax.servlet.annotation.WebServlet;

/**
 * Created by Jensen on 07/03/2017.
 */

@WebServlet("/AdherentController")
public class AdherentController extends Controller {
    private final AdherentDAO adherentDAO;

    public AdherentController() {
        super();
        this.adherentDAO = new AdherentDAO();
    }

    public void listeAction() {
        this.request.setAttribute("mesAdherents", adherentDAO.findAll());
        this.render("adherent/liste");
    }

    public void editAction() {
        int idAdherent = Integer.parseInt(this.request.getParameter("idAdherent"));
        Adherent adherent = adherentDAO.find(idAdherent);
        String nom, prenom, ville;
        if ((nom = this.request.getParameter("txtnom")) != null
                && (prenom = this.request.getParameter("txtprenom")) != null
                && (ville = this.request.getParameter("txtville")) != null) {
            adherent.setNomAdherent(nom);
            adherent.setPrenomAdherent(prenom);
            adherent.setVilleAdherent(ville);
            adherentDAO.update(adherent);
            this.clearFlashMessages();
            this.addFlashMessages(new FlashMessage("Modification effectuee", FlashMessageStatut.SUCCESS));
            listeAction();
        } else {
            this.request.setAttribute("adherent", adherent);
            this.render();
        }
    }

    public void addAction() {
        Adherent adherent = new Adherent();
        String nom, prenom, ville;
        if ((nom = this.request.getParameter("txtnom")) != null
                && (prenom = this.request.getParameter("txtprenom")) != null
                && (ville = this.request.getParameter("txtville")) != null) {
            adherent.setNomAdherent(nom);
            adherent.setPrenomAdherent(prenom);
            adherent.setVilleAdherent(ville);
            adherentDAO.insert(adherent);
            this.clearFlashMessages();
            this.addFlashMessages(new FlashMessage("Proprietaire ajoute", FlashMessageStatut.SUCCESS));
            listeAction();
        } else {
            this.render();
        }
    }

    public void deleteAction() {
        int idAdherent = Integer.parseInt(this.request.getParameter("idAdherent"));
        adherentDAO.delete(idAdherent);
        this.clearFlashMessages();
        this.addFlashMessages(new FlashMessage("Proprietaire supprime", FlashMessageStatut.SUCCESS));
        listeAction();
    }
}
