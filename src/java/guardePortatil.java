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
public class guardePortatil extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        	throws IOException, ServletException {

        PrintWriter out = response.getWriter();
        HttpSession sesion = request.getSession();
        String      mac = new String(""), marca = new String("") ;
        String      ref = new String(""), prc = new String("") ;      
        String      dip = new String("") ;
        int         ret ;

        mac = request.getParameter("mac") ;
        marca = request.getParameter("marca") ;
        ref = request.getParameter("ref") ;
        prc = request.getParameter("prc") ;
        
        Estudiante est = (Estudiante) sesion.getAttribute("estClase") ;
        EstudMisc emisc = new EstudMisc(est.getIdEst()) ;    
        
        dip = emisc.regPortatil(mac, marca, ref, prc) ; 
        sesion.setAttribute("mensaje", "Su solicitud de Registro de Portatil ha sido Aceptada") ;
        response.sendRedirect("http://regport.escuelaing.edu.co?mac=" +mac+ "&dip=" +dip+ "&est=" +est.getIdEst()) ;
        //response.sendRedirect("menuServEstud") ;
     }
}

