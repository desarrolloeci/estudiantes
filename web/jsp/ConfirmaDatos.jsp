<%-- 
    Document   : ConfirmaDatos
    Created on : 27/07/2010, 10:23:52 AM
    Author     : lrodriguez
--%>
<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>


<% String documento = request.getParameter("doc");
// String carnet = new String((String)session.getAttribute("carnet"));
        String celular = request.getParameter("celular");
        PrintWriter oout = response.getWriter();
        Estudiante est = (Estudiante) session.getAttribute("estClase");
        Vector Datos = est.Datos(carnet);
        Vector existe = est.icfes(carnet);%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Inscripción Icfes</title>
    </head>
    <body>
        <table width="770" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
            <tr>
                <td colspan="2" bgcolor="#EEEEEE"><img src="img/top.gif" alt="" width="770" height="10" id="top" /></td>
            </tr>
            <tr>
                <td>
                    <jsp:include page="encabezado" flush="true">
                        <jsp:param name="anterior" value="menuServEstud" />
                </jsp:include></td>
            </tr>
        </table>

        <% if (existe.size() > 0) {
            out.println("<center><b>Ya se encuentra registrado en el sistema</b></center>");
        } else {%>
        
        <% for (int i = 0; i < Datos.size(); i++) {
         Vector dato = (Vector) Datos.elementAt(i);
         if (dato.elementAt(2).equals("T")) {
             out.println("<center><b>Unicamente están autorizados los estudiantes que tengan como documento cédula</b></center>");%>

        <!-- COMPARA LOS 6 DIGITOS DE DOC_EST CON LOS 6 Q SE INGRESAN POR PANTALLA
     String dato1= dato.elementAt(3).toString();
      String sub=dato1.substring(0,6);
      String sub2=documento.substring(0,6);
      out.println(sub);
      out.println(sub2);
      if (sub.equals(sub2)){

          }-->
        <%} else if (dato.elementAt(2).equals("C")) {%>

        <% est.inscripicfes(carnet, documento, celular);%>
        <center><b>Sus datos fueron registrados.</b></center>
        <%}
            }
        }%>


    </body>
</html>
