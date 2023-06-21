
<%@ include file="../secure.jsp" %>
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%-- 
    Document   : Votaciones
    Created on : 18/09/2014, 02:17:19 PM
    Author     : Lucero
--%>
<% HttpSession sesion = request.getSession();
    Estudiante est = new Estudiante();
    Vector votacion = est.desptarjeton(carnet);%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Votaciones</title>
    </head>
    <body>
        <table width="770" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
            <tr>
                <td colspan="2" bgcolor="#EEEEEE"><img src="img/top.gif" alt="" width="770" height="10" id="top" /></td>
            </tr>
            <tr>
                <td  colspan="2">
                    
                     <jsp:include page="encabezado" flush="true">
                            <jsp:param name="anterior" value="menuServEstud" />
                        </jsp:include>
            </td>
        </tr>
    </table>
</body>
</html>

<%
    String nomCrp = new String();
    String tipo = new String();
    String consulta = new String();
    Vector lista, infocan;
    int cont = 0, i, j;

    String vcd, vca, vprg1, vprg2, nomprog, depto;
    if (votacion.size() <= 0) {
        out.println("No existe información para el usuario");
    } else {
        for (j = 0; j < votacion.size(); j++) {

            Vector dato = (Vector) votacion.elementAt(j);
            vcd = dato.elementAt(0).toString();
            vca = dato.elementAt(1).toString();
            vprg1 = dato.elementAt(2).toString();
            vprg2 = dato.elementAt(3).toString();
            nomprog = dato.elementAt(4).toString();
            depto = dato.elementAt(7).toString();
            if ((vcd.equals("2")) && (vca.equals("2")) && (vprg1.equals("2")) && (vprg2.equals("2"))) {
                out.println("<p>");
                out.println("<center>");
                out.println("Usted no debe realizar este proceso");
            } else if ((vcd.equals("1")) && (vca.equals("1")) && (vprg1.equals("1")) && (vprg2.equals("2"))) {
                out.println("<center>");
                out.println("<p class=\"textocom\">Usted ha terminado el proceso de votación</p>");
                out.println("<p>");

            } else if ((vcd.equals("1")) && (vca.equals("1")) && (vprg1.equals("2")) && (vprg2.equals("2"))) {
                out.println("<center>");
                out.println("Usted ha terminado el proceso de votación");
                out.println("<p>");

            } else if (vcd.equals("0")) {
                out.println("<table class=\"textocom\" border=\"3\"  bordercolor=\"#336699\" align=\"center\"  width=\"400\">");
                out.println("   <form  method=\"post\" target=\"_top\" action=\"TarjetonEstudiantes\" > ");
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

            }
            if (vca.equals("0")) {
                out.println("<table class=\"textocom\" border=\"3\"  bordercolor=\"#336699\" align=\"center\"  width=\"400\">");
                out.println("   <form  method=\"post\" target=\"_top\" action=\"TarjetonEstudiantes\" > ");
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
            if (vprg1.equals("0")) {
                out.println("<table class=\"textocom\" border=\"3\"  bordercolor=\"#336699\" align=\"center\"  width=\"400\">");
                out.println("   <form  method=\"post\" target=\"_top\" action=\"TarjetonComite\" > ");
                out.println("   <INPUT type=\"hidden\" name=\"nomCrp\" value=\"vprg1\">");
                out.println("   <INPUT type=\"hidden\" name=\"idCrp\" value=\"" + depto + "\">");
                out.println("   <INPUT TYPE=\"hidden\" NAME=\"nomprog\" VALUE=\" " + nomprog + "\">");
                out.println("   <tr>");
                out.println("       <td width=\"80\">");
                out.println("           <input TYPE=\"submit\"  VALUE=\"VCC\">");
                out.println("       </td>");
                out.println("       <td>");
                out.println("           <b>");
                out.println("           COMITE ASESOR POR PROGRAMA - " + nomprog);
                out.println("           </b>");
                out.println("       </td>");
                out.println("   </tr>");
                out.println("   </form>");
                out.println("</table>");

            }
        }

    }
%>

