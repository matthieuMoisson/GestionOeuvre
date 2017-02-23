package controle;

import dao.Service;
import meserreurs.MonException;
import metier.Proprietaire;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/OwnerController")
public class OwnerController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String ACTION_TYPE = "action";
    private static final String GET_OWNERS = "getOwners";
    private static final String GOTO_ADD_OWNER = "gotoAddOwners";
    private static final String ADD_OWNER = "addOwner";
    private static final String GET_OWNER = "getOwner";
    private static final String EDIT_OWNER = "editOwner";
    private static final String DELETE_OWNER = "deleteOwner";
    private static final String ERROR_KEY = "messageErreur";
    private static final String ERROR_PAGE = "/erreur.jsp";

    public OwnerController()
    {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        run_action(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        run_action(req, resp);
    }

    private void run_action(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String actionName = request.getParameter(ACTION_TYPE);
        String destinationPage = ERROR_PAGE;

        // Get all owners
        if (GET_OWNERS.equals(actionName)) {
            try {

                Service unService = new Service();
                request.setAttribute("owners", unService.getOwners());

            } catch (MonException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

            destinationPage = "/owners.jsp";
        }

        // Get one owner by its ID
        else if (GET_OWNER.equals(actionName))
        {
            try {
                int idOwner = Integer.parseInt((request.getParameter("txtidOwner")));
                Service unService = new Service();
                request.setAttribute("owner", unService.getOwner(idOwner));
            } catch (MonException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            destinationPage = "/editOwner.jsp";
        }

        // Go to add owner page
        else if (GOTO_ADD_OWNER.equals(actionName)) {
            destinationPage = "/addOwner.jsp";
        }

        // Add an owner
        else if (ADD_OWNER.equals(actionName)) {
            try {
                Proprietaire owner = new Proprietaire();
                owner.setNomProprietaire(request.getParameter("txtnom"));
                owner.setPrenomProprietaire(request.getParameter("txtprenom"));
                Service unService = new Service();
                unService.addOwner(owner);

                request.setAttribute("owners", unService.getOwners());

            } catch (MonException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            destinationPage = "/owners.jsp";
        }

        // Edit an owner
        else if (EDIT_OWNER.equals(actionName))
        {
            try {
                Proprietaire owner = new Proprietaire();
                owner.setIdProprietaire(Integer.parseInt(request.getParameter("txtid")));
                owner.setNomProprietaire(request.getParameter("txtnom"));
                owner.setPrenomProprietaire(request.getParameter("txtprenom"));
                Service unService = new Service();
                unService.editOwner(owner);

                request.setAttribute("owners", unService.getOwners());

            } catch (MonException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            destinationPage = "/owners.jsp";
        }

        // Delete an owner
        else if (DELETE_OWNER.equals(actionName))
        {
            try {
                int txtidOwner = Integer.parseInt((request.getParameter("txtidOwner")));
                Service unService = new Service();
                unService.deleteOwner(txtidOwner);

                request.setAttribute("owners", unService.getOwners());

            } catch (MonException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            destinationPage = "/owners.jsp";
        }

        else {
            String messageErreur = "[" + actionName + "] n'est pas une action valide.";
            request.setAttribute(ERROR_KEY, messageErreur);
        }
        // Redirection vers la page jsp appropriee
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(destinationPage);
        dispatcher.forward(request, response);
    }
}
