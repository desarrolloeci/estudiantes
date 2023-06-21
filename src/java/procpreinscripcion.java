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
public class procpreinscripcion extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        	throws IOException, ServletException {

        Estudiante          est ;
        PrintWriter         out = response.getWriter();
        HttpSession         sesion;
        Integer             nc ;
        int                 ncampos, i ;
        String              camas = new String(""), campr = new String("") ;
        String              codas, prio ;
        Vector              vcods = new Vector(),  vprs = new Vector() ;
        Vector              vresp ;

        sesion = request.getSession(false);
        
        if (sesion == null) {
            response.sendRedirect("login?msg=7") ;
        }
        else {
            est = (Estudiante) sesion.getAttribute("estClase") ;
            // Armar vector con asignaturas preinscritas
            nc = new Integer(request.getParameter("ncampos")); 
            ncampos = nc.intValue() ;
            for (i = 0; i < ncampos ; i++) {
                camas = "as" + i ;
                campr = "pr" + i ;
                codas = request.getParameter(camas) ;
                prio  = request.getParameter(campr) ;
                if (!codas.equals("")) {
                    vcods.addElement(codas) ;
                    vprs.addElement(prio) ;
                }
            }
            //Se miran las dos casilas libres (últimas)
            codas = request.getParameter("asf1") ;
            prio  = request.getParameter("priof1") ;
            if (!codas.equals("")) {
                vcods.addElement(codas) ;
                vprs.addElement(prio) ;
            }
            codas = request.getParameter("asf2") ;
            prio  = request.getParameter("priof2") ;
            if (!codas.equals("")) {
                vcods.addElement(codas) ;
                vprs.addElement(prio) ;
            }
            //  Invocamos procesamiento de la preinscripción
            vresp = est.prcPreinsc(vcods, vprs) ;
            
            //Armamos página de respuesta
            sesion.setAttribute("lisrep", vresp) ;
            response.sendRedirect("RespuestaPreinscripcion");
        }
     }
}
