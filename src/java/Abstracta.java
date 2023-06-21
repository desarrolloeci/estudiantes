import java.io.* ;
import java.util.* ;
import estudiantes.baseDatos.BaseDatos ;
//import estudiantes.baseDatos.BdGeneral ;

public class Abstracta {
    public static void despliegueTabla(PrintWriter out, BaseDatos bd, 
    					String consulta, Vector lisnom, String desc) {
    	Vector lista ;
    	Vector obj = new Vector() ;
    	int indice, cont ;
 		
        lista = bd.consultar(consulta, lisnom.size());
        out.println("<b><center><u><font color=\"#800000\">" + desc + "</font></u></center></b><br>");			
        if (lista.size() <= 0)
            out.println("<br>No se encontraron registros en la base de datos <br>");
        else {
            out.println("<table border=\"1\" cellspacing=\"0\" width=\"100%\">") ;
            out.println("<tr>") ;
            for (indice = 0; indice < lisnom.size(); indice++) 
                out.println("<td><font color=\"#800000\">" + (String)lisnom.elementAt(indice) + "</font></td>") ;
            out.println("</tr>") ;								
            for (indice = 0; indice < lista.size(); indice++) {
                obj = (Vector) lista.elementAt(indice);
                out.println("<tr>") ;				
                for (cont = 0; cont < obj.size(); cont++) 
                    out.println("<td>" + (String) obj.elementAt(cont) + "</td>");
                out.println("</tr>");
            }
            out.println("</table>") ;
        }   	
    }	

    public static void despliegueTablaEnc(PrintWriter out, BaseDatos bd, String consulta, Vector lisnom,
                                        String desc) {
    	Vector lista ;
    	Vector obj = new Vector() ;
    	int indice, cont ;
 		
        lista = bd.consultar(consulta, lisnom.size());
        out.println("<b><center><u><font color=\"#800000\">" + desc + "</font></u></center></b><br>");			
        if (lista.size() <= 0)
            out.println("<br>No se encontraron registros en la base de datos <br>");
        else {
            obj = (Vector) lista.elementAt(1);
            out.println("<b><center><u><font color=\"#800000\">" + (String)lisnom.elementAt(0) + ": " + (String) obj.elementAt(0) + "</font></u></center></b><br>");			

            out.println("<table border=\"1\" cellspacing=\"0\" width=\"100%\">") ;
            out.println("<tr>") ;
            for (indice = 1; indice < lisnom.size(); indice++) 
                out.println("<td><font color=\"#800000\">" + (String)lisnom.elementAt(indice) + "</font></td>") ;
            out.println("</tr>") ;								
            for (indice = 1; indice < lista.size(); indice++) {
                obj = (Vector) lista.elementAt(indice);
                out.println("<tr>") ;				
                for (cont = 1; cont < obj.size(); cont++) 
                    out.println("<td>" + (String) obj.elementAt(cont) + "</td>");
                out.println("</tr>");
            }
            out.println("</table><br><br>") ;
        }   	
    }	

    public static void despliegueTablaEnc(PrintWriter out, BaseDatos bd, String consulta, Vector lisnom,
                                        String desc, int colenc) {
    	Vector lista ;
    	Vector obj = new Vector() ;
    	int indice, cont, j ;
 		
        lista = bd.consultar(consulta, lisnom.size());
        out.println("<b><center><u><font color=\"#800000\">" + desc + "</font></u></center></b><br>");			
        if (lista.size() <= 0)
            out.println("<br>No se encontraron registros en la base de datos <br>");
        else {
            obj = (Vector) lista.elementAt(0);
            for ( j = 0; j < colenc; j++)
            out.println("<b><u><font color=\"#800000\">" + (String)lisnom.elementAt(j) + ":</u> " + (String) obj.elementAt(j) + "</font></b><br>");			

            out.println("<br><table border=\"1\" cellspacing=\"0\" width=\"100%\">") ;
            out.println("<tr>") ;
            for (indice = colenc; indice < lisnom.size(); indice++) 
                out.println("<td><font color=\"#800000\">" + (String)lisnom.elementAt(indice) + "</font></td>") ;
            out.println("</tr>") ;								
            for (indice = 0; indice < lista.size(); indice++) {
                obj = (Vector) lista.elementAt(indice);
                out.println("<tr>") ;				
                for (cont = colenc; cont < obj.size(); cont++) 
                    out.println("<td>" + (String) obj.elementAt(cont) + "</td>");
                out.println("</tr>");
            }
            out.println("</table><br><br>") ;
        }   	
    }	
    
    public static void despliegueTabAcc(PrintWriter out, BaseDatos bd, String consulta, Vector lisnom,
                                        String desc, String accion) {
    	Vector lista ;
    	Vector obj = new Vector() ;
    	int indice, cont ;
 		
        lista = bd.consultar(consulta, lisnom.size());
        out.println("<b><center><u><font color=\"#800000\">" + desc + "</font></u></center></b><br><br>");			
        if (lista.size() <= 0)
            out.println("<br>No se encontraron registros en la base de datos <br>");
        else {
            out.println("<table border=\"1\" cellspacing=\"0\" width=\"100%\">") ;
            out.println("<tr>") ;
            for (indice = 0; indice < lisnom.size(); indice++) 
                out.println("<td><font color=\"#800000\">" + (String)lisnom.elementAt(indice) + "</font></td>") ;
            out.println("<td><font color=\"#800000\">Acción</font></td>") ;
            out.println("</tr>") ;								
            for (indice = 0; indice < lista.size(); indice++) {
                obj = (Vector) lista.elementAt(indice);
                out.println("<tr>") ;				
                for (cont = 0; cont < obj.size(); cont++) 
                    out.println("<td>" + (String) obj.elementAt(cont) + "</td>");
                out.println("<td><a href=\"../servlet/" + accion + (String)obj.elementAt(0) + "\">Ver detalle</td>");
                out.println("</tr>");
            }
            out.println("</table><br><br>") ;
        }   	
    }	

    public static void despliegueTabLista(PrintWriter out, BaseDatos bd, String consulta, Vector lisnom,
                                        String desc, String accion, int indAcc) {
    	Vector lista ;
    	Vector obj = new Vector() ;
    	int indice, cont ;
 		
        lista = bd.consultar(consulta, lisnom.size());
        out.println("<b><center><u><font color=\"#800000\">" + desc + "</font></u></center></b><br><br>");			
        if (lista.size() <= 0)
            out.println( "<br>No se encontraron registros en la base de datos <br>");
        else {
            out.println("<table border=\"1\" cellspacing=\"0\" width=\"100%\">") ;
            out.println("<tr>") ;
            for (indice = 0; indice < lisnom.size(); indice++) 
                out.println("<td><font color=\"#800000\">" + (String)lisnom.elementAt(indice) + "</font></td>") ;
            out.println("</tr>") ;								
            for (indice = 0; indice < lista.size(); indice++) {
                obj = (Vector) lista.elementAt(indice);
                out.println("<tr>") ;				
                for (cont = 0; cont < obj.size(); cont++) 
                    if ( cont != indAcc )
                        out.println("<td>" + (String) obj.elementAt(cont) + "</td>");
                    else
                        out.println("<td><a href=\"../servlet/" + accion + (String)obj.elementAt(0) + "\">" + (String) obj.elementAt(cont) + "</td>");
                out.println("</tr>");
            }
            out.println("</table><br><br>") ;
        }   	
    }
    
    /*public static void despliegueTablaHor(PrintWriter out, BaseDatos bd,
    					String consulta, String consulta2, Vector lisnom, String desc) {*/
    public static void despliegueTablaHor(PrintWriter out, BaseDatos bd, String consulta,Vector lisnom, String desc, ArrayList<String> params) {
    	Vector lista ;
    	Vector obj = new Vector() ;
    	int indice, cont ;
 //consulta =con profesor   consulta2=sin profesor
        //lista = bd.consultar(consulta2, lisnom.size());
        lista = bd.consultar(consulta, lisnom.size(), params);
        
        /* if (lista.size()==0){
             lisnom.addElement("Profesor");
             lista = bd.consultar(consulta, lisnom.size());
         }*/

         
        out.println("<b><center><u><font color=\"#800000\" size=\"2\" face=\"Verdana, Arial, Helvetica, sans-serif\">" + desc + "</font></u></center></b><br>");			
        if (lista.size() <= 0)
            out.println("<br><strong><font size=\"2\" face=\"Verdana, Arial, Helvetica, sans-serif\">No se encontraron registros en la Base de Datos </font></strong><br>");
        else {

            out.println("<table border=\"1\" cellspacing=\"0\" width=\"100%\"  align=\"center\" class=\"texto\"  bordercolor=\"#CCCCCC\">") ;
            out.println("<tr>") ;
            for (indice = 0; indice < lisnom.size(); indice++) 
                out.println("<td><font color=\"#800000\" size=\"2\" face=\"Verdana, Arial, Helvetica, sans-serif\">" + (String)lisnom.elementAt(indice) + "</font></td>") ;
            out.println("</tr>") ;								
            for (indice = 0; indice < lista.size(); indice++) {
                obj = (Vector) lista.elementAt(indice);
                out.println("<tr>");		
                for (cont = 0; cont < obj.size(); cont++) 
                    out.println("<td>" + (String) obj.elementAt(cont) + "</td>");
                out.println("</tr>");
            }
            out.println("</table>") ;
        }   	
    }	
    
}