<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Actas.Acta" %>


<%  
        response.setHeader("Cache-Control","no-cache"); 
	String cnum = new String((String)session.getAttribute("clanum"));
        Acta acta = new Acta() ;  
        String opcion, firma, obs ;	
	String prog = new String();
	acta.consultarActa(carnet,cnum) ; 
%>
<html>
<head>
<title>Servicios a Estudiantes</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
a  { text-decoration: none }
.texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}

-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000">

<div align="center"></div>
 
<table width="672" border="0" cellpadding="0" align="center" cellspacing="0">
  <tr> 
    <td width="24"><img src="img/arbIzqAz.gif" width="24" height="24"></td>
    <td width="628" valign="top"><img src="img/puntoAz.gif" width="664" height="2.5" align="absmiddle"></td>
    <td width="20"><img src="img/arbDerAz.gif" width="24" height="24"></td>
  </tr>
  <tr> 
    <td width="24" height="42"></td>
    <td width="628" height="42"> 
	<jsp:include page="encabezado" flush="true"/>
      <table width="100%" border="0" align="center">
        <tr> 
          <td align="center" valign="top" colspan="2" height="60"> 
            <div align="left">
              <p>&nbsp;</p>
              <p><font face="Verdana, Arial, Helvetica, sans-serif"><b>El proceso 
                de Renovaci&oacute;n de acta no esta disponible en esta fecha. 
                </b> </font></p>
              <p>&nbsp;</p>
            </div>
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
    <td width="20" height="42" align="right"></td>
  </tr>
  <tr> 
    <td width="24" height="2"><img src="img/abaIzqAz.gif" width="24" height="24"></td>
    <td width="628" valign="bottom" height="2"><img src="img/puntoAz.gif" width="664" height="2.5"></td>
    <td width="20" height="2"><img src="img/abaDerAz.gif" width="24" height="24"></td>
  </tr>
</table>
</body>
</html>

