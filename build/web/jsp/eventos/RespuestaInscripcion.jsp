<%-- 
    Document   : RespuestaInscripcion
    Created on : 9/05/2012, 12:08:59 PM
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
    String dpto = request.getParameter("dpto");
    Estudiante est = (Estudiante) session.getAttribute("estClase");
    String nombres = request.getParameter("nombres");
    String doc = request.getParameter("doc");
    String medio = "";
    String cupo = "";
    String identifica = "";
    int med1 = 0;
    int respuesta = 0;
    String vinculo = request.getParameter("vinculo");
    String id_evento = "";

    Vector dato = new Vector();
    /* for (int x = 0; x < verifica.size(); x++) {
     dato = (Vector) verifica.elementAt(x);
     id_evento = dato.elementAt(0).toString();
     med1 = Integer.parseInt(id_evento);
     if (med == med1) {
     int p=0;
     }else {

     respuesta = admin.InscribeEvento(medio, doc, nombres, vinculo);
     }
     }*/
    String token[] = new String[500];
    int p = 0;
    String[] checEli;
    checEli = request.getParameterValues("medio");
    int longChec = checEli.length;
    for (int i = 0; i < longChec; i++) {

        StringTokenizer st = new StringTokenizer(checEli[i], "-");
        int k = 0;
        while (st.hasMoreTokens()) {
            token[k] = st.nextToken();
            k = k + 1;

        }
        medio = token[0];
        cupo = token[1];
        identifica = token[2];
    }

    Vector cupos = est.CuposEventos(medio);
    String datoc = (((Vector) cupos.elementAt(0)).elementAt(0).toString());

    int total = Integer.parseInt(datoc);
    int total1 = Integer.parseInt(cupo);


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Inscripción cursos Periodo intermedio</title>
    </head>
    <body>
        <table width="770" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
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

        <% if (total < total1) {

                int med = Integer.parseInt(medio);
                Vector verifica = est.VerificaEventos(medio, doc);

                if (dpto.equals("253")) {
                    Vector verificauge = est.VerificaEventosUGE(doc,  identifica);

                    //String identifica2 = verificauge.elementAt(1).toString();
                    if (verificauge.size() == 0) {
                        respuesta = est.InscribeEvento(medio, doc, nombres, vinculo, identifica);
                    }
                } else if (verifica.size() == 0) {

                    //
                    respuesta = est.InscribeEvento(medio, doc, nombres, vinculo, identifica);
                }%>
        <%if (respuesta > 0) {%>

    <center>Su solicitud de inscripción al curso ha sido realizada.</center>
        <%} else {%>
    <center>Usted ya se encuentra inscrito a este curso.</center>
        <%}
        } else {%>
    <center>No hay cupo disponible.</center>
        <%}%>
    <table width="50%" border="0" id="tablaboton" align="center">
        <tr>
            <td>
                <div align="right">
                    <jsp:include page="piepag">
                        <jsp:param name="anterior" value="InscripcionPI" />
                    </jsp:include>
                </div>
            </td>
        </tr>
    </table>
</body>
</html>
