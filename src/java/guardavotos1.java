/*
 * guardavotos.java
 *
 * Created on 11 de julio de 2006, 10:30 AM
 */


import java.io.*;
import java.text.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.* ;
//import eci.util.Abstracta ;
import eci.baseDatos.* ;
import eci.baseDatos.BdGeneral ;
import estudiantes.Estudiante.Estudiante;
import estudiantes.configuracion.configECI;

/**
 *
 * @author  lrodrigu
 * @version
 */


/** Initialization method that will be called after the applet is loaded
 *  into the browser.
 */
public class guardavotos1 extends HttpServlet {
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {
        
        BaseDatos bd = new BaseDatos();
        configECI configuracion= new configECI();
        String nomParam, R1,nomcrp,codcrp, carnet,id;
        Integer opcion, tipo;
        
        Integer idCE;
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">") ;
        out.println("<style type=\"text/css\">" +
                "<!--" +
                ".textocom { " +
                "font-family: Verdana, Arial, Helvetica, sans-serif; " +
                "font-size: 10px; " +
                "color: #666666; " +
                "-->" +
                "</style>");
        out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
        out.println("<!-- ");
        out.println("function openPop(pagename){");
        out.println("window.open(pagename,'','toolbar=yes,scrollbars=yes,location=no,directories=no,status=no,menubar=yes,resizable=yes,height=350,width=550')} ");
        out.println("//-->");
        out.println("</SCRIPT>");
        out.println("</head>") ;
        out.println("<body>");
        
        

        HttpSession sesion = request.getSession();
        Estudiante est = (Estudiante) sesion.getAttribute("estClase");
        carnet = est.getIdEst();
        R1 = new String(request.getParameter("R1"));
        nomcrp = new String(request.getParameter("nomcrp"));
        codcrp =  new String(request.getParameter("codcrp"));
       if (bd.conectarBD(configuracion.getUsuarioBdApolo(), configuracion.getPasswdBdApolo())) {
            despcandidat(out, bd,  R1, nomcrp, codcrp, carnet);
            nvaconsulta(out, bd,  R1, nomcrp, codcrp,carnet);
            bd.desconectarBD();
        }else
            out.println("No se pudo conectar " + bd.getMensajeBD());
        out.println("</p>");
        out.println("<center><h2><a href=\"../estudiantes/login?msg=8\"> Salir </a></h2></center>");
        out.println("</body>");
        out.println("</html>") ;
    }
    
    
    
    
    public void despcandidat(PrintWriter out, BaseDatos bd, String idcand, String nomcrp, String codcrp, String carnet) {
        String consulta = new String(),  prog = new String();
        Vector  lisnom = new Vector();
        
        consulta = new String("select idcrp, nroton, nombre, vcd, vca, vprg1,vprg2 " +
                "from apolo.candidat, apolo.votantesest " +
                "WHERE   nroton = " + idcand + "  and idcrp= " + codcrp +" and idest= " + carnet + "  ");
        
        lisnom.addElement("Id_cuerpo") ;
        lisnom.addElement("Nro_Tarjetón") ;
        lisnom.addElement("Nombre") ;
        lisnom.addElement("vcd") ;
        lisnom.addElement("vca") ;
        lisnom.addElement("vprg1") ;
        lisnom.addElement("vprg2") ;
        
        insertadatos(out, bd, consulta, lisnom,  "Candidato ",idcand, nomcrp, codcrp, carnet);
        
    }
    
    
    public void insertadatos(PrintWriter out, BaseDatos bd, String consulta,
            Vector lisnom, String desc, String idcand, String nomcrp, String codcrp, String carnet) {
        
        int respuesta;
        Vector lista, resnot, rescon;
        String fecha, consultaact,vca, vcd, vprg1, vprg2, consultadatos;
        BdGeneral obj = new BdGeneral(desc) ;
        lista = bd.consultar(consulta, lisnom.size());
        
        if (lista.size()<=0)
            out.println("Seleccione un candidato");
        else {
            obj=(BdGeneral) lista.elementAt(0);
            vcd=((String)obj.elementAt(3));
            vca=((String)obj.elementAt(4));
            vprg1=((String)obj.elementAt(5));
            vprg2=((String)obj.elementAt(6));
            if ((nomcrp.equals("vca"))&&(vca.equals("0"))) {
                consultaact = new String("update apolo.votantesest set vca = 1 where idest= " + carnet + " ");
                respuesta= bd.actualizar(consultaact);
                //Abstracta.despliegueTablaEnc(out, bd, consultaact, lisnom,  " ", 2);
                consulta =new String("insert into apolo.votacionest values ("+ (String)obj.elementAt(0)+", "+ (String)obj.elementAt(1)+" ,getdate() ) ");
                respuesta= bd.actualizar(consulta);
                //out.println(consulta);
                //Abstracta.despliegueTablaEnc(out, bd, consulta, lisnom,  " ", 2);
                out.println("<center><h2>");
                out.println("Su voto ha sido registrado, muchas gracias por su participación");
                out.println("<p>");
                //out.println("<a href=\"../estudiantes/servlet/LogOutEst/\"> Salir");
                out.println("</center></h2>");
                out.println("</center></h2>");
            }else if ((nomcrp.equals("vcd"))&&(vcd.equals("0"))) {
                
                consultaact = new String("update apolo.votantesest set vcd = 1 where idest= " + carnet +" ");
                respuesta= bd.actualizar(consultaact);
                //Abstracta.despliegueTablaEnc(out, bd, consultaact, lisnom,  " ", 2);
                consulta =new String("insert into apolo.votacionest values ("+ (String)obj.elementAt(0)+", "+ (String)obj.elementAt(1)+" ,getdate() ) ");
                respuesta= bd.actualizar(consulta);
                //Abstracta.despliegueTablaEnc(out, bd, consulta, lisnom,  " ", 2);
                out.println("<center><h2>");
                out.println("Su voto ha sido registrado, muchas gracias por su participación");
                out.println("<p>");
                
            }
            
            else if ((nomcrp.equals("vprg1")) &&(vprg1.equals("0"))) {
                consultaact = new String("update apolo.votantesest set vprg1= 1 where idest=  " + carnet +" ");
                respuesta= bd.actualizar(consultaact);
                //Abstracta.despliegueTablaEnc(out, bd, consultaact, lisnom,  " ", 2);
                consulta =new String("insert into apolo.votacionest values ("+ (String)obj.elementAt(0)+", "+ (String)obj.elementAt(1)+" ,getdate() ) ");
                respuesta= bd.actualizar(consulta);
                //Abstracta.despliegueTablaEnc(out, bd, consulta, lisnom,  " ", 2);
                out.println("<center><h2>");
                out.println("Su voto ha sido registrado, muchas gracias por su participación");
                out.println("<p>");
                //  out.println("<a href=\"http://localhost:8181/estudiantes/login?msg=4\"> Salir");
                out.println("</center></h2>");
                
            }
            
            else if ((nomcrp.equals("vprg2")) &&(vprg2.equals("0"))) {
                consultaact = new String("update apolo.votantesest set vprg2= 1 where idest=  " + carnet +" ");
                respuesta= bd.actualizar(consultaact);
                //Abstracta.despliegueTablaEnc(out, bd, consultaact, lisnom,  " ", 2);
                consulta =new String("insert into apolo.votacionest values ("+ (String)obj.elementAt(0)+", "+ (String)obj.elementAt(1)+" ,getdate() ) ");
                respuesta= bd.actualizar(consulta);
                //Abstracta.despliegueTablaEnc(out, bd, consulta, lisnom,  " ", 2);
                out.println("<center><h2>");
                out.println("Su voto ha sido registrado, muchas gracias por su participación");
                out.println("</center></h2>");
                
            }
            
            else {
                out.println("<center><h2>");
                //   out.println("Usted ya votó , muchas gracias por su participación");
                out.println("Usted ya votó para este cuerpo colegiado, muchas gracias por su participación");
                out.println("<p>");
                //  out.println("<a href=\"http://localhost:8181/estudiantes/login?msg=4\"> Salirdosyavoto");
                out.println("</center></h2>");
                
            }
            
            
            
        }
        
    }
    
    public void nvaconsulta(PrintWriter out, BaseDatos bd, String idcand, String nomcrp, String codcrp, String carnet) {
        String consulta = new String(),  prog = new String();
        Vector  lisnom = new Vector();
        
        consulta = new String("select  apolo.votantesest.vcd, apolo.votantesest.vca, " +
                "apolo.votantesest.vprg1, apolo.votantesest.vprg2, registro.registro.programas.nom_prog, " +
                "registro.registro.estudiante.nom_est, id_dpplan, apolo.votantesest.prg1  " +
                "FROM apolo.votantesest, registro.registro.estudiante, " +
                "registro.registro.programas, registro.registro.plan_estud  "  +
                "WHERE  (registro.registro.plan_estud.id_plan = registro.registro.estudiante.id_plan or  " +
                "registro.registro.plan_estud.id_plan = registro.registro.estudiante.id_dpplan )and   " +
                "registro.registro.programas.id_prog = registro.registro.plan_estud.id_prog   and  " +
                "registro.registro.estudiante.id_est= apolo.votantesest.idest and " +
                "id_est =  " + carnet + " ");
        
        lisnom.addElement("vcd") ;
        lisnom.addElement("vca") ;
        lisnom.addElement("vprg1") ;
        lisnom.addElement("vprg2") ;
        lisnom.addElement("npmprog") ;
        lisnom.addElement("depto") ;
        nvosdatos(out, bd, consulta, lisnom,  "Candidato ",idcand, nomcrp, codcrp, carnet );
        
    }
    
    
    public void nvosdatos(PrintWriter out, BaseDatos bd, String consulta,
            Vector lisnom, String desc, String idcand, String nomcrp, String codcrp, String carnet) {
        int respuesta;
        Vector lista, resnot, rescon;
        String fecha,vcd, vca,vprg1, vprg2, nomprog,consultaact, consultadatos, ejec, depto;
        BdGeneral obj = new BdGeneral(desc) ;
        lista = bd.consultar(consulta, 8);
        if (lista.size()<=0)
            out.println("Seleccione un candidato");
        else {
            obj=(BdGeneral) lista.elementAt(0);
            vcd=((String)obj.elementAt(0));
            vca=((String)obj.elementAt(1));
            vprg1=((String)obj.elementAt(2));
            vprg2=((String)obj.elementAt(3));
            nomprog=((String)obj.elementAt(4));
            depto=((String)obj.elementAt(7));
            out.println("<table border=\"3\"  bordercolor=\"#336699\" align=\"center\"  width=\"400\">");
            if (vcd.equals("0")){
                out.println("<table class=\"textocom\" border=\"3\"  bordercolor=\"#336699\" align=\"center\"  width=\"400\">");
                out.println("   <form  method=\"post\" target=\"_top\" action=\"TarjetonEstudiantes\" > " );
                out.println("   <INPUT type=\"hidden\" name=\"nomCrp\" value=\"vcd\">");
                out.println("   <INPUT type=\"hidden\" name=\"idCrp\" value=\"111\">");
                out.println("   <tr>");
                out.println("       <td width=\"80\">");
                out.println("           <input TYPE=\"submit\"  VALUE=\"VCD\">");
                out.println("       </td>");
                out.println("       <td>");
                out.println("           <b>");
                out.println("           CONSEJO DIRECTIVO");
                out.println("           </b>");
                out.println("       </td>");
                out.println("   </tr>");
                out.println("   </form>");
                out.println("</table>");
            }
            out.println("<br>");
            if (vca.equals("0")){
                out.println("<table class=\"textocom\" border=\"3\"  bordercolor=\"#336699\" align=\"center\"  width=\"400\">");
                out.println("   <form  method=\"post\" target=\"_top\" action=\"TarjetonEstudiantes\" > " );
                out.println("   <INPUT type=\"hidden\" name=\"nomCrp\" value=\"vca\">");
                out.println("   <INPUT type=\"hidden\" name=\"idCrp\" value=\"110\">");
                out.println("   <tr>");
                out.println("       <td width=\"80\">");
                out.println("           <input TYPE=\"submit\"  VALUE=\"VCA\">");
                out.println("       </td>");
                out.println("       <td>");
                out.println("           <b>");
                out.println("           CONSEJO ACADEMICO");
                out.println("           </b>");
                out.println("       </td>");
                out.println("   </tr>");
                out.println("   </form>");
                out.println("</table>");
            }
            if (vprg1.equals("0")){
                out.println("<table class=\"textocom\" border=\"3\"  bordercolor=\"#336699\" align=\"center\"  width=\"400\">");
                out.println("   <form  method=\"post\" target=\"_top\" action=\"TarjetonComite\" > " );
                out.println("   <INPUT type=\"hidden\" name=\"nomCrp\" value=\"vprg1\">");
                out.println("   <INPUT type=\"hidden\" name=\"idCrp\" value=\"" + depto + "\">");
                 out.println("   <INPUT TYPE=\"hidden\" NAME=\"nomprog\" VALUE=\" " + nomprog + "\">");
                out.println("   <tr>");
                out.println("       <td width=\"80\">");
                out.println("           <input TYPE=\"submit\"  VALUE=\"VCC\">");
                out.println("       </td>");
                out.println("       <td>");
                out.println("           <b>");
                out.println("           COMITE DE CARRERA - " + nomprog);
                out.println("           </b>");
                out.println("       </td>");
                out.println("   </tr>");
                out.println("   </form>");
                out.println("</table>");
                
            }
        /*    if ((vca.equals("1")) && (vcd.equals("1"))){
             out.println("<p>");
          out.println("<b>");
          out.println("<center>");
             out.println("Usted ha terminado el proceso de votación");
             out.println("<p>");
           out.println("<a href=\"http://localhost:8181/estudiantes/login?msg=4\"> Salir");
         
         }*/
            
            
            //20sep2006, se quito comite de carrera
       /*ejec = new String("CarreraCivil") ;
       if (nomprog.equals("INGENIERIA CIVIL")) ejec = new String("CarreraCivil") ;
       else if (nomprog.equals("INGENIERIA ELECTRONICA")) ejec = new String("CarreraElectronica") ;
       else if (nomprog.equals("INGENIERIA ELECTRICA")) ejec = new String("CarreraElectrica") ;
       else if (nomprog.equals("INGENIERIA INDUSTRIAL")) ejec = new String("CarreraIndustrial") ;
       else if (nomprog.equals("INGENIERIA DE SISTEMAS")) ejec = new String("CarreraSistemas") ;
       else if (nomprog.equals("ECONOMIA")) ejec = new String("CarreraEconomia") ;
      // else if (nomprog.equals("ADMINISTRACION")) ejec = new String("asociacion.jsp") ;
         imprimecomite (out,nomprog, vprg1, carnet, (String)obj.elementAt(4), new String ("PRG1"), ejec);
        
           if (lista.size()>1){
              obj=(BdGeneral) lista.elementAt(1);
              nomprog=((String)obj.elementAt(4));
              vprg2=((String)obj.elementAt(3));
               ejec = new String("CarreraCivil") ;
               if (nomprog.equals("INGENIERIA CIVIL")) ejec = new String("CarreraCivilDP") ;
               else if (nomprog.equals("INGENIERIA ELECTRONICA")) ejec = new String("CarreraElectronicaDP") ;
               else if (nomprog.equals("INGENIERIA ELECTRICA")) ejec = new String("CarreraElectricaDP") ;
               else if (nomprog.equals("INGENIERIA INDUSTRIAL")) ejec = new String("CarreraIndustrialDP") ;
               else if (nomprog.equals("INGENIERIA DE SISTEMAS")) ejec = new String("CarreraSistemasDP") ;
               else if (nomprog.equals("ECONOMIA")) ejec = new String("CarreraEconomiaDP") ;
               else if (nomprog.equals("ADMINISTRACION")) ejec = new String("Asociaciones") ;
               imprimecomite (out,nomprog, vprg2, carnet, (String)obj.elementAt(4), new String ("PRG2"), ejec);
               out.println("<p>");
        
               //se dejan en dos porque en este momento unicamente se esta votanpo para vprg1
            //  if ((vcd.equals("2")) && (vca.equals("2")) && (vprg1.equals("1"))&&(vprg2.equals("2"))) {
            //  out.println("<p>");
            //  out.println("<center>");
            // out.println("Usted ha terminado el proceso de votación");
            // out.println("<p>");
            //out.println("<a href=\"http://localhost:8181/estudiantes/login?msg=4\"> Salir");
            //}
               //validación para los estudiantes que nodeben votar ej civil, electrica
        
        
            }*/
            
            
        }
    }
    
    
    
    public void imprimecomite(PrintWriter out,String nomprog, String vprg2, String carnet, String nomp, String prg, String ejec ){
        if (vprg2.equals("-1") || vprg2.equals("0")){
            out.println("<form  method=\"post\" target=\"_top\" action=\" "+ejec+"\" > " );
            out.println("<table border=\"3\"  bordercolor=\"#336699\" align=\"center\"  width=\"400\">");
            out.println("<tr>");
            out.println("<td width=\"90\">");
            out.println("<center> <input TYPE=\"submit\"  VALUE=\""+prg+"\"> </center>");
            out.println("</td>");
            out.println("<td>");
            out.println("COMITE DE CARRERA  " + nomp);
            out.println("</td>");
            
            out.println("</form>");
            out.println("</tr>");
            out.println("</table>");
        }
    }
    
}
