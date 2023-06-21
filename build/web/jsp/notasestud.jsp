<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%
    response.setHeader("Cache-Control","no-cache"); 
    String periodo = request.getParameter("periodo");
    String ban = new String((String)session.getAttribute("ban"));
    String notad;
    PrintWriter oout = response.getWriter() ;
    configECI cfgEci = new configECI();
//    Estudiante est = new Estudiante(carnet,oout) ;
    Estudiante est = (Estudiante) session.getAttribute("estClase") ;
%>
<html>
<head>
<title>Servicios Academicos - Consulta de Notas</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.texto {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}
a{color: blue;}
a:hover{color:#3366CC; }
-->
</style>
<style type="text/css">
<!--
.textonot {
	font-family: Cambria;
	font-size: 10px;
	font-weight: bold;
}
-->
</style>
<script type="text/javascript" language="Javascript" src="js/comun.js"></script>
</head>

<body bgcolor="#FFFFFF" text="#000000"> 
 
<table width="640" border="0" cellpadding="0" align="center" cellspacing="0">
  <tr> 
    <td width="24" height="42"></td>
    <td width="592" height="42" valign="top"> 
      <jsp:include page="encabezado" flush="true"/>
      <table width="100%" border="0" align="center">
        <%Vector notas = est.getNotasAnt(carnet, periodo);
    Vector notasact = est.getNotasAct(carnet,cfgEci.getPeriodoActual());%>
        <%if ((notas.size()>0) || (notasact.size()>0)){%>
        <%if (!(periodo.equals("PA"))){%>
        <% for ( int j = 0 ; j < 1 ; j++ ){
		Vector notasant = (Vector)notas.elementAt(j) ;
    %>
        <tr> 
          <td height="6" valign="top"> <font face="Verdana, Arial, Helvetica, sans-serif" color="#336699" font size="2"><b>Pr. 
            Acum: <font color="#666666"><%=notasant.elementAt(3)%></font></b> 
            </font><br>
            <!--<font face="Verdana, Arial, Helvetica, sans-serif" color="#336699" font size="2"><b>Pr. 
            Ult. Sem: <font color="#000000"><%=notasant.elementAt(4)%></font></b> 
            </font><br>-->
            <font face="Verdana, Arial, Helvetica, sans-serif" color="#336699" font size="2"><b>Datos 
            para el Periodo: <font color="#666666"><%=notasant.elementAt(6)%></font></b> 
            </font> </td>
        </tr>
        <%}%>
        <%}else{%>
        <!--else si periodo es actual-->
        <% for ( int j = 0 ; j < 1 ; j++ ){
		Vector notasactual = (Vector)notasact.elementAt(j) ;
    %>
        <tr> 
          <td height="38" valign="top"> <font face="Verdana, Arial, Helvetica, sans-serif" color="#336699" font size="2"><b>Pr. 
            Acum: <font color="#666666">
			<%
			if(notasactual.elementAt(3).toString().equals("0E-7"))
				out.println(" ---- ");
			else
				out.println(notasactual.elementAt(3));
				%>
			</font></b> 
            </font><br>
            <!--<font face="Verdana, Arial, Helvetica, sans-serif" color="#336699" font size="2"><b>Pr. 
            Ult. Sem: <font color="#000000"><%=notasactual.elementAt(4)%></font></b> 
            </font>--></td>
        </tr>
        <%}%>
        <%}%>
        <!--fin else-->
        <%if (!(periodo.equals("PA"))){%>
        <tr> 
          <td valign="top"> 
            <table width="100%" border="1" align="center" bordercolor="#336699" background="img/fondonot.gif">
              <tr bgcolor="#336699"> 
                <td> 
                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Código</b></font></div>
                </td>
                <td> 
                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Nombre</b></font></div>
                </td>
                <td> 
                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Nota</b></font></div>
                </td>
                <td> 
                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Clave</b></font></div>
                </td>
                <td> 
                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Observaciones</b></font></div>
                </td>
              </tr>
              <% for ( int j = 0 ; j < notas.size() ; j++ ){
		Vector notasant = (Vector)notas.elementAt(j) ;
                notad = notasant.elementAt(9).toString();
                if (!notasant.elementAt(12).toString().equals("N")){
                    if (notad.compareTo("3.0") >= 0)
                        notad = "Aprobado";
                    else
                        notad = "No aprobado";
                }
                    
                
                %>
              <tr> 
                <td> 
                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=notasant.elementAt(7)%></font></div>
                </td>
                <td> 
                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=notasant.elementAt(8)%></font></div>
                </td>
                <td> 
                  <div align="center"><font face="Cambria, Verdana" size="2"><%=notad%></font></div>
                </td>
                <td> 
                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;<%=notasant.elementAt(10)%></font></div>
                </td>
                <td> 
                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=notasant.elementAt(11)%></font></div>
                </td>
              </tr>
              <%}%>
            </table>
          </td>
        </tr>
        <%}else{%>
        <!--cierra if de periodo diferente PA-->
        <tr> 
          <td valign="top" >
            <table width="100%" border="1" align="center" bordercolor="#336699" background="img/fondonot.gif">
              <tr bgcolor="#336699"> 
                <td> 
                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Código</b></font></div>
                </td>
                <td> 
                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Nota 
                    1</b></font></div>
                </td>
                <td> 
                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Nota 
                    2</b></font></div>
                </td>
                <td> 
                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Nota 
                    3</b></font></div>
                </td>
                <td> 
                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Nota 
                    Lab</b></font></div>
                </td>
                <td> 
                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Nota</b></font></div>
                </td>
                <td> 
                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Clave</b></font></div>
                </td>
              </tr>
              <% for ( int j = 0 ; j < notasact.size() ; j++ ){
		Vector notasactual = (Vector)notasact.elementAt(j) ;%>
              <tr> 
                <td> 
                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=notasactual.elementAt(6)%></font></div>
                </td>
                <%          if (notasactual.elementAt(7).equals("No disponible")){%>
                <td> 
                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;</font></div>
                </td>
                <%          } else {%>
                <td> 
                  <div align="center"><font face="Cambria, Verdana" size="2"><%=notasactual.elementAt(7)%></font></div>
                </td>
                <%          }%>
                <%          if (notasactual.elementAt(8).equals("No disponible")){%>
                <td> 
                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;</font></div>
                </td>
                <%          } else {%>
                <td> 
                  <div align="center"><font face="Cambria, Verdana" size="2"><%=notasactual.elementAt(8)%></font></div>
                </td>
                <%          }%>
                <%          if (notasactual.elementAt(9).equals("No disponible")){%>
                <td> 
                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;</font></div>
                </td>
                <%          } else {%>
                <td> 
                  <div align="center"><font face="Cambria, Verdana" size="2"><%=notasactual.elementAt(9)%></font></div>
                </td>
                <%          }%>
                <%          if (notasactual.elementAt(10).equals("No disponible")){%>
                <td> 
                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;</font></div>
                </td>
                <%          } else {%>
                <td> 
                  <div align="center"><font face="Cambria, Verdana" size="2"><%=notasactual.elementAt(10)%></font></div>
                </td>
                <%          }%>
                <%          if (notasactual.elementAt(11).equals("No disponible")){%>
                <td> 
                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;</font></div>
                </td>
                <%          } else {%>
                <td> 
                  <div align="center"><font face="Cambria, Verdana" size="2"><%=notasactual.elementAt(11)%></font></div>
                </td>
                <% }%> 				
                <td> 
                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;<%=notasactual.elementAt(12)%></font></div>
                </td>

              </tr>
              <%}%>
            </table>
          </td>
        </tr>
        <%}%>
        <%}else{%>
        <tr> 
          <td >&nbsp;</td>
        </tr>
        <tr> 
          <td > 
            <p><b>NO EXISTEN DATOS PARA ESTE PERIODO</b></p>
          </td>
        </tr>
        <%}%>
        <tr> 
          <td >&nbsp;</td>
        </tr>
        <tr> 
          <td ><div align="center" class="texto">
            <p><font color="#666666">Este documento
                  no es v&aacute;lido como certificado
                oficial de la Escuela Colombiana de Ingenier&iacute;a<br>
                Secretar&iacute;a General</font></p>
          </div></td>
        </tr>
        <tr> 
          <td valign="top"> 
            <div align="right"> 
              <table width="45%" border="0" height="17">
                <tr> 
                  <td width="27%" height="14"> 
                    <div align="center"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1"> 
                      <a href="consultnotas">ANTERIOR</a> </font></b></div>
                    <!-- <FORM NAME="buttonbar">
                        <INPUT TYPE="button" VALUE="Atrás" onClick="history.back()">     
                    </FORM> -->
                  </td>
                  <td width="4%" height="14" align="center" valign="middle"> 
                    <div align="center">|</div>
                  </td>
                  <td width="22%" height="14"> 
                    <%if (ban.equals("0")){%>
                    <div align="center"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><a href="menuServEstud">INICIO</a></font></b></div>
                    <%} else {%>
                    <div align="center"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><a href="menuServEstud1">INICIO</a></font></b></div>
                    <%}%>
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
		<tr>
    		<td height="5" colspan="2"><img src="img/bararhoriz.gif" width="640" height="5"></td>
  		</tr>
      </table>
    </td>
    <td width="24" height="42" align="right"></td>
  </tr>
</table>	
<p align="center">

</body>
</html>
