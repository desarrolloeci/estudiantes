/*
 * chpwd.java
 *
 * Created on 28 de junio de 2007, 01:33 PM
 */

package otros;

import estudiantes.Estudiante.Estudiante;
import estudiantes.baseDatos.BdEstudiante;
import estudiantes.configuracion.configECI;
import java.io.*;
import java.net.*;
import java.util.Vector;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author alexgz
 * @version
 */
public class chpwd extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        /* TODO output your page here
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet chpwd</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Servlet chpwd at " + request.getContextPath () + "</h1>");
        out.println("</body>");
        out.println("</html>");
         */
        out.close();
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
    
    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession sesion = request.getSession();
        String clanum = request.getParameter("clavenum");
        String nvpwd = request.getParameter("nvcont");
        String cnvpwd = request.getParameter("cnvcont");
        String carnet = (String) sesion.getAttribute("carnet") ;
        String msj = (String) sesion.getAttribute("mensaje") ;
        clanum = limpiar(clanum);
        nvpwd = limpiar(nvpwd);
        cnvpwd = limpiar(cnvpwd);
        Estudiante est = (Estudiante) sesion.getAttribute("estClase") ;
        Vector info = (Vector)est.getInfoEstudiante().elementAt(0);
        if(nvpwd.length() < 6 || (!clanum.equals(info.elementAt(30)))||(!nvpwd.equals(cnvpwd))||nvpwd==null||nvpwd.equals("")){
            if(msj.equals("Cambiar contraseña"))
                response.sendRedirect("login?msg=9");
            else{
                sesion.setAttribute("mensaje", "Ha ocurrido un error al cambiar su contraseña intente nuevamente") ;
                response.sendRedirect("menuServEstud");
            }
        }else{
            BdEstudiante bdEst = new BdEstudiante() ;
            configECI cfgEci = new configECI(); 
            bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
            int ret = bdEst.ChPwd(carnet, nvpwd);
            bdEst.desconectar() ;
            if(ret>0)
                response.sendRedirect("login?msg=10");
            else{
                response.sendRedirect("login?msg=9");
            }
        }
    }
    
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    
    private String limpiar(String cadena){
        cadena = cadena.trim();
        cadena = cadena.replace("'", "");
        return cadena;
    }
    // </editor-fold>
}
