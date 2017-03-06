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

        this.clearFlashMessages();

        if (this.request.getParameter("idAdherent") != null && this.request.getParameter("idOeuvrevente") != null) {
            FlashMessage flashMessage = this.reservationSubAction();
            this.addFlashMessages(flashMessage);
        }

        List<Oeuvrevente> oeuvreventes = this.oeuvreventeDAO.findAll();
        List<Adherent> adherents = new AdherentDAO().findAll();
        this.request.setAttribute("oeuvreventes", oeuvreventes);
        this.request.setAttribute("adherents", adherents);
        this.render();
    }

    public void addAction() {
        Service unService = new Service();
        if(false){
            //Si le formulaire est valide
            Oeuvrevente oeuvrevente = new Oeuvrevente();
            //oeuvrevente.setProprietaire(unService.getOwner(request.getParameter("idProprietaire")));
            oeuvrevente.setEtatOeuvrevente("L");
            //oeuvrevente.setPrixOeuvrevente(request.getParameter("numberprix"));
            oeuvrevente.setTitreOeuvrevente(request.getParameter("txttitre"));
            OeuvreventeDAO oeuvreventeDAO = new OeuvreventeDAO();
            oeuvreventeDAO.insert(oeuvrevente);
        }

        this.request.setAttribute("proprietaires", new ProprietaireDAO().findAll());
        this.render();

    }

    public void detailAction() {
        int id = Integer.parseInt(this.request.getParameter("id"));
        Oeuvrevente oeuvrevente = this.oeuvreventeDAO.find(id);
        this.request.setAttribute("oeuvrevente", oeuvrevente);
        this.render();
    }

    public FlashMessage reservationSubAction() {
        int idAdherent = Integer.parseInt(this.request.getParameter("idAdherent"));
        int idOeuvrevente = Integer.parseInt(this.request.getParameter("idOeuvrevente"));
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
