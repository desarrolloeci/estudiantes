/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ajax;

import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author alexgz
 */
public class News extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=ISO-8859-1");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet News</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet News at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
             */
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/xml;charset=utf-8");
        PrintWriter out = response.getWriter();
        //String urlrss = "http://copernico.escuelaing.edu.co/aeci/web/index.php?option=com_rss&feed=RSS2.0&no_html=1";//request.getParameter("urlrss");
        String urlrss = "http://copernico.escuelaing.edu.co/contenido/index.php?format=feed&type=rss";//request.getParameter("urlrss");
        URL url = new URL(urlrss);
        InputStream is = url.openStream();
        BufferedReader di = new BufferedReader(new InputStreamReader(is, "utf-8"));
        String linea;
        /***** Lee l�nea a l�nea el  archivo ... ****/
        do {
            linea = di.readLine();
            if (linea == null) {
                break;
            } else {
                out.println(linea);
            }
        } while (true);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    /*private String tildes(String cadena) {
        cadena = cadena.replace("�", "&aacute;");
        cadena = cadena.replace("�", "&eacute;");
        cadena = cadena.replace("�", "&iacute;");
        cadena = cadena.replace("�", "&oacute;");
        cadena = cadena.replace("�", "&uacute;");
        cadena = cadena.replace("�", "&Aacute;");
        cadena = cadena.replace("�", "&Eacute;");
        cadena = cadena.replace("�", "&Iacute;");
        cadena = cadena.replace("�", "&Oacute;");
        cadena = cadena.replace("�", "&Uacute;");
        cadena = cadena.replace("�", "&Ntilde;");
        cadena = cadena.replace("�", "&ntilde;");
        cadena = cadena.replace("�", "&iquest;");
        cadena = cadena.replace("�", "&iexcl;");
        cadena = cadena.replace("�", "&Uuml;");
        cadena = cadena.replace("�", "&uuml;");
        cadena = cadena.replace("&", "&amp;");
        cadena = cadena.replace("\"", "&quot;");
        cadena = cadena.replace("<", "&lt;");
        cadena = cadena.replace(">", "&gt;");
        return cadena;
    }*/
}
