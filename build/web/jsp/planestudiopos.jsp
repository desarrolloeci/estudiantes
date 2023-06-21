<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>

<%
    response.setHeader("Cache-Control", "no-cache");
    String IdEst = new String((String) session.getAttribute("carnet"));
    String tipest = new String((String) session.getAttribute("tipest"));
    String spar, color;
    PrintWriter oout = response.getWriter();
//        Estudiante est = new Estudiante(IdEst,oout) ;
    Estudiante est = (Estudiante) session.getAttribute("estClase");
    int indice, linea, sem, tmp, par, n, dp, ind, minima;
    Vector crediplan = new Vector();
%>

<html>
    <head>
        <title>Plan de estudios</title>

        <%
            out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
            out.println("<!-- ");
            out.println("function openPop(pagename){");
            out.println("window.open(pagename,'','toolbar=yes,scrollbars=yes,location=no,directories=no,status=no,menubar=yes,resizable=yes,height=350,width=550')} ");
            out.println("//-->");
            out.println("</SCRIPT>");
        %>

    </head>
    <body bgcolor="#FFFFFF" text="#000000">

        <% if (!tipest.equals("P")) {
                response.sendRedirect("planestudio");
            } else {
                Vector plan = est.getDetallePlanPos(IdEst, oout);
                dp = 1;
                int lon = plan.size();
                Vector Detalleplan = (Vector) plan.elementAt(1);
                int total;%>
        <% if (lon <= 0 || (!Detalleplan.elementAt(9).equals("-91") && !Detalleplan.elementAt(9).equals("-96") && !Detalleplan.elementAt(9).equals("-100") && !Detalleplan.elementAt(9).equals("-95") && !Detalleplan.elementAt(9).equals("-93") && !Detalleplan.elementAt(9).equals("-94") && !Detalleplan.elementAt(9).equals("-112") && !Detalleplan.elementAt(9).equals("-103") && !Detalleplan.elementAt(9).equals("-104") && !Detalleplan.elementAt(9).equals("-120"))) {

                out.println("No hay datos en la consulta");
            } else {
                if (((String) Detalleplan.elementAt(7)).equals("No disponible")) {
                    dp = 0;
                }
        %>

        <div id="container">
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
                <tr>
                    <td>
                        <p>El número entre paréntesis corresponde al número de créditos de la asignatura. </p>
                        <table border="1" cellspacing="0" width="100%" class="tabla">
                            <tr>
                                <%Vector maxi = est.getMaximoSemPos(IdEst, oout);
                                    Vector maximosem = (Vector) maxi.elementAt(0);
                                    total = (new Integer((String) maximosem.elementAt(0))).intValue();
                                    for (indice = 1; indice <= total; indice++) {
                                        out.println("<td>" + (new Integer(indice)).toString() + "</td>");
                                    }
                                    linea = 0;
                                    sem = total + 1;
                                %>

                                <%for (indice = 0; indice < plan.size(); indice++) {
                                        Vector Detalle = (Vector) plan.elementAt(indice);
                                        tmp = (new Integer((String) Detalle.elementAt(2))).intValue();

                                        if (linea != tmp) {
                                            for (; sem <= total; sem++) {
                                                out.println("<td>&nbsp</td>");
                                            }
                                            out.println("</tr><tr>");
                                            linea = tmp;
                                            sem = 1;
                                        }
                                        tmp = (new Integer((String) Detalle.elementAt(3))).intValue();%>
                                <%String ident = ((String) Detalle.elementAt(0));

                                    for (; sem < tmp; sem++) {
                                        out.println("<td> &nbsp</td>");
                                    }

                                    Vector idasigCoh = est.getdespidasigposCoh(oout, carnet);
                                    for (ind = 0; ind < idasigCoh.size(); ind++) {
                                        Vector min = (Vector) idasigCoh.elementAt(ind);
                                        minima = (new Integer((String) min.elementAt(0))).intValue();
                                        Vector idasig = est.getdespidasigpos(oout, IdEst, ident, 1, minima);
                                        Vector creditospos = est.getCreditosPos(IdEst, est.getidplan(), oout, minima);
                                        crediplan = (Vector) creditospos.elementAt(0);%>
                                <%
                                    int longi = idasig.size();
                                    color = new String("#000000");
                                    spar = new String("3");

                                    if (longi > 0)
                                        color = new String("#009933");
                                    else {
                                        Vector asig = est.getdespasigposVE(oout, carnet, ident);%>

                                <%
                                                int longitud = asig.size();
                                                if (longitud > 0) {
                                                    spar = new String("4");
                                                    color = new String("#3366FF");
                                                }
                                            }
                                            out.println("<td><B><a href=\"JavaScript:openPop('prerreplanpos?ident=" + ident + "&spar=" + spar + "' " + ") " + "\" > <font color=\"" + color + "\">" + Detalle.elementAt(1) + "</font></B></td>");
                                            sem++;

                                        }
                                    }
                                    for (; sem <= total; sem++) {
                                        out.println("<td> &nbsp</td>");
                                    }
                                    out.println("</tr></table><br>");
                                %>

                            <b>Total de créditos aprobados:</b>
                            <%%>

                            <%=crediplan.elementAt(0)%>
                            <%}

                                }%>
                </tr>
            </table>
        </table>

        <p>&nbsp;</p></body>
</html>
