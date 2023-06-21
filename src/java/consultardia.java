/*
 * Class.java
 *
 * Created on 24 de julio de 2002, 11:47
 */

import java.io.*;
import javax.servlet.*;
import java.util.Vector;
import javax.servlet.http.*;
import estudiantes.baseDatos.BaseDatos;
import estudiantes.configuracion.configECI;
import estudiantes.Estudiante.Estudiante;
import estudiantes.baseDatos.BdEstudiante;
import javax.servlet.http.HttpSession;

/**
 *
 * @author  
 * @version 
 */
public class consultardia extends HttpServlet {

    configECI cfgEci = new configECI();

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        BaseDatos bd = new BaseDatos();
        PrintWriter pw = response.getWriter();
        BdEstudiante bd1 = new BdEstudiante();
        HttpSession session = request.getSession();
        String carnet = (String) session.getAttribute("carnet");

        String nomParam, id;
        Integer opcion, tipo;
        Integer idCE;

        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">");
        out.println("<style type=\"text/css\">" +
                "<!-- " +
                ".texto {  font-family: Arial, Helvetica, sans-serif; " +
                "font-size: 12px; font-style: normal; " +
                "font-variant: normal; text-transform: none;  " +
                "text-decoration: none; color: #666666;} " +
                "--> " +
                "</style>");
        out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
        out.println("<!-- ");
        out.println("function openPop(pagename){");
        out.println("window.open(pagename,'','toolbar=yes,scrollbars=yes,location=no,directories=no,status=no,menubar=yes,resizable=yes,height=350,width=550')} ");
        out.println("//-->");
        out.println("</SCRIPT>");
        out.println("</head>");
        out.println("<body>");
        //out.println("<p>");

        HttpSession sesion;
        sesion = request.getSession(false);
        configECI cfgEci = new configECI();
        carnet = request.getParameter("per");
        if (bd.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg())) {
            //out.println("<center><b>Horario de Asignatura</b></center><br>");
            despdiasem(out, bd, bd1, carnet);

            bd.desconectarBD();
        } else {
            out.println("No se pudo conectar " + bd.getMensajeBD());
        }
        out.println("</p>");
        out.println("</body>");
        out.println("</html>");
    }

    public void despdiasem(PrintWriter out, BaseDatos bd, BdEstudiante bd1, String cod) {
        String consulta = new String();

       /*CAMBIADA PARA EL 2012-1 consulta = new String(" select nom_est, dtur, convert(int, registro.plan_pagos.val_real)  " +
                " from registro.estudiante, registro.ordenes, registro.plan_pagos " +
                " where registro.estudiante.id_est =  registro.ordenes.id_est and " +
                " registro.ordenes.id_ord = registro.plan_pagos.id_ord and " +
                " registro.ordenes.per_acad = '" + cfgEci.getPeriodoActual() + "' and " +
                " registro.ordenes.id_est = " + cod + " and " +
                " registro.plan_pagos.cuota = 1 ");*/
        // consulta = " select nom_est, dtur, convert(int, val_pag)  " + " from registro.estudiante, registro.ordenes " + " where registro.estudiante.id_est =  registro.ordenes.id_est and " + " registro.ordenes.per_acad = '" + cfgEci.getPeriodoActual() + "' and " + " registro.ordenes.id_est = " + cod + " ";
         consulta = " select nom_est, dtur, max(convert(int,ind_pago)), max(estado) " +
                    " from registro.estudiante, Novasoft.dbo.usr_cxc_orden_matri " +
                    " where (id_est =  CONVERT(int, cod_alum) OR id_est =  CONVERT(int, cod_alum)+1000000 )  and  " +
                    " periodo = '" + cfgEci.getPeriodoActual() + "' and  id_est = " + cod + " group by nom_est, dtur ";
        // out.println(consulta);
         

        nombredia(out, bd, bd1, consulta);

        out.println("<p>");
    }


    /* public void restafechas(PrintWriter out, BaseDatos bd, String fec) {
    String consulta = new String();

    consulta = new String(" select datediff(ss, getdate(), 'fec'), getdate() " );
    nombredia(out, bd, consulta);
    out.println("<p>");
    }*/
    public void nombredia(PrintWriter out, BaseDatos bd, BdEstudiante bd1, String consulta) {
        Vector lista = new Vector();
        // Estudiante actualiza = new Estudiante(carnet, pw);
        Vector lista1 = new Vector();
        String valor = new String();
        String valor1 = new String();
        String valfec = new String();
        Estudiante actualiza = new Estudiante();
        String dia;
        String fec = "";
        int val, val1;
        lista = bd.consultar(consulta, 4);

        //   bd.desconectarBD();

        if (lista.size() <= 0) {
            
            
            out.println("<p>&nbsp;</p>");
            out.println("<span class=\"texto\"><p><b>Por favor verifique su situación académica.</b></p></span>");
        } else {
            out.println("<br>");
            out.println("<fieldset>" +
                    "<legend class=\"texto\">");
            out.println("<font color=\"FFOOOO\"> ESTUDIANTE : </FONT>" + (String) ((Vector) lista.elementAt(0)).elementAt(0));
            out.println("</legend><p>");
            dia = (String) ((Vector) lista.elementAt(0)).elementAt(1);
            valor = (String) ((Vector) lista.elementAt(0)).elementAt(2);
            val = Integer.parseInt(valor);
            valor1 = (String) ((Vector) lista.elementAt(0)).elementAt(3);
            val1 = Integer.parseInt(valor1);

            if (dia.equals("1")&&false) {
                out.println("<span class=\"texto\">El día asignado para realizar operaciones de registro es el <b>xxx de 2006.</b> ");
                out.println("<br>Todas las operaciones de registro deberán hacerse vía Internet.</span>");
                
            } /*else if (dia.equals("2")) {
                fec = "30/07/2014 07:00";
                out.println("<span class=\"texto\">El día asignado para realizar operaciones de registro es el <b>miercoles 30 de julio de 2014 a partir de las 7:00 am</b>.");
                out.println("<br>Todas las operaciones de registro deberán hacerse vía Internet.</span>");
            } else if (dia.equals("3")) {
                fec = "31/07/2014 07:00";
                out.println("<span class=\"texto\">El día asignado para realizar operaciones de registro es el <b>jueves 31 de julio de 2014 a partir de las 7:00 am</b>. ");
                out.println("<br>Todas las operaciones de registro deberán hacerse vía Internet.</span>");
            } else if (dia.equals("4")) {
                fec = "01/08/2014 07:00";
                out.println("<span class=\"texto\">El día asignado para realizar operaciones de registro es el <b>viernes 01 de agosto de 2014 a partir de las 7:00 am</b>. ");
                out.println("<br>Todas las operaciones de registro deberán hacerse vía Internet.</span>");
            } else if (dia.equals("5")) {
                fec = "01/08/2014 18:00";
                out.println("<span class=\"texto\">El día asignado para realizar operaciones de registro es el <b>viernes 01 de agosto de 2014 a partir de las 6:00 pm</b> ");
                out.println("<br>Todas las operaciones de registro deberán hacerse vía Internet.</span>");
            } else if (dia.equals("6")) {
                fec = "01/08/2014 18:00";
                out.println("<span class=\"texto\">El día asignado para realizar operaciones de registro es el <b>viernes 01 de agosto de 2014 después de las 6:00 pm</b>. ");
                out.println("<br>Todas las operaciones de registro deberán hacerse vía Internet.</span>");
            }*/
            
            
         else if (dia.equals("2")) {
                fec = "27/07/2020 07:00";
                out.println("<span class=\"texto\">El día asignado para realizar operaciones de registro es el <b>lunes 27 de julio de 2020 de 7:00 am a 9:00 a.m y de 5:00 p.m a 7:00 a.m del día siguiente.</b>");
                out.println("<br>Todas las operaciones de registro deberán hacerse vía Internet.</span>");
           
            } else if (dia.equals("3")) {
                fec = "27/07/2020 12:00";
                out.println("<span class=\"texto\">El día asignado para realizar operaciones de registro es el <b>lunes 27 de julio de 2020 de 12:00 pm a 2:00 p.m y de 5:00 p.m a 7:00 a.m del día siguiente.</b> ");
                out.println("<br>Todas las operaciones de registro deberán hacerse vía Internet.</span>");
           
            } else if (dia.equals("4")) {
                fec = "28/07/2020 07:00";
                out.println("<span class=\"texto\">El día asignado para realizar operaciones de registro es el <b>martes 28 de julio de 2020 de 7:00 am a 9:00 a.m y de 5:00 p.m a 7:00 a.m del día siguiente.</b> ");
                out.println("<br>Todas las operaciones de registro deberán hacerse vía Internet.</span>");
           
            } else if (dia.equals("5")) {
                fec = "28/07/2020 12:00";
                out.println("<span class=\"texto\">El día asignado para realizar operaciones de registro es el <b>martes 28 de julio de 2020 de 12:00 pm a 2:00 p.m y de 5:00 p.m a 7:00 a.m del día siguiente.</b> ");
                out.println("<br>Todas las operaciones de registro deberán hacerse vía Internet.</span>");
            
            }else if (dia.equals("6")) {
                fec = "29/07/2020 07:00";
                out.println("<span class=\"texto\">El día asignado para realizar operaciones de registro es el <b>miercoles 29 de julio de 2020 de 7:00 am a 9:00 a.m y de 5:00 p.m a 7:00 a.m del día siguiente.</b> ");
                out.println("<br>Todas las operaciones de registro deberán hacerse vía Internet.</span>");
            } 
            
            else if (dia.equals("7")) {
                fec = "29/07/2020 12:00";
                out.println("<span class=\"texto\">El día asignado para realizar operaciones de registro es el <b>miercoles 29 de julio de 2020 de 12:00 pm a 2:00 p.m y de 5:00 p.m a 7:00 a.m del día siguiente</b>. ");
                out.println("<br>Todas las operaciones de registro deberán hacerse vía Internet.</span>");
                
            } 
            else if (dia.equals("9")) {
                fec = "30/07/2020 07:00";
                out.println("<span class=\"texto\">El día asignado para realizar operaciones de registro es el <b>jueves 30 de julio de 2020 de 7:00 am a 9:00 a.m y de 5:00 p.m a 7:00 del día siguiente</b>. ");
                out.println("<br>Todas las operaciones de registro deberán hacerse vía Internet.</span>");
                
            } 
            else if (dia.equals("10")) {
                fec = "30/07/2020 12:00";
                out.println("<span class=\"texto\">El día asignado para realizar operaciones de registro es el <b>jueves 30 de julio de 2020 de 12:00 pm a 2:00 p.m y de 5:00 p.m a 7:00 a.m del día siguiente</b>. ");
                out.println("<br>Todas las operaciones de registro deberán hacerse vía Internet.</span>");
                
            }
            else if (dia.equals("11")) {
                fec = "31/07/2020 07:00";
                out.println("<span class=\"texto\">El día asignado para realizar operaciones de registro es el <b>viernes 31 de julio de 2020 de 07:00 a.m a 9:00 a.m</b>. ");
                out.println("<br>Todas las operaciones de registro deberán hacerse vía Internet.</span>");
                
            } 
            else if (dia.equals("12")) {
                fec = "31/07/2020 12:00";
                out.println("<span class=\"texto\">El día asignado para realizar operaciones de registro es el <b>viernes 31 de julio de 2020 de 12:00 p.m a 2:00 p.m</b>. ");
                out.println("<br>Todas las operaciones de registro deberán hacerse vía Internet.</span>");
                
            }
            else {
                out.println("<span class=\"texto\"><p><b>Verifique su situación académica, no tiene día asignado, favor comunicarse con la Oficina de Registro Académico. Ext 255.</b></span>");
            }
            lista1 = actualiza.restafechas(fec);
            if (lista1.size() > 0) {
            valfec = (String) ((Vector) lista1.elementAt(0)).elementAt(0);
            String fechasis = (String) ((Vector) lista1.elementAt(0)).elementAt(1);
            int seg = (Integer.parseInt(valfec));
            int segundos = seg % 60;
            seg = seg / 60;
            int min1 = seg % 60;
            seg = seg / 60;
            int hor = seg % 24;
            int dias = seg / 24;
            out.println("<span class=\"texto\"><font color=\"FFOOOO\">Dado que en nuestro sistema la fecha actual es: " + fechasis + "  le informamos que le quedan  " + dias + " días " + hor + " horas " + min1 + " minutos " + segundos + " segundos, para su día de registro, apartir de este momento.</font>");
            
            }
            /* out.println(segundos);
            out.println(min1);
            out.println(hor);
            out.println(dias);
            out.println(lista1);*/
            bd.desconectarBD();
            
            
            /*if (dia.equals("-3")){
            out.println(" <p>&nbsp;");
            out.println("<b>La Escuela no ha detectado el registro de su pago. Favor presentarse con su recibo en Dirección Administrativa y Financiera</b>");

            }*/
            if (val <= 0 && val1 <= 0 ) {
                
                out.println("<span class=\"texto\"><b><p>La Escuela no tiene reportado el registro de su pago. Favor comunicarse con la oficina de Dirección Administrativa y Financiera.");
                out.println("<br>Enviando un correo a apoyofinanciero@escuelaing.edu.co</b></p></span>");
            }
            
            out.println("<span class=\"texto\"><p>Recuerde que adicional a las franjas asignadas para las operaciones"
                    + " de registro, el sistema estará abierto para todos los estudiantes desde el viernes 31 de julio a las 5:00 p.m hasta el lunes 03 de agosto a las 6:30 am.<br>" +
                    "Si usted ya pago puede firmar su acta y renovación de matrícula desde hoy mismo y hasta el <b>lunes 03 de agosto a las 8:00 am. </b><p>" +
                    "Durante los días de registro <b>(lunes 27 de julio a viernes 31 de julio de 2020)</b> solo podrá hacerlo el <b>dia que le corresponda.</b><br>" +
                    "<a href=\"\" onclick=\"window.open('http://www.escuelaing.edu.co/es/comunidad/estudiantes','','');return false\">Haga clic AQUI.</a>");
            out.println("<br><br><font color=\"#CC3300\">Durante los días de registro deberá utilizar la siguiente dirección si se encuentra fuera de la Escuela Colombiana de Ingeniería " +
                    "<b><a href=\"\" onclick=\"window.open('http://45.239.88.76:81/estudiantes','','');return false\">http://45.239.88.76:81/estudiantes/login</a></font></b> para acceder a los servicios académicos de registro<br>" +
                    "</p></span></fieldset>");

        }
    }
}

