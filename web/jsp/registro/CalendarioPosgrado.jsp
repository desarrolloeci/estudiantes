<%-- 
    Document   : CalendarioPosgrado
    Created on : 6/09/2016, 11:18:41 AM
    Author     : lucero.rodriguez
--%>
<!--%@ include file="../secure.jsp" %-->
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Actas.ActaJava" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%
        response.setHeader("Cache-Control", "no-cache");
        session = request.getSession(true);
      //  String nombre = new String((String) session.getAttribute("nombre"));
      //  String ban = new String((String) session.getAttribute("ban"));
        PrintWriter oout = response.getWriter();
        Estudiante est = new Estudiante();
        String codasig = request.getParameter("iden");
        configECI confEci = new configECI();
        Vector vh;       
        Vector horario = est.getCalendarioPosgrado(confEci.getPeriodoActual(), codasig);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Calendario Posgrado </title>
         <link rel="stylesheet" href="css/comun.css" type="text/css" />
    </head>
    <body>
     
        <% if (horario.size()>0){%>

           
<table width="50%" border="1" align="center" class="tabla">
  <tr> 
    <td colspan="3">
      <div align="center">Calendario para la asignatura:<%=codasig%></div>
    </td>
  </tr>
  <tr> 
    <!--<td>
      <div align="center">PERIODO</div>
    </td>-->
    <td> 
      <div align="center">FECHA</div>
    </td>
    <td> 
      <div align="center">HORA</div>
    </td>
    <td> 
      <div align="center">SALON</div>
    </td>
  </tr>
  <%  for (int i=0; i<horario.size();i++){
            Vector dato =  (Vector) (horario.elementAt(i));%>
  <tr> 
    <td><%=dato.elementAt(3)%></td>
    <!-- <td><!%=dato.elementAt(7)%></td>-->
    <td><%=dato.elementAt(5)%></td>
    <td><%=dato.elementAt(1)%></td>
  </tr>
  <%}%>
</table>

        <%}else {
            out.println("<center>No existen datos</center>");
            }%>
<h1></h1>
    </body>
</html>
