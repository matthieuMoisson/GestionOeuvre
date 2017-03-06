package controle;

import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;
import dao.*;
import metier.*;
import utilitaires.FlashMessage;
import utilitaires.FlashMessageStatut;

import javax.servlet.annotation.WebServlet;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import static java.lang.Integer.parseInt;

/**
 * Created by Matthieu on 25/02/2017.
 */
@WebServlet("/OeuvrepretController")
public class OeuvrepretController extends Controller {

    private OeuvrepretDAO oeuvrepretDAO;

    public OeuvrepretController() {
        super();
        this.oeuvrepretDAO = new OeuvrepretDAO();
    }

    public void listeAction() {
        List<Oeuvrepret> oeuvreprets = this.oeuvrepretDAO.findAll();
        this.request.setAttribute("oeuvreprets", oeuvreprets);
        this.render("oeuvrepret/liste");
    }

    public void detailAction() {
        int idOeuvrepret = Integer.parseInt(this.request.getParameter("idOeuvrepret"));
        Oeuvrepret oeuvrepret = this.oeuvrepretDAO.find(idOeuvrepret);
        this.request.setAttribute("oeuvrepret", oeuvrepret);
        this.render();
    }

    public void deleteAction() {
        int idOeuvrepret = parseInt(this.request.getParameter("idOeuvrepret"));
        oeuvrepretDAO.delete(idOeuvrepret);
        this.clearFlashMessages();
        this.addFlashMessages(new FlashMessage("Oeuvre pret supprimee", FlashMessageStatut.SUCCESS));
        listeAction();
    }

    public void editerAction() {
        int idOeuvrepret = parseInt(this.request.getParameter("idOeuvrepret"));
        Oeuvrepret oeuvrepret = oeuvrepretDAO.find(idOeuvrepret);
        String titre;
        Integer prix, idProprietaire;
        titre = this.request.getParameter("txttitre");
        if(titre != null && this.request.getParameter("numberprix")!=null && this.request.getParameter("idProprietaire")!=null){
            prix = Integer.parseInt(this.request.getParameter("numberprix"));
            idProprietaire = Integer.parseInt(this.request.getParameter("idProprietaire"));
            oeuvrepret.setTitreOeuvrepret(titre);
            ProprietaireDAO proprietaireDAO = new ProprietaireDAO();
            Proprietaire proprietaire = proprietaireDAO.find(idProprietaire);
            oeuvrepret.setProprietaire(proprietaire);
            OeuvrepretDAO oeuvrepretDAO = new OeuvrepretDAO();
            oeuvrepretDAO.insert(oeuvrepret);
            this.clearFlashMessages();
            this.addFlashMessages(new FlashMessage("Modification d'une oeuvre", FlashMessageStatut.SUCCESS));
            this.listeAction();

        }else{
            this.request.setAttribute("txttitre", oeuvrepret.getTitreOeuvrepret());
            this.request.setAttribute("idProprietaire", oeuvrepret.getProprietaire().getIdProprietaire());
            this.request.setAttribute("proprietaires", new ProprietaireDAO().findAll());
            this.render();
        }
    }

    public void addAction() {
        String titre;
        Integer prix, idProprietaire;
        titre = this.request.getParameter("txttitre");
        if(titre != null && this.request.getParameter("idProprietaire")!=null){
            //Si le formulaire est valide
            idProprietaire = Integer.parseInt(this.request.getParameter("idProprietaire"));
            Oeuvrepret oeuvrepret = new Oeuvrepret();
            oeuvrepret.setTitreOeuvrepret(titre);
            ProprietaireDAO proprietaireDAO = new ProprietaireDAO();
            Proprietaire proprietaire = proprietaireDAO.find(idProprietaire);
            oeuvrepret.setProprietaire(proprietaire);
            OeuvrepretDAO oeuvrepretDAO = new OeuvrepretDAO();
            oeuvrepretDAO.insert(oeuvrepret);
            this.clearFlashMessages();
            this.addFlashMessages(new FlashMessage("Ajout d'une oeuvre", FlashMessageStatut.SUCCESS));
            this.listeAction();
        }

        this.request.setAttribute("proprietaires", new ProprietaireDAO().findAll());
        this.render();

    }
}
