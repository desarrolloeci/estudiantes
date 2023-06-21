<%-- 
    Document   : HorarioAsignaturasPosgrado
    Created on : 2/09/2016, 03:52:59 PM
    Author     : Lucero
--%>

<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Actas.ActaJava" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%
   
    PrintWriter oout = response.getWriter();
  
    String valor = request.getParameter("horario");
    String ident = request.getParameter("iden");
    configECI confEci = new configECI();
    Vector vh;
    String maximo;
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Horario Asignaturas Posgrado</title>
    </head>
    <body>
        <h1> 
            <%if (valor.equals("1")) {
                response.sendRedirect("horAsigEstPosgrados?iden=" + ident);
            
            }else
             response.sendRedirect("CalendarioPosgrado?iden=" + ident);
            %>
         
        </h1>
    </body>
</html>
