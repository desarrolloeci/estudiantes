/*
 * loginReing.java
 *
 * Created on 11 de septiembre de 2003, 22:01
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

public class loginReing extends  HttpServlet {
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        BDLogin bd = new BDLogin();
        PrintWriter out = response.getWriter();
        HttpSession sesion;
        String ref  = new String(""), idEst = new String(""), estado = new String("");
        String clave = new String("P") ;
        int p ;
        long val, valor, refpago, cantCorrec = 0 ;
        String consulta, existe, tmp, infpago, dat;
        
        response.setContentType("text/html");
        configECI1 cfgEci = new configECI1(); 

        if (bd.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg())) {
            ref = new String(request.getParameter("ref"));  
            idEst = new String(request.getParameter("idest"));     
            clave = new String(request.getParameter("clave"));                 
            infpago = bd.existeNumRef(ref) ;
            
            if (!infpago.equals("0.00"))
                valor = (new Integer(infpago)).longValue() ;
            else
                valor = 0 ;

            if ( valor >= 62000 ) {
                dat = bd.claveNum(String.valueOf(idEst)) ;
                if (dat.equals(clave) && !dat.equals("") && !clave.equals("")){
                    sesion = request.getSession();
                    sesion.setAttribute("idest", String.valueOf(idEst));   
                    sesion.setAttribute("usuario", String.valueOf(ref));  
                    response.sendRedirect("../jsp/formulariorein.jsp") ;
                }
                else 
                    response.sendRedirect("../jsp/formaerrorreing.jsp") ;     
            }
            else 
                response.sendRedirect("../jsp/formaerrorpago.jsp") ;	           
            bd.desconectar();
        }
        else
            response.sendRedirect("../jsp/formaerrorbd.jsp") ;	
    }
}
