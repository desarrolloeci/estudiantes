/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.*;
import java.net.*;
import java.util.Vector;
import javax.servlet.*;
import javax.servlet.http.*;
import estudiantes.baseDatos.BaseDatos;
import estudiantes.configuracion.configECI;
import estudiantes.baseDatos.BdEstudiante;
import estudiantes.Estudiante.Estudiante;

/**
 *
 * @author Lucero
 */
public class guardavotos extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
        } finally {
            out.close();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int res, error;
        // HttpSession sesion = request.getSession();
        String nomParam, R1, nomcrp, codcrp, id;
        Integer opcion, tipo;


        R1 = request.getParameter("R1");
        nomcrp = request.getParameter("nomcrp");
        codcrp = request.getParameter("codcrp");

        Estudiante Est = new Estudiante();
        HttpSession session = request.getSession(true);

        String carnet = (String) session.getAttribute("carnet");
        String descerror[] = new String[5];

        Vector res2;
        res2 = Est.ConsultaVoto(carnet);

        if (res2.size() <= 0) {
            out.println("Seleccione un candidato");
        } else {
            
            String vcd = (String) ((Vector) res2.elementAt(0)).elementAt(0);
            String vca = (String) ((Vector) res2.elementAt(0)).elementAt(1);
            String vprg1 = (String) ((Vector) res2.elementAt(0)).elementAt(2);
            String vprg2 = (String) ((Vector) res2.elementAt(0)).elementAt(3);
            if ((nomcrp.equals("vca")) && (vca.equals("0"))) {
                out.println("<table width=\"640\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"> ");
                out.println("<tr>");
                out.println("<td>");
                out.println("<img src=\"img/serviciosestudiantes.jpg\" width=\"793\" height=\"228\" border=\"0\" alt=\"\" >");
                out.println("</td>");
                out.println("</tr>");
                out.println("</table>");
                res = Est.ActualizaVotos(nomcrp, carnet);
                int res1 = Est.InserVoto(codcrp, R1);
                out.println("<center><h2>");
                out.println("Su voto ha sido registrado, muchas gracias por su participación");
                out.println("<p>");
                out.println("</h2>");
                out.println("<a href=\"LogOutEst\"> Salir&nbsp;&nbsp;&nbsp;");
                out.println("</a>");
                out.println("&nbsp;&nbsp;&nbsp; ");
                out.println("<a href=\"IngresoVotacion\"> Regresar");
                out.println("</center></h2>");
            } else if ((nomcrp.equals("vcd")) && (vcd.equals("0"))) {
                out.println("<table width=\"640\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"> ");
                out.println("<tr>");
                out.println("<td>");
                out.println("<img src=\"img/serviciosestudiantes.jpg\" width=\"793\" height=\"228\" border=\"0\" alt=\"\" >");
                out.println("</td>");
                out.println("</tr>");
                out.println("</table>");
                res = Est.ActualizaVotos(nomcrp, carnet);
                int res1 = Est.InserVoto(codcrp, R1);
                out.println("<center><h2>");
                out.println("Su voto ha sido registrado, muchas gracias por su participación");
                out.println("<p>");
                out.println("</h2>");
                out.println("<a href=\"LogOutEst\"> Salir&nbsp;&nbsp;&nbsp;");
                out.println("</a>");
                out.println("&nbsp;&nbsp;&nbsp; ");
                out.println("<a href=\"IngresoVotacion\"> Regresar");
                out.println("</center></h2>");
            } else if ((nomcrp.equals("vprg1")) && (vprg1.equals("0"))) {
                out.println("<table width=\"640\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"> ");
                out.println("<tr>");
                out.println("<td>");
                out.println("<img src=\"img/serviciosestudiantes.jpg\" width=\"793\" height=\"228\" border=\"0\" alt=\"\" >");
                out.println("</td>");
                out.println("</tr>");
                out.println("</table>");
                res = Est.ActualizaVotos(nomcrp, carnet);
                int res1 = Est.InserVoto(codcrp, R1);
                out.println("<center><h2>");
                out.println("Su voto ha sido registrado, muchas gracias por su participación");
                out.println("</h2>");
                out.println("<p>");
                out.println("<a href=\"LogOutEst\"> Salir&nbsp;&nbsp;&nbsp;");
                out.println("</a>");
                out.println("&nbsp;&nbsp;&nbsp; ");
                out.println("<a href=\"IngresoVotacion\"> Regresar");
                out.println("</center></h2>");
            } else if ((nomcrp.equals("vprg2")) && (vprg2.equals("0"))) 
            {
                out.println("<table width=\"640\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"> ");
                out.println("<tr>");
                out.println("<td>");
                out.println("<img src=\"img/serviciosestudiantes.jpg\" width=\"793\" height=\"228\" border=\"0\" alt=\"\" >");
                out.println("</td>");
                out.println("</tr>");
                out.println("</table>");
                res = Est.ActualizaVotos(nomcrp, carnet);
                int res1 = Est.InserVoto(codcrp, R1);
                out.println("<center><h2>");
                out.println("Su voto ha sido registrado, muchas gracias por su participación");
                out.println("<p>");
                out.println("</h2>");
                 out.println("<a href=\"LogOutEst\"> Salir&nbsp;&nbsp;&nbsp;");
                out.println("</a>");
                 out.println("&nbsp;&nbsp;&nbsp; ");
                out.println("<a href=\"IngresoVotacion\"> Regresar");
                out.println("</center></h2>");
            } else {
                  out.println("<table width=\"640\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"> ");
                out.println("<tr>");
                out.println("<td>");
                out.println("<img src=\"img/serviciosestudiantes.jpg\" width=\"793\" height=\"228\" border=\"0\" alt=\"\" >");
                out.println("</td>");
                out.println("</tr>");
                out.println("</table>");
                out.println("<center><h2>");
                out.println("Usted ya votó para este cuerpo colegiado, muchas gracias por su participación");
                out.println("<p>");
                out.println("</h2>");
                out.println("<p>");
                 out.println("<a href=\"LogOutEst\"> Salir&nbsp;&nbsp;&nbsp;");
                out.println("</a>");
                 out.println("&nbsp;&nbsp;&nbsp; ");
                out.println("<a href=\"IngresoVotacion\"> Regresar");
                out.println("</center></h2>");

            }


        }
    }
}
