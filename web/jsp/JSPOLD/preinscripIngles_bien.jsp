<%@ include file="secure.jsp" %>
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>

<%     
    response.setHeader("Cache-Control","no-cache"); 
    session = request.getSession(true);
    //String nombre = new String((String)session.getAttribute("nombre"));
    //String estado = new String((String)session.getAttribute("estado"));
    //String tipest = new String((String)session.getAttribute("tip_est"));   
    String idplan = new String((String)session.getAttribute("idplan"));   
    PrintWriter oout = response.getWriter() ;
    int plan;
    plan = Integer.parseInt(idplan);
%>

<html>
<head>
<title>Preinscripcion Ingles</title>
<%
    out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
    out.println("<!-- ");
    out.println("function openPop(pagename){");
    out.println("window.open(pagename,'','top=30, left = 10,toolbar=no,scrollbars=yes,directories=no,status=no,menubar=yes,resizable=yes,height=400,width=620')} ");
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
          <td height="6" > 
            <div> <br>
              <div align="center"><u><font face="Verdana, Arial, Helvetica, sans-serif" size="4">Preinscripci�n 
                Ingles</font></u><br>
                &nbsp;</div>
            </div>
          </td>
        </tr>
<%     if (plan >= 255) {%> 
        <tr> 
          <td align="center" valign="top" colspan="2">	     
            <form method="POST" action="../servlet/procingles/">
              <table width="50%" border="1" bordercolor="#336699">
                <tr bgcolor="#336699"> 
                  <td width="65%"> 
                    <p align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Asignatura</font></b> 
                  </td>
                </tr>
                <tr> 
                  <td> 
                    <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1"> 
                      <select size="1" name="idasig">
                        <option value="843">Ingl�s Nivel 1 - Parte A</option>
                        <option value="846">Ingl�s Nivel 1 - Parte B</option>
                        <option value="853">Ingl�s Nivel 2 - Parte A</option>
                        <option value="856">Ingl�s Nivel 2 - Parte B</option>
                        <option value="863">Ingl�s Nivel 3 - Parte A</option>
                        <option value="866">Ingl�s Nivel 3 - Parte B</option>
                        <option value="873">Ingl�s Nivel 4 - Parte A</option>
                        <option value="876">Ingl�s Nivel 4 - Parte B</option>
                      </select>
                      </font> </div>
                  </td>
                </tr>
              </table>
              <br>
              <input type="submit" value="Enviar Preinscripci�n" name="B1">
            </form>
           
          </td>
        </tr>
  <%} else {%>
    <tr> 
          <td align="center" valign="top" colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif"><b>Usted 
            debe continuar con su nivel de Ingl&eacute;s. </b></font>
			<p>&nbsp;</td>
    </tr>

  <%}%>
        <tr> 
          <td valign="top" colspan="2"> 
            <div align="right"> 
              <table width="45%" border="0" height="17">
                <tr> 
                  <td width="27%" height="14"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud.jsp">ANTERIOR</a> </font></b></font></div>
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
