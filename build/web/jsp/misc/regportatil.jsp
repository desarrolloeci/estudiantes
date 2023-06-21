<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.Estudiante.EstudMisc" %>
<%  
    response.setHeader("Cache-Control","no-cache"); 
    String nombre = new String((String)session.getAttribute("nombre"));
    String ban = new String((String)session.getAttribute("ban"));
    PrintWriter oout = response.getWriter() ;
    Estudiante est = (Estudiante) session.getAttribute("estClase") ;
    EstudMisc emisc = new EstudMisc(est.getIdEst()) ;    
%>
<html>
<head>
<title>Registro Portatil</title>
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
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
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
-->
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_validateForm() { //v4.0
  var i,p,q,nm,test,num,min,max,errors='',args=MM_validateForm.arguments;
  for (i=0; i<(args.length-2); i+=3) { test=args[i+2]; val=MM_findObj(args[i]);
    if (val) { nm=val.name; if ((val=val.value)!="") {
      if (test.indexOf('isEmail')!=-1) { p=val.indexOf('@');
        if (p<1 || p==(val.length-1)) errors+='- '+nm+' must contain an e-mail address.\n';
      } else if (test!='R') { num = parseFloat(val);
        if (isNaN(val)) errors+='- '+nm+' must contain a number.\n';
        if (test.indexOf('inRange') != -1) { p=test.indexOf(':');
          min=test.substring(8,p); max=test.substring(p+1);
          if (num<min || max<num) errors+='- '+nm+' must contain a number between '+min+' and '+max+'.\n';
    } } } else if (test.charAt(0) == 'R') errors += '- '+nm+' is required.\n'; }
  } if (errors) alert('The following error(s) occurred:\n'+errors);
  document.MM_returnValue = (errors == '');
}

function Validar(form) {
	Ctrl = form.mac;
	if (Ctrl.value.length != 12) {
		alert ("La dirección mac debe tener 12 caracteres")
		return (false);
	} else{
		return (true);
	}
}
//-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000">

<table width="640" border="0" cellpadding="0" align="center" cellspacing="0">
    <tr>     
    <td width="640" valign="top" height="255"> 
      <jsp:include page="encabezado" flush="true"/>
      <table width="100%" border="0" align="center">
        <tr> 
          <td valign="top">
            <fieldset> 
            <font color="#336699" face="Verdana, Arial, Helvetica, sans-serif" > 
            <center><legend><font color="#666666" size="2"><b>Registro Portail</u></b></font></legend> 
            </center>
            </font> 
       <% if (emisc.getPortatil() == 0 ) {%>
	   	<div align="center" class="texto"><a href="" onclick="window.open('http://www.escuelaing.edu.co/osiris/Portatiles/instrucciones.htm','','height=600,width=800,scrollbars=yes');return false">C&oacute;mo Obtener la MAC de la tarjeta inal&aacute;mbrica?</a></div>
            <form name="form1" method="post" action="SalvePortatil"> 
            <table width="100%" border="1" class="texto">
              <tr>
                <td width="35%">Dirección MAC Tarjeta inal&aacute;mbrica<br>
                  (Sin guiones ejemplo: <font color="#990000">0E54FA12B018</font>)</td>
                <td width="20%">
                    <p><input name="mac" type="text" size="15" maxlength="12"></p>
                </td>
                <td width="15%">Marca</td>
                <td width="30%"><select size="1" name="marca">
                    <option value="ACE">Acer</option>
                    <option value="IBM">IBM</option>
                    <option value="HP">HP</option>
                    <option value="TOS">Toshiba</option>
                    <option value="DEL">Dell</option>
                    <option value="LEN">Lenovo</option>
                    <option value="SON">Sony</option>
                    <option value="APL">Apple</option>
                    <option value="OTR">Otro</option>
                  </select></td>
              </tr>
              <tr>
                <td width="35%">Referencia</td>
                <td width="20%">
                    <p><input name="ref" type="text" size="20" maxlength="15">
                    </p>
                </td>
                <td width="15%">Procesador</td>
                <td width="30%">
                    <p><input name="prc" type="text" size="20" maxlength="15">
                    </p>
                </td>
              </tr>
            </table>
              <div align="center"> <br>
                <input type="submit" name="Submit" value=" Registrar Portatil " size="2" class="boton" onClick="javascript: return Validar(this.form);">
              </div>
            </form>
            <% } else {  %>
            <div align="center" class="texto"> Usted ya tiene un portatil registrado</div>
        <% }  %>
            </fieldset>
          </td>
        </tr>
        <tr> 
          <td valign="top" height="12"> 
            <table width="45%" border="0" align="right">
              <tr> 
                  <td width="27%" height="12"> 
                    <div align="center"> 
                      <%if (ban.equals("0")){%>
                      <font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud">ANTERIOR</a> </font></b></font> 
                      <%} else {%>
                      <font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud1">ANTERIOR</a> </font></b></font> 
                      <%}%>
                    </div>
                  </td>
                  <td width="4%" height="12" align="center" valign="middle"> 
                    <div align="center">|</div>
                  </td>
                  <td width="22%" height="12"> 
                    <%if (ban.equals("0")){%>
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud">INICIO</a></font></b></font></div>
                    <%} else {%>
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud1">INICIO</a></font></b></font></div>
                    <%}%>
                  </td>
                  <td width="4%" height="12" align="center" valign="middle"> 
                    <div align="center"><b>|</b></div>
                  </td>
                  <td width="43%" height="12"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"><a href="LogOutEst">CERRAR 
                      SESION </a></font></b></font></div>
                  </td>
              </tr>
            </table>
          
          </td>
          
        </tr>
      </table>
  </tr>
    <tr>
      <td height="5" colspan="3"><img src="img/bararhoriz.gif" width="640" height="5"></td>
    </tr>
</table>

</body>
</html>