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
import estudiantes.baseDatos.BdEstudiante;
import estudiantes.configuracion.configECI;
/**
 *
 * @author  Administrador
 * @version 
 */
public class procingles extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        	throws IOException, ServletException {

        Estudiante          est ;
        PrintWriter         out = response.getWriter();
        HttpSession         sesion;
        Vector              vresp ;
        String              idasig, actualizar, consult ;
        String                 ban = "0";
        
        sesion = request.getSession(false);
        
        if (sesion == null) {
            response.sendRedirect("login?msg=7") ;
        }
        else {
            est = (Estudiante) sesion.getAttribute("estClase") ;  
            idasig = request.getParameter("idasig");  
            BdEstudiante bdEst = new BdEstudiante() ;
            configECI cfgEci = new configECI();      
            Vector infoInsc = est.getInfoInsc(est.getIdEst());         
            
            if (infoInsc.size() > 0){
                Vector info = (Vector) infoInsc.elementAt(0) ;
                sesion.setAttribute("idasig", info.elementAt(0)) ;  
                sesion.setAttribute("ban", ban) ;                  
                response.sendRedirect("../../jsp/resppreinsing.jsp");
            }
            else {                
                if (bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg())){
                    ban = "1";
                    actualizar = new String("insert into registro.pre_internet " +
                                " (id_est, id_asig, estado, prio, fec) "  +        
                                " values (" + est.getIdEst()+ ", " + idasig + ", 0, 0, getdate() ) " )  ;                

                   int resultado= bdEst.actualizar(actualizar); 
                   //out.println("<p>resultado:" +resultado); 
                   if (resultado == 0) 
                        out.println("<p>Se produjo un error y los datos no fueron almacenados correctamente</p>");             
                    else {
                        sesion.setAttribute("ban", ban) ;  
                        sesion.setAttribute("idasig", idasig) ;                                                
                        response.sendRedirect("../../jsp/resppreinsing.jsp");
                    }
                }
            }
            bdEst.desconectar() ;     
        }
     }
}
