<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.Estudiante.EstudMisc" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<% 
    response.setHeader("Cache-Control","no-cache");
    EstudMisc emisc = new EstudMisc();
    int i = 0 ;
    String cuerpo = new String("Consejo Directivo") ;
    Vector datos = new Vector(), acta = new Vector() ;
    String ident = request.getParameter("id");    
    datos = emisc.getActa(ident) ;
%>    
<html>
<head>
<title>Servicios Academicos</title>
</head> 

<body>
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

<p align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699">
    <b>Resumen - Boletin</b></font>
</p>    

<%
    if (datos.size() > 0 ) { 
      for (i = 0; i < datos.size(); i++ ) {
            acta = (Vector) datos.elementAt(i) ;
            if (((String) acta.elementAt(0)).equals("A") )
                cuerpo = "Consejo Académico" ;
%>    
<table width="800" border="1" align="center" bordercolor="#336699">
  <tr bgcolor="#336699"> 
    <td width="100%"><div align="center">
        <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF">
            <b><%=cuerpo%> - Boletin No. <%=(String) acta.elementAt(1)%> 
               de fecha: <%=(String) acta.elementAt(2)%></b></font></div></td>
  </tr>
  <tr> 
    <td width="100%">
        <%//out.println(BdEstudiante.quitarSaltosL((String) acta.elementAt(3)) + "<br>");%>
		<%out.println((String) acta.elementAt(3));%>
	</td>    
  </tr>
<%      }
%>
</table>
<% }
%>    
<p align="center"> 
    <input type="button" value="Cerrar" onclick="window.close()">
</p>
</body>
</html>