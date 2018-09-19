package de.msgdavid;

import org.apache.log4j.Logger;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ServletExample
 */
public class Controller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final static Logger log = Logger.getLogger(Controller.class);

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see Servlet#init(ServletConfig)
     */
    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
    }


    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();
        String nextJSP = null;
        String action = null;
        HttpSession session = request.getSession();

        String sArtikel = (String) session.getAttribute("artikelstring");
        log.info("artikel: " + sArtikel);


        if (sArtikel != null) {
            String[] menge = request.getParameterValues("i");

            request.setAttribute("preisliste", Rechnungen.getPreisListe(sArtikel));

            log.info("menge: " + Arrays.toString(menge) + " artikel: " + sArtikel);
            if (menge != null) {
                ArrayList<Double> gesamtPreisListe = Kasse.getGesamtPreise(sArtikel, menge);
                request.setAttribute("gesamtpreisliste", gesamtPreisListe);
                request.setAttribute("summe", Rechnungen.getSumme(gesamtPreisListe));
            }
        }

        try {
            action = request.getParameter("action");
            if (action == null) {
                nextJSP = "/home.jsp";
            } else if (action.equals("auswahl")) {
                nextJSP = "/warenkorb.jsp";
            } else if (action.equals("warenkorb")) {
                nextJSP = "/kassenbon.jsp";
            } else if (action.equals("home")) {
                nextJSP = "/home.jsp";
            } else if (action.equals("administration")) {
                nextJSP = "/login.jsp";
            } else if (action.equals("anmelden")) {
                if (request.getParameter("j_password").equals("admin")) {
                    nextJSP = "/administration.jsp";
                } else {
                    log.info("password falsch");
                    nextJSP = "/login.jsp?error=falsches Password";
                }
            } else if (action.equals("uebernehmen")) {
                String[] markierteArtikel = request.getParameterValues("markierteartikel");
                if (markierteArtikel != null) {
                    log.info("markierte Artikel: " + Arrays.toString(markierteArtikel));
                    Util.artikelUeberschreiben(markierteArtikel);
                }
                String neuerArtikel = request.getParameter("textfeld");
                if (neuerArtikel != null) {
                    log.info("neuer Artikel: " + neuerArtikel);
                    Util.artikelHinzufuegen(neuerArtikel);
                }
                nextJSP = "/administration.jsp";
            } else {
                nextJSP = "/home.jsp";
            }
        } catch (Exception e) {
            log.error("fehler in doget");
            nextJSP = "/error.jsp?error" + e.toString();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher(nextJSP);
        request.setAttribute("list", Auswahl.getArrayListAusArtikeln());

        dispatcher.forward(request, response);
    }


    /**
     * @see Servlet#getServletInfo()
     */
    public String getServletInfo() {
        // TODO Auto-generated method stub
        return null;
    }


    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

    /**
     * @see Servlet#destroy()
     */
    public void destroy() {
        // TODO Auto-generated method stub
    }
}
