<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.Estudiante.EstudMisc" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%  
response.setHeader("Cache-Control","no-cache");
String nombre = new String((String)session.getAttribute("nombre"));
String igrad =  new String((String)session.getAttribute("igrad"));
String iddpto =  new String((String)session.getAttribute("iddpto"));
String ceremonia =  new String((String)session.getAttribute("ceremonia"));
PrintWriter oout = response.getWriter() ;
Estudiante est = (Estudiante) session.getAttribute("estClase") ;
int estado, i;
estado = Integer.parseInt(est.getEstado());
if(!igrad.equals("C")){
    if(estado>0)
        response.sendRedirect("menuServEstud");
    else
        response.sendRedirect("menuServEstud1");
}else{
    Vector solicitud = est.getSolPreGrad(carnet);
    Vector despinfopar = new Vector();
    Vector infoEst = est.getDatosEst(carnet);
    Vector datosestud = (Vector)infoEst.elementAt(0) ;
    Vector datospar = est.getParProg(iddpto);
    Vector paregre = est.getParGraduado(carnet);
    String sel = "";
    String sel1 = "";
    Vector infoPar = est.getParTramGrad("4");
    if(paregre.size()>0){
        if(((Vector)paregre.elementAt(0)).elementAt(1).equals("0"))
            sel1 = "checked";
        else
            sel = "checked";
    }
    for(i=0 ; i < infoPar.size() ; i++)
        despinfopar.addElement((String)((Vector)infoPar.elementAt(i)).elementAt(0));
    EstudMisc estmisc = new EstudMisc();
    Vector dptos = estmisc.getDepartamentos();
%>
<html>
    <head>
        <title>Servicios Academicos - Ceremonia</title>
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
.texto1 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-style: normal;
	line-height: normal;
	font-weight: normal;
	font-variant: normal;
	text-transform: none;
	text-decoration: none;
	color: #666666;
}
a{color: blue;}
a:hover{color:#3366CC; }
            -->
        </style>
        <script language="javascript" src="js/cal22.js">
/*
Xin's Popup calendar script-  Xin Yang (http://www.yxscripts.com/)
Script featured on/available at http://www.dynamicdrive.com/
This notice must stay intact for use
*/
        </script>
        <script language="javascript" src="js/cal_conf2.js"></script>
        <script type="text/javascript">
            <!--
var xmlHttp;

function createXMLHttpRequest() {
    if (window.ActiveXObject) {
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    } 
    else if (window.XMLHttpRequest) {
        xmlHttp = new XMLHttpRequest();
    }
}
    
function refreshModelList(op) {
    if(op == '1'){
        var munexp = document.getElementById("munexp").value;
        var deptoln = document.getElementById("deptoln").value;
        if(deptoln == "null") {
            clearModelsList();
            return;
        }
        var url = "ServAjax?id_dpto=" + deptoln + "&func=solpregrad";
        createXMLHttpRequest();
        xmlHttp.onreadystatechange = handleStateChange;
        xmlHttp.open("POST", url, true);
        xmlHttp.send(null);
    }else if(op == '2'){
        var munres = document.getElementById("munres").value;
        var deptores = document.getElementById("deptores").value;
        if(deptores == "null") {
            clearModelsListRes();
            return;
        }
        var url = "ServAjax?id_dpto=" + deptores  + "&func=solpregrad";
        createXMLHttpRequest();
        xmlHttp.onreadystatechange = handleStateChangeRes;
        xmlHttp.open("POST", url, true);
        xmlHttp.send(null);
    }
}
    
function handleStateChange() {
    if(xmlHttp.readyState == 4) {
        if(xmlHttp.status == 200) {
            updateModelsList();
        }
    }
}

function handleStateChangeRes() {
    if(xmlHttp.readyState == 4) {
        if(xmlHttp.status == 200) {
            updateModelsListRes();
        }
    }
}

function updateModelsList() {
    clearModelsList();
    var munexp = document.getElementById("munexp");
    var results = xmlHttp.responseXML.getElementsByTagName("municipio");
    var resultsid = xmlHttp.responseXML.getElementsByTagName("idmunicipio");
    var option = null;
    if(munexp.disabled)
        munexp.disabled = false;
    for(var i = 0; i < results.length; i++) {
        option = document.createElement("option");
        option.value = resultsid[i].firstChild.nodeValue;
        option.appendChild(document.createTextNode(results[i].firstChild.nodeValue));
        munexp.appendChild(option);
    }
}

function updateModelsListRes() {
    clearModelsListRes();
    var munres = document.getElementById("munres");
    var results = xmlHttp.responseXML.getElementsByTagName("municipio");
    var resultsid = xmlHttp.responseXML.getElementsByTagName("idmunicipio");
    var option = null;
    if(munres.disabled)
        munres.disabled = false;
    for(var i = 0; i < results.length; i++) {
        option = document.createElement("option");
        option.value = resultsid[i].firstChild.nodeValue;
        option.appendChild(document.createTextNode(results[i].firstChild.nodeValue));
        munres.appendChild(option);
    }
}

function clearModelsList() {
    var munexp = document.getElementById("munexp");
    while(munexp.childNodes.length > 0) {
        munexp.removeChild(munexp.childNodes[0]);
    }
}

function clearModelsListRes() {
    var munres = document.getElementById("munres");
    while(munres.childNodes.length > 0) {
        munres.removeChild(munres.childNodes[0]);
    }
} 

function validarform(){
    if(document.getElementById("ape1").value == "" || document.getElementById("nombres").value == ""){
		alert("Ingrese su nombre tal y como aparece en su documento de identidad");
		return false;
	}
	if(document.getElementById("doc_est").value == "" || document.getElementById("munexp").value == "null"){
		alert("Ingrese la información completa de su documento de identidad");
		return false;
	}
	
	if(document.getElementById("munres").value == "null" || document.getElementById("ultdir").value == "" || document.getElementById("ulttel").value == ""){
		alert("Ingrese la información completa de su lugar de residencia");
		return false;
	}
	if(document.getElementById("email_otro").value == "" || document.getElementById("celular").value == "null"){
		alert("Ingrese la información de su email y número de celular");
		return false;
	}
	if(document.getElementById("nro_libr").value != "" && document.getElementById("fecha").value == ""){
		alert("Ingrese la fecha de expedición de su libreta militar");
		return false;
	}
	document.getElementById("form1").submit();
        return true;
}
-->
        </script>
    </head>
    <body bgcolor="#FFFFFF" text="#000000">
        <div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;"></div>
        <table width="640" border="0" cellpadding="0" align="center" cellspacing="0">
            <tr>     
                <td width="640" valign="top"> 
                <jsp:include page="encabezado" flush="true"/>
                <table width="100%" border="0" align="center" class="texto1">
                    <form name="form1" method="post" action="GuardarSolGrad">
                        <tr> 
                            <td valign="top">
                                <div align="left">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="texto1">
                                        <tr>
                                            <td width="15%" height="134"><img src="img/logo.gif" width="83" height="90"></td>
                                            <td width="65%"><div align="left"><strong>ESCUELA COLOMBIANA
                                                        DE INGENIER&Iacute;A &quot;JULIO GARAVITO&quot;<br>
                                                    SOLICITUD PRELIMINAR DE GRADO</strong><br>
                                                CEREMONIA:  <strong><%=ceremonia%></strong></div>
                                            </td>
                                            <td width="20%">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="3"><p>PREGRADO EN: <strong><%=datosestud.elementAt(1)%></strong></p>
                                                <p>PROMOCI&Oacute;N O PER&Iacute;ODO ACAD&Eacute;MICO:<strong> <%=despinfopar.elementAt(5)%></strong></p>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="texto1">
                                                    <tr>
                                                        <td colspan="2">NOMBRE COMPLETO GRADUANDO: </td>
                                                        <td width="30%">&nbsp;</td>
                                                        <td width="20%">C&Oacute;DIGO No.</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="25%"><input name="ape1" type="text" id="ape1" size="20" maxlength="20" value="<%=solicitud.elementAt(2)%>">
                                                        </td>
                                                        <td width="25%"><input name="ape2" type="text" id="ape2" size="20" maxlength="20" value="<%=solicitud.elementAt(3)%>"></td>
                                                        <td><input name="nombres" type="text" id="nombres" size="24" maxlength="40" value="<%=solicitud.elementAt(1)%>"></td>
                                                        <td><%=carnet%></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Primer Apellido</td>
                                                        <td>Segundo Apellido</td>
                                                        <td>Nombres</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4"><strong><font color="#990000">Apellidos
                                                              y Nombres (COMPLETOS
                                                              igual al de la
                                                              c&eacute;dula,
                                                                    May&uacute;sculas
                                                                    y min&uacute;sculas
                                                                    y tildes).
                                                                    As&iacute; aparecer&aacute; en
                                                        su diploma </font></strong></td>
                                                    </tr>
                                                </table>                    
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="texto1">
                                                    <tr>
                                                        <td colspan="3"><hr></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">Documento de Identidad:</td>
                                                        <td width="64%">&nbsp;</td>
                                                    </tr><tr>
                                                        <td width="21%">Tipo:</td>
                                                        <td width="15%">N&uacute;mero</td>
                                                        <td>Expedida en: </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <select name="tip_doc" id="tip_doc">
                                                                <option value="C" <%if(solicitud.elementAt(7).equals("C"))out.println("selected");%>>CC
                                                                <option value="T" <%if(solicitud.elementAt(7).equals("T"))out.println("selected");%>>TI
                                                                <option value="R" <%if(solicitud.elementAt(7).equals("R"))out.println("selected");%>>RC
                                                                <option value="P" <%if(solicitud.elementAt(7).equals("P"))out.println("selected");%>>PS
                                                            </select>
                                                        </td>
                                                        <td><input name="doc_est" type="text" id="doc_est" size="15" maxlength="15" value="<%=solicitud.elementAt(6)%>"></td>
                                                        <td><select name="deptoln" id="deptoln" onchange="refreshModelList('1');">
                                                            <option value="null" selected>-- SELECCIONE --
                                                                <% for(i=0;i<dptos.size();i++){
        Vector descdptos = (Vector)dptos.elementAt(i);%>
                                                          <option value="<%=descdptos.elementAt(0).toString().trim()%>"><%=descdptos.elementAt(1)%>
                                                                <% }%>
                                                          </select>
                                                            
                                                            <select name="munexp" id="munexp" disabled>
                                                                <option value="null" selected>-- NINGUNO --
                                                          </select></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4"><strong><font color="#990000">Como aparece
                                                        en su Documento de identidad y lugar de expedici&oacute;n</font></strong> </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="21%">Libreta
                                                          militar No:</td>
                                                        <td width="15%">DM:</td>
                                                        <td>Fecha de expedici&oacute;n: </td>
                                                    </tr>
                                                    <tr>
                                                        <td><input name="nro_libr" type="text" id="nro_libr" size="15" maxlength="15" value="<%=solicitud.elementAt(8)%>">
                                                        </td>
                                                        <td><input name="nro_distr" type="text" id="nro_distr" size="15" maxlength="5" value="<%=solicitud.elementAt(9)%>"></td>
                                                        <td><input type="text" name="fecha" size="14" maxlength="10"  onFocus="blur()" class="campotext" value="<%=solicitud.elementAt(10)%>"  readonly>
                                                                <small><a href="javascript:showCal('Calendar1')"> 
                                                        <img src="img/calendar.gif" width=16 height=16 border=0></a></small></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4"><hr></td>
                                                    </tr>
                                                </table>                    
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="texto1">
                                                    <tr>
                                                        <td colspan="2">Residencia:</td>
                                                        <td colspan="2">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="9%">Direcci&oacute;n:&nbsp;&nbsp;</td>
                                                        <td width="30%"><input name="ultdir" type="text" id="ultdir" size="25" maxlength="50" value="<%=solicitud.elementAt(12)%>"></td>
                                                        <td width="7%">Ciudad:&nbsp;&nbsp; 
                                                        </td>
                                                        <td width="54%">
                                                            <select name="deptores" id="deptores" onchange="refreshModelList('2');">
                                                            <option value="null" selected>-- SELECCIONE --
                                                                <% for(i=0;i<dptos.size();i++){
        Vector descdptos = (Vector)dptos.elementAt(i);%>
                                                          <option value="<%=descdptos.elementAt(0).toString().trim()%>"><%=descdptos.elementAt(1)%>
                                                                <% }%>
                                                          </select>
                                                            
                                                            <select name="munres" id="munres" disabled>
                                                                <option value="null" selected>-- NINGUNO --
                                                          </select></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        Tel&eacute;fono:&nbsp;&nbsp;                        </td>
                                                        <td><input name="ulttel" type="text" id="ulttel" size="25" maxlength="12" value="<%=solicitud.elementAt(13)%>">
                                                        </td>
                                                        <td>Celular:&nbsp;&nbsp;</td>
                                                        <td><input name="celular" type="text" id="celular" size="30" maxlength="15" value="<%=solicitud.elementAt(4)%>"></td>
                                                    </tr>
                                                    <tr>
                                                        <td>email:</td>
                                                        <td><input name="email_otro" type="text" id="email_otro" size="25" maxlength="50" value="<%=solicitud.elementAt(5)%>"></td>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                </table>                    <p>NOTA: Si no puede asistir
                                                    a la ceremonia de entrega de diplomas, debe dar poder mediante
                                                    documento escrito, a un familiar o a su acudiente para
                                                    recibir el diploma. Esta comunicaci&oacute;n debe dirigirla
                                                    al Secretario General y entregarla en la Oficina de Coordinaci&oacute;n
                                                de Grados bloque A tercer piso.</p>
                                                <p>
                                                    NOTA: PARA PRESENTAR SU SOLICITUD DE GRADO DEBE CUMPLIR
                                                    CON LOS REQUISITOS EXIGIDOS EN LOS ART&Iacute;CULOS 105
                                                Y 106 DEL REGLAMENTO ESTUDIANTIL</p>
                                                <p>Declaro que conozco el procedimiento de grado y las fechas
                                                    establecidas y acepto que el incumplimiento de ellos conlleva
                                                    mi exclusi&oacute;n de la Ceremonia de Grados Colectiva
                                                    prevista para esta promoci&oacute;n. As&iacute; mismo,
                                                    acepto en su<br>
                                                    totalidad las calificaciones, que hasta la fecha est&aacute;n
                                                consignadas en mi registro acad&eacute;mico.</p>
                                                <p align="center">
                                                  <input type="button" name="Submit" value="Guardar y continuar"  class="boton"  onclick="javascript: return validarform();">
                                                </p>
                                                <p><br>
                                            </p></td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </form>
                    <tr> 
                        <td valign="top" height="12"> 
                            <table width="45%" border="0" align="right">
                                <tr> 
                                    <td width="27%" height="12"> 
                                        <div align="center"> 
                                            <font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                                            <a href="TramiteGrado">ANTERIOR</a> </font></b></font> 
                                        </div>
                                    </td>
                                    <td width="4%" height="12" align="center" valign="middle"> 
                                        <div align="center">|</div>
                                    </td>
                                    <td width="22%" height="12"> 
                                        <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                                        <a href="menuServEstud">INICIO</a></font></b></font></div>
                                    </td>
                                    <td width="4%" height="12" align="center" valign="middle"> 
                                        <div align="center">|</div>
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
<% }%>