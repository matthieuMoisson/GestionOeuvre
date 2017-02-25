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

    public void listeAction() {
        OeuvreventeDAO oeuvreventeDAO = new OeuvreventeDAO();
        List<Oeuvrevente> oeuvreventes = oeuvreventeDAO.getAllOeuvrevente();
        this.request.setAttribute("oeuvreventes", oeuvreventes);
        this.render();
    }
}
