/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package financiero;

import estudiantes.Estudiante.Estudiante;
import estudiantes.configuracion.configECI;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author alexgz
 */
public class RegPago extends HttpServlet {
   
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
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegPago</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegPago at " + request.getContextPath () + "</h1>");
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
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession  session = request.getSession(true);
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegPago</title>");
            out.println("</head>");
            out.println("<body>");
            String carnet = (String)session.getAttribute("carnet");
            Estudiante est = (Estudiante) session.getAttribute("estClase");
            configECI cfgEci = new configECI();
            Vector infoOrden = est.getOrdenes(carnet, cfgEci.getPeriodoSig());
            int ret = 0;
            if(infoOrden.size()>0){
                Vector tmp = (Vector)infoOrden.elementAt(0);

                ret = est.setMatricula(carnet, cfgEci.getPeriodoSig(), tmp.elementAt(0).toString());
                if(ret > 0){
                    session.setAttribute("mensaje", "Se ha registrado su matricula correctamente");
                    response.sendRedirect("menuServEstud");
                }else{
                    out.println("<script> " +
                        " alert(' Error en el ingreso de los datos'); " +
                        " history.back();" +
                        " </script>");
                }
            }else{
                out.println("<script> " +
                    " alert(' No existe información o ya registro su matrícula '); " +
                    " history.back();" +
                    " </script>");
            }
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
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
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
