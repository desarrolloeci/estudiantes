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
public class guardeEncuesta extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        	throws IOException, ServletException {

        PrintWriter out = response.getWriter();
        HttpSession sesion = request.getSession();
        String      prof = new String(""), asig = new String("") ;
        String      ngrp = new String(""), idgrp = new String("") ;      
        String      resp = new String(""), nomp = new String("R") ;
        String      obs = new String(""),  vr = new String("");
        int         i, ret, acum = 0 ;

        prof = request.getParameter("prof") ;
        asig = request.getParameter("asig") ;
        ngrp = request.getParameter("ngrp") ;
        idgrp = request.getParameter("idgrp") ;
        obs = request.getParameter("obser") ;
        obs = obs.replace("'", "");
        for ( i = 1; i <= 25; i++) {
            nomp = "R" + String.valueOf(i) ;
            vr = request.getParameter(nomp) ;
            acum = acum + Integer.parseInt(vr) ;
            resp = resp + vr ;
        }
        
        Estudiante est = (Estudiante) sesion.getAttribute("estClase") ;
        EstudMisc emisc = new EstudMisc(est.getIdEst()) ;            
        ret = emisc.ingEncuesta(idgrp, ngrp, prof, asig, obs, resp, String.valueOf(acum)) ; 
        if (ret > 0 )
            sesion.setAttribute("mensaje", "Su encuesta ha sido Aceptada") ;
        else
            sesion.setAttribute("mensaje", "Hubo algún problema diligenciando esta encuesta") ;
        response.sendRedirect("ListaEncuestas") ;
     }
}

