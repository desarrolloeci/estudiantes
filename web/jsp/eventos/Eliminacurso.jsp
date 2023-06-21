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
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Cursos</title>
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
        <table width="640" border="0" align="center">
            <tr>
                <td width="86%" height="41" align="center" valign="top"> <br>
                    <% 	String token[] = new String[500];
        int p = 0;
        /*   String checEli="";
        checEli = request.getParameter("checEli");

        if (!checEli.equals("null")) {
        p = 1;
        admin.eliminaCurso(checEli);
        } else {
        p = 0;
        }*/
        String[] checEli;
        checEli = request.getParameterValues("checEli");
        int longChec = checEli.length;
        for (int i = 0; i < longChec; i++) {
            if (checEli[i].compareTo("null") != 0) {
                StringTokenizer st = new StringTokenizer(checEli[i], "*");
                int k = 0;
                while (st.hasMoreTokens()) {
                    token[k] = st.nextToken();
                    k = k + 1;

                }
                p = 1;
                est.EliminaCurso(token[0], carnet);
            } else {
                p = 0;
            }
        }

                    %>
                    <% if (p == 1) {%>
                    <form name=form1>
                        <input type="hidden" name="fecuso" value=<%=checEli%>>
                        <table width="95%" border="0" cellspacing="0" cellpadding="0" class="textocom">
                            <tr>
                                <td>
                                    <div align="left">
                                        <p>Usted ha cancelado la inscripción al curso:<b></b>
                                        <b><%=token[1]%>.</b>
 <br>
                                    </div>
                                </td>
                            </tr>
                        </table>

                    </form>
                    <%} else {%>
                    <p><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><i><b>La solicitud de cancelación de inscripción al curso no fué realizada.</b></i></font></p>
                    <%}%>
                    <br>
                </td>
            </tr>
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
    <p>&nbsp;</p></body>
</html>


