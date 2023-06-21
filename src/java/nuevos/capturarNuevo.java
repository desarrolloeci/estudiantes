/*
 * capturarIdiomas.java
 *
 * Created on 24 de febrero de 2003, 19:13
 */

package nuevos;
import java.io.*;
import java.text.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.* ;
import estudiantes.baseDatos.BaseDatosadm;
import estudiantes.configuracion.configECI1;


/**
 *
 * @author  Julián García
 * @version 1.0
 */
public class capturarNuevo extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {
        			
        BaseDatosadm bd = new BaseDatosadm();
        String usuario, consulta, resp;
        PrintWriter out = response.getWriter();
        HttpSession  sesion ;
        Nuevo asp ;

        response.setContentType("text/html");
        sesion = request.getSession(false);
        configECI1 cfgEci = new configECI1(); 

        if (bd.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg())) {
            asp = new Nuevo(request) ;
            resp = asp.inserteBD(bd);
            
            if (resp.indexOf("Error") >= 0 )
                response.sendRedirect("../jsp/formaerrorbd.jsp") ;                  
            else {
                sesion = request.getSession() ;
                sesion.setAttribute("ref", resp) ;
                bd.desconectarBD();
                response.sendRedirect("../jsp/mensajeFinal.jsp") ;	
            }
        }
        else
            response.sendRedirect("../jsp/formaerrorbd.jsp") ;  
    }
}
