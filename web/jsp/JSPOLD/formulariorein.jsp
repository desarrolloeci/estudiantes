<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiantereint" %>
<%@ page import="estudiantes.baseDatos.BdEstudianteadm" %>

<%
    String carnet = new String();  
    //String IdEst = "2055655";
    //String usuario = "10255";
    PrintWriter oout = response.getWriter() ;
    String prog = new String();
    HttpSession         sesion;
    String ban = "0", idp = "", idm = "";
    String ban1 = "0";
    sesion = request.getSession(true);
    String IdEst = new String((String)session.getAttribute("idest"));
    String usuario = new String((String)session.getAttribute("usuario"));
    Estudiantereint est = new Estudiantereint(IdEst,oout) ;
    if (IdEst != null && !IdEst.equals("")) {
%>
   
<html>
<head>
<title>Reintegro</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="../servlet/GuardaDatosreing">  

<%Vector estud = est.getInfoEstudiante() ;%>
<%if((estud.size()) == 0){%>
  	<p>&nbsp;</p>
	<p align="center"><h3><center>Su numero de carnet es incorrecto, o no existe información<br>Puede comunicarse con la oficina de Admisiones donde se aclararán sus inquietudes, al email: <a href="mailto:admisiones@escuelaing.edu.co">admisiones@escuelaing.edu.co</a> o al teléfono 6762666 ext. 274 o 263.</center></h3>
<%}else{%>
<%if ((est.getEstado().equals("-1")) || (est.getEstado().equals("-12"))) {%>

<% for ( int j = 0 ; j < estud.size() ; j++ ){
		Vector estudiante = (Vector)estud.elementAt(j) ;
%>
<%  	Vector padres = est.getInfoPadres() ;
%>
	
<%if(!(estudiante.elementAt(18).equals("R"))){%>
    	
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#8C00BB" height="151">
    <tr> 
      <td rowspan="9" width="22%" valign="top"> 
        <div align="center"> 
          <p><img src="../img/LogEci1.gif" width="120" height="126"></p>
        </div>
      </td>
      <td colspan="3"> 
        <div align="center"><font color="#FFFFFF"><b><font size="4">ESCUELA COLOMBIANA 
          DE INGENIERIA JULIO GARAVITO</font></b></font></div>
      </td>
    </tr>
    <tr> 
      <td width="9%">&nbsp;</td>
      <td width="38%">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="9%"> 
        <div align="right"><font color="#FFFFFF" size="2">&nbsp; </font></div>
      </td>
      <td colspan="2"> <b><font color="#FFFFFF" size="3"><b>Solicitud para el 
        </b>primer per&iacute;odo</font></b> <b><font color="#FFFFFF" size="3">acad&eacute;mico 
        del a&ntilde;o 2004</font></b></td>
    </tr>
    <tr> 
      <td height="18" width="9%">&nbsp;</td>
      <td height="18" width="38%">&nbsp;</td>
      <td height="18" width="31%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="9%" height="18"><font color="#FFFFFF" size="1"><b>&nbsp;</b></font> 
        <div align="center"><font color="#FFFFFF" size="2"><b>&nbsp;</b></font></div>
      </td>
      <%if (estudiante.elementAt(7).equals("13")){
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
      <td height="18" width="38%"><font color="#FFFFFF" size="1"><b><font face="Times New Roman, Times, serif" size="3">Programa: 
        <%=prog%></font></b></font> <font color="#FFFFFF" size="2"><b> </b></font> 
      </td>
      <td width="31%" height="18">&nbsp;</td>
    </tr>
    <tr> 
      <td height="18" width="9%">&nbsp;</td>
      <td height="18" width="38%">&nbsp;</td>
      <td height="18" width="31%">&nbsp;</td>
    </tr>
    <tr> 
      <td height="18" width="9%">&nbsp;</td>
      <td height="18" width="38%">&nbsp;</td>
      <td height="18" width="31%">&nbsp;</td>
    </tr>
  </table>
  <br>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#EEEEEE">
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4"><b><font color="#7C009B">DATOS DEL ASPIRANTE </font></b> 
      </td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td width="29%">&nbsp;</td>
      <td width="35%">&nbsp;</td>
      <td width="34%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="2%" height="27">&nbsp;</td>
      <td colspan="3" height="27"> 
        <div align="left"> <b><%=estudiante.elementAt(1)%></b></div>
        
      </td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td width="29%"><i>Apellidos y Nombres</i></td>
      <td width="35%">&nbsp;</td>
      <td width="34%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td colspan="3">Documento de identidad &nbsp;
        <% if ("T".equals(estudiante.elementAt(2))){%>
       		&nbsp;&nbsp; T.I.	
     
        <%}%>        	
		
        <% if ("C".equals(estudiante.elementAt(2))){%>
			C.C.   	    
        <%}%> 
	    <% if ("CE".equals(estudiante.elementAt(2))){%>
        	C.E.        	
       	<%}%>
	    <% if ("RC".equals(estudiante.elementAt(2))){%>				
     	   R.C.      	  
    
	  	<%}%>		  			  
        &nbsp;&nbsp; No. 
        <%=estudiante.elementAt(3)%>
        &nbsp;de 
        <%=est.getNomciudadexp()%>
      </td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td colspan="3">Direcci&oacute;n correspondencia: &nbsp;&nbsp; 
        <input type="text" name="campo1" maxlength="35" size="35" value="<%=estudiante.elementAt(4)%>">
        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td colspan="3">Ciudad&nbsp; 
        <input type="text" name="campo2" size="21" maxlength="25" value="<%=est.getNomciudad()%>">
        &nbsp;&nbsp;&nbsp; Tel&eacute;fono 
        <input type="text" name="campo3" maxlength="15" size="15" value="<%=estudiante.elementAt(6)%>">
      </td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td width="29%">&nbsp;</td>
      <td width="35%">&nbsp;</td>
      <td width="34%">&nbsp;</td>
    </tr>
  </table>
  <br>
  <%
 for ( int i = 0 ; i < padres.size() ; i++ ){
		Vector padre = (Vector)padres.elementAt(i) ;
	  if (padre.elementAt(0).equals("P") && padre.elementAt(10).equals("S")){
		ban = "1";
                idp = (String)padre.elementAt(11);		
		 %>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#EEEEEE">
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4"><b><font color="#7C009B">DATOS DEL PADRE </font></b></td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td width="28%">&nbsp;</td>
      <td width="35%">&nbsp;</td>
      <td width="35%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="2%" height="25">&nbsp;</td>
      <td width="28%" height="25">Vive ? 
        <%      if(padre.elementAt(10).equals("S")){
%>
        Si: 
        <input type="radio" name="campo4" value="<%=padre.elementAt(10)%>" checked>
        <%}	else {%>
        Si: 
        <input type="radio" name="campo4" value="S">
        <%}%>
        <%      if(padre.elementAt(10).equals("N")){
%>
        No: 
        <input type="radio" name="campo4" value="<%=padre.elementAt(10)%>" checked>
        <%}	else {%>
        No: 
        <input type="radio" name="campo4" value="N">
        <%}%>
      </td>
      <td width="35%" height="25">&nbsp;</td>
      <td width="35%" height="25">&nbsp;</td>
    </tr>
    <tr> 
      <td width="2%" height="21">&nbsp;</td>
      <td colspan="3" height="21"> 
        <div align="left"> <b><%=padre.elementAt(1)%></b> </div>
      </td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td width="28%"><i>Apellidos y Nombres</i></td>
      <td width="35%">&nbsp;</td>
      <td width="35%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td colspan="3">Direcci&oacute;n residencia: &nbsp;&nbsp; 
        <input type="text" name="campo5" size="20" maxlength="30" value="<%=padre.elementAt(2)%>">
        &nbsp;&nbsp;Tel&eacute;fono: 
        <input type="text" name="campo6" size="10" maxlength="15" value="<%=padre.elementAt(3)%>">
        Ciudad: 
        <%//=est.getLugresp()%>
        <input type="text" name="campo7" maxlength="20" size="15">
      </td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td colspan="3">Direcci&oacute;n oficina: &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
        <input type="text" name="campo8" size="20" maxlength="30" value="<%=padre.elementAt(4)%>">
        &nbsp;&nbsp;Tel&eacute;fono: 
        <input type="text" name="campo9" size="10" maxlength="15" value="<%=padre.elementAt(6)%>">
        &nbsp;Ciudad 
        <%//=est.getCiutrap()%>
        <input type="text" name="campo10" maxlength="20" size="15">
      </td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td colspan="3">Total ingresos a&ntilde;o anterior $ 
        <input type="text" name="campo25" size="15" maxlength="20" value="<%=padre.elementAt(13)%>">
        Renta L&iacute;quida a&ntilde;o anterior $ 
        <input type="text" name="campo26" size="15" maxlength="20" value="<%=padre.elementAt(12)%>">
      </td>
    </tr>
    <!--<tr> 
      <td width="2%">&nbsp;</td>
      <td colspan="3">Profesi&oacute;n. 
        <input type="text" name="campo15" size="34" maxlength="35">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cargo actual&nbsp; 
        <input type="text" name="campo16" size="30" value="<%=padre.elementAt(8)%>" maxlength="30">
      </td>
    </tr>-->
    <tr> 
      <td width="2%">&nbsp;</td>
      <td width="28%">&nbsp;</td>
      <td width="35%">&nbsp;</td>
      <td width="35%">&nbsp;</td>
    </tr>
  </table>
  <br>
   <%}else if (padre.elementAt(0).equals("M") && padre.elementAt(10).equals("S")){
   		ban1 = "1";
                idm = (String)padre.elementAt(11);
   %>
 
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#EEEEEE">
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4"><b><font color="#7C009B">DATOS DE LA MADRE </font></b></td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td width="28%">&nbsp;</td>
      <td width="35%">&nbsp;</td>
      <td width="35%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="2%" height="25">&nbsp;</td>
      <td width="28%" height="25">Vive ? 
        <%      if(padre.elementAt(10).equals("S")){
%>
        Si: 
        <input type="radio" name="campo11" value="<%=padre.elementAt(10)%>" checked>
        <%}	else {%>
        Si: 
        <input type="radio" name="campo11" value="S">
        <%}%>
        <%      if(padre.elementAt(10).equals("N")){
%>
        No: 
        <input type="radio" name="campo11" value="<%=padre.elementAt(10)%>" checked>
        <%}	else {%>
        No: 
        <input type="radio" name="campo11" value="N">
        <%}%>
      </td>
      <td width="35%" height="25">&nbsp;</td>
      <td width="35%" height="25">&nbsp;</td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td colspan="3"> 
        <div align="left"> <b><%=padre.elementAt(1)%></b> </div>
      </td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td width="29%"><i>Apellidos y Nombres</i></td>
      <td width="35%">&nbsp;</td>
      <td width="34%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td colspan="3">Direcci&oacute;n residencia: &nbsp;&nbsp; 
        <input type="text" name="campo12" size="20" maxlength="30" value="<%=padre.elementAt(2)%>">
        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Tel&eacute;fono: 
        <input type="text" name="campo13" size="10" maxlength="15" value="<%=padre.elementAt(3)%>">
        &nbsp;&nbsp;Ciudad: 
        <%//=est.getLugresm()%>
        <input type="text" name="campo14" maxlength="20" size="15">
      </td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td colspan="3">Direcci&oacute;n oficina: &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
        <input type="text" name="campo15" size="20" maxlength="30" value="<%=padre.elementAt(4)%>">
        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Tel&eacute;fono: 
        <input type="text" name="campo16" size="10" maxlength="15" value="<%=padre.elementAt(6)%>">
        &nbsp;&nbsp;Ciudad: 
        <%//=est.getCiutram()%>
        <input type="text" name="campo17" maxlength="20" size="15">
      </td>
    </tr>
    <!--<tr> 
      <td width="2%">&nbsp;</td>
      <td colspan="3">Profesi&oacute;n. 
        <input type="text" name="campo23" size="34" maxlength="35">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cargo actual&nbsp; 
        <input type="text" name="campo24"  value="<%=padre.elementAt(8)%>" size="30" maxlength="30">
      </td>
    </tr>-->
    <tr> 
      <td width="2%">&nbsp;</td>
      <td colspan="3">Total ingresos a&ntilde;o anterior $ 
        <input type="text" name="campo27" size="15" maxlength="20" value="<%=padre.elementAt(13)%>">
        Renta L&iacute;quida a&ntilde;o anterior $ 
        <input type="text" name="campo28" size="15" maxlength="20" value="<%=padre.elementAt(12)%>">
      </td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td width="29%">&nbsp;</td>
      <td width="35%">&nbsp;</td>
      <td width="34%">&nbsp;</td>
    </tr>
  </table>
 
  <%}%>
  <%}%> 
    <br>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#EEEEEE">
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4"><b><font color="#7C009B">INFORMACION ECONOMICA</font></b></td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td width="23%">&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr> 
      <td width="2%" height="26">&nbsp;</td>
      <td colspan="3" height="26"> 
        <div align="left"> <b>* La vivienda de habitaci&oacute;n de su hogar es:</b></div>
      </td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td width="23%"> 
        <% 	  if(estudiante.elementAt(25).equals("1")){
%>
        Arrendada: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input type="radio" name="campo18" value="<%=estudiante.elementAt(25)%>" checked>
        <%}	  else {%>
        Arrendada: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input type="radio" name="campo18" value="1">
        <%}%>
      </td>
      <td colspan="2">Canon mensual 
        <% 	  if(estudiante.elementAt(25).equals("1")){
%>
        &nbsp;&nbsp;&nbsp;&nbsp; 
        <input type="text" name="campo19" value="<%=estudiante.elementAt(26)%>" maxlength="20" size="15">
        <%}	  else {%>
        &nbsp;&nbsp;&nbsp;&nbsp; 
        <input type="text" name="campo19" value="" maxlength="20" size="15">
        <%}%>
      </td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td width="23%"> 
        <% 	  if(estudiante.elementAt(25).equals("2")){
%>
        Propia y pagada: &nbsp; 
        <input type="radio" name="campo18" value="<%=estudiante.elementAt(25)%>" checked>
        <%}	  else {%>
        Propia y pagada: &nbsp; 
        <input type="radio" name="campo18" value="2">
        <%}%>
      </td>
      <td colspan="2">Aval&uacute;o comercial 
        <% 	  if(estudiante.elementAt(25).equals("2")){
%>
        &nbsp; 
        <input type="text" name="campo20" value="<%=estudiante.elementAt(26)%>" maxlength="20" size="15">
        <%}	  else {%>
        &nbsp; 
        <input type="text" name="campo20" value="" maxlength="20" size="15">
        <%}%>
      </td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td width="23%"> 
        <% 	  if(estudiante.elementAt(25).equals("3")){
%>
        Propia y deuda: &nbsp;&nbsp;&nbsp; 
        <input type="radio" name="campo18" value="<%=estudiante.elementAt(25)%>" checked>
        <%}	  else {%>
        Propia y deuda: &nbsp;&nbsp;&nbsp; 
        <input type="radio" name="campo18" value="3">
        <%}%>
      </td>
      <td colspan="2">Aval&uacute;o comercial 
        <% 	  if(estudiante.elementAt(25).equals("3")){
%>
        &nbsp;&nbsp;
        <input type="text" name="campo21" value="<%=estudiante.elementAt(26)%>" maxlength="20" size="15">
        <%}	  else {%>
        &nbsp;&nbsp;
        <input type="text" name="campo21" value="" maxlength="20" size="15">
        <%}%>
      </td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td width="23%"> 
        <% 	  if(estudiante.elementAt(25).equals("104")){
%>
        Otros: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input type="radio" name="campo18" value="<%=estudiante.elementAt(25)%>" checked>
        <%}	  else {%>
        Otros: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input type="radio" name="campo18" value="104">
        <%}%>
      </td>
      <td colspan="2">Aval&uacute;o comercial 
        <% 	  if(estudiante.elementAt(25).equals("104")){
%>
        &nbsp; 
        <input type="text" name="campo22" value="<%=estudiante.elementAt(26)%>" maxlength="20" size="15">
        <%}	  else {%>
        &nbsp; 
        <input type="text" name="campo22" value="" maxlength="20" size="15">
        <%}%>
      </td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td colspan="3">Estrato de los servicios p&uacute;blicos : 
<%	if (estudiante.elementAt(27).equals("")){	
%>	  
        <input type="text" name="campo23" size="5" maxlength="10">
<%} else {%>
        <input type="text" name="campo23" size="5" maxlength="10" value="<%=estudiante.elementAt(27)%>">		
<%}%>		
        Patromonio bruto familiar $ 
<%	if (estudiante.elementAt(28).equals("")){	
%>		
        <input type="text" name="campo24" maxlength="15" size="10">
<%} else {%>
        <input type="text" name="campo24" size="10" maxlength="15" value="<%=estudiante.elementAt(28)%>">		
<%}%>		
      </td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td width="23%">&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
  </table>
    <br>

  <center><p align="center"> 
  
    <input type="submit" name="Submit" value="Enviar Solicitud" size="2">
  </p></center>
</form>

<% 
	
	sesion = request.getSession(true);
	sesion.setAttribute("carnet", est.getIdEst());
	sesion.setAttribute("prog", prog);
	sesion.setAttribute("ban", ban);		
	sesion.setAttribute("ban1", ban1);
	sesion.setAttribute("idp", idp);		
	sesion.setAttribute("idm", idm);
	sesion.setAttribute("usuario", usuario);
%>

<%}else{%>
	<p>&nbsp;</p>
	<p align="center"><h3><center>Usted ya realizó su solicitud de reingreso</center></h3>
<%}%>

<%}%>

<%}else{%>
	<p>&nbsp;</p>
	<p align="center"><h3><center>Usted no esta autoriazado para realizar este proceso. <br>Puede comunicarse con la oficina de Admisiones donde se aclararán sus inquietudes, al email: <a href="mailto:admisiones@escuelaing.edu.co">admisiones@escuelaing.edu.co</a> o al teléfono 6762666 ext. 274 o 263.</center></h3>
<%}%>
<%}%>

</body>
</html>
<%
    } else {
%>
	<p>&nbsp;</p>
	<p align="center"><h3><center>Aun no se ha registrdo su pago. <br>Puede comunicarse con la oficina de Admisiones donde se aclararán sus inquietudes, al email: <a href="mailto:admisiones@escuelaing.edu.co">admisiones@escuelaing.edu.co</a> o al teléfono 6762666 ext. 274 o 263.</center></h3>
<% 	
    } 
%>
