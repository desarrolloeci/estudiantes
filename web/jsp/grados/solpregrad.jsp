<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.Estudiante.EstudMisc" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%
    response.setHeader("Cache-Control", "no-cache");
    String nombre = new String((String) session.getAttribute("nombre"));
    String igrad = new String((String) session.getAttribute("igrad"));
    String iddpto = new String((String) session.getAttribute("iddpto"));
    String ceremonia = new String((String) session.getAttribute("ceremonia"));
    PrintWriter oout = response.getWriter();
    Estudiante est = (Estudiante) session.getAttribute("estClase");

    int estado, i;
    estado = Integer.parseInt(est.getEstado());
    if (!igrad.equals("C") && !igrad.equals("O")) {
        if (estado > 0) {
            response.sendRedirect("menuServEstud");
        } else {
            response.sendRedirect("menuServEstud1");
        }
    } else {
        Vector solicitud = est.getSolPreGrad(carnet);
        Vector tmp;
        String trabajoact, padreact, madreact;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        Vector exper = bdEst.getSolPreGradExper(carnet);
        Vector respm = bdEst.getSolPreGradMadre(carnet);
        Vector respp = bdEst.getSolPreGradPadre(carnet);
        bdEst.desconectar();
        if (exper.size() == 0) {
            for (i = 0; i < 5; i++) {
                exper.addElement("");
            }

        } else {
            exper = (Vector) exper.elementAt(0);
            //trabajoact = exper.elementAt(0).toString();
        }
        if (respm.size() == 0) {
            for (i = 0; i < 15; i++) {
                respm.addElement("");
            }
            madreact = "0";
        } else {
            respm = (Vector) respm.elementAt(0);
            madreact = respm.elementAt(0).toString();
        }
        if (respp.size() == 0) {
            for (i = 0; i < 15; i++) {
                respp.addElement("");
            }
            padreact = "0";
        } else {
            respp = (Vector) respp.elementAt(0);
            padreact = respp.elementAt(0).toString();
        }
        Vector despinfopar = new Vector();
        Vector infoEst = est.getDatosEst(carnet);
        Vector datosestud = (Vector) infoEst.elementAt(0);
        Vector datospar = est.getParProg(iddpto);
        Vector paregre = est.getParGraduado(carnet);
        Vector profesiones = est.getProfesiones();
        String sel = "";
        String sel1 = "";
        Vector infoPar = est.getParTramGrad("4");
        if (paregre.size() > 0) {
            if (((Vector) paregre.elementAt(0)).elementAt(1).equals("0")) {
                sel1 = "checked";
            } else {
                sel = "checked";
            }
        }
        for (i = 0; i < infoPar.size(); i++) {
            despinfopar.addElement((String) ((Vector) infoPar.elementAt(i)).elementAt(0));
        }
        EstudMisc estmisc = new EstudMisc();
        Vector dptos = estmisc.getDepartamentos();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios Académicos - Solicitud</title>

        <!-- JavaScript -->
        <script type="text/javascript" src="scripts/wufoo.js"></script>

        <!-- CSS -->
          <link rel="stylesheet" type="text/css" href="Navegacion/css/estilo-escuela.css">
<link rel="stylesheet" href="Navegacion/css/bootstrap.min.css">
        <script language="javascript" src="js/cal22.js">
            /*
            Xin's Popup calendar script-  Xin Yang (http://www.yxscripts.com/)
            Script featured on/available at http://www.dynamicdrive.com/
            This notice must stay intact for use
            */
        </script>
        <script language="javascript" src="js/cal_conf2.js"></script>
        <script language="JavaScript" type="text/JavaScript">
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
            if(document.getElementById("doc_est").value == "" || document.getElementById("exp_diploma").value == ""){
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

            //if(document.getElementById("nro_libr").value != "" && document.getElementById("fecha").value == ""){
            //  alert("Ingrese la fecha de expedición de su libreta militar");
            //return false;
            // }

            document.getElementById("form1").submit();
            return true;
            }
            //-->
        </script>
    </head>
  <body id="public" style="background-color: white">
        <div id="container">
            <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
                <tr>
                    <td colspan="2" bgcolor="#EEEEEE"><img src="img/top.gif" alt="" width="770" height="10" id="top" /></td>
                </tr>
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
                                <label id="msj">Solicitud preliminar</label>
                                </font></h2>
                        </div></td>
                </tr>
                <tr>
                    <td>
                        <fieldset><legend>Solicitud preliminar de grado</legend>
                            <form name="form1" id="form1" method="post" action="GuardarSolGrad">
                                <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
                                    <tr>
                                        <td width="15%" height="134"><img src="img/logo.gif" width="83" height="90"></td>
                                        <td width="65%"><div align="left"><strong>ESCUELA COLOMBIANA
                                                    DE INGENIER&Iacute;A &quot;JULIO GARAVITO&quot;<br>
                                                    SOLICITUD PRELIMINAR DE GRADO</strong><br>
                                                CEREMONIA DE ENTREGA DE DIPLOMAS:  <strong><!%=ceremonia%></strong></div>
                                        </td>
                                        <td width="20%">&nbsp;</td>
                                    </tr>

                                    <tr>
                                        <td colspan="3"><p>PREGRADO O POSGRADO
                                                EN: <strong><%=datosestud.elementAt(1)%></strong></p>
                                            <%//despinfopar.elementAt(6)  el "2020" HAY QUE DEVOLVERLO EN 2020%>
                                            <p>PROMOCI&Oacute;N O PER&Iacute;ODO ACAD&Eacute;MICO: <strong> <%="2020"%></strong>  </p>
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tabla">
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
                                                            y Nombres completos, may&uacute;sculas, min&uacute;sculas
                                                            y tildes.
                                                            As&iacute; aparecer&aacute; en
                                                            su diploma </font></strong></td>
                                                </tr>
                                            </table>
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tabla">
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
                                                            <option value="C" <%if (solicitud.elementAt(7).equals("C")) {
                                                                    out.println("selected");
                                                                }%>>CC
                                                            <option value="T" <%if (solicitud.elementAt(7).equals("T")) {
                                                                    out.println("selected");
                                                                }%>>TI
                                                            <option value="R" <%if (solicitud.elementAt(7).equals("R")) {
                                                                    out.println("selected");
                                                                }%>>RC
                                                            <option value="P" <%if (solicitud.elementAt(7).equals("P")) {
                                                                    out.println("selected");
                                                                }%>>PS
                                                                 <option value="E" <%if (solicitud.elementAt(7).equals("E")) {
                                                                    out.println("selected");
                                                                }%>>CE
                                                        </select>
                                                    </td>
                                                    <td><input name="doc_est" type="text" id="doc_est" size="15" maxlength="15" value="<%=solicitud.elementAt(6)%>"></td>
                                                    <td>
                                                        <input name="exp_diploma" type="text" id="exp_diploma" size="20" maxlength="30" value="<%=solicitud.elementAt(17)%>">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4"><strong><font color="#990000">Como aparece
                                                            en su Documento de identidad y lugar de expedici&oacute;n</font></strong> </td>
                                                </tr>
                                                <!-- Para Hombres -->
                                                <% if (solicitud.elementAt(18).equals("M")) {%>

                                                <tr>
                                                    <td width="25%">Libreta
                                                        militar No:</td>
                                                    <td width="20%">DM:</td>
                                                    <td>Fecha de expedici&oacute;n: </td>
                                                </tr>
                                                <tr>
                                                    <td><input name="nro_libr" type="text" id="nro_libr" size="15" maxlength="15" value="<%=solicitud.elementAt(8)%>">
                                                    </td>
                                                    <td><input name="nro_distr" type="text" id="nro_distr" size="15" maxlength="5" value="<%=solicitud.elementAt(9)%>"></td>
                                                    <td><input type="text" name="fecha" id="fecha" size="14" maxlength="10"  onFocus="blur()" class="campotext" value="<%=solicitud.elementAt(10)%>"  readonly>
                                                        <small><a href="javascript:showCal('Calendar1')">
                                                                <img src="img/calendar.gif" width=16 height=16 border=0></a></small></td>
                                                </tr>
                                                <!-- Para Mujeres -->
                                                <% } else {%>
                                                <tr>
                                                    <td><input name="nro_libr" type="hidden" id="nro_libr" size="15" maxlength="15" value="">
                                                    </td>
                                                    <td><input name="nro_distr" type="hidden" id="nro_distr" size="15" maxlength="5" value="<%=solicitud.elementAt(9)%>"></td>
                                                    <td><input type="hidden" name="fecha" id="fecha" size="14" maxlength="10"  onFocus="blur()" class="campotext" value="<%=solicitud.elementAt(10)%>"  readonly>

                                                </tr>

                                                <% }%>

                                                <tr>
                                                    <td colspan="4"><hr></td>
                                                </tr>
                                            </table>
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tabla">
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
                                                        <select name="deptores" id="deptores" onChange="refreshModelList('2');">
                                                            <option value="null" selected>-- SELECCIONE --
                                                                <% for (i = 0; i < dptos.size(); i++) {
                                                                    Vector descdptos = (Vector) dptos.elementAt(i);%>
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
                                                    <td><input name="email_otro" type="text" id="email_otro" size="25" maxlength="40" value="<%=solicitud.elementAt(5)%>"></td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4"><hr></td>
                                                </tr>
                                            </table>
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tabla">
                                                <tr>
                                                    <td colspan="2">Entidad
                                                        donde trabaja:

                                                    <td colspan="2">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td width="9%">Nombre:&nbsp;&nbsp;</td>
                                                    <td width="30%"><input name="nom_entidad" type="text" id="nom_entidad" size="25" maxlength="50" value="<%=exper.elementAt(0)%>"></td>
                                                    <td width="7%">Cargo:&nbsp;&nbsp;
                                                    </td>
                                                    <td width="54%">
                                                        <input name="cargo" type="text" id="cargo" size="30" maxlength="50" value="<%=exper.elementAt(1)%>"></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Jefe inmediato&nbsp;&nbsp;                        </td>
                                                    <td><input name="nomjefe" type="text" id="nomjefe" size="25" maxlength="50" value="<%=exper.elementAt(2)%>">
                                                    </td>
                                                    <td>Telefono:&nbsp;&nbsp;</td>
                                                    <td><input name="telexper" type="text" id="telexper" size="30" maxlength="20" value="<%=exper.elementAt(3)%>"></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4"><hr></td>
                                                </tr>
                                            </table>

                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tabla">
                                                <tr>
                                                    <td colspan="2">Datos
                                                        de los padres:</td>
                                                    <td colspan="2">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td width="9%">Padre:&nbsp;</td>
                                                    <td width="30%"><input name="padreact" type="hidden" id="padreact" value="<%=padreact%>"></td>
                                                    <td width="7%">Madre:&nbsp;&nbsp;
                                                    </td>
                                                    <td width="54%"><input name="madreact" type="hidden" id="madreact" value="<%=madreact%>">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Nombre:&nbsp;&nbsp;                        </td>
                                                    <td><input name="nompadre" type="text" id="nompadre" size="25" maxlength="40" value="<%=respp.elementAt(3)%>">
                                                    </td>
                                                    <td>Nombre:</td>
                                                    <td><input name="nommadre" type="text" id="nommadre" size="30" maxlength="40" value="<%=respm.elementAt(3)%>"></td>
                                                </tr>
                                                <tr>
                                                    <td> Profesi&oacute;n:&nbsp;&nbsp; </td>
                                                    <td><select name="profpadre" id="profpadre">
                                                            <option value="0">Seleccione</option>
                                                            <%
                                                                String selprof = "";
                                                                Vector tmpprof;
                                                                for (int j = 0; j < profesiones.size(); j++) {
                                                                    selprof = "";
                                                                    tmpprof = (Vector) profesiones.elementAt(j);
                                                                    if (tmpprof.elementAt(0).equals(respp.elementAt(4))) {
                                                                        selprof = "selected";
                                                                    }
                                                                    out.println("<option value=\"" + tmpprof.elementAt(0) + "\"" + selprof + ">" + tmpprof.elementAt(1) + "</option>");
                                                                }
                                                            %>
                                                        </select>
                                                    </td>
                                                    <td>Profesi&oacute;n:</td>
                                                    <td><select name="profmadre" id="profmadre">
                                                            <option value="0">Seleccione</option>
                                                            <%
                                                                for (int j = 0; j < profesiones.size(); j++) {
                                                                    selprof = "";
                                                                    tmpprof = (Vector) profesiones.elementAt(j);
                                                                    if (tmpprof.elementAt(0).equals(respm.elementAt(4))) {
                                                                        selprof = "selected";
                                                                    }
                                                                    out.println("<option value=\"" + tmpprof.elementAt(0) + "\"" + selprof + ">" + tmpprof.elementAt(1) + "</option>");
                                                                }
                                                            %>
                                                        </select></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4"><hr>
                                                    </td>
                                                </tr>
                                                <!--
                                                    <tr>
                                                        <td width="9%">Esposo(a):&nbsp;</td>
                                                        <td width="30%"><input name="espact" type="hidden" id="espact" value="0"></td>
                                                        <td width="7%">&nbsp;
                                                        </td>
                                                        <td width="54%">&nbsp;                                                      </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        Nombre:&nbsp;&nbsp;                        </td>
                                                        <td><input name="nomcon" type="text" id="nomcon" size="25" maxlength="40" value="<%=solicitud.elementAt(13)%>">
                                                        </td>
                                                        <td>:</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td> Profesi&oacute;n:&nbsp;&nbsp; </td>
                                                        <td><select name="profcon" id="profcon">
                                                        <option value="0">Seleccione</option>
                                                <%
                                                    /*Vector tmpprof;
                                                     for(int j=0; j< profesiones.size(); j++){
                                                     tmpprof = (Vector)profesiones.elementAt(j);

                                                     }*/
                                                %>
                                        </select>
</td>
                                        <td>:</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><hr></td>
                                    </tr>
                                                -->
                                            </table>
                                            <p align="justify">NOTA: Si no puede asistir
                                                a la ceremonia de entrega de
                                                diplomas, por favor dar poder mediante
                                                documento escrito, a un familiar
                                                o a su acudiente para recibir el
                                                diploma, en la ceremonia de grado.
                                                Esta comunicaci&oacute;n debe dirigirla
                                                al Secretario General y entregarla
                                                en la Oficina de Coordinaci&oacute;n
                                                de Grados bloque A primer piso.
                                                De igual manera debe hacer llegar
                                                debidamente firmado el Juramento
                                                con una carta dirigida al Consejo
                                                Directivo donde informa que tiene
                                                conocimiento y lo va a cumplir. </p>
                                            <p align="justify">
                                                NOTA: PARA PRESENTAR SU SOLICITUD DE GRADO DEBE CUMPLIR
                                                CON LOS REQUISITOS EXIGIDOS POR EL REGLAMENTO ESTUDIANTIL
                                                Y LA LEY.</p>
                                            <p align="justify">Declaro que conozco el procedimiento
                                                de grado y las fechas establecidas
                                                y acepto que el incumplimiento
                                                de ellos conlleva
                                                mi exclusi&oacute;n de la Ceremonia
                                                de Grados Colectiva prevista
                                                para esta promoci&oacute;n. As&iacute; mismo,
                                                acepto en la<br>
                                                totalidad las calificaciones, que hasta la fecha est&aacute;n
                                                consignadas en mi registro acad&eacute;mico.</p>
                                            <p align="center">

                                                <input type="button" name="Submit" value="Guardar y continuar"  class="boton"  onclick="javascript: return validarform();">
                                            </p>
                                            <p><br>
                                            </p></td>
                                    </tr>
                                </table>
                            </form>       </fieldset>             </td>
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

<% }%>