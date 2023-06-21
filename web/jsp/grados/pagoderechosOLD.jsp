<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.DecimalFormat" %>

<% 

String ban = new String((String)session.getAttribute("ban"));
String igrad = new String((String) session.getAttribute("igrad"));
%>
<html>
<head>
<title>Pago derechos de grado</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.boton{
        font-size:10px;
        font-family:Verdana,Helvetica;
        font-weight:bold;
        color:white;
	background-image:url(img/blue-background.gif);
        height:25px;
	border-color: 666699;
	border-width: 2;
}
.texto {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-style: normal;
	line-height: normal;
	font-weight: bold;
	font-variant: normal;
	text-transform: none;
	text-decoration: none;
	color: #666666;
}
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
      <table width="100%" border="0" align="center" class="texto">
        <tr> 
          <td width="100%" height="6" > 
            <div>
              <div align="center">
                  <%if(igrad.equals("O")){%>
                <p><font face="Verdana, Arial, Helvetica, sans-serif"><font color="#666666" size="2"><u><strong>Pago Derechos
                          de Grado </strong></u></font></font></p>
                <p align="left"><a href="PagoDerPSE">1. Pago en l&iacute;nea PSE</a></p>
                <p align="left"><a href="PagoDerSantander?tipo=santander">2. Pago en Banco Santander</a></p>
                <p align="left"><a href="PagoDerSantander?tipo=caja">3. Pago en caja</a><br>
                </p>
                <%}else if(igrad.equals("P")){%>
                <p><font face="Verdana, Arial, Helvetica, sans-serif"><font color="#666666" size="2"><u><strong>Pago Derechos
                          de Grado </strong></u></font></font></p>
                          <p align="left"><img src="img/ok.gif" width="30" height="20" alt="ok"/>
El pago de sus derechos de grado ya se encuentra registrado<br>
                <%}else{
                    response.sendRedirect("menuServEstud");
                }%>

              </div>
            </div>          </td>
        </tr>
        <tr> 
          <td align="left" valign="top"><div align="center"></div></td>
        </tr>
        <tr> 
          <td valign="top"> 
            <div align="right"> 
              <table width="45%" border="0" height="17">
                <tr> 
                  <td width="27%" height="14"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud">ANTERIOR</a> </font></b></font></div>                  </td>
                  <td width="4%" height="14" align="center" valign="middle"> 
                    <div align="center">|</div>                  </td>
                  <td width="22%" height="14"> 
                    <%if (ban.equals("0")){%>
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud">INICIO</a></font></b></font></div>
                    <%} else {%>
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud1">INICIO</a></font></b></font></div>
                    <%}%>                  </td>
                  <td width="4%" height="14" align="center" valign="middle"> 
                    <div align="center">|</div>                  </td>
                  <td width="43%" height="14"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"><a href="LogOutEst">CERRAR 
                      SESION </a></font></b></font></div>                  </td>
                </tr>
              </table>
            </div>          </td>
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

