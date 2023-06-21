/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ajax;

import estudiantes.Estudiante.Estudiante;
import estudiantes.baseDatos.BdEstudiante;
import estudiantes.configuracion.configECI;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lrodriguez
 */
public class Preinscribe extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

    /* try {
    /* TODO output your page here
    out.println("<html>");
    out.println("<head>");
    out.println("<title>Servlet Preinscribe</title>");
    out.println("</head>");
    out.println("<body>");
    out.println("<h1>Servlet Preinscribe at " + request.getContextPath () + "</h1>");
    out.println("</body>");
    out.println("</html>");
     */
    /*   } finally {
    out.close();
    }*/
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //    StringBuffer results = new StringBuffer("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?><municipios>");
        HttpSession session = request.getSession();
        PrintWriter pw = response.getWriter();
        String identificador = request.getParameter("identificador");
        String valor = request.getParameter("valor");
        
        String id = request.getParameter("id");
        
        String carnet = (String) session.getAttribute("carnet");
        int maxcred = 21;
        int tamamo;
        String respuesta = null;
        
        Estudiante actualiza = new Estudiante(carnet, pw);
        if (valor.equals("1")) {
            String[] ident=identificador.split(",");
            for (int i=0; i<ident.length;i++){
            tamamo = actualiza.Insertapreins(ident[i], carnet);
            }
            response.sendRedirect("NvaPreinscripcion?valor=" + valor + "&id=" + identificador);
        } else {
            tamamo = actualiza.Actualpreins(identificador, carnet);
            if (tamamo > 0) {
                respuesta = "<root>ok</root>";
            } else {
                respuesta = "<root>error</root>";
            }
            response.setContentType("text/xml");
            pw.write(respuesta);
            pw.flush();
            pw.close();
       }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
