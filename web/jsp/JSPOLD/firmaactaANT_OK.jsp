<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Actas.Acta" %>


<%  
    response.setHeader("Cache-Control","no-cache"); 
	String firma = new String((String)session.getAttribute("firma"));
	String nombre = new String((String)session.getAttribute("nombre"));
        String obs = request.getParameter("observ");
        Acta acta = new Acta() ;         
        acta.firmarActa(carnet,firma,obs);
%>

<html>
<head>
<title>Renovacion de matricula y acta</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
a  { text-decoration: none }
.texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}

-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000">

<table width="640" border="0" cellpadding="0" align="center" cellspacing="0">
  <tr>
    <td width="628" height="42" valign="top"> 
	<jsp:include page="encabezado" flush="true"/>
      <table width="100%" border="0" align="center">
        <tr> 
          <td align="center" valign="top" colspan="2"> 
            <%if(acta.getRespuesta().equals("A")){%>
            <p>&nbsp;</p>
            <center>
              <h3><font face="Verdana, Arial, Helvetica, sans-serif">FALLO LA 
                CONEXION, NO SE FIRMO EL ACTA</font></h3>
            </center>
            <font face="Verdana, Arial, Helvetica, sans-serif"> 
            <%}%>
            <%if(acta.getRespuesta().equals("E")){%>
            </font> 
            <p>&nbsp;</p>
            <center>
              <h3><font face="Verdana, Arial, Helvetica, sans-serif">ERROR EN 
                LA BASE DE DATOS, NO SE FIRMO EL ACTA</font></h3>
            </center>
            <font face="Verdana, Arial, Helvetica, sans-serif"> 
            <%}%>
            <%if(acta.getRespuesta().equals("S")){%>
            </font> 
            <p>&nbsp;</p>
            <center>
              <h3><font face="Verdana, Arial, Helvetica, sans-serif">SU RENOVACIÓN 
                Y ACTA DE MATRICULA FUERON RECIBIDAS</font></h3>
            </center>
            <font face="Verdana, Arial, Helvetica, sans-serif"> 
            <%}%>
            </font> 
            <p>&nbsp;</p>
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
  </tr>
  
</table>


<p>&nbsp;</p>
</body>
</html>
