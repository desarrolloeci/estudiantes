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
    Vector datgr = new Vector() ;
%>
<html>
<head>
<title>Encuesta Académica</title>
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
.textocom {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
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

<script language="JavaScript" type="text/JavaScript">
<!--
function validaresp(){
    var i, cont = 0, c = 1, mens = ': ';
    i = 4 ;
    while (i < 164) {
        if ( document.formenc.elements[i].checked){
            cont++ ;
        }
        if (c % 5 == 0 && cont < c / 5  ) {
            alert("Falta responder pregunta: " + c / 5 ) ;
            return false ;
        }
        i++ ;
        c++ ;
    }
    if (cont < 32) {
        alert("faltan preguntas por contestar" + mens) ;
        return false ;
    }
	if(document.formenc.obser.value.length >= 250){
		//alert('El tamaño del textarea supera el permitido'); 
		//document.formenc.obser.select(); 
		var str = document.formenc.obser.value;
		document.formenc.obser.value = str.substring(0,250);
		//return false;
	} 
    return true;
}
-->
</script>

</head>

<body bgcolor="#FFFFFF" text="#000000">

<table width="800" border="0" cellpadding="0" align="center" cellspacing="0">
    <tr>     
    <td width="800" valign="top" height="255"> 
      <jsp:include page="encabezado" flush="true"/>
      <table width="100%" border="0" align="center" class="textocom">
        <tr> 
          <td valign="top">
            <fieldset> 
            <font color="#336699" face="Verdana, Arial, Helvetica, sans-serif" > 
            <center><legend><font color="#666666" size="2"><b>Encuesta Académica</u></b></font></legend> 
            </center>
            </font> 
<%      datgr = emisc.getGrupo(request.getParameter("grupo")) ;
        if ( datgr == null ) {
%>    
            <div align="center" class="textocom"> Usted ya Registro encuesta para este Grupo</div>    
<%      } else if ( datgr.size() > 0 ) {
%>
            <b>Profesor:</b> <%=datgr.elementAt(3)%> -  
            <b>Asignatura: </b><%=datgr.elementAt(4)%> - <b>Grupo: </b><%=datgr.elementAt(1)%>
			<br>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="textocom">
  <tr>
    <td width="22%"><strong>1</strong>: Totalmente en Desacuerdo</td>
    <td width="23%"><strong>2</strong>: Parcialmente en Desacuerdo</td>
    <td width="21%"><strong>3</strong>: Parcialmente de Acuerdo</td>
    <td width="14%"><strong>4</strong>: De acuerdo</td>
    <td width="20%"><strong>5</strong>: Totalmente de Acuerdo </td>
  </tr>
</table>

			<form name="formenc" method="post" action="GuardEncuesta"> 
              <input type="hidden" name="prof" value="<%=datgr.elementAt(2)%>">
              <input type="hidden" name="asig" value="<%=datgr.elementAt(0)%>">
              <input type="hidden" name="ngrp" value="<%=datgr.elementAt(1)%>">
              <input type="hidden" name="idgrp" value="<%=datgr.elementAt(5)%>">

              <table border="1" width="100%" class="textocom">
    <tr>
      <td width="4%" align="center"><b><font color="#91091D">Nro</font></b></td>
      <td width="55%" align="center">
        <p align="center"><b><font color="#91091D">Información del Estudiante</font></b></p>
      </td>
      <td width="4%" align="center"><b><font color="#91091D">1</font></b></td>
      <td width="4%" align="center"><b><font color="#91091D">2</font></b></td>
      <td width="4%" align="center"><b><font color="#91091D">3</font></b></td>
      <td width="4%" align="center"><b><font color="#91091D">4</font></b></td>
      <td width="4%" align="center"><b><font color="#91091D">5</font></b></td>
    </tr>
    <tr>
      <td width="4%">1</td>
      <td width="55%">Antes de comenzar el
        curso, conocí los objetivos, la metodología, el sistema de evaluación
        y el contenido programático descrito en la página de 
        la ECI</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R1"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R1"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R1"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R1"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R1"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">2</td>
      <td width="55%">Trabajé en promedio al
        menos dos horas adicionales por cada hora programada de clase</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R2"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R2"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R2"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R2"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R2"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">3</td>
      <td width="55%">Me interesé en aprender
        y complementar por mi mismo lo tratado en clase</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R3"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R3"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R3"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R3"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R3"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">4</td>
      <td width="55%">Participé activamente en
        las clases</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R4"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R4"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R4"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R4"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R4"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">5</td>
      <td width="55%">Con la asignatura practiqué y mejoré el trabajo en equipo</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R5"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R5"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R5"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R5"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R5"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">6</td>
      <td width="55%">Utilicé las evaluaciones
        para reorientar mi propio aprendizaje</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R6"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R6"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R6"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R6"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R6"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">7</td>
      <td width="55%">Adquirí nuevos conocimientos</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R7"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R7"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R7"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R7"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R7"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">8</td>
      <td width="55%">Cumplí con los compromisos adquiridos con la
        asignatura (asistir a clase, realización de talleres, trabajos,
        laboratorios, proyectos, etc.)</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R8"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R8"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R8"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R8"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R8"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">9</td>
      <td width="55%">Logré los objetivos
        propuestos para la asignatura</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R9"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R9"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R9"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R9"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R9"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">10</td>
      <td width="55%">Quiero profundizar los conocimientos adquiridos en
        esta materia</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R10"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R10"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R10"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R10"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R10"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">11</td>
      <td width="55%">La ética, la honradez, la transparencia y la honestidad de mis
        actuaciones son los principios que guían mi actuar diario</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R11"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R11"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R11"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R11"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R11"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">12</td>
      <td width="55%">Me preocupé por
        consultar y resolver mis dudas fuera de clases</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R12"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R12"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R12"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R12"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R12"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">&nbsp;</td>
      <td width="55%">
        <p align="center"><b><font color="#91091D">Información de la Asignatura</font></b></td>
      <td width="4%" align="center"><b><font color="#91091D">1</font></b></td>
      <td width="4%" align="center"><b><font color="#91091D">2</font></b></td>
      <td width="4%" align="center"><b><font color="#91091D">3</font></b></td>
      <td width="4%" align="center"><b><font color="#91091D">4</font></b></td>
      <td width="4%" align="center"><b><font color="#91091D">5</font></b></td>
    </tr>
    <tr>
      <td width="4%">13</td>
      <td width="55%">El programa de la
        asignatura, descrito en la página de la ECI, establece claramente sus objetivos</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R13"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R13"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R13"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R13"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R13"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">14</td>
      <td width="55%">El contenido de la
        asignatura corresponde a los objetivos establecidos</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R14"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R14"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R14"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R14"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R14"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">15</td>
      <td width="55%">Los temas desarrollados contribuyen a mi formación integral</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R15"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R15"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R15"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R15"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R15"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">16</td>
      <td width="55%">El tiempo total requerido
        para la asistencia a clase y para el trabajo adicional no interfirió
        con mis compromisos con las demás asignaturas</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R16"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R16"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R16"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R16"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R16"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">17</td>
      <td width="55%">El contenido de esta
        asignatura se articula con los contenidos de otras</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R17"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R17"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R17"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R17"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R17"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">18</td>
      <td width="55%">Las actividades
        desarrolladas (ejercicios, talleres, proyectos, visitas, etc.)
        contribuyen a mi aprendizaje de la asignatura</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R18"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R18"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R18"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R18"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R18"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">19</td>
      <td width="55%">Los recursos de apoyo para esta asignatura son
        adecuados (biblioteca, recursos informáticos, laboratorios, aulas,
        etc.)</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R19"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R19"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R19"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R19"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R19"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">20</td>
      <td width="55%">Se debe tener una línea
        de profundización en el tema de esta asignatura</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R20"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R20"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R20"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R20"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R20"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">21</td>
      <td width="55%">Las evaluaciones
        facilitan el seguimiento de mi propio proceso de aprendizaje</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R21"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R21"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R21"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R21"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R21"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">&nbsp;</td>
      <td width="55%">
        <p align="center"><b><font color="#91091D">Información del Profesor</font></b></td>
      <td width="4%" align="center"><b><font color="#91091D">1</font></b></td>
      <td width="4%" align="center"><b><font color="#91091D">2</font></b></td>
      <td width="4%" align="center"><b><font color="#91091D">3</font></b></td>
      <td width="4%" align="center"><b><font color="#91091D">4</font></b></td>
      <td width="4%" align="center"><b><font color="#91091D">5</font></b></td>
    </tr>
    <tr>
      <td width="4%">22</td>
      <td width="55%">Indaga sobre sus
        expectativas respecto a la asignatura al comenzar el curso</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R22"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R22"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R22"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R22"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R22"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">23</td>
      <td width="55%">Revisa con los
        estudiantes las reglas del juego para el desarrollo de la asignatura</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R23"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R23"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R23"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R23"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R23"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">24</td>
      <td width="55%">Conduce adecuadamente la clase</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R24"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R24"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R24"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R24"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R24"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">25</td>
      <td width="55%">Fomenta el uso de nuevas tecnologías para el aprendizaje</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R25"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R25"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R25"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R25"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R25"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">26</td>
      <td width="55%">Inculca al estudiante el deseo de aprender</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R26"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R26"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R26"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R26"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R26"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">27</td>
      <td width="55%">Es sensible a las dificultades de los estudiantes y
        está dispuesto a ayudar</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R27"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R27"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R27"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R27"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R27"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">28</td>
      <td width="55%">Estimula la participación
        de los estudiantes</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R28"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R28"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R28"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R28"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R28"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">29</td>
      <td width="55%">
        <p align="left">Suscita el interés y compromiso para con la asignatura</p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R29"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R29"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R29"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R29"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R29"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">30</td>
      <td width="55%">Procura que sus estudiantes razonen, apliquen y
        aprendan a plantear soluciones a problemas que favorecen el proceso de
        aprendizaje</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R30"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R30"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R30"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R30"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R30"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">31</td>
      <td width="55%">Explica los resultados de
        las evaluaciones y realiza la retroalimentación respectiva
        oportunamente</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R31"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R31"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R31"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R31"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R31"></p>
      </td>
    </tr>
    <tr>
      <td width="4%">32</td>
      <td width="55%">Comparte sus experiencias
        con los estudiantes como parte de la orientación del aprendizaje</td>
      <td width="4%">
        <p align="center"><input type="radio" value="1" name="R32"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="2" name="R32"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="3" name="R32"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="4" name="R32"></p>
      </td>
      <td width="4%">
        <p align="center"><input type="radio" value="5" name="R32"></p>
      </td>
    </tr>
              
              </table>               
              <div align="center"> <br>
                Observación<br>
                <textarea name="obser" cols="75"></textarea> <br>
                <input type="submit" name="Submit" value=" Aceptar Encuesta " size="2" 
                    onclick="return validaresp()" class="boton">
              </div>
            </form>
            <% } else {  %>
            <div align="center" class="textocom"> Usted ya Registro encuesta para este Grupo</div>
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
      <td height="5" colspan="3"><img src="img/bararhoriz.gif" width="800" height="5"></td>
    </tr>
</table>

</body>
</html>