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

@WebServlet ("/zulogin")
public class ServletZuLogin extends HttpServlet {
    private final static Logger log = Logger.getLogger(ServletZuLogin.class);

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

        nextJSP = "/login.jsp";

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
