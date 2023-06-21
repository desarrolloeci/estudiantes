/*
 * LogOut.java
 *
 * Created on 29 de mayo de 2002, 11:35 AM
 */

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.* ;
//import javax.mail.*;
import java.util.Properties;

/**
 *
 * @author  Claudia J. Choconta Vargas
 * @version 
 */
public class LogOutEst extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response)
        	throws IOException, ServletException {
        
        HttpSession         sesion;
        PrintWriter         out = response.getWriter();
      
        sesion = request.getSession(false);
        if (sesion != null){
            sesion.removeAttribute("carnet");
            sesion.removeAttribute("nombre");
            sesion.removeAttribute("iddpto");
            sesion.removeAttribute("clanum");
            sesion.removeAttribute("estClase");
            sesion.invalidate();
        }
        /* Sesion Cerrada */
        //response.sendRedirect("login?msg=4") ;
        response.sendRedirect("http://www.escuelaing.edu.co/es/comunidad/estudiantes") ;
    }
}
