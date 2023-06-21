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
public class procpreintermedio extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        	throws IOException, ServletException {

        Estudiante          est ;
        PrintWriter         out = response.getWriter();
        HttpSession         sesion;
        Integer             nc ;
        int                 ncampos, i, crinsc = 0, crasig = 0, ret, crmax = 0, amax = 0, nas = 0;
        String              camas = new String(""), tmp = new String("") ;
        String              codas, oper = new String(""), op = new String("") ;
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
                codas = request.getParameter(camas) ;
                oper = "op" + i ;
                op = request.getParameter(oper) ;
                if (!codas.equals("") && op.equals("0") ) {
                    camas = "cred" + i ;
                    codas = request.getParameter(camas) ;
                    crinsc = crinsc + (Integer.valueOf(codas)).intValue() ;
                }
                else if (op.equals("1") ) {
                    ret = est.borrarAsigPreintermedio(est.getIdEst(), codas) ;
                    if (ret > 0)
                        sesion.setAttribute("mensaje", "Preinscripción Eliminada") ;
                    else
                        sesion.setAttribute("mensaje", "No puede eliminar asignatura pagada") ;
                }
            }
            //Se miran la siguiente libre (última)
            if(request.getParameter("asf1") != null)
                codas = request.getParameter("asf1");
            else
                codas = "0";
            op = request.getParameter("nasig") ;
            if (!codas.equals("0") && (op.equals("0") || op.equals("1"))) {
                op = request.getParameter("nasig") ;
                nas = (Integer.valueOf(op)).intValue() ;
                tmp = request.getParameter("amax") ;
                amax = (Integer.valueOf(tmp)).intValue() ;
                if ( (op.equals("0") || op.equals("1")) && nas < amax ) {
                    op = request.getParameter("opf1") ;
                    if (op.equals("1")) {
                        codas = request.getParameter("asf1") ;
                        tmp = request.getParameter("cref1") ;
                        crasig = (Integer.valueOf(tmp)).intValue() ;
                        tmp = request.getParameter("crmax") ;
                        crmax = (Integer.valueOf(tmp)).intValue() ;
                        tmp = request.getParameter("cupf1") ;
                        if (crinsc + crasig <= crmax ) {
                            ret = est.inscAsigPreintermedio(est.getIdEst(), codas) ;
                            if (ret <= 0 ) {
                                sesion.setAttribute("mensaje", "Ya no hay cupo o NO puede tomar la asignatura deseada") ;
                            } else {
                                sesion.setAttribute("mensaje", "Preinscripción Realizada") ;
                            }
                        } else {
                            sesion.setAttribute("mensaje", "Sobrepasa la Carga de Créditos Permitida") ;
                        }
                    }
                } else {
                    sesion.setAttribute("mensaje", "Ya tiene la Carga de Asignaturas Permitida") ;                
                }
            }
            response.sendRedirect("preintermedio");
        }
     }
}
