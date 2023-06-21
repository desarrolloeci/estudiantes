/*
 * procpgasigp.java
 *
 * Created on 14 de agosto de 2006, 11:26 AM
 * Procesa la seleccion de asignaturas a pagar en una orden de postgrado
 */

import java.io.*;
import java.io.IOException ;
import javax.servlet.*;
import javax.servlet.http.* ;
import java.util.Vector;
import estudiantes.Estudiante.Estudiante;
import estudiantes.Estudiante.EstudFin;

/**
 *
 * @author  Administrador
 * @version 
 */
public class procpgasigp extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        	throws IOException, ServletException {

        Estudiante          est ;
        PrintWriter         out = response.getWriter();
        HttpSession         sesion;
        Integer             nc ;
        int                 nasig, i ;
        String              idbib, pg ;
        Vector              vcods = new Vector(),  vpgs = new Vector() ;
        Vector              vresp ;

        sesion = request.getSession(false);
        if (sesion == null) {
            response.sendRedirect("login?msg=7") ;
        }
        else {
            est = (Estudiante) sesion.getAttribute("estClase") ;
            EstudFin efin = new EstudFin(est.getIdEst()) ;
            // Armar vector con asignaturas seleccionadas
            nc = new Integer(request.getParameter("casig")); 
            nasig = nc.intValue() ;
            for (i = 0; i < nasig ; i++) {
                pg = request.getParameter("c" + i ) ;
                idbib = request.getParameter("ida" + i ) ;
                if (!idbib.equals("")) {
                    vcods.addElement(idbib) ;
                    if (pg != null)
                        vpgs.addElement("0") ;
                    else
                        vpgs.addElement("-1") ;
                }
            }
            //  Invocamos la confirmacion de asignaturas para pago
            vresp = efin.prcpgasigp(vcods, vpgs) ;
            response.sendRedirect("ConfPagoPost");
            //response.sendRedirect("FormularioPagosPost") ;
        }
     }
}
