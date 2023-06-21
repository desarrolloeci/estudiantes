<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>

<%  
        Vector prei = new Vector() ;
        response.setHeader("Cache-Control","no-cache"); 
	String nombre = new String((String)session.getAttribute("nombre"));
	String raz = new String(), traz = new String();
	PrintWriter oout = response.getWriter() ;
        Vector lispre = (Vector) session.getAttribute("lisrep") ;
        int i ;
%>
<html>
<head>
<title>Preinscripcion</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
a  { text-decoration: none }
.texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}
.textocom {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
	color: #666666;
}
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
-->
</style>
</head>
<body bgcolor="#FFFFFF" text="#000000">
    <table width="640" border="0" cellpadding="0" align="center" cellspacing="0">
    <tr> 
        <td width="640"> 
       	<jsp:include page="encabezado" flush="true"/> 
      <table width="100%" border="0" align="center">
        <tr>
          <td align="center" valign="top"><div> <br>
              <div align="center" class="textocom"><font size="3"><strong>Preinscripción</strong></font></div>
            </div></td>
        </tr>
        <tr> 
          <td align="center" valign="top"> 
            <table width="100%" border="1" bordercolor="#336699">
              <tr bgcolor="#336699"> 
                <td width="35%"> 
                  <div align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Asignaturas</font></b></div>
                </td>
                <td width="65%"> 
                  <p align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Resultado</font></b> 
                </td>
              </tr>
        <%  for (i = 0; i < lispre.size(); i++) {
        prei = (Vector) lispre.elementAt(i) ;
        raz = (String) prei.elementAt(0) ;
        if ( raz.equals("-1") )
            traz = "Asignatura no existe o es Laboratorio" ;
        else if ( raz.equals("-2") )
            traz = "Sobrepasa la carga de créditos para preinscripción" ;
        else
            traz = "Preinscripción Aceptada" ;
%>
              <tr> 
                <td> 
                  <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1"> 
                    <%=(String) prei.elementAt(1)%></font> </div>
                </td>
                <td> 
                  <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1"> 
                    <%=traz%> </font> </div>
                </td>
              </tr>
              <%  }
%>
            </table>
            <p>&nbsp;</p>
          </td>
        </tr>
        <tr> 
          <td valign="top"> 
            <div align="right"> 
              <table width="45%" border="0" height="17">
                <tr> 
                  <td width="27%" height="14"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="preinscripcion">ANTERIOR</a> </font></b></font></div>
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
    		<td height="5" colspan="2"><img src="img/bararhoriz.gif" width="640" height="5"></td>
	  </tr>
</table>
