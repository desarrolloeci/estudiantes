<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.Modreg.Operacion" %>

<%  
        response.setHeader("Cache-Control","no-cache"); 
	String nombre = new String((String)session.getAttribute("nombre"));
	String valren;
	String prog = new String();
	PrintWriter oout = response.getWriter() ;
//        Estudiante est = new Estudiante(carnet,oout) ;
        Estudiante est = (Estudiante) session.getAttribute("estClase") ;
        Operacion op = new Operacion (carnet) ;
%>

<html>
<head>
<title>Elaboraci&oacute;n de Horarios</title>
<%
    out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
    out.println("<!-- ");
    out.println("function openPop(pagename){");
    out.println("window.open(pagename,'','toolbar=yes,scrollbars=yes,location=no,directories=no,status=no,menubar=yes,resizable=yes,height=400,width=620')} ");
    out.println("//-->"); 
    out.println("</SCRIPT>");
%>
<%
    out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
    out.println("<!-- ");
    out.println("function openPopHor(pagename){");
    out.println("window.open(pagename,'','toolbar=yes,scrollbars=yes,location=no,directories=no,status=no,menubar=yes,resizable=yes,height=620,width=650')} ");
    out.println("//-->"); 
    out.println("</SCRIPT>");
%>
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
    <td width="640" height="42" valign="top"> 
      <!--Tabla externa donde va logo y titulo-->
      <jsp:include page="encabezado" flush="true"/>
	    <br> 
      <p>&nbsp;</p>
      <p><font face="Verdana, Arial, Helvetica, sans-serif"><b>El proceso de Elaboraci&oacute;n 
        y modificaci&oacute;n de horarios no esta disponible en esta fecha. </b></font></p>
     
      <table width="88%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="6" colspan="2">&nbsp; </td>
        </tr>
        <tr> 
          <td align="center" valign="top" colspan="2"> 
           
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
  </tr>
    <tr>
      <td height="5" colspan="3"><img src="img/bararhoriz.gif" width="640" height="5"></td>
    </tr>
</table>


</body>
</html>

