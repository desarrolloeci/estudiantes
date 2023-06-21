<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>

<%  
        response.setHeader("Cache-Control","no-cache"); 
	String nombre = new String((String)session.getAttribute("nombre"));
        //String spar = new String((String)session.getAttribute("spar"));
        String ident = request.getParameter("ident");
        String spar = request.getParameter("spar");
        PrintWriter oout = response.getWriter() ;
//        Estudiante est = new Estudiante(carnet,oout) ;
        Estudiante est = (Estudiante) session.getAttribute("estClase") ;
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
Vector Datos=est.getdespInfAsi(oout,carnet, ident);
Vector dato= (Vector) Datos.elementAt(0);
out.println("<b><font color=\"#800000\">Datos de asignatura:</font></b>" + dato.elementAt(0) );
out.println("<br>");
out.println("<b><font color=\"#800000\">Para el estudiante:</font></b>" + dato.elementAt(1)  );
out.println("<p>");
%>

<br>

<% Vector Biblia= est.getBibliapost(oout, carnet, ident);

out.println("<b><center><u><font color=\"#800000\">Información de Historia Académica</center></u></b></font>");
out.println("<br>");
if (Biblia.size()<=0){
out.println("No se encontraron registros en la Bases de Datos");
out.println("<br>");
}else{
%>
<table border="1" width="500">
<tr>
<td>Asignatura</td>
<td>Periodo</td>
<td>Nota </td>
<td>Clave</td>

</tr>

<% for (n =0; n < Biblia.size(); n++) {
                Vector historia = (Vector) Biblia.elementAt(n);
                
%>

<tr>
<tr>
<td><%=historia.elementAt(0)%></td>
<td><%=historia.elementAt(1)%></td>
<td><%=historia.elementAt(2)%></td>
<td><%=historia.elementAt(3)%></td>
</tr>

<%}
}%>

</table>
<br>
<br>


 
<%
out.println("<br>");
out.println("<br>");
out.println("<FORM>");
          out.println("<center><INPUT Type='button' Value='Close' onClick='window.close()'>");                        
          out.println("</center>");
          out.println("</FORM>");
%>


</body>
</html>