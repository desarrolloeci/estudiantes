<%@ include file= "../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%
        PrintWriter oout = response.getWriter();
        Estudiante est = (Estudiante) session.getAttribute("estClase");
        Vector Datos = est.DatosEncuestas(carnet);
         if (Datos.size() > 0) {
         for (int i=0; i < Datos.size(); i++){
             Vector dato= (Vector) Datos.elementAt(i);
       
            String iden = dato.elementAt(1).toString();
            String flag1 = dato.elementAt(2).toString();
            String iden2=  dato.elementAt(3).toString();
            String flag2 = dato.elementAt(4).toString();
            String prog= dato.elementAt(5).toString();

             if (iden.equals("142") && flag1.equals("0")) {
                response.sendRedirect("EES-Es?flag=1&prog="+prog);
            } else if (iden.equals("133") && flag1.equals("0")) {
                response.sendRedirect("EES?flag=1&prog="+prog);
            }else {%>
               <center> Gracias por su participación.</center>


                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"><a href="LogOutEst">CERRAR
                      SESION </a></font></b></font></div>

        <%}
}
            }else{%>
          <center> Gracias por su participación.</center>
             <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"><a href="LogOutEst">CERRAR
                      SESION </a></font></b></font></div>
                
            <%} %>
