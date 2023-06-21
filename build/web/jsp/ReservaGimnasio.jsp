<%-- 
    Document   : ReservaGimnasio
    Created on : 24/11/2016, 10:36:20 AM
    Author     : lucero.rodriguez
--%>
<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%
    HttpSession sesion;
    PrintWriter oout = response.getWriter();
    
    Estudiante est = new Estudiante();
    configECI confEci = new configECI();
    //Se bloquean los estudiantes que estén en la tabla bloqueados_gimnasio
    if(!est.desbloqueadoServicioGimnasio(confEci.getPeriodoHor())||est.bloqueadoGimnasio(carnet, confEci.getPeriodoHor())){
        response.sendRedirect("ServicioNoDisponible");
    }
    int resec = 0;
    String secuen = "";
    Vector sec = est.getSecuenciaColiseo();
    for (int j = 0; j < sec.size(); j++) {
        Vector secuencia = (Vector) sec.elementAt(j);
        secuen = secuencia.elementAt(0).toString();
        resec = Integer.parseInt(secuen);

    }
    //resec = Integer.parseInt(sec)
    String descr = request.getParameter("antiguedad");
    Vector Controla = est.ControlaGimnasio(confEci.getPeriodoHor());
    Vector Inscrito = est.ControlaInscritoGimnasio(confEci.getPeriodoHor(), carnet);

%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios Académicos - Inscripción Coliseo</title>

        <!-- JavaScript -->
        <script type="text/javascript" src="scripts/wufoo.js"></script>

        <!-- CSS -->
        <link rel="stylesheet" href="css/comun.css" type="text/css" />
        <script language="JavaScript" type="text/JavaScript">
        </script>
    <body>
        <table width="770" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
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
        </table>

        <div align="center">
            <p><br>
                <br>
                <%
                    if (Inscrito.size() <= 0) {
                        Vector vis = (Vector) Controla.elementAt(0);
                        String cuantos = vis.elementAt(0).toString();
                        int dato = Integer.parseInt(cuantos);
                        //ESTA ES LA CANTIDAD MAXIMA DE CUPOS DISPONIBLES PARA EL GIMNASIO
                        int total = 400;
                        if (dato < total) {
                            int datos = est.ReservaGimnasio(resec, "134", "R", "S", confEci.getPeriodoHor(), carnet, descr);

                if (datos > 0) {
                    est.ActSecuenciaReservas();%>
                Su solicitud ha sido generada con el código: <%=resec%> .  <p>Con este n&uacute;mero de reserva ac&eacute;rquese al gimnasio y reserve 
                su horario.</p>

            <%} else {
          out.println("<center>Ha ocurrido un error, intente mas tarde</center>");

      }%>
            <%} else {

                    out.println("<center>No hay cupos disponibles en el momento.</center>");

      }%>
            <%} else if (Inscrito.size() > 0) {
                Vector reserva = (Vector) Inscrito.elementAt(0);
                String numero = reserva.elementAt(2).toString();
            %>
            <p>&nbsp;</p></div>
    <center>
        <p>Usted ya se encuentra registrado. <b>Su número de reserva es: <%=numero%> . </b>
            Con este n&uacute;mero de reserva ac&eacute;rquese al gimnasio y reserve su horario. </p>
    </center>
    <%}%>



</body>
</html>
