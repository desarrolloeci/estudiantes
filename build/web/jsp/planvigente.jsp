<%-- 
    Document   : planvigente
    Created on : 17/03/2017, 09:51:17 AM
    Author     : lucero.rodriguez
--%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%
    response.setHeader("Cache-Control", "no-cache");
    String spar, color, idplan = "", programa;
    PrintWriter oout = response.getWriter();
    programa = new String(request.getParameter("programa"));
    String nroplan= "";
    int indice, tmp, par, n, dp;
    Integer opcion, tipo;
    //  programa = new String(request.getParameter("programa"));
    //  idplan = new String(request.getParameter("idplan"));
    Estudiante est = new Estudiante();
    Vector Vigente = est.PlanVigente(programa);
    if (Vigente.size() > 0) {
        idplan = (((Vector) Vigente.elementAt(0)).elementAt(0).toString());
        nroplan= (((Vector) Vigente.elementAt(0)).elementAt(2).toString());

    }
    Vector detalle = est.getDetallePlanes(oout, idplan);

    Vector lisdetalles;
%>

<html>
    <head>
        <title>Planes de Estudio </title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
         <link rel="stylesheet" href="css/comun.css" type="text/css" />
    </head>

    <body bgcolor="#FFFFFF" text="#000000">

        <div align="center"><font color="#990000" size="2" face="Verdana, Arial, Helvetica, sans-serif">
            <strong>Plan de Estudios <%=nroplan%></strong>    </font></div>

        <form name="form1" method="post" action="detalleplanestudios.jsp">
            <input type="hidden" name="programa" value="<%=programa%>">

            <table width="60%" height="8" border="1" align="center" cellspacing="0">
                <tr>
                    <%for (indice = 1; indice <= 11; indice++) {
                            if (indice == 1) {%>
                    <td> Fundamentación</td>
                    <% } else {%>
                    <td>&nbsp</td>
                    <%}
                        }%>
                </tr>
                <%
                    int linAnt = 0, linea, nivel = 0, sem, i = -1;
                    String[][] res = new String[15][11];
                    String[][] niv = new String[15][11];
                    for (int j = 0; j < res.length; j++) {
                        for (int z = 0; z < res[j].length; z++) {
                            res[j][z] = "";
                            niv[j][z] = "";
                        }
                    }
                    for (Object dato : detalle) {
                        linea = Integer.parseInt(((Vector) dato).elementAt(2).toString());
                        sem = Integer.parseInt(((Vector) dato).elementAt(3).toString());
                        // nivel= Integer.parseInt(((Vector) dato).elementAt(4).toString());
                        String idasig = ((Vector) dato).elementAt(0).toString();
                        if (linea != linAnt) {
                            i++;
                            linAnt = linea;
                        }

                        res[i][sem] = res[i][sem] + "<a href=contenidos.jsp?idasig=" + ((Vector) dato).elementAt(0) + " target='_blank'>" + ((Vector) dato).elementAt(1) + "</a><br>";
                        Vector niveles = est.Nivel(idplan, idasig);
                        if (niveles.size() > 0) {
                            niv[i][sem] = (((Vector) niveles.elementAt(0)).elementAt(0).toString());
                        }
                    }
                    for (int j = 0; j < i + 1; j++) {
                        out.println("<tr>");
                        for (int z = 0; z < 11; z++) {
                            if (res[j][z].equals("")) {
                                res[j][z] = "&nbsp;";
                            }
                            if (niv[j][z].equals("1")) {
                                out.println("<td bgcolor=\"#E0FBDD\">" + res[j][z] + "</td>");
                            } else if (niv[j][z].equals("2")) {
                                out.println("<td bgcolor=\"#0DFF86\">" + res[j][z] + "</td>");
                            } else if (niv[j][z].equals("3")) {
                                out.println("<td bgcolor=\"#00C600\">" + res[j][z] + "</td>");
                            } else {
                                out.println("<td bgcolor=\"#FFFFFF\">" + res[j][z] + "</td>");
                            }
                        }
                        out.println("</tr>");
                    }%>

            </table>
            <%if (idplan.equals("334") || idplan.equals("350")) {%>
            <table width="20%" align="center" class="tabla">
                <tr><td bgcolor="#E0FBDD" width="45">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>Nivel I</td></tr>
            </table>
            
            <table width="20%" align="center" class="tabla">
                <tr><td bgcolor="#0DFF86" width="45">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>Nivel II</td></tr>
            </table>
            
            <table width="20%" align="center" class="tabla">
                <tr><td bgcolor="#00C600" width="45">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>Nivel III</td></tr>
            </table>
            <%}%>
            <p></p>
            <table width="60%" height="8" border="0" align="center" cellspacing="0">
                <tr>
                    <td align="center"><b>Histórico de planes</b></td>
                </tr>
                <tr>
                    <td align="center">
                        <% Vector plan = est.getListaPlanes(oout, programa);%>
                        <% int lon = plan.size();
                        %>
                        <h4> <font size="2" face="Verdana, Arial, Helvetica, sans-serif">Seleccione el plan a consultar:</font> </h4>
                        <%if((!programa.equals("268"))&&(!programa.equals("275"))&&(!programa.equals("3"))){%>
                        <h4> <font color="#990000" size="2" face="Verdana, Arial, Helvetica, sans-serif">Nota: Este plan de estudios está sujeto a modificaciones de acuerdo a la aprobación del Ministerio de Educación.</font> </h4>
                        <%}%>
                        <select name="idplan">

                            <%for (indice = 0; indice < lon; indice++) {
                                    Vector listaplanes = (Vector) plan.elementAt(indice);
                                   // nroplan= listaplanes.elementAt(2).toString();%>
                            <option value="<%=listaplanes.elementAt(0)%>">Plan de estudios <%=listaplanes.elementAt(2)%></option>
                           
                            <%}%> 

                        </select> 
                         
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <p>
                            <input type="submit" name="Submit" value="Consultar">
                    </td>
                </tr>

            </table>
                              
            <%
                if (plan.size() <= 0) {
                    out.println("No hay datos en la consulta");
                }

            %>

        </form>
        <p>&nbsp;</p>
    </body>
</html>
