<%-- 
    Document   : Inscrito
    Created on : 14/05/2012, 08:56:11 AM
    Author     : lrodriguez
--%>
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
        String dpto = request.getParameter("dpto");
        Estudiante est = (Estudiante) session.getAttribute("estClase");
        int semestre = Integer.parseInt(est.getSemestre());
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Inscripción Cursos Periodo Intermedio</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <style type="text/css">
            a:hover{color:#3366CC; }
            a{color: blue;}
            a:link, a:visited { text-decoration: none }
        </style>
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>
    <body id="public">
       
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
       <!-- cfgEci.getPeriodoHor()-->
           <%Vector curso = est.Eventosdpto(cfgEci.getPerCursos(), dpto);%>
         <%  if (curso.size()<= 0){%>
          <center> No hay programación de cursos disponibles en el momento.</center>
          <p>
              
           <%}else if (dpto.equals("253") && semestre < 7) {%>
            <center> Usted no cumple los requisitos para aplicar a estos seminarios.</center>
          <p>
           <%}else if (dpto.equals("253") && semestre >= 7) {%>
        <table width="80%" border="1" id="tablaboton" align="center" class="tabla">
            <form name="formulario" method="post" action="RespuestaInscripcion">
                <input name="nombres" type="hidden" id="nombres" value="<%=nombre%>">
                <input name="doc" type="hidden" id="doc" value="<%=carnet%>">
                <input name="vinculo" type="hidden" id="vinculo" value="EST">
                <input name="dpto" type="hidden" id="dpto" value="<%=dpto%>">
               <tr>
      <td><b>Nombre del curso</b></td>
      <td><b>Profesor:</b></td>
      <td><b>Horario</b></td>
      <td><b>Lugar</b></td>
      <td><b>Fec.Ini.</b></td>
      <td><b>Fec.Fin.</b></td>
     
      <td><b>Seleccione</b></td>
      <p>
        <%   Vector cursos = new Vector();
     
        for (int x = 0; x < curso.size(); x++) {
            cursos = (Vector) curso.elementAt(x);
            Vector profesorInterno = est.ProfesorPorIDEvento((String) cursos.elementAt(0));
            String nombreProfesorInterno = "";
            if((cursos.elementAt(9)==null||cursos.elementAt(9).equals("No disponible"))&&profesorInterno.size()>0){
                nombreProfesorInterno = (String) ((Vector) profesorInterno.get(0)).get(0);
            }
            %>
        
      </p>
    </tr>
    <tr>
      <td><%=cursos.elementAt(1)%></td>
      <td><%=(!nombreProfesorInterno.equals(""))?nombreProfesorInterno:cursos.elementAt(9)%></td>
      <td><%=cursos.elementAt(8)%></td>
      <td><%=cursos.elementAt(4)%></td>
      <td><%=cursos.elementAt(2)%></td>
      <td><%=cursos.elementAt(3)%></td>
     
      <td>
          
        <input type="radio" name="medio" value="<%=cursos.elementAt(0)%>-<%=cursos.elementAt(5)%>-<%=cursos.elementAt(12)%>">
      </td>
    </tr>
     <% }
        }  else {%>
         <table width="80%" border="1" id="tablaboton" align="center" class="tabla">
            <form name="formulario" method="post" action="RespuestaInscripcion">
                <input name="nombres" type="hidden" id="nombres" value="<%=nombre%>">
                <input name="doc" type="hidden" id="doc" value="<%=carnet%>">
                <input name="vinculo" type="hidden" id="vinculo" value="EST">
                <input name="dpto" type="hidden" id="dpto" value="<%=dpto%>">
               <tr>
      <td><b>Nombre del curso</b></td>
      <td><b>Profesor:</b></td>
      <td><b>Horario</b></td>
      <td><b>Lugar</b></td>
      <td><b>Fec.Ini.</b></td>
      <td><b>Fec.Fin.</b></td>
     
      <td><b>Seleccione</b></td>
      <p>
        <%   Vector cursos = new Vector();
     
        for (int x = 0; x < curso.size(); x++) {
            cursos = (Vector) curso.elementAt(x);%>
        
      </p>
    </tr>
    <tr>
      <td><%=cursos.elementAt(1)%></td>
      <td><%=cursos.elementAt(9)%></td>
      <td><%=cursos.elementAt(8)%></td>
      <td><%=cursos.elementAt(4)%></td>
      <td><%=cursos.elementAt(2)%></td>
      <td><%=cursos.elementAt(3)%></td>
     
      <td>
          <!--VERIFICAR PARA VALIDAR CUPOS AQUI VOY-->
        <input type="radio" name="medio" value="<%=cursos.elementAt(0)%>-<%=cursos.elementAt(5)%>">
      </td>
    </tr>
       <%}
           }%> 
        
                <tr>
                    <td colspan="8">
                        <div align="center">
                            <input type="submit" name="Submit" onclick="return verificaCheckbox()" value="Inscribirse">
                        </div>
                    </td>
                </tr>

                <tr> 
            <td colspan="5"> 
                <div align="right"> 
                    <jsp:include page="piepag"> 
                        <jsp:param name="anterior" value="InscripcionPI" />
                    </jsp:include>
                </div>
            </td>
        </tr>
            </form>
        </table>
           <script lang="javascript">
               function verificaCheckbox(){
                   if(document.querySelector('input[name="medio"]:checked')===null){
                       alert("Seleccione un curso al cual inscribirse");
                       return false;
                   }else{
                       return true;
                   }
               }
           </script>
    </body>
</html>
