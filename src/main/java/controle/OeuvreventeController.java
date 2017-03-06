package controle;

import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;
import dao.*;
import meserreurs.MonException;
import metier.Adherent;
import metier.Oeuvrevente;
import metier.Proprietaire;
import metier.Reservation;
import utilitaires.FlashMessage;
import utilitaires.FlashMessageStatut;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;

import static java.lang.Integer.parseInt;

/**
 * Created by Gaetan on 25/02/2017.
 */
@WebServlet("/OeuvreventeController")
public class OeuvreventeController extends Controller {

    private OeuvreventeDAO oeuvreventeDAO;

    public OeuvreventeController() {
        super();
        this.oeuvreventeDAO = new OeuvreventeDAO();
    }

    public void listeAction() {


        if (this.request.getParameter("idAdherent") != null && this.request.getParameter("idOeuvrevente") != null) {
            FlashMessage flashMessage = this.reservationSubAction();
            this.clearFlashMessages();
            this.addFlashMessages(flashMessage);
        }

        List<Oeuvrevente> oeuvreventes = this.oeuvreventeDAO.findAll();
        List<Adherent> adherents = new AdherentDAO().findAll();
        this.request.setAttribute("oeuvreventes", oeuvreventes);
        this.request.setAttribute("adherents", adherents);
        this.render("oeuvrevente/liste");
    }

    public void addAction() {
        String titre;
        Integer prix, idProprietaire;
        titre = this.request.getParameter("txttitre");
        if(titre != null && this.request.getParameter("numberprix")!=null && this.request.getParameter("idProprietaire")!=null){
            //Si le formulaire est valide
            prix = Integer.parseInt(this.request.getParameter("numberprix"));
            idProprietaire = Integer.parseInt(this.request.getParameter("idProprietaire"));
            Oeuvrevente oeuvrevente = new Oeuvrevente();
            oeuvrevente.setEtatOeuvrevente("L");
            oeuvrevente.setTitreOeuvrevente(titre);
            oeuvrevente.setPrixOeuvrevente(prix);
            ProprietaireDAO proprietaireDAO = new ProprietaireDAO();
            Proprietaire proprietaire = proprietaireDAO.find(idProprietaire);
            oeuvrevente.setProprietaire(proprietaire);
            OeuvreventeDAO oeuvreventeDAO = new OeuvreventeDAO();
            oeuvreventeDAO.insert(oeuvrevente);
            this.clearFlashMessages();
            this.addFlashMessages(new FlashMessage("Ajout d'une oeuvre", FlashMessageStatut.SUCCESS));
            this.listeAction();
        }

        this.request.setAttribute("proprietaires", new ProprietaireDAO().findAll());
        this.render();

    }

    public void editerAction() {
        int idOeuvrevente = parseInt(this.request.getParameter("idOeuvrevente"));
        Oeuvrevente oeuvrevente = oeuvreventeDAO.find(idOeuvrevente);
        String titre;
        Integer prix, idProprietaire;
        titre = this.request.getParameter("txttitre");
        if(titre != null && this.request.getParameter("numberprix")!=null && this.request.getParameter("idProprietaire")!=null){
            prix = Integer.parseInt(this.request.getParameter("numberprix"));
            idProprietaire = Integer.parseInt(this.request.getParameter("idProprietaire"));
            oeuvrevente.setEtatOeuvrevente("L");
            oeuvrevente.setTitreOeuvrevente(titre);
            oeuvrevente.setPrixOeuvrevente(prix);
            ProprietaireDAO proprietaireDAO = new ProprietaireDAO();
            Proprietaire proprietaire = proprietaireDAO.find(idProprietaire);
            oeuvrevente.setProprietaire(proprietaire);
            OeuvreventeDAO oeuvreventeDAO = new OeuvreventeDAO();
            oeuvreventeDAO.insert(oeuvrevente);
            this.clearFlashMessages();
            this.addFlashMessages(new FlashMessage("Modification d'une oeuvre", FlashMessageStatut.SUCCESS));
            this.listeAction();

        }else{
            this.request.setAttribute("txttitre", oeuvrevente.getTitreOeuvrevente());
            this.request.setAttribute("txttitre", oeuvrevente.getTitreOeuvrevente());
            this.request.setAttribute("numberprix", oeuvrevente.getPrixOeuvrevente());
            this.request.setAttribute("idProprietaire", oeuvrevente.getProprietaire().getIdProprietaire());
            this.request.setAttribute("proprietaires", new ProprietaireDAO().findAll());
            this.render();
        }
    }

    public void detailAction() {
        int id = parseInt(this.request.getParameter("id"));
        Oeuvrevente oeuvrevente = this.oeuvreventeDAO.find(id);
        this.request.setAttribute("oeuvrevente", oeuvrevente);
        this.render();
    }

    public void deleteAction() {
        int id = parseInt(this.request.getParameter("id"));
        oeuvreventeDAO.delete(id);
        this.clearFlashMessages();
        this.addFlashMessages(new FlashMessage("Oeuvre vente supprimee", FlashMessageStatut.SUCCESS));
        listeAction();
    }

    public FlashMessage reservationSubAction() {
        int idAdherent = parseInt(this.request.getParameter("idAdherent"));
        int idOeuvrevente = parseInt(this.request.getParameter("idOeuvrevente"));
        Adherent adherent = new AdherentDAO().find(idAdherent);
        Oeuvrevente oeuvrevente = this.oeuvreventeDAO.find(idOeuvrevente);
        Reservation reservation = new Reservation();
        reservation.setAdherent(adherent);
        reservation.setDate(new java.sql.Date(Calendar.getInstance().getTime().getTime()));
        reservation.setOeuvrevente(oeuvrevente);
        reservation.setStatut("confirmee");
        if (new ReservationDAO().insert(reservation) == -1) { // If Reservation already done
            String message = "Reservation impossible (Reservation de " + adherent.getNomComplet()+" deja existante)";
            return new FlashMessage(message, FlashMessageStatut.ERROR);
        }
        return new FlashMessage("Reservation bien prise en compte", FlashMessageStatut.SUCCESS);
    }
}
