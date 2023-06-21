<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdAsignatura" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%
        Vector prei = new Vector();
        Vector lisAsig = new Vector(), asig = new Vector();
        configECI cfgEci = new configECI();
        response.setHeader("Cache-Control", "no-cache");
        String nombre = new String((String) session.getAttribute("nombre"));
        String estado = new String((String) session.getAttribute("estado"));
        String tipest = new String((String) session.getAttribute("tip_est"));
        String nomas, oper, cred;
        String prog = new String();
        PrintWriter oout = response.getWriter();
        BdAsignatura bdAsig = new BdAsignatura();
        bdAsig.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        Estudiante est = new Estudiante(carnet, oout);
        Vector lispre = est.getPreintermedio(carnet);
        int i, j, carga = 0, crmax = 0, asigmax = 0;

        int val = 0;
        Vector dat = est.getExamIngles();
        if (dat.size() <= 0) {
            val = -3;
        } else {
            Vector ding = (Vector) dat.elementAt(0);
            int perming = Integer.parseInt(ding.elementAt(2).toString());
            carga = Integer.parseInt(ding.elementAt(4).toString());
            crmax = carga % 10;
            asigmax = carga / 10;
            if ((Integer.parseInt(ding.elementAt(0).toString()) < 6 && Integer.parseInt(ding.elementAt(1).toString()) < 0) ||
                    (Integer.parseInt(ding.elementAt(0).toString()) < 5 && Integer.parseInt(ding.elementAt(1).toString()) > 0) ||
                    (Integer.parseInt(ding.elementAt(3).toString()) < 255)) {
                perming = 1;
            }
            if (perming < 1) {
                val = -2;
            } else if ((Integer.parseInt(estado) > 0) && (tipest.equals("A"))) {
                val = 1;
            } else {
                if (Integer.parseInt(estado) <= 0 && tipest.equals("A")) {
                    val = 0;
                } else {
                    val = 1;
                }
            }
        }
        /*  if (!tipest.equals("E")) {
        val = -3 ;
        } */

        lisAsig = bdAsig.ConsultaAsigInter(carnet, String.valueOf(crmax));
        if (lisAsig.size() == 0) {
            lisAsig = bdAsig.ConsultaAsigInter();
        }
%>

<html>
<head>
    <title>Preinscripción Periodo Intersemestral</title>
    <%
        out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
        out.println("<!-- ");
        out.println("function openPop(pagename){");
        out.println("window.open(pagename,'','top=30, left = 10,toolbar=no,scrollbars=yes,directories=no,status=no,menubar=yes,resizable=yes,height=400,width=620')} ");
        out.println("//-->");
        out.println("</SCRIPT>");
    %>
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
        .texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}
        a{color: blue;}
        a:hover{color:#3366CC; }
        -->
    </style>
</head>
<body bgcolor="#FFFFFF" text="#000000">
<table width="640" border="0" cellpadding="0" align="center" cellspacing="0">
<tr> 
<td width="640" height="42"> 
<jsp:include page="encabezado" flush="true"/>        
<table width="100%" border="0" align="center">
<tr> 
    <td height="6" >
        <div> <br>
            <div align="center">
                <p><font color="#666666">
                </font></p>
                <p><font color="#666666"><b><font size="2" face="Verdana, Arial, Helvetica, sans-serif">
                                EL CRITERIO DE ASIGNACION DE CUPOS ESTA
                SUJETO A LAS POLITICAS DE LA DECANATURA</font>&nbsp;</b></font></p>
            </div>
        </div>
    </td>
</tr>
<%if (val == 1) { //Valida para estudiantes Periodo Intermedio %>
<tr> 
<td align="center" valign="top" colspan="2">
<fieldset> 
<legend><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif"><b>Preinscripci&oacute;n
Periodo Intermedio</u></b></font></legend>	     
<form method="POST" action="procpreintermedio">
    <table width="100%" border="1" bordercolor="#336699">
        <tr bgcolor="#336699">
            <td width="15%">
                <div align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Créditos</font></b></div>
            </td>
            <td width="65%">
                <p align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Asignatura</font></b>
            </td>
            <td width="20%">
                <p align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Operación</font></b>
            </td>
        </tr>
        <%
    for (i = 0; i < lispre.size(); i++) {
        prei = (Vector) lispre.elementAt(i);
        nomas = "as" + i;
        oper = "op" + i;
        cred = "cred" + i;
        %>
        <tr>
            <td>
                <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1">
                <%=(String) prei.elementAt(2)%></font> </div>
            </td>
            <td>
                <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1">
                        <input type="hidden" name="<%=nomas%>" size="5" value="<%=(String) prei.elementAt(0)%>">
                        <input type="hidden" name="<%=cred%>" size="5" value="<%=(String) prei.elementAt(2)%>">
                <%=(String) prei.elementAt(1)%></font> </div>
            </td>
            <td>
                <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1">
                    <select size="1" name="<%=oper%>">
                        <option value="0" checked>Mantener</option>
                        <option value="1" checked>Eliminar</option>
                    </select>
                </font>
            </td>
        </tr>
        <%
    }
    if (i < 2) {
        %>
        <tr>
            <td>
                <input type="hidden" name="nasig" size="2" value="<%=i%>">
                <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1">
                Seleccione la Asignatura</font> </div>
            </td>
            <td>
                <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1">
                        <select size="1" name="asf1">
                            <option value="0">Seleccione Asignatura</option>
                            <%  for (j = 0; j < lisAsig.size(); j++) {
                asig = (Vector) lisAsig.elementAt(j);
                            %>
                            <option value="<%=(String) asig.elementAt(0)%>"><%=(String) asig.elementAt(1)%></option>
                            <%   }%>
                        </select>
                </font> </div>
            </td>
            <td>
                <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1">
                        <select size="1" name="opf1">
                            <option value="0" checked>No Preinscribir</option>
                            <option value="1">Preinscribir</option>
                        </select>
                        <input type="hidden" name="cref1" size="5" value="1">
                        <input type="hidden" name="cupf1" size="5" value="<%=(String) asig.elementAt(3)%>">
                </font> </div>
            </td>
        </tr>
        <%   } else {
        %>
        <tr>
            <td>
                <input type="hidden" name="nasig" size="2" value="<%=i%>">
            </td>
        </tr>
        <%   }
        %>
    </table>
    <input type="hidden" name="crmax" size="5" value="<%=crmax%>">
    <input type="hidden" name="amax" size="5" value="<%=asigmax%>">
    <input type="hidden" name="ncampos" size="2" value="<%=i%>">
    <br>
    <input type="submit" value="Enviar Preinscripción" name="B1" class="boton">
</form>
<font face="Verdana, Arial, Helvetica, sans-serif" size="2"> </font>
</fieldset>
<a href="JavaScript:openPop('horAsig')"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2">Consulta de Cupos 
de Asignaturas </font></a> <br>
<font face="Verdana, Arial, Helvetica, sans-serif" size="2">Solo
    preinscriba las asignaturas teóricas. Máximo <%=crmax%> créditos y <%=asigmax%> asignaturas.<br>
    Tenga en cuenta que la prioridad de las asignaturas, para su registro, se tomará según
    el orden en que Usted realice la preinscripción y estará sujeta a aprobación
del decano.</font></td>
</tr>
<%}//if de var=1 
else if (val == -2) {%>
<tr> 
    <td height="6" > <p><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><br>
                Para preinscribir asignaturas para periodo intersemestral, debe
        haber presentado y aprobado el Exámen Diagnóstico de Inglés.</font></p><br>
</td></tr>          
<%} else {%>
<tr> 
    <td height="6" > <p><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><br>
                Para preinscribir una asignatura para periodo intermedio, debió primero realizar
                la solicitud de Reintegro o Reingreso.
        </font></p><br>
</td></tr>          
<%}%>
<tr> 
    <td valign="top" colspan="2">
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
        </div>
    </td>
</tr>
<tr>
    <td height="5" colspan="3"><img src="img/bararhoriz.gif" width="640" height="5"></td>
</tr>
</table>
</td>
</tr>
</table>
