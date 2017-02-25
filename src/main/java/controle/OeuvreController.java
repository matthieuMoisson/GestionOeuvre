package controle;

import dao.Service;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Gaetan on 25/02/2017.
 */
@WebServlet("/OeuvreController")
public class OeuvreController extends Controller {

    public void listeAction() {

        Service unService = new Service();

        this.request.setAttribute("oeuvres", null);
        this.render();
    }
}
