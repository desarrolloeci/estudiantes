<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.DecimalFormat" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>

<%
int tmp, dg, div, dgfin, dgfin2, modtmp, i;
String ref2, tmpchar, sec, nrocarne;
response.setHeader("Cache-Control","no-cache"); 
String nombre = new String((String)session.getAttribute("nombre"));
String ban = new String((String)session.getAttribute("ban"));
String imprimir = request.getParameter("imprimir");
PrintWriter oout = response.getWriter() ;
//        Estudiante est = new Estudiante(carnet,oout) ;
Estudiante est = (Estudiante) session.getAttribute("estClase") ;
Vector datosEst = est.getInfoPerInter(carnet);
Vector veringles = est.getVerifPerInter(carnet);
nrocarne = carnet;
int estado = Integer.parseInt(est.getEstado());
while(nrocarne.length() < 7){
    nrocarne = "0" + nrocarne;
}
if(datosEst.size()>0 /*&& veringles.size() > 0*/){
    Vector datos = (Vector)datosEst.elementAt(0);
    // Una Asignatura: 
    ref2 = "1" + valref2(nrocarne);
    sec = "1212121212121212";
    dg = 0;
    for(i=0; i<ref2.length(); i++){
        tmpchar = String.valueOf(ref2.charAt(i));
        tmp = Integer.parseInt(tmpchar);
        tmpchar = String.valueOf(sec.charAt(i));
        tmp = tmp * Integer.parseInt(tmpchar);
        if(tmp >= 10){
            div = tmp/10;
            dg = dg + div + tmp%10;
        }else{
            dg = dg + tmp;
        }
    }
    modtmp = dg%10;
    if(modtmp > 0){
        dgfin = 10 - modtmp;
    }else{
        dgfin = 0;
    }
    // Dos Asignaturas: 
    ref2 = "2" + valref2(nrocarne);
    dg = 0;
    for(i=0; i<ref2.length(); i++){
        tmpchar = String.valueOf(ref2.charAt(i));
        tmp = Integer.parseInt(tmpchar);
        tmpchar = String.valueOf(sec.charAt(i));
        tmp = tmp * Integer.parseInt(tmpchar);
        if(tmp >= 10){
            div = tmp/10;
            dg = dg + div + tmp%10;
        }else{
            dg = dg + tmp;
        }
    }
    modtmp = dg%10;
    if(modtmp > 0){
        dgfin2 = 10 - modtmp;
    }else{
        dgfin2 = 0;
    }
    if(imprimir == null){
%>

<html>
<head>
<title>Período Intermedio</title>
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
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000">
    <table width="640" border="0" cellpadding="0" align="center" cellspacing="0">
    <tr>
        
    <td width="640" height="42" valign="top"> 
	<jsp:include page="encabezado" flush="true"/>
      <table width="100%" border="0" align="center" class="texto">
        <tr> 
          <td height="6" colspan="2" > 
            <div>
              <div align="center">
                <p><font face="Verdana, Arial, Helvetica, sans-serif"><font color="#666666" size="2"><u><strong>Datos b&aacute;sicos
                          de pago - Per&iacute;odo Intersemestral</strong></u></font></font></p>
                <p>Presentar esta informaci&oacute;n en el Banco Santander para recaudo
                con el c&oacute;digo 0507<br>
                </p>
              </div>
            </div>
          </td>
        </tr>
        <tr> 
          <td width="28%" align="left" valign="top">Nombre:</td>
          <td width="72%" align="left" valign="top"><%=nombre%></td>
        </tr>
        <tr> 
          <td width="28%" align="left" valign="top">Programa:</td>
          <td width="72%" align="left" valign="top"><%=datos.elementAt(2)%></td>
        </tr>
        <tr> 
          <td colspan="2" align="center" valign="top"><hr></td>
        </tr>
        <tr bgcolor="#E8E8E8"> 
          <td colspan="2" align="left" valign="top"><input type="checkbox" name="checkbox" value="checkbox">
          1 Asignatura </td>
        </tr>
        <tr> 
          <td width="28%" align="left" valign="top">C&oacute;digo del estudiante:</td>
          <td width="72%" align="left" valign="top">1<%=valref2(nrocarne)%><%=dgfin%></td>
        </tr>
        <tr> 
          <td width="28%" align="left" valign="top">Programa:</td>
          <td width="72%" align="left" valign="top"><%=valref3(datos.elementAt(5).toString())%></td>
        </tr>
        <tr> 
          <td width="28%" align="left" valign="top">Identificaci&oacute;n del estudiante:</td>
          <td width="72%" align="left" valign="top"><%=datos.elementAt(3)%></td>
        </tr>
		
        <tr> 
          <td width="28%" align="left" valign="top">Valor a pagar:</td>
          <td width="72%" align="left" valign="top">$ <%=datos.elementAt(6)%></td>
        </tr>
        <tr> 
          <td colspan="2" align="center" valign="top"><hr></td>
        </tr>
<%if(estado != -12){%>
		<tr bgcolor="#E8E8E8"> 
          <td colspan="2" align="left" valign="top"><input type="checkbox" name="checkbox2" value="checkbox">
2 Asignaturas </td>
        </tr>
		<tr> 
          <td width="28%" align="left" valign="top">C&oacute;digo del estudiante:</td>
          <td width="72%" align="left" valign="top">2<%=valref2(nrocarne)%><%=dgfin2%></td>
        </tr>
        <tr> 
          <td width="28%" align="left" valign="top">Programa:</td>
          <td width="72%" align="left" valign="top"><%=valref3(datos.elementAt(5).toString())%></td>
        </tr>
        <tr> 
          <td width="28%" align="left" valign="top">Identificaci&oacute;n del
          estudiante:</td>
          <td width="72%" align="left" valign="top"><%=datos.elementAt(3)%></td>
        </tr>
        <tr> 
          <td width="28%" align="left" valign="top">Valor a pagar:</td>
          <td width="72%" align="left" valign="top">$ <%=datos.elementAt(4)%></td>
        </tr>
        <tr> 
          <td colspan="2" align="center" valign="top"> 
            <hr>
          </td>
        </tr>
<%}%>
        <tr> 
          <td colspan="2" align="center" valign="top"> 
            <input name="Submit" type="button" onClick="MM_openBrWindow('PreInterMat?imprimir=imprimir','imp','toolbar=yes,location=yes,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=800,height=600')" value="Imprimir" class="boton">
          </td>
        </tr>
        <tr> 
          <td colspan="2" align="left" valign="top"><div align="center"><b><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif">Pagar
          hasta el 27 - mayo - 2010<br>
          Los pagos con tarjeta d&eacute;bito o tarjeta cr&eacute;dito &uacute;nicamente
          se recibir&aacute;n en la Caja de la Escuela de
          1:00 pm. a 5:00 pm.</font></b></div></td>
          
        </tr>
        <tr> 
          <td colspan="2" valign="top"> 
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
		<tr>
      <td height="5" colspan="4"><img src="img/bararhoriz.gif" width="640" height="5"></td>
    </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
<%      }else{%>
<html>
<head>
<title>Período Intermedio</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.texto {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-style: normal;
	line-height: normal;
	font-weight: bold;
	font-variant: normal;
	text-transform: none;
	text-decoration: none;
}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function impresion(){
    window.print();
    window.close();
}
//-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" onLoad="">
<table width="640" border="1" cellpadding="0" align="center" cellspacing="0">
    <tr>
    <td width="640" height="42" valign="top"> 
    <table width="640" border="0" cellpadding="0" align="center" cellspacing="0">
    <tr>
    <td width="640" height="42" valign="top"> 
      <table width="100%" border="0" align="center" class="texto">
	  	<tr> 
          <td colspan="2" align="left" valign="top">
		  <table width="100%" border="0" align="center" class="texto">
		  <tr> 
          <td height="6" > 
            <div>
              <div align="center">
                <p><img src="img/logo.gif" width="83" height="90"></p>
              </div>
            </div>
          </td>
          <td height="6" ><p><font face="Verdana, Arial, Helvetica, sans-serif"><font color="#666666" size="2"><u><strong>Datos b&aacute;sicos
                      de pago - Per&iacute;odo Intersemestral</strong></u></font></font></p>
            <p>Presentar esta informaci&oacute;n en el Banco Santander para recaudo
                con el c&oacute;digo 0507</p></td>
        </tr>	
		  </table>
		  </td>
        </tr>
        <tr> 
          <td width="17%" align="left" valign="top">Nombre:</td>
          <td width="83%" align="left" valign="top"><%=nombre%></td>
        </tr>
        <tr> 
          <td width="17%" align="left" valign="top">Programa:</td>
          <td width="83%" align="left" valign="top"><%=datos.elementAt(2)%></td>
        </tr>
        <tr> 
          <td colspan="2" align="center" valign="top"><hr></td>
        </tr>
        <tr bgcolor="#E8E8E8"> 
          <td colspan="2" align="left" valign="top"><input type="checkbox" name="checkbox" value="checkbox">
          1 Asignatura </td>
        </tr>
        <tr> 
          <td width="28%" align="left" valign="top">C&oacute;digo del estudiante:</td>
          <td width="72%" align="left" valign="top">1<%=valref2(nrocarne)%><%=dgfin%></td>
        </tr>
        <tr> 
          <td width="28%" align="left" valign="top">Programa:</td>
          <td width="72%" align="left" valign="top"><%=valref3(datos.elementAt(5).toString())%></td>
        </tr>
        <tr> 
          <td width="28%" align="left" valign="top">Identificaci&oacute;n del estudiante:</td>
          <td width="72%" align="left" valign="top"><%=datos.elementAt(3)%></td>
        </tr>
		
        <tr> 
          <td width="28%" align="left" valign="top">Valor a pagar:</td>
          <td width="72%" align="left" valign="top">$ <%=datos.elementAt(6)%></td>
        </tr>
        <tr> 
          <td colspan="2" align="center" valign="top"><hr></td>
        </tr>
<%if(estado != -12){%>
		<tr bgcolor="#E8E8E8"> 
          <td colspan="2" align="left" valign="top"><input type="checkbox" name="checkbox2" value="checkbox">
2 Asignaturas </td>
        </tr>
		<tr> 
          <td width="28%" align="left" valign="top">C&oacute;digo del estudiante:</td>
          <td width="72%" align="left" valign="top">2<%=valref2(nrocarne)%><%=dgfin2%></td>
        </tr>
        <tr> 
          <td width="28%" align="left" valign="top">Programa:</td>
          <td width="72%" align="left" valign="top"><%=valref3(datos.elementAt(5).toString())%></td>
        </tr>
        <tr> 
          <td width="28%" align="left" valign="top">Identificaci&oacute;n del
          estudiante:</td>
          <td width="72%" align="left" valign="top"><%=datos.elementAt(3)%></td>
        </tr>
        <tr> 
          <td width="28%" align="left" valign="top">Valor a pagar:</td>
          <td width="72%" align="left" valign="top">$ <%=datos.elementAt(4)%></td>
        </tr>
        <tr> 
          <td colspan="2" align="center" valign="top"> 
            <hr>
          </td>
        </tr>
 <%}%>
        <tr> 
          <td colspan="2" align="left" valign="top">
		  <div align="center"><b><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif">Pagar
          hasta el 27 - mayo - 2010<br>
          Los pagos con tarjeta d&eacute;bito o tarjeta cr&eacute;dito &uacute;nicamente
          se recibir&aacute;n en la Caja de la Escuela de
          1:00 pm. a 5:00 pm.</font></b></div></td>
          
        </tr>
      </table>
    </td>
  </tr>
</table>

    </td>
  </tr>
</table>
</body>
</html>
<%      }
    }else{
%>
<html>
<head>
<title>Período Intermedio</title>
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
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000">
    <table width="640" border="0" cellpadding="0" align="center" cellspacing="0">
    <tr>
        
    <td width="640" height="42" valign="top"> 
	<jsp:include page="encabezado" flush="true"/>
      <table width="100%" border="0" align="center" class="texto">
        <tr> 
          <td colspan="2" align="left" valign="top"><b><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif">
                      <br><font color="#FF0000">Informativo: </font>Señor Estudiante: Usted no podrá cursar asignaturas en el
               período intersemestral por que le falta el 
               requisito de inglés equivalente al nivel intermedio alto, 
               según el Reglamento Estudiantil vigente y reglamentación aprobada por el 
               Consejo Directivo el 10 de abril de 2007 en su reunión No. 272, 
<a href="" onclick="window.open('http://www.escuelaing.edu.co/servicios/estudiantes/ingles.htm','','height=600,width=800, toolbar=yes,scrollbars=yes,location=no,directories=yes,status=yes,menubar=yes,resizable=yes');return false">
            Reglamentación idioma inglés
            
        </a><br>&nbsp;</font></b></td>
          
        </tr>
        <tr> 
          <td colspan="2" valign="top"> 
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
		<tr>
      <td height="5" colspan="4"><img src="img/bararhoriz.gif" width="640" height="5"></td>
    </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
<%
    }%>
    
<%!
    public String valref3(String ref){
        while(ref.length() < 3){
            ref = "0" + ref;
        }
        return ref;
    }
%>
<%!
    public String valref2(String ref){
        while(ref.length() < 7){
            ref = ref + "0";
        }
        return ref;
    }
%>
