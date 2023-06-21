<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%  
        response.setHeader("Cache-Control","no-cache"); 
	String spar,  color,  per;
        PrintWriter oout = response.getWriter() ;
        int indice, linea, sem, tmp,  par, n, dp;
        Integer opcion, tipo;
        per = new String(request.getParameter("programa"));	
        Estudiante est = new Estudiante() ;
%>
<html>
<head>
<title>Planes  de estudio</title>
    <body>
<div align="center">
    <!--detalleplanestudios.jsp-->
 <form name="form1" method="post" action="planvigente.jsp"> 
 <% Vector plan = est.getListaPlanes(oout,per) ;%>
 <% int lon = plan.size();
           %>
            <h4> <font size="2" face="Verdana, Arial, Helvetica, sans-serif">Seleccione el plan a consultar:</font> </h4>
            <select name="idplan">
			
           <%for (indice = 0; indice < lon; indice++) { 
                Vector listaplanes= (Vector)plan.elementAt(indice); %>
                <option value="<%=listaplanes.elementAt(0)%>">Plan de estudios <%=listaplanes.elementAt(2)%></option>
 
            <%}%> 

    </select> 
<%				
           if (plan.size() <= 0)
            out.println("No hay datos en la consulta");
            
%>
 
<p>
<input type="submit" name="Submit" value="Consultar">
</form>
</div>
</body>
</html>
