
/**
 *
 * @author  J.García H.Serrano
 * @version 
 */

import java.io.*;
import java.text.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.* ;
import estudiantes.baseDatos.BaseDatos ;
import estudiantes.configuracion.configECI;

public class horAsig extends HttpServlet
{    
    configECI cfgEci = new configECI();
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {  
        BaseDatos bd = new BaseDatos();
        String nomParam, opcion = new String(), usuario, iden, ruta, tmp;
        Integer idCE;
        PrintWriter out = response.getWriter(); 
        response.setContentType("text/html");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">") ;
        out.println("</head>") ;
        out.println("<p>");
        out.println("<body>");
        HttpSession sesion;
        sesion = request.getSession(false);
        if (bd.conectar()) {
            //out.println("<center><b>Horario de Asignatura</b></center><br>");
            despCupoInt(out, bd) ;
            bd.desconectarBD();
        }
               
            else
            out.println("No se pudo conectar " + bd.getMensajeBD());	
            out.println("</p>");	
            out.println("</body>");
            out.println("</html>") ;
    }   
    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {  
        BaseDatos bd = new BaseDatos();
        String nomParam, opcion = new String(), usuario, iden, ruta, tmp;
        Integer idCE;
        PrintWriter out = response.getWriter(); 
        response.setContentType("text/html");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">") ;
        out.println("</head>") ;
        out.println("<p>");
        out.println("<body>");
        HttpSession sesion;
        sesion = request.getSession(false);
        configECI cfgEci = new configECI();  

        if (bd.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg())) {
            //out.println("<center><b>Horario de Asignatura</b></center><br>");
            despCupoInt(out, bd) ;
            bd.desconectarBD();
        }
               
            else
            out.println("No se pudo conectar " + bd.getMensajeBD());	
            out.println("</p>");	
            out.println("</body>");
            out.println("</html>") ;
    }   

    public void despCupoInt(PrintWriter out, BaseDatos bd) {
        String consulta = new String();			
    	Vector  lisnom = new Vector() ;
		
       /* consulta=new String(" select registro.asignatura.id_asig, nom_asig, cod_asig,  " +
        "  num_ulas_a, num_ulas_b, count(*) PREINS " +
	"  from   registro.asignatura, registro.preins_int " +
	"  where registro.asignatura.id_asig *= registro.preins_int.id_asig  and " +
        "  num_ulas_b > 0 and tipo_asig = 'N'  " +
        " group by registro.asignatura.id_asig, nom_asig, cod_asig,  " +
        "  num_ulas_a, num_ulas_b " +
        " order by nom_asig " );     */
        consulta=new String(" select registro.asignatura.id_asig, nom_asig, cod_asig, " +
                "   num_ulas_a, num_ulas_b, count(*) PREINS " +
                "   from registro.asignatura LEFT OUTER JOIN registro.preins_int ON registro.asignatura.id_asig = registro.preins_int.id_asig    " +
                "   where num_ulas_b > 0 and tipo_asig = 'N'    " +
                "   group by registro.asignatura.id_asig, nom_asig, cod_asig, num_ulas_a, num_ulas_b " +
                "   order by nom_asig " );

          
        //out.println(consulta);
        lisnom.addElement("Id.Interno") ;				
        lisnom.addElement("Asignatura") ;				
        lisnom.addElement("Código") ;	
        lisnom.addElement("Créditos") ;				
        lisnom.addElement("CupoMáximo") ;				
        lisnom.addElement("Preinscritos") ;				
       
        Abstracta.despliegueTabla(out, bd, consulta, lisnom, "Cupos de Asignaturas en Intermedio") ;
    }
    
}
