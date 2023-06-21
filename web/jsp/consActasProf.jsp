<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.Estudiante.EstudMisc" %>   
<html>
<head>
<title>Servicio Profesores</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}
a{color: blue;}
a:hover{color:#3366CC; }
-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000">
    <% 
    String sesprof = request.getParameter("evsesion");
    if(sesprof != null){
        if(sesprof.equals("8600348113")){
            response.setHeader("Cache-Control","no-cache");
            EstudMisc emisc = new EstudMisc();
            int i = 0 ;
            String cuerpo = new String("Consejo Directivo") ;
            Vector datos = new Vector(), acta = new Vector() ;

            datos = emisc.getActa("0");
%> 
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

<p align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699">
    <b>Listado de Resúmenes de Boletines</b></font>
</p>    

<%
    if (datos.size() > 0 ) { 
%> 
<table width="640" border="1" align="center" bordercolor="#336699">
  <tr bgcolor="#336699"> 
    <td width="30%">
    <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Cuerpo</b></font></div></td>
    <td width="20%"><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Nro. Acta</b></font></div></td>
    <td width="20%"><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Fecha Acta</b></font></div></td>    
    <td width="30%"><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Ver Acta</b></font></div></td>    
  </tr>
<%      for (i = 0; i < datos.size(); i++ ) {
            acta = (Vector) datos.elementAt(i) ;
            if (((String) acta.elementAt(1)).equals("A") )
                cuerpo = "Consejo Académico" ;
            else
                cuerpo = "Consejo Directivo" ;                
%>    
  <tr> 
    <td width="30%"><%=cuerpo%></td>
    <td width="20%"><%=(String) acta.elementAt(2)%></td>
    <td width="30%"><%=(String) acta.elementAt(3)%></td>    
    <td width="30%"><a href="VerBoletinProfesor?evsesion=8600348113&id=<%=(String) acta.elementAt(0)%>">Ver Boletín</a></td>
  </tr>
<%      }
%>
</table>
<% }
%>    
<p align="center"> 
    <input type="button" value="Cerrar" onclick="window.close()">
</p>
<%
        }else{
            out.println("Acceso no Permitido");
        }
    }else{
        out.println("Acceso no Permitido");
    }
    %>
</body>
</html>