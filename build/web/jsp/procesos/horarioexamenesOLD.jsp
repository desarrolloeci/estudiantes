<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>

<%  
	String nombre = new String((String)session.getAttribute("nombre"));
	String ban = new String((String)session.getAttribute("ban"));
	PrintWriter oout = response.getWriter() ;
        //Estudiante est = new Estudiante(carnet,oout) ;
        Estudiante est = (Estudiante) session.getAttribute("estClase") ;
        configECI cfgEci = new configECI();

%>

<html>
<head>
<title>Servicios Academicos - Consulta de Notas</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}
a{color: blue;}
a:hover{color:#3366CC; }
-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000">

<table width="640" border="0" cellpadding="0" align="center" cellspacing="0">
    <tr> 
    <td width="640" height="42" valign="top"> 
	<jsp:include page="encabezado" flush="true"/>
      <table width="100%" border="0" align="center">
        <tr> 
          <td valign="top"><br><div align="center"><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif"><b><u>Horario de Exámenes</u></b></font></div><br>
            <%Vector horario = est.getHorarioEx(carnet, cfgEci.getPeriodoActual(), oout);%>
            <%if (horario.size() <= 0){%>
            <p> 
              <center>
                <b><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif">No se encontraron registros en la base de datos, para este 
                periodo</font></b> 
              </center>
            </p>
            <%}else{%>
            <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#336699">
              <tr bgcolor="#336699"> 
                <td width="20%"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Asignatura</font></b></td>
                <td width="40%"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Día 
                  de exámen</font></b></td>
                <td width="20%"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Hora</font></b></td>
                <td width="20%"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Salón</font></b></td>
              </tr>
              <% for ( int j = 0 ; j < horario.size() ; j++ ){
		Vector horarioex = (Vector)horario.elementAt(j) ;
		%>
              <tr> 
                <td width="20%"><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif"><%=horarioex.elementAt(1)%></font></td>
                <td width="40%"><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif"><%=horarioex.elementAt(2)%></font></td>
                <td width="20%"><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif"><%=horarioex.elementAt(3)%></font></td>
                <td width="20%"><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif"><%=horarioex.elementAt(4)%></font></td>
              </tr>
              <%}%>
            </table>
            <%}%>
            <br>
          </td>
        </tr>
        <tr> 
          <td valign="top"> 
            <div align="right"> 
              <table width="45%" border="0" height="17">
                <tr> 
                  <td width="27%" height="14"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud">ANTERIOR</a> </font></b></font></div>
                  </td>
                  <td width="4%" height="14" align="center" valign="middle"> 
                    <div align="center">|</div>
                  </td>
                  <td width="22%" height="14"> 
                    <%if (ban.equals("0")){%>
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"><a href="menuServEstud">INICIO</a></font></b></font></div>
                    <%} else {%>
                    <font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"><a href="menuServEstud1">INICIO</a></font></b></font> 
                    <%}%>
                  </td>
                  <td width="4%" height="14" align="center" valign="middle"> 
                    <div align="center"><b>|</b></div>
                  </td>
                  <td width="43%" height="14"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"><a href="LogOutEst">CERRAR 
                      SESION </a></font></b></font></div>
                  </td>
                </tr>
              </table>
            </div>
          </td>
        </tr>
		<tr>
      <td height="5" colspan="3"><img src="img/bararhoriz.gif" width="640" height="5"></td>
    </tr>
      </table>
    </td>
  </tr>
</table>

</body>
</html>
