<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>

<%  
        Vector prei = new Vector() ;
        response.setHeader("Cache-Control","no-cache"); 
	String nombre = new String((String)session.getAttribute("nombre"));
	String nomas, prioas, cha = new String(), chb = new String();
	String prog = new String();
	PrintWriter oout = response.getWriter() ;
        Estudiante est = new Estudiante(carnet,oout) ;
        Vector lispre = est.getPreinscripcion(carnet) ;
        int i, crtot, cras, cradic ;
%>

<html>
<head>
<title>Preinscripciones Estudiantes</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
a  { text-decoration: none }
.texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}

-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000">

 
    
<table width="607" border="0" cellpadding="0" align="center" cellspacing="0">
  <tr> 
    <td width="24"><img src="img/arbIzqAz.gif" width="24" height="24"></td>
    <td width="564" valign="top"><img src="img/puntoAz.gif" width="565" height="2.5" align="absmiddle"></td>
    <td width="28"><img src="img/arbDerAz.gif" width="24" height="24"></td>
  </tr>
  <tr> 
    <td width="24" height="42"></td>
    <td width="564" height="42"> 
      <table width="94%" border="0" align="center">
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
              a Estudiantes - Preinscripción&nbsp;</font></font></div>
          </td>
        </tr>
        <tr> 
          <td align="center" valign="top" colspan="2" height="19"> <b><font face="Verdana, Arial, Helvetica, sans-serif">EL 
            PROCESO DE INSCRIPCION PARA EL PERIODO 2006-2, SE HA CERRADO</font></b><br>
			<p>&nbsp;</p>
          </td>
        </tr>
        <tr> 
          <td valign="top" colspan="2"> 
            <div align="right">
              <table width="55%" border="0" height="17">
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
            </div>
          </td>
        </tr>
      </table>
    </td>
    <td width="28" height="42" align="right"></td>
  </tr>
  <tr> 
    <td width="24"><img src="img/abaIzqAz.gif" width="24" height="24"></td>
    <td width="564" valign="bottom"><img src="img/puntoAz.gif" width="564" height="2.5"></td>
    <td width="28"><img src="img/abaDerAz.gif" width="24" height="24"></td>
  </tr>
</table>
