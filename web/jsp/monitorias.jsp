<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>

<%  
        response.setHeader("Cache-Control","no-cache"); 
	String nombre = new String((String)session.getAttribute("nombre"));
	PrintWriter oout = response.getWriter() ;
        Estudiante est = new Estudiante(carnet,oout) ;
        configECI cfgEci = new configECI();
    if (carnet != null && !carnet.equals("")) {

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
<form name="form1" method="post" action="guardamonitor">  
<table width="752" border="0" cellpadding="0" align="center" cellspacing="0">
  <tr> 
        
      <td width="24"><img src="img/arbIzqAz.gif" width="24" height="24"></td>
        
      <td width="883" valign="top"><img src="img/puntoAz.gif" width="715" height="3" align="absmiddle"></td>
        
      <td width="428"><img src="img/arbDerAz.gif" width="24" height="24"></td>
    </tr>
    <tr> 
        
      <td width="24" height="42"></td>
        
      <td width="883" height="42"> 
        <table width="99%" border="0" align="center">
          <tr> 
            <td height="37" rowspan="2" align="left" valign="top" width="14%"> 
              <div align="left"><font face="Verdana, Arial, Helvetica, sans-serif"><b><img src="img/LogEci.gif" width="72" height="74"></b></font></div>
            </td>
            <td height="33" width="86%"> 
              <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif"><b><font color="#336699" size="4">ESCUELA 
                COLOMBIANA DE INGENIERIA</font></b></font></div>
            </td>
          </tr>
          <tr> 
            <td width="86%" height="55" valign="top"> 
              <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif"><font size="4">Servicios 
                a estudiantes - Solicitud de monitorias </font></font></div>
            </td>
          </tr>
          <tr> 
            <td height="6" colspan="2"> 
              <div><font size="2"> <b>Nombre: </b> <font size="2">&nbsp;<%=nombre%> 
                </font> </font></div>
            </td>
          </tr>
          <%Vector estud = est.getInfoEstudiante() ;%>
          <% for ( int j = 0 ; j < estud.size() ; j++ ){
		Vector estudiante = (Vector)estud.elementAt(j) ;
%>
          <%String prog="";
if (estudiante.elementAt(7).equals("13")){
	  	prog="INGENIERIA CIVIL";}%>
          <%if (estudiante.elementAt(7).equals("14")){
	  	prog="INGENIERIA ELECTRICA";}%>
          <%if (estudiante.elementAt(7).equals("15")){
	  	prog="INGENIERIA DE SISTEMAS";}%>
          <%if (estudiante.elementAt(7).equals("16")){
	  	prog="INGENIERIA INDUSTRIAL";}%>
          <%if (estudiante.elementAt(7).equals("17")){
	  	prog="INGENIERIA ELECTRONICA";}%>
          <%if (estudiante.elementAt(7).equals("18")){
	  	prog="ECONOMIA";}%>
          <%if (estudiante.elementAt(7).equals("19")){
	  	 prog="ADMINISTRACION";}
		 %>
          <tr> 
            <td valign="top" colspan="2"> 
              <div><b>Documento de identidad:</b><font size="3">&nbsp;<%=estudiante.elementAt(3)%> 
                &nbsp;&nbsp;&nbsp;&nbsp;<b>Telefono:</b> <%=estudiante.elementAt(6)%></font> 
              </div>
            </td>
          </tr>
          <tr> 
            <td valign="top" colspan="2"> 
              <div><b>Programa de estudios:</b><font size="2">&nbsp;<%=prog%> 
                &nbsp;&nbsp;&nbsp;&nbsp;<b>Semestre que cursa:</b> <%=estudiante.elementAt(24)%></font> 
              </div>
            </td>
          </tr>
          <tr> 
            <td valign="top" colspan="2"> <b>Direccion electronica:</b><font size="3">&nbsp;<%=estudiante.elementAt(23)%>@mail.escuelaing.edu.co 
              </font> </td>
          </tr>
          <tr> 
            <td valign="top" colspan="2">&nbsp;</td>
          </tr>
          <tr> 
            <td valign="top" colspan="2" height="25"> 
              <p><b>Este proceso ha terminado.</b> 
            </td>
          </tr>
		  <%}%>
          <tr> 
            <td valign="top" colspan="2"> 
              <table width="45%" border="0" height="17" align="right">
                <tr> 
                  <td width="27%" height="14"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud">ANTERIOR</a> </font></b></font></div>
                  </td>
                  <td width="4%" height="14" align="center" valign="middle"> 
                    <div align="center">|</div>
                  </td>
                  <td width="22%" height="14"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud">INICIO</a></font></b></font></div>
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
            </td>
          </tr>
        </table>
    </td>
      <td width="428" height="42" align="right"></td>
  </tr>
  <tr> 
      <td width="24"><img src="img/abaIzqAz.gif" width="24" height="24"></td>
      <td width="883" valign="bottom"><img src="img/puntoAz.gif" width="715" height="3"></td>
      <td width="428"><img src="img/abaDerAz.gif" width="24" height="24"></td>
  </tr>
</table>
</form>


</body>
</html>
<%
    } else {
%>
<jsp:forward page="login"/>
<% 	
    } 
%>
