<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>

<%  
        response.setHeader("Cache-Control","no-cache"); 
	String nombre = new String((String)session.getAttribute("nombre"));
	PrintWriter oout = response.getWriter() ;
        Estudiante est = new Estudiante(carnet,oout) ;
        configECI cfgEci = new configECI();
        otros.rutas ruta = new otros.rutas();
    if (carnet != null && !carnet.equals("")) {

%>

<html>
<head>
<title>Servicios Academicos - Consulta de Notas</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
a  { text-decoration: none }
.texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}

-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="../servlet/guardamonitor">  
<table width="752" border="0" cellpadding="0" align="center" cellspacing="0">
  <tr> 
        
    <td width="16"><img src="../img/arbIzqAz.gif" width="24" height="24"></td>
        
      <td width="711" valign="top"><img src="../img/puntoAz.gif" width="715" height="3" align="absmiddle"></td>
        
    <td width="25"><img src="../img/arbDerAz.gif" width="24" height="24"></td>
    </tr>
    <tr> 
        
    <td width="16" height="42"></td>        
    <td width="711" height="42"> 
		<jsp:include page="encabezado.jsp" flush="true"/>
        <table width="100%" border="0" align="center">
          <%Vector estud = est.getInfoEstudiante() ;%>
          <% for ( int j = 0 ; j < estud.size() ; j++ ){
		Vector estudiante = (Vector)estud.elementAt(j) ;
%>
          <%String prog="";
if (estudiante.elementAt(7).equals("13")){
	  	prog="INGENIERIA CIVIL";}%>
          <%if (estudiante.elementAt(7).equals("14")){
	  	prog="INGENIERIA ELECTRICA";}%>
          <%if (estudiante.elementAt(7).equals("15")){
	  	prog="INGENIERIA DE SISTEMAS";}%>
          <%if (estudiante.elementAt(7).equals("16")){
	  	prog="INGENIERIA INDUSTRIAL";}%>
          <%if (estudiante.elementAt(7).equals("17")){
	  	prog="INGENIERIA ELECTRONICA";}%>
          <%if (estudiante.elementAt(7).equals("18")){
	  	prog="ECONOMIA";}%>
          <%if (estudiante.elementAt(7).equals("19")){
	  	 prog="ADMINISTRACION";}%>
          <%if (estudiante.elementAt(7).equals("20")){
	  	 prog="MATEMATICAS";}%>
          <tr> 
            <td valign="top" colspan="2"> 
              <div><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699"><b>Documento 
                de identidad:</b></font><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;<%=estudiante.elementAt(3)%> 
                &nbsp;&nbsp;&nbsp;&nbsp;</font><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699"><b>Teléfono:</b></font><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                <%=estudiante.elementAt(6)%></font> </div>
            </td>
          </tr>
          <tr> 
            <td valign="top" colspan="2"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699"><b>Dirección electrónica:</b></font><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;<%=estudiante.elementAt(23)%>@mail.escuelaing.edu.co 
              </font> </td>
          </tr>
          <tr> 
            <td valign="top" colspan="2">&nbsp;</td>
          </tr>
          <tr> 
            <td valign="top" colspan="2"> 
              <div><b>MONITORIAS SOLICITADAS : (En orden de preferencia)</b></div>
            </td>
          </tr>
          <tr> 
            <td valign="top" colspan="2"> 
              <table width="100%" border="0">
                <tr> 
                  <td width="54%"> 
                    <div>Asignatura</div>
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="30%"> 
                    <div>Profesor con quien la cursó</div>
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="10%"> 
                    <div>Período académico</div>
                  </td>
                  <td width="2%">&nbsp;</td>
                </tr>
                <% String arreglo[]=new String[500];       
                    String texto[]=new String[200];
                    int i=0, n=1;
                    int k=0;
                    try {
                        //FileReader ra = new FileReader("../confEci/monitorias.txt"); 
                        //FileReader ra = new FileReader("D:\\jakarta-tomcat-3.2.1\\confEci\\monitorias.txt"); 
		        FileReader ra = new FileReader(ruta.valruta() + "monitorias.txt");        
                        BufferedReader entrada = new BufferedReader(ra); 
                        String s; 
                        while((s = entrada.readLine()) != null) {
                            arreglo[i]= s;
                            i=i+1;           
                        }   
                        entrada.close();
	                ra.close();
                    %>
                <tr> 
                  <td width="54%"> 1. 
                    <select NAME="asig1" size="1">
                      <option selected value="N">Seleccione la asignatura</option>
                      <%for (int l=0; l<i; l++){
                StringTokenizer st = new StringTokenizer(arreglo[l], ",");
                k=0;
              
                while (st.hasMoreTokens()) {              
                    texto[k]=st.nextToken();
                    k=k+1;  
                }%>
                      <option value="<%=texto[0]%>"><%=texto[1]%></option>
                      <%}%>
                    </select>
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="30%"> 
                    <input type="text" name="prof1" size="30" MAXLENGTH="30">
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="10%"> 
                    <input type="text" name="sem1" size="6" MAXLENGTH="6">
                  </td>
                  <td width="2%">&nbsp;</td>
                </tr>
                <tr> 
                  <td width="54%"> 2. 
                    <select NAME="asig2" size="1">
                      <option selected value="N">Seleccione la asignatura</option>
                      <%for (int l=0; l<i; l++){
                StringTokenizer st = new StringTokenizer(arreglo[l], ",");
                k=0;
              
                while (st.hasMoreTokens()) {              
                    texto[k]=st.nextToken();
                    k=k+1;  
                }%>
                      <option value="<%=texto[0]%>"><%=texto[1]%></option>
                      <%}%>
                    </select>
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="30%"> 
                    <input type="text" name="prof2" size="30" MAXLENGTH="30">
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="10%"> 
                    <input type="text" name="sem2" size="6" MAXLENGTH="6">
                  </td>
                  <td width="2%">&nbsp;</td>
                </tr>
                <tr> 
                  <td width="54%"> 3. 
                    <select NAME="asig3" size="1">
                      <option selected value="N">Seleccione la asignatura</option>
                      <%for (int l=0; l<i; l++){
                StringTokenizer st = new StringTokenizer(arreglo[l], ",");
                k=0;
              
                while (st.hasMoreTokens()) {              
                    texto[k]=st.nextToken();
                    k=k+1;  
                }%>
                      <option value="<%=texto[0]%>"><%=texto[1]%></option>
                      <%}%>
                    </select>
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="30%"> 
                    <input type="text" name="prof3" size="30" MAXLENGTH="30">
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="10%"> 
                    <input type="text" name="sem3" size="6" MAXLENGTH="6">
                  </td>
                  <td width="2%">&nbsp;</td>
                </tr>
                <tr> 
                  <td colspan="6">&nbsp;</td>
                </tr>
                <tr> 
                  <td colspan="6"> 
                    <center>
                      <input type="submit" style="font-size: 10pt; font-family: Times New Roman" value="Aceptar" name="B1">
                    </center>
                  </td>
                </tr>
              </table>
              <% }	
         catch(java.io.FileNotFoundException fnfex) { 
         System.out.println("Archivo no encontrado: " + fnfex); 
	%>
              <p>Archivo no encontrado 
                <%} 
         catch(java.io.IOException ioex) { }           	
        %>
                <% 
	HttpSession         sesion;
	sesion = request.getSession(true);
	sesion.setAttribute("semestre", estudiante.elementAt(24));	
%>
                <%}%>
            </td>
          </tr>
          <tr> 
            <td valign="top" colspan="2"> 
              <table width="45%" border="0" height="17" align="right">
                <tr> 
                  <td width="27%" height="14"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud.jsp">ANTERIOR</a> </font></b></font></div>
                  </td>
                  <td width="4%" height="14" align="center" valign="middle"> 
                    <div align="center">|</div>
                  </td>
                  <td width="22%" height="14"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud.jsp">INICIO</a></font></b></font></div>
                  </td>
                  <td width="4%" height="14" align="center" valign="middle"> 
                    <div align="center"><b>|</b></div>
                  </td>
                  <td width="43%" height="14"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"><a href="../servlet/LogOutEst/">CERRAR 
                      SESION </a></font></b></font></div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
    </td>
    <td width="25" height="42" align="right"></td>
  </tr>
  <tr> 
    <td width="16"><img src="../img/abaIzqAz.gif" width="24" height="24"></td>
      <td width="711" valign="bottom"><img src="../img/puntoAz.gif" width="715" height="3"></td>
    <td width="25"><img src="../img/abaDerAz.gif" width="24" height="24"></td>
  </tr>
</table>
</form>


</body>
</html>
<%
    } else {
%>
<jsp:forward page="inicio.jsp"/>
<% 	
    } 
%>
