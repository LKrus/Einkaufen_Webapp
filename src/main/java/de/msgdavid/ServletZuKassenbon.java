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
import java.util.ArrayList;
import java.util.Arrays;

@WebServlet ("/zukassenbon")
public class ServletZuKassenbon extends HttpServlet {
    private final static Logger log = Logger.getLogger(ServletZuKassenbon.class);

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

        try {

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
            nextJSP = "/kassenbon.jsp";

        } catch (Exception e) {
            log.info("exception servlet warenkorb");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(nextJSP);
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
