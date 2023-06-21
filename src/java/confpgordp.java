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
import estudiantes.baseDatos.BdEstfin;
import estudiantes.configuracion.configECI;


/**
 *
 * @author  Administrador
 * @version 
 */
public class confpgordp extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        	throws IOException, ServletException {

        PrintWriter out = response.getWriter();
        HttpSession sesion;
        String      ord = new String(""), val = new String("") ;
        String      retc = new String(""), trsta = new String("") ;          
        String      fecb = new String(""), codb = new String("") ;          
        String      nach = new String(""), naut = new String("") ;          
        int         ret ;

        ord = request.getParameter("TicketId") ;
        retc = request.getParameter("ReturnCode") ;
        trsta = request.getParameter("TransactionState") ;
        fecb = request.getParameter("BankProcessDate") ;
        codb = request.getParameter("Banco") ;
        nach = request.getParameter("TransactionCycle") ;
        naut = request.getParameter("TrazabilityCode") ;
        val = request.getParameter("TransactionValue") ;
        
        BdEstfin bdEst = new BdEstfin() ;
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());        
        ret = bdEst.confordp(ord, retc, trsta, fecb, codb, nach, naut, val) ; 
        bdEst.desconectar() ;  
     }
}
