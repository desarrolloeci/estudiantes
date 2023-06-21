/*
 * loginAsp.java
 *
 * Created on 20 de febrero de 2003, 11:47
 */
package nuevos;

import java.io.*;
import java.text.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.* ;
import estudiantes.baseDatos.BaseDatosadm;
import estudiantes.baseDatos.BDLogin;
import estudiantes.configuracion.configECI1;

/**
 *
 * @author  Julián García
 * @version 1.0
 */

public class loginAsp extends  HttpServlet {
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        BDLogin bd = new BDLogin();
        PrintWriter out = response.getWriter();
        HttpSession sesion;
        String ref  = new String(""), idEst = new String(""), nsol = new String("");
        String doc = new String("P") ;
        int p ;
        long val, valor, refpago, cantCorrec = 0 ;
        String consulta, existe, tmp, infpago, dat;
//Modif cjchocon        
	sesion = request.getSession(false);
//Fin Modif cjchocon        
        response.setContentType("text/html");
        configECI1 cfgEci = new configECI1(); 

        if (bd.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg())) {
            ref = new String(request.getParameter("ref"));  
            doc = new String(request.getParameter("doc"));     
            
            infpago = bd.existeNumRef(ref, doc) ;
            
            if (!infpago.equals("0.00"))
                valor = (new Integer(infpago)).longValue() ;
            else
                valor = 0 ;

            if ( valor >= 62000 ) {
                dat = bd.estadoInsc(String.valueOf(ref)) ;
                p = dat.indexOf("$") ;
                sesion = request.getSession();
                sesion.setAttribute("usuario", String.valueOf(ref));     
                
                if (p >= 0) {
                    idEst = new String(dat.substring(0, p)) ;
                    nsol = new String(dat.substring(p+1)) ;                    
                    sesion.setAttribute("ident", idEst);
                    sesion.setAttribute("nsol", nsol);
                }
                if ( idEst.equals(""))
                    response.sendRedirect("../jsp/Pregrado1.jsp") ;
                else 
                    response.sendRedirect("../jsp/citacion.jsp") ;     
            }
            else 
                response.sendRedirect("../jsp/formaerrorpago.jsp") ;	           
            bd.desconectar();
        }
        else
            response.sendRedirect("../jsp/formaerrorbd.jsp") ;	
    }
}
