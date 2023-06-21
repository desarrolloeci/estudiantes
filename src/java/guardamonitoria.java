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
public class guardamonitoria extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        	throws IOException, ServletException {

        Estudiante          est ;
        PrintWriter         out = response.getWriter();
        HttpSession         sesion;      
        String              as1, as2, as3, nro ;         
        Vector              vresp ;
        String numsol, periodo;
        int nsol, n = 0 ;
        sesion = request.getSession(false);
        
      if (sesion == null) {
            response.sendRedirect("login?msg=7") ;
        }
        else {
            est = (Estudiante) sesion.getAttribute("estClase") ;
            // Obtenemos variables           
            as1 = request.getParameter("asig1");
            as2 = request.getParameter("asig2");
            as3 = request.getParameter("asig3");
            nro = request.getParameter("nro");
            numsol = request.getParameter("nsol");
            periodo = request.getParameter("per");
            //Se verifica que no pueda enviar mas de tres solicitudes
             if (!as1.equals("0"))
                 n = n + 1 ;
             if (!as2.equals("0"))
                 n = n + 1 ;
             if (!as3.equals("0"))
                 n = n + 1 ;
            nsol  = (Integer.valueOf((String) numsol)).intValue() ;

            if( nsol < 3 ){
                 if ((nsol == 1) && (n == 3))
                    as3 = "0";
                 if ((nsol == 2) && (n == 3)){
                     as2 = "0";
                     as3 = "0";
                 }
                 if ((nsol == 2) && (n == 2)){
                     if(!as1.equals("0"))  {
                        as2 = "0";
                        as3 = "0";
                     }
                     else
                     if (!as2.equals("0")){
                         as1 = "0" ;
                         as3 = "0" ;
                     }
                     else
                     if (!as3.equals("0")){
                         as1 = "0" ;
                         as2 = "0" ;                     
                     }
                 }

                vresp = est.prcMonitorias(as1, as2, as3, nro, periodo) ;
            
                 //Armamos página de respuesta
                sesion.setAttribute("lisrep", vresp) ;
                //response.sendRedirect("RespuestaMonitorias");
                response.sendRedirect("Monitorias");
            }
            else
                response.sendRedirect("RespuestaMonitorias");
        }
     }
}
