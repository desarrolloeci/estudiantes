<%-- 
    Document   : Tutor
    Created on : 5/03/2015, 09:54:46 AM
    Author     : Lucero
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
    Vector Tutor = est.ConsultaTutor(carnet,confEci.getPeriodoActual());

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
            </table>
    
<%  if ((Tutor.size()) == 0) {%>
<p>&nbsp;</p>
<p align="center"><h3><center>
        <font color="#666666" size="3" face="Verdana, Arial, Helvetica, sans-serif">No existe información.</font><br>
    </center></h3>
    <%} else {%>

<% for (int j = 0; j < Tutor.size(); j++) {
        Vector estudiante = (Vector) Tutor.elementAt(j);
%>

 
<h3><center>
<font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif">Consejero: 
&nbsp;&nbsp;&nbsp;&nbsp;</font>
<p align="center">
<font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif"><%=estudiante.elementAt(0)%></font>
   </center></h3>
   <table>
<%}
}
   }%>
   </table>
 </p>
 </div>
  