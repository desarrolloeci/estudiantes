<%-- 
    Document   : InscripcionPI
    Created on : 9/05/2012, 10:31:58 AM
    Author     : lrodriguez
--%>
<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>

<%
    response.setHeader("Cache-Control", "no-cache");
    String nombre = new String((String) session.getAttribute("nombre"));
    String ban = new String((String) session.getAttribute("ban"));
    PrintWriter oout = response.getWriter();
    configECI cfgEci = new configECI();
    //  String periodo = cfgEci.getPeriodoHor();
        /*REVISAR QUE LEA PI*/
    Estudiante est = (Estudiante) session.getAttribute("estClase");

    //validar si ya contesto todas las encuestas académicas sino enviarlo a la encuesta.
    Vector CuantosEnc = est.AsignaEncuestaA(carnet);
    Vector cuantos = new Vector();
    cuantos = (Vector) CuantosEnc.elementAt(0);
    int total;
    //validar si ya contesto todas las encuestas académicas sino enviarlo a la encuesta.
    total = (Integer.parseInt((String) cuantos.elementAt(0)));  //cuantos debe contestar en la encuesta academica

    Vector contesto = est.ContestaEncuestaA(carnet);
    Vector valorcontesto = new Vector();
    valorcontesto = (Vector) contesto.elementAt(0);
    int totalcontesto;
    totalcontesto = (Integer.parseInt((String) valorcontesto.elementAt(0))); //cuantas asignaturas contesto
    //ESTE FALSE SE QUITA CUANDO LO SOLICITE LILIANA PEDRAZA
    if (false && total != totalcontesto) {
        response.sendRedirect("ListaEncuestas");
    } else {

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Inscripción a cursos Periodo </title>
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>
    <script language="JavaScript" type="text/JavaScript">
        <!--

        /*------------------------------------------------------------------
        function Validar Eliminacion del CheckBox
        ------------------------------------------------------------------*/
        function ValidarChk(){
        var max = document.fmArchivos.checEli.length
        var vall = false
        var k = 0
        for ( i=0 ; i<max ; i++ ){
        if  (document.fmArchivos.checEli[i].checked == true) {
        vall =true
        k++ ;
        }
        }
        if ( k > 1 )
        alert("Solo puede seleccionar un campo")
        else if ((vall == true))
        document.fmArchivos.submit()
        else
        if ((vall == false) && (document.fmArchivos.checEli.checked == true) )
        document.fmArchivos.submit()
        else
        alert ("Para eliminar tiene que seleccionar algun recurso")

        //else {
        //document.fmArchivos.submit()
        //document.fmArchivos.submit()
        //}
        }
        /*-----------------------------------------------------------------
        function Validar el CheckBox que selecciona a todos
        ------------------------------------------------------------------*/
        function chkAll(){
        var max = document.fmArchivos.checEli.length
        var vall
        if (document.fmArchivos.chAll.checked == true)
        vall = true
        else
        vall = false
        for ( i=0 ; i<max ; i++ ){
        document.fmArchivos.checEli[i].checked = vall
        }
        }
        /*------------------------------------------------------------------
        function Validar Cada check box
        ------------------------------------------------------------------*/
        function chkUn(){
        var max = document.fmArchivos.checEli.length
        var vall = true
        if (document.fmArchivos.chAll.checked == true)
        document.fmArchivos.chAll.checked = false
        for ( i=0 ; i<max ; i++ ){
        vall = vall && document.fmArchivos.checEli[i].checked
        }
        if (vall == true)
        document.fmArchivos.chAll.checked = true
        }
        //-->
    </script>
    <link href="css/comun.css" rel="stylesheet" type="text/css">
</head>

<body id="public">
    <p>&nbsp;</p><table width="770" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
        <tr>
            <td colspan="2" bgcolor="#EEEEEE"><img src="img/top.gif" alt="" width="770" height="10" id="top" /></td>
        </tr>
        <tr>
            <td>
                <jsp:include page="encabezado" flush="true">
                    <jsp:param name="anterior" value="InscripcionPI" />
                </jsp:include>
            </td>
        </tr>
    </table>
    <table width="41%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
        <form name="fmArchivos" method="post" action="Eliminacurso">
            <!--"2012-I"/ cfgEci.getPeriodoHor()-->
            <%  Vector inscritos = est.InscritoEventos(cfgEci.getPerCursos(), carnet);%>
            <%if (inscritos.size() > 0) {%>
            <tr> 
                <td colspan="3"> </td>
            </tr>
            <tr> 
                <td colspan="3"><b>Usted se encuentra inscrito a los siguientes cursos:</b></td>
            </tr>
            <tr> 
                <td width="4%">&nbsp;</td>
                <td width="4%">&nbsp;</td>
                <td width="51%"><b>Nombre del curso</b></td>
                <td width="20%"><b>Sal&oacute;n</b></td>
                <td width="21%"><b>Horario</b></td>
            </tr>
            <% Vector cursoi = new Vector();
                if (inscritos.size() > 0) {
                    for (int j = 0; j < inscritos.size(); j++) {
                cursoi = (Vector) inscritos.elementAt(j);%>
            <tr> 
                <td width="4%"><%=j + 1%> </td>
                <td width="4%"> 
                    <input type="checkbox" name="checEli" onClick="chkUn()"  value="<%=cursoi.elementAt(0)%>*<%=cursoi.elementAt(1)%>">
                </td>
                <td width="51%"><%=cursoi.elementAt(1)%></td>
                <td width="20%"><%=cursoi.elementAt(2)%></td>
                <td width="21%"><%=cursoi.elementAt(3)%></td>
            </tr>
            <%}%>
            <tr> 
                <td colspan="5"> 
                    <div align="center"> 
                        <input type="button" name="Submit"  onClick="ValidarChk()" value="Cancelar Inscripción" class="boton">
                    </div>
                </td>
            </tr>
            <%}
        }%>
        </form>
        <%Vector departa = new Vector();
      Vector deptos = est.departamentos(cfgEci.getPerCursos());%>
        <form name="formulario" method="post" action="Inscrito">
            <tr> 
                <td colspan="5"> 
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p>Seleccione la dependencia que quiere consultar: 
                        <select name="dpto" class="campotext">
                            <option value="0" Selected><font size="3">Seleccione</font></option>
                            <%   for (int j = 0; j < deptos.size(); j++) {
                    departa = (Vector) deptos.elementAt(j);%>
                            <option value="<%=departa.elementAt(0)%>"><font size="3"><%=departa.elementAt(1)%></font></option>
                            <%
                }%>
                        </select>
                    </p>
                    <p align="center"> 
                        <input type="submit" name="Submit2" value="Enviar">
                    </p>
                    <p align="center">&nbsp;</p>
                </td>
            </tr>
            <tr> 
                <td colspan="5"> 
                    <div align="center"> </div>
                </td>
            </tr>
        </form>
        <tr> 
            <td colspan="5"> 
                <div align="right"> 
                    <jsp:include page="piepag"> 
                        <jsp:param name="anterior" value="menuServEstud" />
                    </jsp:include>
                </div>
            </td>
        </tr>
    </table>
                        <%}%>
</body>
</html>
