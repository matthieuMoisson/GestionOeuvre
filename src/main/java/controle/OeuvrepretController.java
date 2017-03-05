package controle;

import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;
import dao.AdherentDAO;
import dao.OeuvrepretDAO;
import dao.ReservationDAO;
import metier.Adherent;
import metier.Oeuvrepret;
import metier.Reservation;
import utilitaires.FlashMessage;
import utilitaires.FlashMessageStatut;

import javax.servlet.annotation.WebServlet;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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
        this.render();
    }

    public void detailAction() {
        int id = Integer.parseInt(this.request.getParameter("id"));
        Oeuvrepret oeuvrepret = this.oeuvrepretDAO.find(id);
        this.request.setAttribute("oeuvrepret", oeuvrepret);
        this.render();
    }
}
