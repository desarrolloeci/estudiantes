<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>

<%  
        Vector prei = new Vector() ;
        response.setHeader("Cache-Control","no-cache"); 
		String idasig = new String((String)session.getAttribute("idasig"));
		String ban = new String((String)session.getAttribute("ban"));
		PrintWriter oout = response.getWriter() ;
    	String nomasig = "";
%>

<html>
<head>
<title>Preinscripcion</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
a  { text-decoration: none }
.texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}

-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000">

<% if (idasig.equals("843"))
		nomasig = "Inglés Nivel 1 - Parte A";
	if (idasig.equals("846"))
		nomasig = "Inglés Nivel 1 - Parte B";		
	if (idasig.equals("853"))
		nomasig = "Inglés Nivel 2 - Parte A";
	if (idasig.equals("856"))
		nomasig = "Inglés Nivel 2 - Parte B";		
	if (idasig.equals("863"))
		nomasig = "Inglés Nivel 3 - Parte A";	
	if (idasig.equals("866"))
		nomasig = "Inglés Nivel 3 - Parte B";
	if (idasig.equals("873"))
		nomasig = "Inglés Nivel 4 - Parte A";	
	if (idasig.equals("876"))
		nomasig = "Inglés Nivel 4 - Parte B";		
%>
 
    <table width="580" border="0" cellpadding="0" align="center" cellspacing="0">
    <tr> 
        <td width="8"><img src="../img/arbIzqAz.gif" width="24" height="24"></td>
        <td width="564" valign="top"><img src="../img/puntoAz.gif" width="564" height="2.5" align="absmiddle"></td>
        <td width="8"><img src="../img/arbDerAz.gif" width="24" height="24"></td>
    </tr>
    <tr> 
        <td width="8" height="42"></td>
        <td width="564" height="42"> 
       	<jsp:include page="encabezado.jsp" flush="true"/> 
      <table width="100%" border="0" align="center">
        <tr>
          <td align="center" valign="top"><div> <br>
              <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif"><font size="4">Preinscripción 
                Ingl&eacute;s </font></font></div>
            </div></td>
        </tr>
        <tr> 
          <td align="center" valign="top"> 
            <br>
			<div align="left">
			<%if (ban.equals("0")) {%>	
              <p><font face="Verdana, Arial, Helvetica, sans-serif">Usted ya tiene preinscrita la asignatura: <b><%=nomasig%></b> 
                </font></p>
			<%} else {%>  
			  <p><font face="Verdana, Arial, Helvetica, sans-serif">La</font><font face="Verdana, Arial, Helvetica, sans-serif"> 
                solicitud de preinscripcion para la asignatura: <b><%=nomasig%></b> 
                fue recibida.</font></p>
			<%}%>
              <p>&nbsp;</p>
            </div>
          </td>
        </tr>
        <tr> 
          <td valign="top"> 
            <div align="right"> 
              <table width="45%" border="0" height="17">
                <tr> 
                  <td width="27%" height="14"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="preinscripIngles.jsp">ANTERIOR</a> </font></b></font></div>
                  </td>
                  <td width="4%" height="14" align="center" valign="middle"> 
                    <div align="center">|</div>
                  </td>
                  <td width="22%" height="14"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud.jsp">INICIO</a></font></b></font></div>
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
