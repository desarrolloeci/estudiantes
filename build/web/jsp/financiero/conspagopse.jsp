<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="java.text.*" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.Estudiante.EstudFin" %>

<%  
    response.setHeader("Cache-Control","no-cache"); 
    String nombre = new String((String)session.getAttribute("nombre"));
    String ban = new String((String)session.getAttribute("ban"));
    Vector pago = new Vector () ;
    NumberFormat nf = NumberFormat.getIntegerInstance() ;
    PrintWriter oout = response.getWriter() ;
    Estudiante est = (Estudiante) session.getAttribute("estClase") ;
    EstudFin efin = new EstudFin(est.getIdEst()) ;
    String pag = new String("") ;
%>

<html>
<head>
<title>Servicios Academicos - Consulta de Pago en línea</title>
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
.texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}
a{color: blue;}
a:hover{color:#3366CC; }
-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000">

<table width="640" border="0" cellpadding="0" align="center" cellspacing="0">
    <tr>     
    <td width="640" valign="top" height="255"> 
      <jsp:include page="encabezado" flush="true"/>
      <p align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699">
        <b>Consulta del último pago en línea registrado</b></font></p>
      <table width="100%" border="0" align="center">
        <tr>
<%      Vector lispse = new Vector(efin.getpagopse()) ;
        if (lispse.size() > 0) {
            pago = (Vector) lispse.elementAt(0) ;
%>
            <table align="center" border="1" width="640">
            <tr>  <td width="30%">Periodo: </td>
                  <td width="70%"><%=pago.elementAt(0)%></td>
            </tr>
            <tr>  <td width="30%">No. Ref.Orden: </td>
                  <td width="70%"><%=pago.elementAt(1)%></td>
            </tr>
            <tr>  <td width="30%">Fecha: </td>
                  <td width="70%"><%=pago.elementAt(4)%></td>
            </tr>
            <tr>  <td width="30%">Banco: </td>
                  <td width="70%"><%=pago.elementAt(5)%></td>
            </tr>
            <tr>  <td width="30%">Valor: </td>
                  <td width="70%"><%=nf.format(Integer.parseInt((String) pago.elementAt(6)))%></td>
            </tr>
            <tr>  <td width="30%">No. Autorización: </td>
                  <td width="70%"><%=pago.elementAt(7)%></td>
            </tr>
            </table>              
<%      }
        else {
%>
        <p align="center"> No hay pagos en línea registrados </p>
<%      }
%>
        </tr>
        <tr> 
          <td valign="top" height="12"> 
            <table width="45%" border="0" align="right">
              <tr> 
                  <td width="27%" height="12"> 
                    <div align="center"> 
                      <%if (ban.equals("0")){%>
                      <font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud">ANTERIOR</a> </font></b></font> 
                      <%} else {%>
                      <font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud1">ANTERIOR</a> </font></b></font> 
                      <%}%>
                    </div>
                  </td>
                  <td width="4%" height="12" align="center" valign="middle"> 
                    <div align="center">|</div>
                  </td>
                  <td width="22%" height="12"> 
                    <%if (ban.equals("0")){%>
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud">INICIO</a></font></b></font></div>
                    <%} else {%>
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud1">INICIO</a></font></b></font></div>
                    <%}%>
                  </td>
                  <td width="4%" height="12" align="center" valign="middle"> 
                    <div align="center"><b>|</b></div>
                  </td>
                  <td width="43%" height="12"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"><a href="LogOutEst">CERRAR 
                      SESION </a></font></b></font></div>
                  </td>
                </tr>
              </table>
          </td>
          
        </tr>
        <tr>
          <td height="5" colspan="3" align="center">
            <img src="img/bararhoriz.gif" width="640" height="5"></td>
        </tr>
      </table>
  </tr>
</table>
</body>
</html>