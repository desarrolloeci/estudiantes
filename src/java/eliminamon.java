/*
 * procpreinscripcion.java
 *
 * Created on 2 de marzo de 2004, 11:26 AM
 */

import java.io.*;
import java.io.IOException ;
import javax.servlet.*;
import javax.servlet.http.* ;
import java.util.Vector;
import estudiantes.Estudiante.Estudiante;

/**
 *
 * @author  Administrador
 * @version 
 */
public class eliminamon extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        	throws IOException, ServletException {

        Estudiante          est ;
        PrintWriter         out = response.getWriter();
        HttpSession         sesion;            
        Vector              vresp ;
        String[] checEli;
        sesion = request.getSession(false);
        
      if (sesion == null) {
            response.sendRedirect("login?msg=7") ;
        }
        else {
           est = (Estudiante) sesion.getAttribute("estClase") ;
           checEli = request.getParameterValues("checEli");
           if(checEli == null){
             response.sendRedirect("Monitorias");
            //out.println("<p><b>No se selecciono asignatura a eliminar de la solicitud.</b></p>");
           }
           else{
           int longChec = checEli.length;
           for ( int i=0 ; i < longChec ; i++ ){
            if (checEli[i].compareTo("null")!= 0){
               vresp = est.prcEliMonitorias(checEli[i]) ;
					}
					 }
            //sesion.setAttribute("lisrep", vresp) ;
            response.sendRedirect("Monitorias");
            //response.sendRedirect("RespuestaMonitorias");
        }
        }
         //Armamos página de respuesta

     }
}
