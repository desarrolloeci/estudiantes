<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%  
        response.setHeader("Cache-Control","no-cache"); 
	String  idasig;
        PrintWriter oout = response.getWriter() ;
        int indice, i;
        idasig = new String(request.getParameter("idasig"));	
         Estudiante est = new Estudiante() ;
  %>

<html>
<head><title>Contenidos Programáticos</title></head>
<body>

<table width="70%" border="0" align="center">
        <tr> 
          <td  rowspan="2" align="left" valign="top" width="20%"> 
            <div align="left"><font face="Verdana, Arial, Helvetica, sans-serif"><b><img src="../img/LogEci.gif" width="72" height="74"></b></font></div>
            </td>
          <td  width="50%"> 
            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif"><b><font color="#B70404" size="4">ESCUELA 
              COLOMBIANA DE INGENIERIA</font></b></font></div><br><B><CENTER><font color=800000>CONTENIDO PROGRAMATICO</FONT></CENTER></B>
          </td>
        </tr>
</table>


<P>

 <% Vector detalle = est.getContenido(oout,idasig) ;%>
 <% int lon = detalle.size();
if (lon==0){
out.println("<b>No existen datos para esta asignatura</b>");
}
else{
        
 for (indice = 0; indice < lon; indice++) { 
            Vector listacontenidos= (Vector)detalle.elementAt(indice); 
           
  %>
<p>
<table  border="1" align="center" width="100%" >
  
 <tr>
<td><b>Asignatura:</b></td>
<td><b>Vigente desde:</b></td>
<td><b>Hasta:</b></td>
<td><b>Ult.Modificación</b></td>
<td><b>Penúltima:</b></td>
</tr>

<tr>
<td><%=listacontenidos.elementAt(0)%></td>
<td><%=listacontenidos.elementAt(1)%></td>
<td><%=listacontenidos.elementAt(2)%></td>
<td><%=listacontenidos.elementAt(3)%></td>
<td><%=listacontenidos.elementAt(4)%></td>
</tr>
</table>

 <% for (i=5;i< listacontenidos.size(); i++) {
           if (i==5){
            out.println("<b><BR><center><font color=800000>OBJETIVOS</font></b><BR></center>");
%>
<table  border="1" align="center" width="100%" >
  <tr> 
    <td> 
      <% out.println(BdEstudiante.quitarSaltosL((String) listacontenidos.elementAt(5)) + "<br>"); %>
    </td>
  </tr>
</table>
<%}%>
            <%if (i==6){
            out.println("<b><BR><center><font color=800000>JUSTIFICACION</font></b><BR></center>");%>
<table border="1" align="center"  width="100%" >
  <tr> 
    <td> 
      <% out.println(BdEstudiante.quitarSaltosL((String) listacontenidos.elementAt(6)) + "<br>"); %>
    </td>
  </tr>
</table>
<%}%>
           <% if (i==7){
            out.println("<b><BR><center><font color=800000>INTENSIDAD (HORAS/SEMANA)</font></b><BR></center>");%>
<table  border="1" align="center"  width="100%" >
  <tr> 
    <td> 
      <% out.println(BdEstudiante.quitarSaltosL((String) listacontenidos.elementAt(12)) + "<br>"); %>
    </td>
  </tr>
</table>
<%}%>

<%
            if (i==8){
            out.println("<b><BR><center><font color=800000>BIBLIOGRAFIA</font></b><BR></center>");%>
<table  border="1"  align="center" width="100%" >
  <tr> 
    <td> 
      <% out.println(BdEstudiante.quitarSaltosL((String) listacontenidos.elementAt(8)) + "<br>"); %>
    </td>
  </tr>
</table>
<%}%>
<%
            if (i==9){
            out.println("<b><BR><center><font color=800000>CONTENIDO RESUMIDO</font></b><BR></center>");%>
<table  border="1" align="center"  width="100%" >
  <tr> 
    <td> 
      <% out.println(BdEstudiante.quitarSaltosL((String) listacontenidos.elementAt(9)) + "<br>"); %>
    </td>
  </tr>
</table>
<%}%>


<%
            if (i==10){
            out.println("<b><BR><center><font color=800000>CONTENIDO DETALLADO</font></b><BR></center>");%>
<table  border="1"  align="center" width="100%" >
  <tr> 
    <td> 
      <% out.println(BdEstudiante.quitarSaltosL((String) listacontenidos.elementAt(10)) + "<br>"); %>
    </td>
  </tr>
</table>
<%}%>


<%
            if (i==11){
            out.println("<b><BR><center><font color=800000>METODOLOGIA</font></b><BR><BR></center>");%>
<table  border="1"  align="center" width="100%" >
  <tr> 
    <td> 
      <% out.println(BdEstudiante.quitarSaltosL((String) listacontenidos.elementAt(11)) + "<br>"); %>
    </td>
  </tr>
</table>
<%}%>




<!--esta linea para imoprimir todos los datos sin tablas
//<!% out.println(BdEstudiante.quitarSaltosL((String) listacontenidos.elementAt(i)) + "<br>"); %> -->
<%}
}
}%>

</body>
</html>
