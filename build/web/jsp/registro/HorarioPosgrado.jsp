<%-- 
    Document   : HorarioPosgrado
    Created on : 11/06/2013, 03:12:20 PM
    Author     : Lucero
--%>
<%@ include file="../secure.jsp" %>
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Actas.ActaJava" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%
        response.setHeader("Cache-Control", "no-cache");
        session = request.getSession(true);
        String nombre = new String((String) session.getAttribute("nombre"));
        String ban = new String((String) session.getAttribute("ban"));
        PrintWriter oout = response.getWriter();
        Estudiante est = (Estudiante) session.getAttribute("estClase");
        
        configECI confEci = new configECI();
        Vector vh;
        String maximo;
        Vector periodo = est.getMaxPeriodoPos();%>
       
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Horario Posgrado </title>
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
                        </jsp:include>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="info" align="center">
                            <h2><font color="#666666">
                                    <label id="msj">Horario de Clase</label>
                            </font></h2>
                    </div></td>
                </tr>
      </table>
        <% if (periodo.size() > 0) {
        maximo = ((Vector) periodo.elementAt(0)).elementAt(0).toString();
        Vector horario = est.getHorarioPosgrado(maximo);
         if (horario.size()>0){%>

           <table width="50%" border="1" align="center" class="tabla">
  <tr>
    <td>
      <div align="center">ASIGNATURA</div>
    </td>
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
    <td><%=dato.elementAt(9)%></td>
   <!-- <td><!%=dato.elementAt(7)%></td>-->
    <td><%=dato.elementAt(5)%></td>
    <td><%=dato.elementAt(8)%></td>
    <td><%=dato.elementAt(2)%></td>
  </tr>
 <%}%>
</table>

        <%}else {
            out.println("<center>No existen datos</center>");
            }
        }%>
<h1></h1>
    </body>
</html>
