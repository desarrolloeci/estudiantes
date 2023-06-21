<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>

<%  
    response.setHeader("Cache-Control","no-cache"); 
    otros.rutas ruta = new otros.rutas();
	String nombre = new String((String)session.getAttribute("nombre"));
	String ban = new String((String)session.getAttribute("ban"));
	String clanum = new String((String)session.getAttribute("clanum"));
    String codigo = request.getParameter("codigo");
    //String grp = request.getParameter("grupo");
    String obs = request.getParameter("observ");
    obs = obs.replace("'", "");
	PrintWriter oout = response.getWriter() ;
    StringTokenizer st = new StringTokenizer(codigo, "-");
    int k=0;
    String texto[]=new String[2000];
    while (st.hasMoreTokens()) {
        texto[k]=st.nextToken();
        k=k+1;
    }
	String cod = (String)texto[0];
	String grp = (String)texto[1];	
    session = request.getSession(true);
    cod = cod.toUpperCase();                      
%>
<!-- GUARDA EN ARCHIVO-->
<%
    try {
        FileWriter arch = new FileWriter(ruta.valruta() + "cancelaciones.txt", true);
        BufferedWriter arch1 = new BufferedWriter(arch);
        PrintWriter entrada = new PrintWriter(arch1);
        String datos = (String)carnet+","+(String)cod+","+(String) grp+","+(String)obs.toUpperCase();
        entrada.println(datos);
        entrada.close();
        arch.close();
        arch1.close();
    }catch(java.io.FileNotFoundException fnfex) {
        System.out.println("Archivo no encontrado: " + fnfex);
        %>
        <p>&nbsp;</p>	  
        <p class="texto">No pudo ser procesada su información en el archivo</p>
        <%
    }
    Estudiante est = (Estudiante) session.getAttribute("estClase") ;
    long resp =  est.CanceleAsig(carnet, cod, obs);
%>
<html>
<head>
<title>Solicitud de Cancelaci&oacute;n</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
a  { text-decoration: none }
.texto {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
	font-style: normal;
	line-height: normal;
	font-weight: bold;
	font-variant: normal;
	text-transform: none;
	text-decoration: none;
	color: #666666;
}

-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000">

<table width="640" border="0" cellpadding="0" align="center" cellspacing="0">
    <tr> 
        
    <td width="640" valign="top"> 
	<jsp:include page="encabezado" flush="true"/>
      <table border="0" align="center" width="603">
        <tr> 
          <td align="center" valign="top" colspan="2" height="2"> <br>
            <div align="left"> 
              <%
           if (resp > 0) {
%>
              <span class="texto"><b><font face="Verdana, Arial, Helvetica, sans-serif">La
              solicitud de cancelación para la asignatura: <font color="#336699"><%=cod%></font> 
              grupo: <font color="#336699"><%=grp%> </font>fue recibida.<br> <br>
              <u>El número de su cancelación es <%=resp%>, conserve este
              número como prueba de su solicitud de cancelación.</u>
              </font></b>
              </span>
              <p><font face="Verdana, Arial, Helvetica, sans-serif"><span class="texto"><b>Pendiente
                        aprobación del decano </b>
                </span>
                </font>
              <p class="texto"><font face="Verdana, Arial, Helvetica, sans-serif"><b>Recuerde:
                    Debe asistir a clase hasta que el decano apruebe la cancelación. <br>
                Esta respuesta aparece al cierre del proceso de cancelación.</b></font></p> 
              <%} else {%>
              <b class="texto">El 
              servidor se encuentra ocupado. Por favor intente más tarde.</font></b>	
              <%}%>
            </div>
        </tr>
        <tr> 
          <td valign="top" colspan="2" height="49"> 
            <div align="right"> <br>
              &nbsp; 
              <table width="45%" border="0" height="17">
                <tr> 
                  <td width="27%" height="14"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="cancelaciones">ANTERIOR</a> </font></b></font></div>
                  </td>
                  <td width="4%" height="14" align="center" valign="middle"> 
                    <div align="center">|</div>
                  </td>
                  <td width="22%" height="14"> 
                    <%if (ban.equals("0")){%>
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud">INICIO</a></font></b></font></div>
                    <%} else {%>
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud1">INICIO</a></font></b></font></div>
                    <%}%>
                  </td>
                  <td width="4%" height="14" align="center" valign="middle"> 
                    <div align="center"><b>|</b></div>
                  </td>
                  <td width="43%" height="14"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"><a href="LogOutEst">CERRAR 
                      SESION </a></font></b></font></div>
                  </td>
                </tr>
              </table>
            </div>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td height="5" colspan="3"><img src="img/bararhoriz.gif" width="640" height="5"></td>
    </tr>
</table>
</body>
</html>
