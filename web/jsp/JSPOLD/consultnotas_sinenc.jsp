<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>

<%  
    response.setHeader("Cache-Control","no-cache"); 
	String nombre = new String((String)session.getAttribute("nombre"));
	String ban = new String((String)session.getAttribute("ban"));
	PrintWriter oout = response.getWriter() ;
//        Estudiante est = new Estudiante(carnet,oout) ;
        Estudiante est = (Estudiante) session.getAttribute("estClase") ;
%>

<html>
<head>
<title>Servicios Academicos - Consulta de Notas</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
a  { text-decoration: none }
.texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}

-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000">

<table width="580" border="0" cellpadding="0" align="center" cellspacing="0">
    <tr> 
        <td width="8"><img src="../img/arbIzqAz.gif" width="24" height="24"></td>
        <td width="564" valign="top"><img src="../img/puntoAz.gif" width="564" height="2.5" align="absmiddle"></td>
        <td width="8"><img src="../img/arbDerAz.gif" width="24" height="24"></td>
    </tr>
    <tr> 
        <td width="8" height="42"></td>
        <td width="564" height="42"> 
        <table width="100%" border="0" align="center">
            <tr> 
            <td height="37" rowspan="2" align="left" valign="top" width="14%"> 
                <div align="left"><font face="Verdana, Arial, Helvetica, sans-serif"><b><img src="../img/LogEci.gif" width="72" height="74"></b></font></div>
            </td>
            <td height="33" width="86%"> 
             <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif"><b><font color="#336699" size="4">ESCUELA 
              COLOMBIANA DE INGENIERIA</font></b></font></div>
            </td>
            </tr>
            <tr> 
             <td width="86%" height="55" valign="top"> 
                
            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif"><font size="4">Servicios 
              a Estudiantes - Consulta de Notas</font></font></div>
            </td>
            </tr>
            <tr> 
            <td height="6" colspan="2"> 
                <div><font face="Verdana, Arial, Helvetica, sans-serif"><b>Nombre: 
                <font size="2">&nbsp;<%=nombre%> </font></b> </font></div>
            </td>
            </tr>
            <tr> 
            
          <td valign="top" colspan="2"> 
            <br>
            <font size="3" color="#336699" face="Verdana, Arial, Helvetica, sans-serif" ><center><b>Seleccione el periodo académico a consultar:</b></center></font>
            
            <form name="form1" method="post" action="notasestud.jsp">
              <%Vector period = est.getInfoPeriodos() ;%>
			<center><select name="periodo">
			<option value="PA">Consulta Periodo Actual</option> 
              <% for ( int j = 0 ; j < period.size() ; j++ ){
		Vector periodos = (Vector)period.elementAt(j) ;
		%>
		<option value="<%=periodos.elementAt(0)%>">Período <%=periodos.elementAt(0)%></option>               
		<%}%>
		</select></center>
       <br>       
      <div align="center">
    <input type="submit" name="Submit" value=" Consultar " size="2">
  </div>
</form>
            </td>
            </tr>
            <tr> 
             <td valign="top" colspan="2"> 
             <div align="right"></div>
             <div align="right"> 
              <table width="45%" border="0" height="17">
                <tr> 
                  <td width="27%" height="14"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                 <%if (ban.equals("0")){%>
                      <a href="menuServEstud.jsp">ANTERIOR</a> </font></b></font></div> 
                 <%} else {%>
                      <a href="menuServEstud1.jsp">ANTERIOR</a> </font></b></font></div> 
                 <%}%>
                  </td>
                  <td width="4%" height="14" align="center" valign="middle"> 
                    <div align="center">|</div>
                  </td>                  
                  <td width="22%" height="14">                 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                 <%if (ban.equals("0")){%>
                      <a href="menuServEstud.jsp">INICIO</a></font></b></font></div>
                 <%} else {%>
                      <a href="menuServEstud1.jsp">INICIO</a></font></b></font></div>
                 <%}%>
                  </td>
                  <td width="4%" height="14" align="center" valign="middle"> 
                    <div align="center"><b>|</b></div>
                  </td>
                  <td width="43%" height="14"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"><a href="../servlet/LogOutEst/">CERRAR 
                      SESION </a></font></b></font></div>
                  </td>
                </tr>
              </table>
            </div>
          </td>
        </tr>
      </table>
    </td>
    <td width="8" height="42" align="right"></td>
  </tr>
  <tr> 
    <td width="8"><img src="../img/abaIzqAz.gif" width="24" height="24"></td>
    <td width="564" valign="bottom"><img src="../img/puntoAz.gif" width="564" height="2.5"></td>
    <td width="8"><img src="../img/abaDerAz.gif" width="24" height="24"></td>
  </tr>
</table>

</body>
</html>