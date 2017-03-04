package controle;

import meserreurs.MonException;
import utilitaires.FlashMessage;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Gaetan on 25/02/2017.
 */
public abstract class Controller extends HttpServlet {

    private static final String ERROR_PAGE = "/erreur.jsp";
    private static final String ACTION_TYPE = "action";
    private static final String NORM_CONTROLLER = "controller"; // Suffix of the file in non case sensitive

    protected HttpServletRequest request = null;
    protected HttpServletResponse response = null;

    private List<FlashMessage> flashMessages = new ArrayList<FlashMessage>();

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processusTraiteRequete(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processusTraiteRequete(request, response);
    }


    /**
     * Process the request : invoke the method corresponding to the given controller and spelled like listeAction
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void processusTraiteRequete(HttpServletRequest request, HttpServletResponse response) {

        this.request = request;
        this.response = response;

        String action = request.getParameter(ACTION_TYPE);
        String methodName = action.toLowerCase() + "Action";

        try {
//            Method method = this.getClass().getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
            Method method = this.getClass().getMethod(methodName);
            method.invoke(this);

        } catch (NoSuchMethodException e) {
            String destinationPage = ERROR_PAGE;
            String messageErreur = "[" + action + "] n'est pas une action valide.";
            this.request.setAttribute("messageErreur", messageErreur);
            this.render(destinationPage);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
    }

    /**
     * Display the page corresponding to the controller/action
     */
    protected void render() {
        String controller = this.getClass().getSimpleName().toLowerCase().replace(NORM_CONTROLLER, "");
        String action = this.request.getParameter(ACTION_TYPE);
        String destinationPage = controller + "/" + action;
        this.render(destinationPage);
    }

    /**
     * Display the given destination page
     * @param destinationPage either full path like : /oeuvre/liste.jsp or oeuvre/liste
     */
    protected void render(String destinationPage) {
        if (this.response == null || this.request == null) {
//            throw new MonException("Couldn't get request or response");
        }

        this.request.setAttribute("flashMessages", this.getFlashMessagesHtml());

        if (! destinationPage.startsWith("/")) {
            destinationPage = "/" + destinationPage;
        }
        if (! destinationPage.contains(".jsp")) {
            destinationPage = destinationPage + ".jsp";
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(destinationPage);
        try {
            dispatcher.forward(this.request, this.response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected List<FlashMessage> getFlashMessages() {
        return flashMessages;
    }

    protected void addFlashMessages(FlashMessage flashMessage) {
        this.flashMessages.add(flashMessage);
    }

    private String getFlashMessagesHtml() {
        String html = "";
        for (FlashMessage flashMessage :this.getFlashMessages()) {
            html += flashMessage.buildHtml();
        }
        return html;
    }

    protected void clearFlashMessages() {
        this.flashMessages.clear();
    }
}
