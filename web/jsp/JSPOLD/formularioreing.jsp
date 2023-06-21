<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiantereint" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>

<%
    String carnet = new String();  
    String IdEst = request.getParameter("documento");
   // String IdEst = documento;
    PrintWriter oout = response.getWriter() ;
    Estudiantereint est = new Estudiantereint(IdEst,oout) ;
    String prog = new String();
    HttpSession         sesion;
    sesion = request.getSession(true);
    if (IdEst != null && !IdEst.equals("")) {
   %>
   
<html>
<head>
<title>Reintegro</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="../servlet/GuardaDatos">  

<%Vector estud = est.getInfoEstudiante() ;%>
<%if((estud.size()) == 0){%>
  	<p>&nbsp;</p>
	<p align="center"><h3><center>Su documento es incorrecto, recuerde que este documento fue con el que ingreso a la Escuela; o no existe información<br>Puede comunicarse con la oficina de Admisiones donde se aclararán sus inquietudes, al email: <a href="mailto:admisiones@escuelaing.edu.co">admisiones@escuelaing.edu.co</a> o al teléfono 6762666 ext. 274 o 263.</center></h3>
<%}else{%>
<%if ((est.getEstado().equals("-3")) || (est.getEstado().equals("-4")) || (est.getEstado().equals("-8")) || (est.getEstado().equals("-9")) || (est.getEstado().equals("-5"))) {%>

<% for ( int j = 0 ; j < estud.size() ; j++ ){
		Vector estudiante = (Vector)estud.elementAt(j) ;
%>
<%  	Vector padres = est.getInfoPadres() ;
%>
	
<%if(!(estudiante.elementAt(18).equals("E"))){%>
    	
  <table width="102%" border="0" cellspacing="0" cellpadding="0" bgcolor="#8C00BB" height="151">
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
        </b>segundo per&iacute;odo </font></b> <b><font color="#FFFFFF" size="3">acad&eacute;mico 
        del a&ntilde;o 2003</font></b>&nbsp;&nbsp; </td>
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
        <input type="text" name="campo6" maxlength="35" size="35" value="<%=estudiante.elementAt(4)%>">
        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td colspan="3">Ciudad&nbsp; 
        <input type="text" name="campo7" size="21" maxlength="25" value="<%=est.getNomciudad()%>">
        &nbsp;&nbsp;&nbsp; Tel&eacute;fono 
        <input type="text" name="campo8" maxlength="15" size="15" value="<%=estudiante.elementAt(6)%>">
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
		if (padre.elementAt(0).equals("P")){
		 %>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#EEEEEE">
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4"><b><font color="#7C009B">DATOS DEL PADRE</font></b></td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td width="28%">&nbsp;</td>
      <td width="35%">&nbsp;</td>
      <td width="35%">&nbsp;</td>
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
      <td colspan="3">Direcci&oacute;n residencia: &nbsp;&nbsp; <%=padre.elementAt(2)%> 
        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Tel&eacute;fono: <%=padre.elementAt(3)%> 
        &nbsp;&nbsp;Ciudad: <%=est.getLugresp()%> </td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td colspan="3">Direcci&oacute;n oficina: &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
        <%=padre.elementAt(4)%> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Tel&eacute;fono: 
        <%=padre.elementAt(6)%>
        &nbsp;&nbsp;Ciudad 
        <%=est.getCiutrap()%>
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
   <%}else if (padre.elementAt(0).equals("M")){
   %>
 
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#EEEEEE">
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4"><b><font color="#7C009B">DATOS DE LA MADRE</font></b></td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td width="29%">&nbsp;</td>
      <td width="35%">&nbsp;</td>
      <td width="34%">&nbsp;</td>
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
      <td colspan="3">Direcci&oacute;n residencia: &nbsp;&nbsp; <%=padre.elementAt(2)%> 
        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Tel&eacute;fono: <%=padre.elementAt(3)%> 
        &nbsp;&nbsp;Ciudad: <%=est.getLugresm()%> </td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td colspan="3">Direcci&oacute;n oficina: &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
        <%=padre.elementAt(4)%> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Tel&eacute;fono: 
        <%=padre.elementAt(6)%> &nbsp;&nbsp;Ciudad: <%=est.getCiutram()%> </td>
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
      <td width="29%">&nbsp;</td>
      <td width="35%">&nbsp;</td>
      <td width="34%">&nbsp;</td>
    </tr>
  </table>
  <br>
  <%}%> 
  <%}%>
  

  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#EEEEEE">
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4"><b><font color="#7C009B">DATOS DEL ACUDIENTE</font></b></td>
    </tr>
    <tr> 
      <td width="3%">&nbsp;</td>
      <td width="23%">&nbsp;</td>
      <td width="49%">&nbsp;</td>
      <td width="25%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="3%" height="29">&nbsp;</td>
      <td width="23%" height="29"> 
        <div align="left"> Parentesco: 
          <select name="parent">
            <%int band=0;
               if(estudiante.elementAt(21).equals("M")){
               band=1;%>
                <option value="M" selected>Madre</option>
            <%}else{%>
                <option value="M">Madre</option>
            <%}if(estudiante.elementAt(21).equals("P")){ band=1;%>
                <option value="P" selected>Padre</option>
            <%}else{%>    
                <option value="P">Padre</option>
            <%}if(estudiante.elementAt(21).equals("A")){ band=1;%>
                <option value="A" selected>Abuelo(a)</option>
            <%}else{%>    
                <option value="A">Abuelo(a)</option>
            <%}if(estudiante.elementAt(21).equals("T")){ band=1;%>
                <option value="T" selected>Tio(a)</option>
            <%}else{%>    
                <option value="T">Tio(a)</option>
            <%}if(estudiante.elementAt(21).equals("H")){ band=1;%>
                <option value="H" selected>Hermano(a)</option>
            <%}else{%>    
                <option value="H">Hermano(a)</option>
            <%}if(estudiante.elementAt(21).equals("R")){ band=1;%>
                <option value="R" selected>Primo</option>
            <%}else{%>    
                <option value="R">Primo</option>
            <%}if(estudiante.elementAt(21).equals("O")){ band=1;%>
                <option value="O" selected>Otro</option>
            <%}else{%>    
                <option value="O">Otro</option>
            <%}if(band==0){%>  
                <option value="N" selected>Ninguno</option>        
            <%}else{%>
                <option value="N">Ninguno</option>  
            <%}%>
          </select>
        </div>
      </td>
      <td width="49%" height="29"> 
        <div align="left"> Nombre completo: <b> <%=estudiante.elementAt(9)%></b> 
        </div>
      </td>
      <td width="25%" height="29"> 
        <div align="left">&nbsp;</div>
      </td>
    </tr>
    <tr> 
      <td width="3%">&nbsp;</td>
      <td colspan="3">Direcci&oacute;n residencia: &nbsp;&nbsp; <%=estudiante.elementAt(10)%> 
        &nbsp;&nbsp;&nbsp;&nbsp; Tel&eacute;fono: <%=estudiante.elementAt(11)%></td>
    </tr>
    <tr> 
      <td width="3%">&nbsp;</td>
      <td colspan="3"><b>Persona diferente del acudiente, residente en Bogot&aacute;</b></td>
    </tr>
    <tr> 
      <td width="3%">&nbsp;</td>
      <td colspan="3">Nombre completo: <b><%=estudiante.elementAt(12)%></b> &nbsp;&nbsp;&nbsp;Direcci&oacute;n: 
        <%=estudiante.elementAt(13)%> &nbsp;&nbsp;Tel&eacute;fono: <%=estudiante.elementAt(14)%> 
      </td>
    </tr>
    <tr> 
      <td width="3%">&nbsp;</td>
      <td width="23%">&nbsp;</td>
      <td width="49%">&nbsp;</td>
      <td width="25%">&nbsp;</td>
    </tr>
  </table>
  <br>
  <br>
  <center><p align="center"> 
  
    <input type="submit" name="Submit" value="Enviar Solicitud" size="2">
  </p></center>
</form>

<% 
	
	sesion = request.getSession(true);
	sesion.setAttribute("carnet", est.getIdEst());
	sesion.setAttribute("prog", prog);		
%>

<%}else{%>
	<p>&nbsp;</p>
	<p align="center"><h3><center>Usted ya realizo su solicitud de reintegro</center></h3>
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
<jsp:forward page="reingreso.jsp"/>
<% 	
    } 
%>
