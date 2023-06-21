<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>

<%  
  	//HttpSession sesion;
    //sesion = request.getSession(true);		  
	
    response.setHeader("Cache-Control","no-cache"); 
	String nombre = new String((String)session.getAttribute("nombre"));
	String asig = new String((String)session.getAttribute("asig")); 
	PrintWriter oout = response.getWriter() ;
    Estudiante est = new Estudiante(carnet,oout) ;
    configECI cfgEci = new configECI();
    if (carnet != null && !carnet.equals("")) {

%>

<html>
<head>
<title>Servicios Academicos - Consulta de Notas</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
a  { text-decoration: none }
.texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}

-->
</style>
<SCRIPT LANGUAGE="JavaScript">

function comprueba( ){
var indice = document.form1.asig1.selectedIndex;    
if (document.forms.form1.asig1.options[indice].value != "N") {
	if ( document.forms.form1.prof1.value == '' || document.forms.form1.sem1.value == '') {
			alert("Los campos de Profesor y periodo para la signatura seleccionada no deben estar en blanco.");
			return false;
	}
	
	if (document.forms.form1.sem1.value.length !=  6) {
		 alert("El periodo ingresado no es correcto. Ejemplo: 2005-1");	
		 return false;
	  }	
	
} 

var indi = document.form1.asig2.selectedIndex;    
if (document.forms.form1.asig2.options[indi].value != "N") {
	if ( document.forms.form1.prof2.value == '' || document.forms.form1.sem2.value == '') {
			alert("Los campos de Profesor y periodo para la signatura seleccionada no deben estar en blanco.");
			return false;
	}
	
	if (document.forms.form1.sem2.value.length !=  6) {
		 alert("El periodo ingresado no es correcto. Ejemplo: 2005-1");	
		 return false;
	  }	
} 

var ind = document.form1.asig3.selectedIndex;    
if (document.forms.form1.asig3.options[ind].value != "N") {
	if ( document.forms.form1.prof3.value == '' || document.forms.form1.sem3.value == '') {
			alert("Los campos de Profesor y periodo para la signatura seleccionada no deben estar en blanco.");
			return false;
	}
	if (document.forms.form1.sem3.value.length !=  6) {
		 alert("El periodo ingresado no es correcto. Ejemplo: 2005-1");	
		 return false;
	  }	
	
} 


}
</SCRIPT>

</head>

<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="guardamonitor" onSubmit="return comprueba( );">  
<table width="752" border="0" cellpadding="0" align="center" cellspacing="0">
  <tr> 
        
    <td width="16"><img src="img/arbIzqAz.gif" width="24" height="24"></td>
        
      <td width="711" valign="top"><img src="img/puntoAz.gif" width="715" height="3" align="absmiddle"></td>
        
    <td width="25"><img src="img/arbDerAz.gif" width="24" height="24"></td>
    </tr>
    <tr> 
        
    <td width="16" height="42"></td>        
    <td width="711" height="42"> 
		<jsp:include page="encabezado" flush="true"/>
        <table width="100%" border="0" align="center">
          <tr> 
            <td valign="top" colspan="2">&nbsp;</td>
          </tr>
          <%Vector estud = est.getInfoEstudiante() ;%>
          <% for ( int j = 0 ; j < estud.size() ; j++ ){
		Vector estudiante = (Vector)estud.elementAt(j) ;
%>
          <%String prog="";
		if (estudiante.elementAt(7).equals("13")){
	  	prog="INGENIERIA CIVIL";}%>
          <%if (estudiante.elementAt(7).equals("14")){
	  	prog="INGENIERIA ELECTRICA";}%>
          <%if (estudiante.elementAt(7).equals("15")){
	  	prog="INGENIERIA DE SISTEMAS";}%>
          <%if (estudiante.elementAt(7).equals("16")){
	  	prog="INGENIERIA INDUSTRIAL";}%>
          <%if (estudiante.elementAt(7).equals("17")){
	  	prog="INGENIERIA ELECTRONICA";}%>
          <%if (estudiante.elementAt(7).equals("18")){
	  	prog="ECONOMIA";}%>
          <%if (estudiante.elementAt(7).equals("19")){
	  	 prog="ADMINISTRACION";}%>
          <%if (estudiante.elementAt(7).equals("20")){
	  	 prog="MATEMATICAS";}%>
          <tr> 
            <td valign="top" colspan="2">
              <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif"><b>Su 
                solicitud de monitoria(s) fue recibida, Gracias.</b></font></div>
            </td>
          </tr>
          <tr>
            <td valign="top" colspan="2">&nbsp;</td>
          </tr>
          <tr> 
            <td valign="top" colspan="2"> 
              <%}%>
            </td>
          </tr>
          <tr> 
            <td valign="top" colspan="2"> 
              <table width="45%" border="0" height="17" align="right">
                <tr> 
                  <td width="27%" height="14"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="monitorias">ANTERIOR</a> </font></b></font></div>
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
            </td>
          </tr>
        </table>
    </td>
    <td width="25" height="42" align="right"></td>
  </tr>
  <tr> 
    <td width="16"><img src="img/abaIzqAz.gif" width="24" height="24"></td>
      <td width="711" valign="bottom"><img src="img/puntoAz.gif" width="715" height="3"></td>
    <td width="25"><img src="img/abaDerAz.gif" width="24" height="24"></td>
  </tr>
</table>
</form>


</body>
</html>
<%
    } else {
%>
<jsp:forward page="login"/>
<% 	
    } 
%>
