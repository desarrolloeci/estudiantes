<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ include file="secure.jsp" %>

<%
    //String carnet = new String();   
    PrintWriter oout = response.getWriter() ;
    String prog = new String();
    HttpSession         sesion;
    //String IdEst = new String((String)session.getAttribute("idest"));    
    //String IdEst = request.getParameter("carnet");
    Estudiante est = new Estudiante() ;
  //  if (IdEst != null && !IdEst.equals("")) {
      if (carnet != null && ! carnet.equals("")) {
%>
   
<html>
<head>
<title>Consultar Correo</title>
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
a{color: blue;}
a:hover{color:#3366CC; }
-->
</style>
</head>

<body>

<%
Vector estud = est.infoCorreo(carnet);
if((estud.size()) == 0){%>
  	<p>&nbsp;</p>
	<p align="center"><h3><center>
	    <font color="#666666" size="3" face="Verdana, Arial, Helvetica, sans-serif">Su numero de carnet o documento es incorrecto, o no existe información</font><br>
  </center></h3>
<%}else{%>

<% for ( int j = 0 ; j < estud.size() ; j++ ){
		Vector estudiante = (Vector)estud.elementAt(j) ;
%>
<center>
<table width="770" height="70" border="0" align="center" cellpadding="0" cellspacing="0" id="Tabla_01">
  <tr>
    <td> <img src="img/cabezote_estudiantes.jpg" width="770" height="189" border="0" usemap="#Map"></td>
    
  </tr>
</table>
  <p><b><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif">CORREO ESTUDIANTES</font></b><br>
  </p>
  <table width="450" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td width="20%"> 
        <div align="right"><b><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif">Carnet: 
          &nbsp;&nbsp;&nbsp;&nbsp;</font></b></div>
      </td>
      <td width="80%"><b><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif"><%=estudiante.elementAt(0)%></font></b></td>
    </tr>
    <tr> 
      <td width="20%"> 
        <div align="right"><b><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif">Doc: 
          &nbsp;&nbsp;&nbsp;&nbsp;</font></b></div>
      </td>
      <td width="80%"><b><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif"><%=estudiante.elementAt(1)%></font></b></td>
    </tr>
    <tr> 
      <td width="20%"> 
        <div align="right"><b><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif">Nombre: 
          &nbsp;&nbsp;&nbsp;&nbsp;</font></b></div>
      </td>
      <td width="80%"><b><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif"><%=estudiante.elementAt(2)%></font></b></td>
    </tr>
    <tr> 
      <td width="20%"> 
        <div align="center"><b><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
          Correo: &nbsp;&nbsp;</font></b></div>
      </td>
      <td width="80%"><a href="mailto:<%=estudiante.elementAt(3)%>@mail.escuelaing.edu.co"><b><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><%=estudiante.elementAt(3)%>@mail.escuelaing.edu.co</font></b></a> 
        &nbsp;&nbsp; </td>
    </tr>
    <tr> 
      <td colspan="2"> 
        <div align="left"> 
          <p>&nbsp;</p>
          <p><font size="3"><b><font color="#336699" face="Verdana, Arial, Helvetica, sans-serif"><blink><font color="#800000">Estimado 
            estudiante</font></blink></font></b> </font></p>
        </div>
        <p align="left"><font color="#800000" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Le 
          informamos A LOS ESTUDIANTES NUEVOS que la contrase&ntilde;a ser&aacute; 
          generada autom&aacute;ticamente por el sistema con la siguiente estructura:</b></font></p>
        <p align="left"><font color="#800000" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><br>
          Primera letra del primer nombre en May&uacute;scula + Segunda letra 
          del primer nombre en min&uacute;scula + Los cuatro &uacute;ltimos d&iacute;gitos 
          del carnet + Las dos primeras letras del primer apellido en min&uacute;scula. 
          </b></font></p>
        <p>Ejemplo: Juan Alberto P&eacute;rez Morales, n&uacute;mero de documento 
          de identificaci&oacute;n 123456789, n&uacute;mero de carnet 1234567; 
          para este caso la contrase&ntilde;a asignada ser&aacute;: Ju4567pe </p>
        <p>Tips para realizar el cambio de contrase&ntilde;a:<br>
          &quot; Ingresar al enlace<br>
          &quot; Registrar su usuario sin &quot;@mail.escuelaing.edu.co&quot;<br>
          &quot; Registrar Preguntas y asociar correo alterno<br>
          &quot; Cambiar contrase&ntilde;a</p>
        <ul>
          <li><a href="http://tycho.escuelaing.edu.co/contenido/documentos/Manualcambiocontrasenas.pdf">Consulte 
            el manual para gestionar el cambio de contrase&ntilde;a</a></li>
          <li><a href="http://gestorpasswd.escuelaing.edu.co/">Cambie su contrase&ntilde;a</a></li>
        </ul>
        <p align="left"><font color="#800000"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Cualquier 
          duda o inconveniente por favor acercarse a OSIRIS.</font></b></font><br>
        </p>
        <b><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif">&nbsp;&nbsp;</font></b></td>
    </tr>
  </table>
  <br>
  <form>
  <INPUT Type="button" class="boton" onClick="window.close()" Value="Cerrar">
  </form>
  <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><a href="http://www.escuelaing.edu.co/es/comunidad/estudiantes">Anterior</a></strong></font><br>
  <%}%>
  <%}%>
  <%
    } else {
%>
</center>

<p>&nbsp;</p>
	<p align="center"><h3><center>
	<font color="#666666" size="3" face="Verdana, Arial, Helvetica, sans-serif">Usuario no autorizado.</font>
	</center></h3>
<% 	
    } 
%>
<map name="Map">
        <area shape="rect" coords="3,2,127,32" href="http://www.escuelaing.edu.co/delcolegioalau.htm">
        <area shape="rect" coords="131,2,255,32" href="http://www.escuelaing.edu.co/aspirantesposgrado/aspirantes.htm">
        <area shape="rect" coords="385,3,513,34" href="http://egresados.escuelaing.edu.co/egresados">
        <area shape="rect" coords="516,4,640,32" href="http://empleados.escuelaing.edu.co/intraeci">
        <area shape="rect" coords="643,3,766,31" href="http://www.escuelaing.edu.co/entorno/relacion_entorno.htm">
        <area shape="rect" coords="3,124,165,186" href="http://www.escuelaing.edu.co">
        </map>
</body>
</html>