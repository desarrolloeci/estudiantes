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
public class asigTurno extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        	throws IOException, ServletException {

        PrintWriter out = response.getWriter();
        HttpSession sesion = request.getSession();
        String      fec = new String(""), hor = new String(""), fform = new String() ;
        String      soft = new String("") ;      
        String      eqret = new String() ;
        String      tipo = new String() ;       
        String      sala = new String() ;       
        Estudiante est ;

        fec = request.getParameter("fecha") ;
        fform = fec.substring(0, 4) + "-" + fec.substring(8, 10) + "-" + fec.substring(5,7) ;
        hor = request.getParameter("hora") ;
        soft = request.getParameter("soft") ;
        tipo = request.getParameter("tipo") ;
        
        if (tipo.equals("T")) {
            est = (Estudiante) sesion.getAttribute("estClase") ;
            EstudMisc emisc = new EstudMisc(est.getIdEst()) ;    

            eqret = emisc.getTurno(fform, hor, soft, est.getDpto()) ; 
            if (!eqret.equals("0"))
                sesion.setAttribute("mensaje", "Solicitud de Turno Aceptada.") ;
            else
                sesion.setAttribute("mensaje", "No hay equipo disponible o ya tiene turno a esa hora.") ;
            response.sendRedirect("SolicitudTurno") ;
        } else {
            est = new Estudiante(new String("894"), out) ;
            EstudMisc emisc = new EstudMisc(est.getIdEst()) ;    
            sala = request.getParameter("sala") ;

            eqret = emisc.getSala(fform, hor, soft, sala) ; 
            if (!eqret.equals("0"))
                response.sendRedirect("SolSala?msj=Solicitud de Turno Aceptada") ;
                //sesion.setAttribute("mensaje", "Solicitud de Turno Aceptada.") ;
            else
                response.sendRedirect("SolSala?msj=La sala no está disponible") ;
                //sesion.setAttribute("mensaje", "No hay equipo disponible o ya tiene turno a esa hora.") ;
            //response.sendRedirect("SolSala") ;
        }
     }
}

