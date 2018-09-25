package de.msgdavid;

import org.apache.log4j.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

@WebServlet("/zuadmin")
public class ServletZuAdmin extends HttpServlet {

    private final static Logger log = Logger.getLogger(ServletZuAdmin.class);


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

        try {
            action = request.getParameter("action");

            if (action.equals("anmelden")) {
                String jpasswort = request.getParameter("j_password");
                String passwort = Verschluesselung.verschluesseln(jpasswort);
                if (passwort.equals("21232f297a57a5a743894a0e4a801fc3")) {
                    nextJSP = "/administration.jsp";
                } else {
                    log.info("password falsch");
                    nextJSP = "/login.jsp?error=falsches Passwort!";
                }
            }


            if (action.equals("uebernehmen")) {
                String neuerArtikelName = request.getParameter("textfeld");
                String euro = request.getParameter("euro");
                String cent = request.getParameter("cent");
                String[] markierteArtikel = request.getParameterValues("markierteartikel");
                if (markierteArtikel != null) {
                    log.info("markierte Artikel: " + Arrays.toString(markierteArtikel));
                    Util.artikelUeberschreiben(markierteArtikel);
                    nextJSP = "/administration.jsp";
                } else if (neuerArtikelName != null && euro != null && cent != null && Util.eingabeUeberpruefen(neuerArtikelName)) {
                    log.info("neuer Artikel: " + neuerArtikelName + ", euro: " + euro + ", cent: " + cent);
                    Util.artikelHinzufuegen(neuerArtikelName, euro, cent);
                    nextJSP = "/administration.jsp";
                } else {
                    log.info("falsche eingabe beim artikel");
                    nextJSP = "/administration.jsp?errorr=keine gultige Eingabe, keine Kommas oder Semikolon im Artikelnamen";
                }
            }
        } catch (Exception e) {
            log.info("ecxeption servletzuadmin");
            nextJSP = "/error.jsp";
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
