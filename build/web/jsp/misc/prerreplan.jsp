<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>

<%
    response.setHeader("Cache-Control", "no-cache");
    String nombre = new String((String) session.getAttribute("nombre"));
    //String spar = new String((String)session.getAttribute("spar"));
    String ident = request.getParameter("ident");
    String idplan = request.getParameter("idplan");
    String spar = request.getParameter("spar");
    PrintWriter oout = response.getWriter();
//        Estudiante est = new Estudiante(carnet,oout) ;
    Estudiante est = (Estudiante) session.getAttribute("estClase");
    int i, indice, a, n;
%>

<html>
    <head>
        <title>Servicios Academicos - Plan de estudios</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <style type="text/css">
            <!--
            a  { text-decoration: none }
            .texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}

            -->
        </style>
    </head>

    <body bgcolor="#FFFFFF" text="#000000">
<%
            Vector Datos = est.getdespInfAsi(oout, carnet, ident);
            Vector dato = (Vector) Datos.elementAt(0);
            out.println("<b><font color=\"#800000\"><center>Datos de asignatura:</font></b>" + dato.elementAt(0));
            out.println("<br>");
            out.println("<b><font color=\"#800000\"><center>Para el estudiante:</font></b>" + dato.elementAt(1));
            out.println("</center><p>");
        %>
<%
            if (spar.equals("4")) {
                Vector Registro = est.getRegistro(oout, carnet, ident);
                out.println("<b><center><u><font color=\"#800000\">Información de Registro actual</center></u></b></font>");
                out.println("<br>");
                for (a = 0; a < Registro.size(); a++) {
                    Vector regactual = (Vector) Registro.elementAt(a);
        %>
<div align="center">
        <table border="1" width="500">
            <tr>
                <td>Asignatura</td>
                <td>Nota 1</td>
                <td>Nota 2</td>
                <td>Nota 3</td>
                <td>Nota_Lab</td>
                <td>Clave</td>

            </tr>
            <tr>
                <td><%=regactual.elementAt(0)%></td>
                <td><%=regactual.elementAt(1)%></td>
                <td><%=regactual.elementAt(2)%></td>
                <td><%=regactual.elementAt(3)%></td>
                <td><%=regactual.elementAt(4)%></td>
                <td><%=regactual.elementAt(5)%></td>

            </tr>
        </table>
		</div>
        <br>
        <br>
        <%}
            }
        %>

        <% Vector Biblia = est.getBiblia(oout, carnet, ident);
            out.println("<b><center><u><font color=\"#800000\">Información de Historia Académica</font></u></center></b>");
            out.println("<br>");
            if (Biblia.size() <= 0) {
                out.println("<center>No se encontraron registros en la Base de Datos</center>");
                out.println("<br>");
            } else
        %>
		<div align="center">
        <table border="1" width="500">
            <tr>
                <td>Asignatura</td>
                <td>Periodo</td>
                <td>Nota </td>
                <td>Clave</td>

            </tr>

            <% for (n = 0; n < Biblia.size(); n++) {
                    Vector historia = (Vector) Biblia.elementAt(n); %>

            <tr>
            <tr>
                <td><%=historia.elementAt(0)%></td>
                <td><%=historia.elementAt(1)%></td>
                <td><%=historia.elementAt(2)%></td>
                <td><%=historia.elementAt(3)%></td>
            </tr>

            <%}%>

        </table>
		</div>
        <br>
        <br>
<%
            out.println("<b><center><u><font color=\"#800000\">Prerrequisitos en el plan</font></u></center></b>");
            out.println("<br>");

            Vector prerreq = est.getdesppre(oout, carnet, ident);

            if (ident.equals("9694")|| ident.equals("1209") ) {
                Vector Otros = est.OtrosPrerreq(oout, carnet);
                if (Otros.size() > 0) {
                    for (int j = 0; j < Otros.size(); j++) {
                        Vector otroreq = (Vector) Otros.elementAt(j);
                        String nombres = ((String) otroreq.elementAt(0));
                        Vector nomasig = est.NombreAsig(oout, nombres);
                        String nombreasigna = (String) ((Vector) nomasig.elementAt(0)).elementAt(0);
        %>
<div align="center">
        <table border="1" width="500">
            <tr>
                <td><%=nombreasigna%></td>
            </tr>
        </table>
		</div>

        <%  }

            } else {
                out.println("<center>No se encontraron registros en la Base de Datos</center>");
                out.println("<br>");
            }

        } else if (ident.equals("9709")) {
            for (indice = 0; indice < prerreq.size(); indice++) {
                Vector requisito = (Vector) prerreq.elementAt(indice);%>
				<div align="center">
                <table border="1" width="500">
            <tr>
                <td><%=requisito.elementAt(0)%></td>
            </tr>
        </table>
		</div>

        <% }
            out.println("<br>");
            out.println("<br>");
        
            Vector Otros = est.OtrosPrerreqF(oout, carnet);
               // Vector requisito = (Vector) prerreq.elementAt(indice);
                if (Otros.size() > 0) {
                    for (int j = 0; j < Otros.size(); j++) {
                        Vector otroreq = (Vector) Otros.elementAt(j);
                        String nombres = ((String) otroreq.elementAt(0));
                        Vector nomasig = est.NombreAsig(oout, nombres);
                        String nombreasigna = (String) ((Vector) nomasig.elementAt(0)).elementAt(0);
        %>
<div align="center">
        <table border="1" width="500">
            <tr>
                <td><%=nombreasigna%></td>
            </tr>
        </table>
		</div>

        <%  }

            } else {
                out.println("<center>No se encontraron registros en la Base de Datos</center>");
                out.println("<br>");
            }

        } else if (ident.equals("9718")) {
            for (indice = 0; indice < prerreq.size(); indice++) {
                Vector requisito = (Vector) prerreq.elementAt(indice);%>
				<div align="center">
                <table border="1" width="500">
            <tr>
                <td><%=requisito.elementAt(0)%></td>
            </tr>
        </table>
		</div>

        <% }
            out.println("<br>");
            out.println("<br>");
        
                Vector Otros = est.OtrosPrerreqE(oout, carnet);
                if (Otros.size() > 0) {
                    for (int j = 0; j < Otros.size(); j++) {
                        Vector otroreq = (Vector) Otros.elementAt(j);
                        String nombres = ((String) otroreq.elementAt(0));
                        Vector nomasig = est.NombreAsig(oout, nombres);
                        String nombreasigna = (String) ((Vector) nomasig.elementAt(0)).elementAt(0);
        %>
<div align="center">
        <table border="1" width="500">
            <tr>
                <td><%=nombreasigna%></td>
            </tr>
        </table>
		</div>

        <%  }

            } else {
                out.println("<center>No se encontraron registros en la Base de Datos</center>");
                out.println("<br>");
            }

        } else if (ident.equals("1370")) {
          for (indice = 0; indice < prerreq.size(); indice++) {
                Vector requisito = (Vector) prerreq.elementAt(indice);%>
				<div align="center">
                <table border="1" width="500">
            <tr>
                <td><%=requisito.elementAt(0)%></td>
            </tr>
        </table>
		</div>

        <% }
            out.println("<br>");
            out.println("<br>");    
        
                Vector Otros = est.OtrosPrerreqQ(oout, carnet);
                if (Otros.size() > 0) {
                    for (int j = 0; j < Otros.size(); j++) {
                        Vector otroreq = (Vector) Otros.elementAt(j);
                        String nombres = ((String) otroreq.elementAt(0));
                        Vector nomasig = est.NombreAsig(oout, nombres);

                        String nombreasigna = (String) ((Vector) nomasig.elementAt(0)).elementAt(0);
        %>
<div align="center">
        <table border="1" width="500">
            <tr>
                <td><%=nombreasigna%></td>
            </tr>
        </table>
		</div>

        <%  }

            } else {
                out.println("<center>No se encontraron registros en la Base de Datos</center>");
                out.println("<br>");
            }

        } else if (ident.equals("10183")) {
              for (indice = 0; indice < prerreq.size(); indice++) {
                Vector requisito = (Vector) prerreq.elementAt(indice);%>
				<div align="center">
                <table border="1" width="500">
            <tr>
                <td><%=requisito.elementAt(0)%></td>
            </tr>
        </table>
		</div>

        <% }
            out.println("<br>");
            out.println("<br>");    
            
        
                Vector Otros = est.OtrosPrerreqB(oout, carnet);
                if (Otros.size() > 0) {
                    for (int j = 0; j < Otros.size(); j++) {
                        
                        Vector otroreq = (Vector) Otros.elementAt(j);
                        String nombres = ((String) otroreq.elementAt(0));
                        Vector nomasig = est.NombreAsig(oout, nombres);

                        String nombreasigna = (String) ((Vector) nomasig.elementAt(0)).elementAt(0);
        %>
<div align="center">
        <table border="1" width="500">
            <tr>
                <td><%=nombreasigna%></td>
            </tr>
        </table>
		</div>

        <%  }

            } else {
                out.println("<center>No se encontraron registros en la Base de Datos</center>");
                out.println("<br>");
            }

        } else if (ident.equals("10181")) {
               for (indice = 0; indice < prerreq.size(); indice++) {
                Vector requisito = (Vector) prerreq.elementAt(indice);%>
				<div align="center">
                <table border="1" width="500">
            <tr>
                <td><%=requisito.elementAt(0)%></td>
            </tr>
        </table>
</div>
        <% }
            out.println("<br>");
            out.println("<br>");    
            
        
                Vector Otros = est.OtrosPrerreqC(oout, carnet);
                if (Otros.size() > 0) {
                    for (int j = 0; j < Otros.size(); j++) {
                        Vector otroreq = (Vector) Otros.elementAt(j);
                        String nombres = ((String) otroreq.elementAt(0));
                        Vector nomasig = est.NombreAsig(oout, nombres);

                        String nombreasigna = (String) ((Vector) nomasig.elementAt(0)).elementAt(0);
        %>
<div align="center">
        <table border="1" width="500">
            <tr>
                <td><%=nombreasigna%></td>
            </tr>
        </table>
		</div>

        <%  }

            } else {
                out.println("<center>No se encontraron registros en la Base de Datos</center>");
                out.println("<br>");
            }

        } else if (ident.equals("10179")) {
            for (indice = 0; indice < prerreq.size(); indice++) {
                Vector requisito = (Vector) prerreq.elementAt(indice);%>
				<div align="center">
                <table border="1" width="500">
            <tr>
                <td><%=requisito.elementAt(0)%></td>
            </tr>
        </table>
		</div>

        <% }
            out.println("<br>");
            out.println("<br>");
            
        
                Vector Otros = est.OtrosPrerreqQui(oout, carnet);
                if (Otros.size() > 0) {
                    for (int j = 0; j < Otros.size(); j++) {
                        Vector otroreq = (Vector) Otros.elementAt(j);
                        String nombres = ((String) otroreq.elementAt(0));
                        Vector nomasig = est.NombreAsig(oout, nombres);

                        String nombreasigna = (String) ((Vector) nomasig.elementAt(0)).elementAt(0);
        %>
<div align="center">
        <table border="1" width="500">
            <tr>
                <td><%=nombreasigna%></td>
            </tr>
        </table>
		</div>

        <%  }
            } else {
                out.println("<center>No se encontraron registros en la Base de Datos</center>");
                out.println("<br>");
            }
        }   else if (prerreq.size() <= 0 ) {
            out.println("<center>No se encontraron registros en la Base de Datos</center>");
            out.println("<br>");
        } else
            for (indice = 0; indice < prerreq.size(); indice++) {
                Vector requisito = (Vector) prerreq.elementAt(indice);
        %>
		<div align="center">
        <table border="1" width="500">
            <tr>
                <td><%=requisito.elementAt(0)%></td>
            </tr>
        </table>
		</div>

        <% }
            out.println("<br>");
            out.println("<br>");
        %>


        <%
            Vector Correq = est.getdespcorreq(oout, carnet, ident, idplan);
            out.println("<b><center><u><font color=\"#800000\">Correquisitos en el plan</font></u></center></b>");
            out.println("<br>");
            if (Correq.size() <= 0) {
                out.println("<center>No se encontraron registros en la Base de Datos</center>");
                out.println("<br>");
            } else
                for (i = 0; i < Correq.size(); i++) {
                    Vector Correquisito = (Vector) Correq.elementAt(i);
        %>
<div align="center">
        <table border="1" width="500">
            <tr>
                <td><%=Correquisito.elementAt(0)%></td>
            </tr>
        </table>
</div>
        <%
                }
            out.println("<br>");
            out.println("<br>");
            out.println("<FORM>");
            out.println("<center><INPUT Type='button' Value='Close' onClick='window.close()'>");
            out.println("</center>");
            out.println("</FORM>");
        %>


    </body>
</html>