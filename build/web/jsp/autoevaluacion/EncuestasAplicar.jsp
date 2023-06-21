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
        <title>Encuestas Autoevaluaci�n con fines de Acreditaci�n Institucional</title>
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
                    <!--<p align="left">	En el marco del proceso de autorregulaci�n con fines de autoevaluaci�n para la renovaci�n del Registro Calificado del programa de Ingenier�a Biom�dica el cual se realiza en convenio entre la Universidad del Rosario y la Escuela Colombiana de Ingenier�a Julio Garavito, la evaluaci�n que hagan los estudiantes sobre la calidad del programa es de gran importancia.
                        Por lo anterior, tenga en cuenta que su opini�n, la cual es confidencial, es valiosa y debe ser contestada de manera objetiva.
                        Se trata entonces, de responder preguntas enfocadas al programa, sin embargo, encontrar� algunas preguntas de tipo institucional, �stas �ltimas deben ser respondidas de acuerdo con la encuesta que le correspondi�: ya sea de la Escuela o del Rosario.
                        Es importante contestar todas las preguntas destacando las fortalezas y oportunidades de mejoramiento que tiene el programa o las instituciones (Universidad del Rosario - Escuela Colombiana de Ingenier�a Julio Garavito).
                        S� no tiene conocimiento sobre alguno de los temas o considera que no aplica marque la opci�n correspondiente.</p>

                    Muchas gracias por su valiosa participaci�n. -->


                    <!--%} else {   %>-->
                   <font size="4" color="#800000">Encuesta Institucional</font>

                    <p align="justify">El proceso de autoevaluaci�n Institucional es de car�cter 
                        participativo, integral, reflexivo, cr�tico y constructivo, y de acuerdo
                        con el Modelo Integral de Autoevaluaci�n se realiza cada dos a�os. 
                        Con los aportes de todos los miembros de nuestra comunidad, se lograr� 
                        identificar las fortalezas y oportunidades tanto a nivel institucional, 
                        como de los programas acad�micos que se encuentran adelantando procesos 
                        de aseguramiento de la calidad.
                        <br>
                        A continuaci�n, encontrar� una serie de afirmaciones sobre temas de inter�s 
                        institucional. Por favor l�alas cuidadosamente y seleccione la opci�n de 
                        respuesta que m�s se ajuste a su opini�n. Si usted considera que la afirmaci�n 
                        no aplica para su caso o no conoce sobre ese aspecto, seleccione la opci�n 
                        correspondiente. Adem�s, si desea complementar su respuesta puede hacerlo 
                        en el espacio disponible ubicado debajo de cada afirmaci�n. 
                        <br>
                        Sus respuestas ser�n tratadas en forma confidencial. Contamos con su valiosa y decidida participaci�n.

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
        Gracias por su participaci�n.
    </center>
    <%}%>
    <!-- response.sendRedirect("Mensajes?idmsj=7");-->
    <h1>&nbsp;</h1>
    <h1 align="center">&nbsp;</h1>
    <div align="center"></div>
</body>
</html>
