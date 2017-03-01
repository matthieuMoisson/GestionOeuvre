package controle;

import dao.OeuvreventeDAO;
import metier.Oeuvrevente;

import javax.servlet.annotation.WebServlet;
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
        List<Oeuvrevente> oeuvreventes = this.oeuvreventeDAO.findAll();
        this.request.setAttribute("oeuvreventes", oeuvreventes);
        this.render();
    }

    public void detailAction() {
        int id = Integer.parseInt(this.request.getParameter("id"));
        Oeuvrevente oeuvrevente = this.oeuvreventeDAO.find(id);
        this.request.setAttribute("oeuvrevente", oeuvrevente);
        this.render();
    }
}
