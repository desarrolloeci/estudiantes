<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
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
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Servicios Acad&eacute;micos - Encuesta acad&eacute;mica</title>
        
        <!-- JavaScript -->
        <script type="text/javascript" src="scripts/wufoo.js"></script>
        
        <!-- CSS -->
          <link rel="stylesheet" type="text/css" href="Navegacion/css/estilo-escuela.css">
<link rel="stylesheet" href="Navegacion/css/bootstrap.min.css">
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
//25 campos *5 rtas cada uno mas 4 campos que van ocultos
    while (i < 129) {
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
    if (cont < 25) {
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
  <body id="public" style="background-color: white">
        <div id="container">
            <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
                
                <tr>
                    <td>                    
                    <jsp:include page="encabezado" flush="true">
                        <jsp:param name="anterior" value="menuServEstud" />
                    </jsp:include>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="info" align="center">
                            <h2><font color="#666666">
                                    <label id="msj">Encuesta acad&eacute;mica</label>
                            </font></h2>
                    </div></td>
                </tr>
                <tr>
                    <td>
                        <fieldset> 
                            <font color="#336699" face="Verdana, Arial, Helvetica, sans-serif" > 
                                <center><legend></legend>
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
                            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tabla">
                                <tr>
                                    <td width="22%"><font size="1"><strong>1</strong>: Totalmente en Desacuerdo</font></td>
                                    <td width="23%"><font size="1"><strong>2</strong>: Parcialmente en Desacuerdo</font></td>
                                    <td width="23%"><font size="1"><strong>3</strong>: Parcialmente de Acuerdo</font></td>
                                    <td width="12%"><font size="1"><strong>4</strong>: De acuerdo</font></td>
                                    <td width="20%"><font size="1"><strong>5</strong>: Totalmente de Acuerdo </font></td>
                                </tr>
                            </table>
                            
                            <form name="formenc" method="post" action="GuardEncuesta"> 
                                <input type="hidden" name="prof" value="<%=datgr.elementAt(2)%>">
                                <input type="hidden" name="asig" value="<%=datgr.elementAt(0)%>">
                                <input type="hidden" name="ngrp" value="<%=datgr.elementAt(1)%>">
                                <input type="hidden" name="idgrp" value="<%=datgr.elementAt(5)%>">
                                <table border="1" width="100%" class="tabla">
                                    <tr> 
                                        <td width="4%" align="center"><b><font color="#91091D">Nro</font></b></td>
                                        <td width="55%" align="center"> 
                                            <p align="center"><b><font color="#91091D">Información del Profesor</font></b></p>
                                        </td>
                                        <td width="4%" align="center"><b><font color="#91091D">1</font></b></td>
                                        <td width="4%" align="center"><b><font color="#91091D">2</font></b></td>
                                        <td width="4%" align="center"><b><font color="#91091D">3</font></b></td>
                                        <td width="4%" align="center"><b><font color="#91091D">4</font></b></td>
                                        <td width="4%" align="center"><b><font color="#91091D">5</font></b></td>
                                    </tr>
                                    <tr> 
                                        <td width="4%">1</td>
                                        
                                        <td width="55%">Presenta y entrega a sus estudiantes las reglas 
                                        del juego para el desarrollo de la asignatura.</td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="1" name="R1">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="2" name="R1">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="3" name="R1">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="4" name="R1">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="5" name="R1">
                                            </p>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td width="4%">2</td>
                                        <td width="55%">Hace expl&iacute;cita la importancia de la asignatura 
                                        dentro del programa de formaci&oacute;n.</td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="1" name="R2">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="2" name="R2">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="3" name="R2">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="4" name="R2">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="5" name="R2">
                                            </p>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td width="4%">3</td>
                                        
                                        <td width="55%"> Asiste a las clases programadas.</td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="1" name="R3">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="2" name="R3">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="3" name="R3">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="4" name="R3">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="5" name="R3">
                                            </p>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td width="4%">4</td>
                                        
                                        <td width="55%">Demuestra un buen conocimiento de la asignatura.</td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="1" name="R4">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="2" name="R4">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="3" name="R4">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="4" name="R4">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="5" name="R4">
                                            </p>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td width="4%">5</td>
                                        
                                        <td width="55%">Fomenta el uso de nuevas tecnolog&iacute;as para 
                                        el aprendizaje.</td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="1" name="R5">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="2" name="R5">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="3" name="R5">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="4" name="R5">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="5" name="R5">
                                            </p>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td width="4%">6</td>
                                        
                                        <td width="55%">Es claro en la exposici&oacute;n.</td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="1" name="R6">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="2" name="R6">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="3" name="R6">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="4" name="R6">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="5" name="R6">
                                            </p>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td width="4%">7</td>
                                        
                                        <td width="55%"> Se interesa en que sus estudiantes aprendan.</td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="1" name="R7">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="2" name="R7">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="3" name="R7">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="4" name="R7">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="5" name="R7">
                                            </p>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td width="4%">8</td>
                                        <td width="55%"> Desarrolla los ex&aacute;menes con extensi&oacute;n 
                                        y dificultad apropiadas.</td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="1" name="R8">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="2" name="R8">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="3" name="R8">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="4" name="R8">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="5" name="R8">
                                            </p>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td width="4%">9</td>
                                        
                                        <td width="55%"> Explica los resultados de las evaluaciones y realiza 
                                        la retroalimentaci&oacute;n oportunamente.</td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="1" name="R9">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="2" name="R9">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="3" name="R9">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="4" name="R9">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="5" name="R9">
                                            </p>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td width="4%">10</td>
                                        <td width="55%"> Es sensible a las dificultades de los estudiantes 
                                            y est&aacute; dispuesto a ayudar. 
                                            <p></p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="1" name="R10">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="2" name="R10">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="3" name="R10">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="4" name="R10">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="5" name="R10">
                                            </p>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td width="4%">&nbsp;</td>
                                        <td width="55%"> 
                                            <p align="center"><b><font color="#91091D">Información del Estudiante</font></b> 
                                        </td>
                                        <td width="4%" align="center"><b><font color="#91091D">1</font></b></td>
                                        <td width="4%" align="center"><b><font color="#91091D">2</font></b></td>
                                        <td width="4%" align="center"><b><font color="#91091D">3</font></b></td>
                                        <td width="4%" align="center"><b><font color="#91091D">4</font></b></td>
                                        <td width="4%" align="center"><b><font color="#91091D">5</font></b></td>
                                    </tr>
                                    <tr> 
                                        <td width="4%">11</td>
                                        
                                        <td width="55%">Trabaja en promedio dos horas adicionales por cada 
                                        hora programada de clase.</td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="1" name="R11">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="2" name="R11">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="3" name="R11">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="4" name="R11">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="5" name="R11">
                                            </p>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td width="4%">12</td>
                                        <td width="55%">Se interesa en aprender y complementar por s&iacute; 
                                        mismo lo aprendido en clase.</td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="1" name="R12">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="2" name="R12">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="3" name="R12">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="4" name="R12">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="5" name="R12">
                                            </p>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td width="4%">13</td>
                                        
                                        <td width="55%">Participa activamente en clase.</td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="1" name="R13">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="2" name="R13">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="3" name="R13">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="4" name="R13">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="5" name="R13">
                                            </p>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td width="4%">14</td>
                                        
                                        <td width="55%">Pide explicaciones cuando las instrucciones o la 
                                        presentaci&oacute;n de un tema no son claros.</td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="1" name="R14">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="2" name="R14">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="3" name="R14">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="4" name="R14">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="5" name="R14">
                                            </p>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td width="4%">15</td>
                                        
                                        <td width="55%">Utiliza las evaluaciones para mejorar su propio 
                                        aprendizaje.</td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="1" name="R15">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="2" name="R15">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="3" name="R15">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="4" name="R15">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="5" name="R15">
                                            </p>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td width="4%">16</td>
                                        <td width="55%"> Act&uacute;a diariamente bajo los principios de 
                                        la &eacute;tica, la honradez, la transparencia y la honestidad.</td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="1" name="R16">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="2" name="R16">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="3" name="R16">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="4" name="R16">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="5" name="R16">
                                            </p>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td width="4%">17</td>
                                        
                                        <td width="55%">Ha alcanzado un buen conocimiento de la asignatura.</td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="1" name="R17">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="2" name="R17">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="3" name="R17">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="4" name="R17">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="5" name="R17">
                                            </p>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td width="4%">&nbsp;</td>
                                        <td width="55%"> 
                                            <p align="center"><b><font color="#91091D">Información de la asignatura</font></b> 
                                        </td>
                                        <td width="4%" align="center"><b><font color="#91091D">1</font></b></td>
                                        <td width="4%" align="center"><b><font color="#91091D">2</font></b></td>
                                        <td width="4%" align="center"><b><font color="#91091D">3</font></b></td>
                                        <td width="4%" align="center"><b><font color="#91091D">4</font></b></td>
                                        <td width="4%" align="center"><b><font color="#91091D">5</font></b></td>
                                    </tr>
                                    <tr> 
                                        <td width="4%">18</td>
                                        
                                        <td width="55%">Las asignaturas requeridas para tomar &eacute;sta 
                                        son pertinentes y adecuadas.</td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="1" name="R18">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="2" name="R18">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="3" name="R18">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="4" name="R18">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="5" name="R18">
                                            </p>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td width="4%">19</td>
                                        
                                        <td width="55%">El tiempo que demanda la asignatura corresponde 
                                        a los cr&eacute;ditos acad&eacute;micos de la misma.</td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="1" name="R19">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="2" name="R19">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="3" name="R19">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="4" name="R19">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="5" name="R19">
                                            </p>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td width="4%">20</td>
                                        
                                        <td width="55%"> El contenido de la asignatura es importante para 
                                        su formaci&oacute;n.</td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="1" name="R20">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="2" name="R20">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="3" name="R20">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="4" name="R20">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="5" name="R20">
                                            </p>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td width="4%">21</td>
                                        
                                        <td width="55%">Las actividades desarrolladas (ejercicios, talleres, 
                                            proyectos, visitas, etc.) contribuyen al buen desempe&ntilde;o 
                                            del estudiante en la asignatura, y facilitan el seguimiento de 
                                        su propio aprendizaje.</td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="1" name="R21">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="2" name="R21">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="3" name="R21">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="4" name="R21">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="5" name="R21">
                                            </p>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td width="4%">22</td>
                                        <td width="55%"> Los siguientes recursos son adecuados para el desarrollo 
                                        de la asignatura:</td>
                                        <td width="4%"> 
                                            <p align="center">&nbsp; </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center">&nbsp; </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center">&nbsp; </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center">&nbsp; </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center">&nbsp; </p>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td width="4%">a</td>
                                        <td width="55%"> Biblioteca</td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="1" name="R22">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="2" name="R22">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="3" name="R22">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="4" name="R22">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="5" name="R22">
                                            </p>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td width="4%">b</td>
                                        <td width="55%">Recursos inform&aacute;ticos</td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="1" name="R23">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="2" name="R23">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="3" name="R23">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="4" name="R23">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="5" name="R23">
                                            </p>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td width="4%">c</td>
                                        <td width="55%"> 
                                            <p align="left">Aulas</p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="1" name="R24">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="2" name="R24">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="3" name="R24">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="4" name="R24">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="5" name="R24">
                                            </p>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td width="4%">d</td>
                                        <td width="55%">Laboratorios</td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="1" name="R25">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="2" name="R25">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="3" name="R25">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="4" name="R25">
                                            </p>
                                        </td>
                                        <td width="4%"> 
                                            <p align="center"> 
                                                <input type="radio" value="5" name="R25">
                                            </p>
                                        </td>
                                    </tr>
                                </table>               
                                <div align="center"> 
                                  <p><br>
                                      Observación<br>
                                      
              <textarea name="obser" cols="100" rows="3"></textarea> 
                                  </p>
                                  <p><br>
                                      <input type="submit" name="Submit" value=" Aceptar Encuesta " size="2" 
                                           onclick="return validaresp()" class="boton">
                                      </p>
                                </div>
                            </form>
                            <% } else {  %>
                            <div align="center" class="textocom"> Usted ya Registro encuesta para este Grupo</div>
                            <% }  %>
                        </fieldset>
                    </td>
                </tr>
            </table>
        </div><!--container-->
           <footer style="position: static">
    <div class="container">
        <div class="row">
            <div class="col-8 oferta-academica">
                <ul>
                <h6>Oferta Educativa</h6>  
                   <li>Carreras profesionales</li>
                   <li>Especializaciones</li>
                   <li>Maestrías</li>
                   <li>Doctorado</li>
                   <li>Educación Continuada</li>
                   <li>Escuela Internacional de Verano</li> 
               </ul>
                
            </div>
            <div class="col localizacion-redes">
                <ul> 
                    <li><img width="60%" height="60%" src="img/Navegacion/acreditacion.png" class="img-fluid" alt="acreditación institucional"></li><br>
                   <li>
                     <div class="row">
                         <div class="col-1 mr-2">
                            <img src="img/Navegacion/icono-localizacion.png" alt="localizacion">
                        </div>
                         <div class="col ml-1">
                             <p>AK. 45 n.º 205 - 59 (Autopista Norte)
                             <br>PBX: +57 (1) 668 3600 - Bogotá
                             <br>Línea nacional gratuita: 018000112668</p>
                         </div>
                     </div>
                   </li>
                   <li>
                       <ul class="list-inline">
                           <li class="list-inline-item"><a href="https://www.facebook.com/EscuelaIng/" target="_blank"><img src="img/Navegacion/icono-facebook.png" class="img-fluid" alt="facebook"></a></li>
                           <li class="list-inline-item"><a href="https://twitter.com/Escuelaing" target="_blank"><img src="img/Navegacion/icono-twitter.png" class="img-fluid" alt="twitter"></a></li>
                           <li class="list-inline-item"><a href="https://www.linkedin.com/school/escuela-colombiana-de-ingenieria/" target="_blank"><img src="img/Navegacion/icono-linkedin.png" class="img-fluid" alt="linkedin"></a></li>
                           <li class="list-inline-item"><a href="https://www.instagram.com/somoscivilescuelaing/" target="_blank"><img src="img/Navegacion/icono-instagram.png" class="img-fluid" alt="instagram"></a></li>
                           <li class="list-inline-item"><a href="https://www.youtube.com/user/escuelacolingenieria" target="_blank"><img src="img/Navegacion/icono-youtube.png" class="img-fluid" alt="youtube"></a></li>
                       </ul>
                   </li>
               </ul>
            </div>
            <div class="col-12 derechos-reservados">
                <p>
                    Todos los derechos reservados ©2011 - Escuela Colombiana de Ingeniería Julio Garavito. Personería Jurídica 086 de enero 19 de 1973. Renovación de Acreditación Institucional de Alta Calidad. Resolución 002710 del 18 de marzo de 2019 (vigencia de 6 años). Vigilada por Mineducación.
                </p>
            </div>
        </div>
    </div>
</footer>
    </body>
    
</html>
</html>
