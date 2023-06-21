/*
 * GuardaDatos.java
 *
 * Created on April 23, 2003, 9:57 AM
 */
import java.io.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import estudiantes.Estudiante.monitor;
import estudiantes.baseDatos.BdMonitor;
import estudiantes.configuracion.configECI;

/**
 *
 * @author  Administrador
 * @version 
 */
public class guardamonitor extends HttpServlet {

    private String  carnet = null, nombre = null, clanum = null, semestre = null;  
    private String  ultdir = null;    
    private String  programa = null;        
    private String  ulttel = null;        
    private String  codasig = null;    
    private String  codasig1 = null;        
    private String  ban = null;    
    private String  parentesco = null;                
    private String  dia;
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        	throws IOException, ServletException {
                    
        PrintWriter     out = response.getWriter();
        String cadena="asig", cadena1="prof", cadena2="sem", codasignatura="", per="2005-2";
        String cad = "", variable, actualiza, actualiza1, actualiza2;
        String arregloa[]=new String[136];
        String arreglop[]=new String[136];        
        String arreglos[]=new String[136];  
        String asig = "";
        int numsol, respuesta, respuesta1, respuesta2, numsem, ban=0, n, men=0;
       
        HttpSession session = request.getSession(true);
    
      String carnet = new String((String)session.getAttribute("carnet"));                  
      String semestre = new String((String)session.getAttribute("semestre"));   
                    
          monitor mon = new monitor(carnet, out) ;  
          numsem = Integer.parseInt(semestre);
          //numsem = 1;
          
            response.setContentType("text/html");
            out.println("<html>");
            out.println("<head>");            
            out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">") ;                    
            out.println("<head>");
            out.println("<body>");    
    if (numsem < 4){
        ban = 1; 
        out.println("<p>&nbsp;</p><p><b><center><h4>Recuerde que esta solicitud de monitorias, es para estudiantes que esten como m�nimo en cuarto semestre ponderado. </h4></center></b>"); 
    }
    else {
        for ( int j = 1 ; j < 4 ; j++ ){
            cad=String.valueOf(j);
            variable=(String)cadena.concat(cad);         
            arregloa[j] = request.getParameter(variable);
            variable=(String)cadena1.concat(cad);         
            arreglop[j] = request.getParameter(variable);
            variable=(String)cadena2.concat(cad);         
            arreglos[j] = request.getParameter(variable);
            //out.println("<p>arreglo : " +arregloa[j]+ "-" +arreglop[j]+ "-"+arreglos[j]);
            //int n = (new Integer(arreglos[j])).intValue();
            n = arreglos[j].compareTo(per);            
            //out.println("<p>valor n: " +n);
            if (n > 0){
               ban = 1; 
               men = 0;
               out.println("<p>&nbsp</p><p><b><center><h4>El per�odo acad�mico capturado no corresponde, favor envie nuevamente la solicitud para esta asignatura.</h4></center></b></p>");  
            }
            else{
            if (!(arregloa[j].equals("N")) && !(arreglop[j].equals("")) && !(arreglos[j].equals(""))){
              ban = 1;  
              BdMonitor bdmon = new BdMonitor() ;
              configECI cfgEci = new configECI();                                                                
              if (bdmon.conectar(cfgEci.getUsuarioBdApolo(), cfgEci.getPasswdBdApolo())){     
                            
                if (!(mon.getNumSol().equals("0"))) {                   	
                      //out.println("<p>Tamano numsol:" + mon.getNumSol()); 
                      numsol = Integer.parseInt(mon.getNumSol());
                      numsol = numsol + 1;
                      //out.println("<p>numsol inc:" + numsol);                       
                      actualiza = new String("update apolo.n_sol_monitor set num_sol = " + numsol + " where id_est = " + carnet +" ");
                      respuesta= bdmon.actualizar(actualiza);
               }
                else{
                     numsol = 1;
                     actualiza1 = new String("insert into apolo.n_sol_monitor values ("+carnet+", "+numsol+")");
                     respuesta1= bdmon.actualizar(actualiza1);                            
               }
                Vector codasig = mon.getIdAsig(arregloa[j], out);
                //out.println("<p>Asignatura:" + arregloa[j]);
                for ( int i = 0 ; i < 1 ; i++ ){
                    //Vector codigo = (Vector)codasig.elementAt(i) ; 
                     //out.println("<p>tamano codasig:" + codasig.size());  
                     if (codasig.size() == 0){
		         //coloco identificadores para asignaturas no existentes Ejem:if (strcmp($nasig,"SL2")==0)
			 codasignatura="20010";
                         actualiza2 = new String("insert into apolo.sol_monitor values ("+carnet+", "+numsol+", "+codasignatura+", '"+arreglop[j].toUpperCase()+"', '"+arreglos[j]+"', '', getdate())");                            
                         respuesta2= bdmon.actualizar(actualiza2);                        
                         //out.println("<p>Insert:" + actualiza2);  
                     }    
                     else{
                         Vector codigo = (Vector)codasig.elementAt(i) ; 
                         actualiza2 = new String("insert into apolo.sol_monitor values ("+carnet+", "+numsol+", "+codigo.elementAt(0)+", '"+arreglop[j].toUpperCase()+"', '"+arreglos[j]+"', '', getdate())");                            
                         respuesta2= bdmon.actualizar(actualiza2);   
                         //out.println("<p>Insert2:" + actualiza2);  
                     }
                     if (respuesta2==0) 
                         out.println("<p><b><center><h4>EN EL MOMENTO SUS DATOS NO PUEDEN SER ALMACENADOS. INTENTE MAS TARDE.</h4></center></b>");                 
                     else{
                         //out.println("<p>&nbsp;</p><p><b><center><h4>SU INFORMACION FUE ENVIADA. GRACIAS.</h4></center></b>");                                                 
                         men = 1;
                         if (asig.equals(""))
                             asig = arregloa[j];
                         else
                             asig = asig + "," + arregloa[j];
                                                                              
                     }
                     
                     }                  
                        
                bdmon.desconectar() ;                         
                }
              else
                  out.println("<p><b><center><h4>NO SE CONECTO A LA BD.</h4></center></b>");                
            } 
            }    
 
    } 
     if (ban == 0)
          out.println("<p>&nbsp;</p><p><b><center><h4>Debe proporcionar todos los datos.</h4></center></b>");                        
    }
    if (men == 1){
        session.setAttribute("asig", asig);  
        response.sendRedirect("correctomonitorias");   
    }                    
    /*      out.println("<p>&nbsp;</p><p><b><center><h4>SU INFORMACION FUE ENVIADA. GRACIAS.</h4></center></b>");                                                                  
    out.println("<center><table width=\"45%\" border=\"0\" height=\"17\">");
    out.println("<tr> ");
    out.println("<td colspan=\"5\">&nbsp;</td>");
    out.println("</tr> ");  
    out.println("<tr> ");
    out.println("<td colspan=\"5\">&nbsp;</td>");
    out.println("</tr> "); 
    out.println("<tr> ");
    out.println("<td width=\"27%\" height=\"14\">"); 
    out.println("<div align=\"center\"><font size=\"1\"><b><font face=\"Verdana, Arial, Helvetica, sans-serif\">"); 
    out.println("<a href=\"monitorias\">ANTERIOR</a> </font></b></font></div>");                   
    out.println("</td>");
    out.println("<td width=\"4%\" height=\"14\" align=\"center\" valign=\"middle\">"); 
    out.println("<div align=\"center\">|</div>");
    out.println("</td>");
    out.println("<td width=\"22%\" height=\"14\">"); 
    out.println("<div align=\"center\"><font size=\"1\"><b><font face=\"Verdana, Arial, Helvetica, sans-serif\">"); 
    out.println("<a href=\"menuServEstud\">INICIO</a></font></b></font></div>");
    out.println("</td>");
    out.println("<td width=\"4%\" height=\"14\" align=\"center\" valign=\"middle\">"); 
    out.println("<div align=\"center\"><b>|</b></div>");
    out.println("</td>");
    out.println("<td width=\"43%\" height=\"14\">"); 
    out.println("<div align=\"center\"><font size=\"1\"><b><font face=\"Verdana, Arial, Helvetica, sans-serif\">");
    out.println("<a href=\"LogOutEst\">CERRAR SESION</a></font></b></font></div>");
    out.println("</td>");
    out.println("</tr>");
    out.println("</table></center>");*/
    out.println("</body>");
    out.println("</html>");
  }
 

}
