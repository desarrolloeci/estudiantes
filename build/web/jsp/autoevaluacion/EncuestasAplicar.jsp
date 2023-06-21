<%-- 
    Document   : EncuestasAplicar
    Created on : 24/04/2013, 10:46:31 AM
    Author     : Lucero
--%>
<%@ include file= "../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>

<%HttpSession sesion;
    PrintWriter oout = response.getWriter();
    Estudiante est = (Estudiante) session.getAttribute("estClase");
    Vector Datos = est.DatosEncuestas(carnet);
    String dato = "";%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Encuestas Autoevaluación con fines de Acreditación Institucional</title>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <table width="770" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
            <tr>
                <td colspan="2" bgcolor="#EEEEEE"><img src="img/top.gif" alt="" width="770" height="10" id="top" /></td>
            </tr>
            <tr>
                <td>
                    <jsp:include page="encabezado" flush="true">
                        <jsp:param name="anterior" value="" />
                    </jsp:include>
                </td>
            </tr>
        </table>
        <table width="770" border="0" height="143" align="center" class="tablanva">
            <tr>
                <td>
                    <%Vector estud = est.getInfoEstudiante();%>
                    <% for (int j = 0; j < estud.size(); j++) {
                            Vector estudiante = (Vector) estud.elementAt(j);
                    %>
                    <%String prog = "";
                        //if (estudiante.elementAt(7).equals("262")) {%>
                    <!--<p align="left">	En el marco del proceso de autorregulación con fines de autoevaluación para la renovación del Registro Calificado del programa de Ingeniería Biomédica el cual se realiza en convenio entre la Universidad del Rosario y la Escuela Colombiana de Ingeniería Julio Garavito, la evaluación que hagan los estudiantes sobre la calidad del programa es de gran importancia.
                        Por lo anterior, tenga en cuenta que su opinión, la cual es confidencial, es valiosa y debe ser contestada de manera objetiva.
                        Se trata entonces, de responder preguntas enfocadas al programa, sin embargo, encontrará algunas preguntas de tipo institucional, éstas últimas deben ser respondidas de acuerdo con la encuesta que le correspondió: ya sea de la Escuela o del Rosario.
                        Es importante contestar todas las preguntas destacando las fortalezas y oportunidades de mejoramiento que tiene el programa o las instituciones (Universidad del Rosario - Escuela Colombiana de Ingeniería Julio Garavito).
                        Sí no tiene conocimiento sobre alguno de los temas o considera que no aplica marque la opción correspondiente.</p>

                    Muchas gracias por su valiosa participación. -->


                    <!--%} else {   %>-->
                   <font size="4" color="#800000">Encuesta Institucional</font>

                    <p align="justify">El proceso de autoevaluación Institucional es de carácter 
                        participativo, integral, reflexivo, crítico y constructivo, y de acuerdo
                        con el Modelo Integral de Autoevaluación se realiza cada dos años. 
                        Con los aportes de todos los miembros de nuestra comunidad, se logrará 
                        identificar las fortalezas y oportunidades tanto a nivel institucional, 
                        como de los programas académicos que se encuentran adelantando procesos 
                        de aseguramiento de la calidad.
                        <br>
                        A continuación, encontrará una serie de afirmaciones sobre temas de interés 
                        institucional. Por favor léalas cuidadosamente y seleccione la opción de 
                        respuesta que más se ajuste a su opinión. Si usted considera que la afirmación 
                        no aplica para su caso o no conoce sobre ese aspecto, seleccione la opción 
                        correspondiente. Además, si desea complementar su respuesta puede hacerlo 
                        en el espacio disponible ubicado debajo de cada afirmación. 
                        <br>
                        Sus respuestas serán tratadas en forma confidencial. Contamos con su valiosa y decidida participación.

                    </p>
                  
                    <%//}
                        }%>
                </td>
            </tr>
        </table>
        <p>&nbsp;</p>

        <p> 
            <% if (Datos.size () > 0) {

                    for (int i = 0; i < Datos.size(); i++) {
                        Vector aplica = (Vector) Datos.elementAt(i);
                        String iden = aplica.elementAt(1).toString();
                        String flag1 = aplica.elementAt(2).toString();
                        String descripcion = aplica.elementAt(4).toString();
                        String prog = aplica.elementAt(3).toString();
                         String tipo = aplica.elementAt(5).toString();
                        String id_encuestado = aplica.elementAt(6).toString();%>
        </p>
        <table  align="center" width="770" border="0" height="37">
            <tr><!-- FormatoEncuesta-->
                <td>
                    <p align="left"><a class="menuprueba" bgcolor="FFFFFF" href="EncuestaNuevo?iden=<%=iden%>&prog=<%=prog%>&descripcion=<%=descripcion%>&id_encuestado=<%=id_encuestado%>&tipo=<%=tipo%>"><%=prog%></a> </p>
                </td>
            </tr>

        </table>
        <p align="center">&nbsp;
        <p align="center"> 
            <%}%>
            <%} else {%>
        <p>
    <center>
        Gracias por su participación.
    </center>
    <%}%>
    <!-- response.sendRedirect("Mensajes?idmsj=7");-->
    <h1>&nbsp;</h1>
    <h1 align="center">&nbsp;</h1>
    <div align="center"></div>
</body>
</html>
