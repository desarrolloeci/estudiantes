/*
 * votacion.java
 *
 * Created on 7 de julio de 2006, 03:13 PM
 */

/*
 * votacion.java
 *
 * Created on 29 de agosto de 2002, 16:05
 */
package eci.servlets.seracaest;

import java.io.*;
import java.text.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
//import eci.util.Abstracta ;
import eci.baseDatos.*;
import eci.baseDatos.BdGeneral;
import estudiantes.configuracion.configECI;

/**
 *
 * @author  lrodrigu
 * @version 
 */
public class votacion extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        BaseDatos bd = new BaseDatos();
        configECI configuracion= new configECI();
        String nomParam, carnet, id;
        Integer opcion, tipo;
        Integer idCE;
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">");
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
        out.println("</head>");
        out.println("<body>");

        HttpSession sesion;
        sesion = request.getSession(true);

        if (bd.conectarBD(configuracion.getUsuarioBdApolo(), configuracion.getPasswdBdApolo())) {
            carnet = new String(request.getParameter("carnet"));
            if (carnet != (null)) {
                sesion = request.getSession(false);
                sesion.setAttribute("carnet", carnet);
                desptarjeton(out, bd, carnet);
                bd.desconectarBD();
            }
        } else {
            out.println("No se pudo conectar " + bd.getMensajeBD());
        }
        out.println("</p>");
        out.println("</body>");
        out.println("</html>");
    }

    public void desptarjeton(PrintWriter out, BaseDatos bd, String idEst) {
        String consulta = new String(), prog = new String();
        Vector lisnom = new Vector();

        /*  consulta = new String("select  apolo.votantesest.vcd, apolo.votantesest.vca, " +
        "apolo.votantesest.vprg1, apolo.votantesest.vprg2, registro.registro.programas.nom_prog, " +
        "registro.registro.estudiante.nom_est, id_dpplan  " +
        "FROM apolo.votantesest, registro.registro.estudiante, " +
        "registro.registro.programas, registro.registro.plan_estud  "  + 
        "WHERE  (registro.registro.plan_estud.id_plan = apolo.votantesest.prg1 or  " +
        "registro.registro.plan_estud.id_plan = apolo.votantesest.prgdp )and   " +
        "registro.registro.programas.id_prog = registro.registro.plan_estud.id_prog   and  " +
        "registro.registro.estudiante.id_est= apolo.votantesest.idest and " +
        "id_est =  " + idEst + " ");
        out.println(consulta);
         */

        consulta = new String("select  apolo.votantesest.vcd, apolo.votantesest.vca, " +
                "apolo.votantesest.vprg1, apolo.votantesest.vprg2, registro.registro.programas.nom_prog, " +
                "registro.registro.estudiante.nom_est, id_dpplan, apolo.votantesest.prg1  " +
                "FROM apolo.votantesest, registro.registro.estudiante, " +
                "registro.registro.programas, registro.registro.plan_estud  " +
                /*"WHERE  (registro.registro.plan_estud.id_plan = registro.registro.estudiante.id_plan or  " +
                "registro.registro.plan_estud.id_plan = registro.registro.estudiante.id_dpplan )and   " +*/
                "WHERE  registro.registro.plan_estud.id_plan = registro.registro.estudiante.id_plan and " +
                "registro.registro.programas.id_prog = registro.registro.plan_estud.id_prog   and  " +
                "registro.registro.estudiante.id_est= apolo.votantesest.idest and " +
                "id_est =  " + idEst);
        //out.println(consulta);
        lisnom.addElement("vcd");
        lisnom.addElement("vca");
        lisnom.addElement("vprg1");
        lisnom.addElement("vprg2");
        lisnom.addElement("nom_prog");
        lisnom.addElement("nom_est");
        lisnom.addElement("iddp_plan");
        lisnom.addElement("dpto");

        validacarrera(out, bd, consulta, lisnom, "Carrera ", idEst);

    }

    public void validacarrera(PrintWriter out, BaseDatos bd, String consulta,
            Vector lisnom, String desc, String idEst) {
        Vector lista;
        int n;
        String vcd, vca, vprg1, vprg2, nomprog, ejec, depto;
        BdGeneral obj = new BdGeneral(desc);
        lista = bd.consultar(consulta, lisnom.size());
        if (lista.size() <= 0) {
            out.println("No existe información para el usuario");
        } else {
            obj = (BdGeneral) lista.elementAt(0);
            out.println("<div align=\"center\"><font face=\"Verdana, Arial, Helvetica, sans-serif\"><b><font color=\"#336699\" size=\"4\">ESCUELA COLOMBIANA DE INGENIERIA ");
            out.println("</font></b></font></div>");
            out.println("<p>");
            out.println("<font face=\"Verdana, Arial, Helvetica, sans-serif\" size=\"2\"> <b>");
            out.println("<center><font color=\"FFOOOO\"> ESTUDIANTE: </font>" + (String) obj.elementAt(5));
            out.println("</center></b></font>");
            out.println("</p>");
            out.println("<p>");
            out.println("</p>");
            out.println("<BR>");
            out.println("<BR>");
            vcd = ((String) obj.elementAt(0));
            vca = ((String) obj.elementAt(1));
            vprg1 = ((String) obj.elementAt(2));
            vprg2 = ((String) obj.elementAt(3));
            nomprog = ((String) obj.elementAt(4));
            depto = ((String) obj.elementAt(7));
            if ((vcd.equals("2")) && (vca.equals("2")) && (vprg1.equals("2")) && (vprg2.equals("2"))) {
                out.println("<p>");
                out.println("<center>");
                out.println("Usted no debe realizar este proceso");
                out.println("<p>");
                out.println("<a href=\"login?msg=4\"> Salir");
            }
            if ((vcd.equals("1")) && (vca.equals("1")) && (vprg1.equals("2")) && (vprg2.equals("2"))) {
                out.println("<center>");
                out.println("<p class=\"textocom\">Usted ha terminado el proceso de votación</p>");
                out.println("<p class=\"textocom\"><b><a href=\"login?msg=4\"> Salir</a></b></center></p>");
            }
            if (vcd.equals("0")) {
                out.println("<table class=\"textocom\" border=\"3\"  bordercolor=\"#336699\" align=\"center\"  width=\"400\">");
                out.println("   <form  method=\"post\" target=\"_top\" action=\"votaciones/TarjetonEstudiantes\" > ");
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
            if (vca.equals("0")) {
                out.println("<table class=\"textocom\" border=\"3\"  bordercolor=\"#336699\" align=\"center\"  width=\"400\">");
                out.println("   <form  method=\"post\" target=\"_top\" action=\"votaciones/TarjetonEstudiantes\" > ");
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
            out.println("<br>");
            if (vprg1.equals("0")) {
                out.println("<table class=\"textocom\" border=\"3\"  bordercolor=\"#336699\" align=\"center\"  width=\"400\">");
                out.println("   <form  method=\"post\" target=\"_top\" action=\"votaciones/TarjetonComite\" > ");
                out.println("   <INPUT type=\"hidden\" name=\"nomCrp\" value=\"vprg1\">");
                out.println("   <INPUT type=\"hidden\" name=\"idCrp\" value=\"" + depto + "\">");
                out.println("   <INPUT TYPE=\"hidden\" NAME=\"carnet\" VALUE=\" " + idEst + "\">");
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
        //20sep2006, se quito comite de carrera
            /*ejec = new String("carreraciv.jsp") ;
        if (nomprog.equals("INGENIERIA CIVIL"))
        ejec = new String("CarreraCivil") ;
        else if (nomprog.equals("INGENIERIA ELECTRONICA"))
        ejec = new String("CarreraElectronica") ;
        else if (nomprog.equals("INGENIERIA ELECTRICA"))
        ejec = new String("CarreraElectrica") ;
        else if (nomprog.equals("INGENIERIA INDUSTRIAL"))
        ejec = new String("CarreraIndustrial") ;
        else if (nomprog.equals("INGENIERIA DE SISTEMAS"))
        ejec = new String("CarreraSistemas") ;
        else if (nomprog.equals("ECONOMIA"))
        ejec = new String("CarreraEconomia") ;
        else if (nomprog.equals("ADMINISTRACION"))
        ejec = new String("Asociaciones") ;*/
        //imprimecomite (out,nomprog, vprg1, idEst, (String)obj.elementAt(4), new String ("PRG1"), ejec);
        //para cualquier otro tipo de votacion dte a comites de carrera vprg2
        //imprimecomite (out,nomprog, vprg1, idEst, (String)obj.elementAt(4), new String ("PRG1"), ejec);
        //OJO CON ADMIN Y MATEMATICAS
            /*if (lista.size()>1){
        obj=(BdGeneral) lista.elementAt(1);
        nomprog=((String)obj.elementAt(4));
        vprg2=((String)obj.elementAt(3));
        ejec = new String("CarreraCivil") ;
        if (nomprog.equals("INGENIERIA CIVIL")) ejec = new String("CarreraCivilDP") ;
        else if (nomprog.equals("INGENIERIA ELECTRONICA"))
        ejec = new String("CarreraElectronicaDP") ;
        else if (nomprog.equals("INGENIERIA ELECTRICA"))
        ejec = new String("CarreraElectricaDP") ;
        else if (nomprog.equals("INGENIERIA INDUSTRIAL"))
        ejec = new String("CarreraIndustrialDP") ;
        else if (nomprog.equals("INGENIERIA DE SISTEMAS"))
        ejec = new String("CarreraSistemasDP") ;
        else if (nomprog.equals("ECONOMIA"))
        ejec = new String("CarreraEconomiaDP") ;

        imprimecomite (out,nomprog, vprg1, idEst, (String)obj.elementAt(4), new String ("PRG2"), ejec);


        if ((vcd.equals("1")) && (vca.equals("1")) && (vprg1.equals("1"))&&(vprg2.equals("1"))) {
        out.println("<p>");
        out.println("Usted ya votó por todos los cuerpos colegiados, muchas gracias por su participación");
        out.println("</p>");
        }
        }
        // ESTA VALIDACION PARA LA VOTACION INCLUYENDO COMITE DE CARRERA SE QUITA POR AHORA YA QUE
        //EN ESTE SEM NO HABRA VOTACION PARA COMITE DE CARRERA
        else if ((vcd.equals("1")) && (vca.equals("1")) && (vprg1.equals("1"))) {
        out.println("<center>");
        out.println("<p>");
        out.println("Usted ya votó por todos los cuerpos colegiados, muchas gracias por su participación");
        out.println("</p>");
        out.println("<p>");
        out.println("<a href=\"../estudiantes/login?msg=4\"> Salir");
        }*/
        //VALIDACION  PARA LOS CONSEJOS DIRECTIVO Y ACAD.
           /* if ((vcd.equals("1")) && (vca.equals("1"))) {   
        out.println("<p align=\"center\" class=\"textocom\">Usted ya votó por todos los cuerpos colegiados, muchas gracias por su participación</p>");
        }*/
        }

    }

    public void imprimecomite(PrintWriter out, String nomprog, String vprg2, String idEst, String nomp, String prg, String ejec) {
        if (vprg2.equals("-1") || vprg2.equals("0")) {
            out.println("<form  method=\"post\" target=\"_top\" action=\"" + ejec + "\" > ");
            out.println("<INPUT TYPE=\"hidden\" NAME=\"carnet\" VALUE=\" " + idEst + "\">");
            out.println("<table border=\"3\"  bordercolor=\"#336699\" align=\"center\" width=\"400\">");
            out.println("<tr>");
            out.println("<td width=\"80\">");
            out.println("<input TYPE=\"submit\"  VALUE=\"" + prg + "\">   ");
            out.println("</td>");
            out.println("<td>");
            out.println("<font face=\"Verdana, Arial, Helvetica, sans-serif\" size=\"2\"> <b>");
            //  out.println("ASOCIACION ESTUDIANTES "  + nomp);
            out.println("COMITE DE CARRERA " + nomp);
            out.println("</td>");
            out.println("</font></b>");
            out.println("</tr>");

            out.println("</form>");


        }
    }
}
 