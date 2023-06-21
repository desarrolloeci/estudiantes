/*
 * guardePortatil.java
 *
 * Created on 18 de octubre de 2006, 11:52 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */


import java.io.*;
import java.io.IOException ;
import javax.servlet.*;
import javax.servlet.http.* ;
import java.util.Vector;
import estudiantes.Estudiante.Estudiante;
import estudiantes.Estudiante.EstudMisc;

/**
 *
 * @author  Administrador
 * @version 
 */
public class canTurno extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        	throws IOException, ServletException {

        PrintWriter out = response.getWriter();
        HttpSession sesion = request.getSession();
        int   nt = 0, i ;
        String      nturnos = new String("") ;
        String      idt = new String(""), ci = new String() ;     
        Vector      lista = new Vector() ;
        EstudMisc emisc ;
        Estudiante est ;

        nturnos = request.getParameter("ntur") ;
        nt = Integer.parseInt(nturnos) ;
        est = (Estudiante) sesion.getAttribute("estClase") ;
        for (i = 0; i < nt; i++) {
            ci = request.getParameter("t" + i ) ;
            if (ci != null )
                lista.addElement(ci) ;
        }
        if (lista.size() > 0 ) {
            if (est != null)
                emisc = new EstudMisc(est.getIdEst()) ;            
            else
                emisc = new EstudMisc("894") ;            
            emisc.cancelTurnos(lista) ; 
        }
        if (est != null)
           response.sendRedirect("SolicitudTurno") ;
        else
           response.sendRedirect("SolSala") ;
            
     }
}

