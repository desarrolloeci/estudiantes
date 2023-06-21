<%@ include file="secure.jsp" %>
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>

<%  
        response.setHeader("Cache-Control","no-cache"); 
	//HttpSession  session;
        session = request.getSession(true);	
	String nombre = new String((String)session.getAttribute("nombre"));
	String ban = new String((String)session.getAttribute("ban"));
	PrintWriter oout = response.getWriter() ;
//        Estudiante est = new Estudiante(carnet,oout) ;
        Estudiante est = (Estudiante) session.getAttribute("estClase") ;
%>

<html>
<head>
<title>Servicio de red Inalámbrica</title>
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
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
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
.campotexto {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
	color: #CCCCCC;
}
-->
</style>
<SCRIPT LANGUAGE="JavaScript">
function comprueba( ){
	var indice = document.form1.codigo.selectedIndex; 
	if ( document.forms.form1.codigo.options[indice].value == 'N') {
		alert("Usted debe seleccionar la asignatura que desea cancelar.");
		return false;
	}
    
   if ( document.forms.form1.observ.value == '' ) {
        alert("Usted debe escribir la razon por la cual cancela la asignatura");
        return false;
   }       
return true;
}
</SCRIPT>

</head>

<body bgcolor="#FFFFFF" text="#000000">
		
<table width="640" border="0" cellpadding="0" align="center" cellspacing="0">
    <tr> 
        <td width="640" height="42"> 
         <jsp:include page="encabezado" flush="true"/>
      <table width="100%" border="0" align="center">
        <tr> 
          <td height="42" colspan="3"> 
            <div> 
              <p align="center" class="texto"><b><font color="#666666" size="2">Servicio
                    de red inal&aacute;mbrica</font></b></p>
             
            </div>
          </td>
        </tr>
		<form action="RespuestaCancelacion" method="post" name="form1" class="texto" onSubmit="return comprueba( );">
        <tr> 
          <td width="310" align="center" valign="top"> 
            <div align="right">Direcci&oacute;n f&iacute;sica o direcci&oacute;n
            MAC :<br>
			(De la tarjeta inal&aacute;mbrica)</div></td>
          <td width="20" align="center" valign="top">&nbsp;</td>
          <td width="310" align="center" valign="top"><div align="left">
      		<input name="textfield" type="text" class="campotexto" size="2" maxlength="2">
 				-
    		<input name="textfield2" type="text" class="campotexto" size="2" maxlength="2">
  				-
  			<input name="textfield22" type="text" class="campotexto" size="2" maxlength="2">
  				-
  			<input name="textfield23" type="text" class="campotexto" size="2" maxlength="2">
  				-
  			<input name="textfield24" type="text" class="campotexto" size="2" maxlength="2">
  				-
  			<input name="textfield25" type="text" class="campotexto" size="2" maxlength="2">
          </div></td>
        </tr>
        <tr> 
          <td height="28" colspan="3" align="center" valign="top"> 
            <p>
              <input name="Submit" type="submit" class="boton" value="Enviar">
            </p>
          </td>
        </tr>
		</form>
		<tr> 
          <td align="center" valign="top" colspan="3"> 
            <a href=""><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>&iquest;como
          obtener la direcci&oacute;n mac?</strong></font></a></td>
        </tr>
        <tr> 
          <td valign="top" colspan="3"> 
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
                    <%if (ban.equals("0")){%>
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud">INICIO</a></font></b></font></div>
                    <%} else {%>
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud1">INICIO</a></font></b></font></div>
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
      </table>
    </td>
  </tr>
    <tr>
      <td height="5" colspan="3"><img src="img/bararhoriz.gif" width="640" height="5"></td>
    </tr>
</table>

</body>
</html>
