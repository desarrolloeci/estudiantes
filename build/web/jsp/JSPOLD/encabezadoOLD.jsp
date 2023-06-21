<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%  
     response.setHeader("Cache-Control","no-cache"); 	
     PrintWriter oout = response.getWriter() ;
     //configECI cfgEci = new configECI();
     String periodo = "PA"; 
     Estudiante est = (Estudiante) session.getAttribute("estClase") ;
     String mensaje = new String((String)session.getAttribute("mensaje"));
     String estado = est.getEstado();
%>

<style type="text/css">
<!--
a  { text-decoration: none }
.texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}

-->
</style>

<div align="center"></div>
<table width="640" height="70" border="0" align="center" cellpadding="0" cellspacing="0" id="Tabla_01">
  <tr>
    <td> <img src="img/servest_01.gif" width="150" height="60" alt=""></td>
    <td> <img src="img/servest_02.gif" width="20" height="60" alt=""></td>
    <td> <img src="img/servest_03.gif" width="233" height="60" alt=""></td>
    <td> <img src="img/servest_04.gif" width="237" height="60" alt=""></td>
  </tr>
  <tr>
    <td colspan="4"> <img src="img/servest_05.gif" width="640" height="10" alt=""></td>
  </tr>
</table>
<table width="100%" border="0" align="center">
  <%Vector datosEst = est.getDatosEst(carnet);%>
  <%//if ((datosEst.size()>0) && ( (Integer.parseInt(estado) > 0) || (Integer.parseInt(estado) == -3) || (Integer.parseInt(estado) == -4) || (Integer.parseInt(estado) == -8) || (Integer.parseInt(estado) == -9)) ){%>
  <%if ((datosEst.size()>0)){ %>  
  <% for ( int j = 0 ; j < 1 ; j++ ){
		Vector datos = (Vector)datosEst.elementAt(j) ;
    %>
  <tr> 
    <td width="86%" height="6"> 
      <div><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699"><b>Nombre:</b></font><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#666666">&nbsp;<%=datos.elementAt(0)%>&nbsp;&nbsp;&nbsp;<font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699"><b>Estado:</b></font>&nbsp;&nbsp;&nbsp;<%=datos.elementAt(4)%></font></b> 
      </div><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699"><b>Programa:</b></font><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#666666">&nbsp;<%=datos.elementAt(1)%></font></b><br>
            <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699"><b>Plan 
      de Estudios:</b></font><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#666666">&nbsp;<%=datos.elementAt(2)%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699">Semestre: 
      </font><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#666666">&nbsp;<%=datos.elementAt(3)%></font></b> 
      <%SimpleDateFormat formatter = new SimpleDateFormat ("dd/MM/yyyy'-'HH:mm:ss");
                Date currentTime_1 = new Date();
                String dateString = formatter.format(currentTime_1);%>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699">Fecha: </font></b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#666666"> 
      <%= dateString %></font><br>
	  
      <div align="center">
	  <strong><a href="" onclick="window.open('http://tycho.escuelaing.edu.co/contenido/servicios/estudiantes/buscarhorasig/buscarhor.htm','','height=600,width=800');return false"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> </font></a></strong>
	  <table width="640" border="0">
	    <tr>
	      <td width="320">
              <%
              if(mensaje.equals("Bienvenido")){
                %>
                <strong><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699"><%=mensaje%></font></strong>
                
             <%
              }else{
%>
                <strong><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#990000"><MARQUEE><%=mensaje%></MARQUEE></font></strong>
             <%
              }
%>
	      </td>
	      <td width="320">
	        <div align="right"><strong><a href="" onclick="window.open('http://tycho.escuelaing.edu.co/contenido/servicios/estudiantes/buscarhorasig/buscarhor.htm','','height=600,width=800');return false"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Consulta
        de horario de asignatura</font></a></strong></div></td>
	      </tr>
	    </table>
	  </div>
      </div></td>
  </tr>
  <%}
  }%>
</table>
