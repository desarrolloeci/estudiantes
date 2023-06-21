<%@ include file="secure.jsp" %>
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>

<%  
        response.setHeader("Cache-Control","no-cache"); 
	//HttpSession  session;
        session = request.getSession(true);	
	String nombre = new String((String)session.getAttribute("nombre"));
	String ban = new String((String)session.getAttribute("ban"));
	PrintWriter oout = response.getWriter() ;
//        Estudiante est = new Estudiante(carnet,oout) ;
        Estudiante est = (Estudiante) session.getAttribute("estClase") ;
%>

<html>
<head>
<title>Horario Estudiantes</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
a  { text-decoration: none }
.texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}

-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000">
<%Vector horario = est.getInfoHorario() ;%>

<%!  Vector iniMatriz(){ 
       	int i, j ;
       	Integer h ;
       	String vacia = new String(" "), cad;
       	Vector horario = new Vector();
       	Vector horas = new Vector();
       
	    for (i=700, j = 0; i<=1800; i=i+100, j++) {
    	    h = new Integer(i) ;
        	cad = new String(h.toString(i) + "-" + h.toString(i+30) + "     ") ;
        	horas.addElement(cad) ;
        	cad = new String(h.toString(i+30) + "-" + h.toString(i+100) + "     ") ;
        	horas.addElement(cad) ;
    	} 
  	    horario.addElement(horas);
        for (i=1 ; i < 7; i++) {
    	    horas = new Vector() ;
        for (j=0; j < 24; j++)
            horas.addElement(vacia);
        	horario.addElement(horas);
   		 }
   		return  horario;            
   }
%>


<%! void marqueHora(Vector horas, Vector reg){    
    int horaini, horafin, pdia, inicio, fin, i;
    Vector dia ;
    String cadhor ;
    horaini =(new Integer((String) reg.elementAt(4))).intValue() ;
    horafin =(new Integer((String) reg.elementAt(5))).intValue() ;
    pdia= (new Integer((String) reg.elementAt(3))).intValue()  ;
    cadhor = new String(reg.elementAt(1) + "-" + reg.elementAt(6) + " (" + reg.elementAt(2) + ")") ;
    dia = (Vector) horas.get(pdia) ;
    inicio = (horaini/100)*2 - 14;
    if (horaini % 100 > 0 )
       inicio++ ;
    fin = (horafin/100)*2 - 14;
    if (horafin % 100 > 0 )
       fin++ ;
    for (i = inicio; i < fin; i++)
        dia.setElementAt(cadhor, i) ;
    horas.setElementAt(dia, pdia) ;    
    }
%>


<%if((horario.size()) > 0){%>
 
    <%Vector horas;
    horas = iniMatriz();
    for (int j = 0; j < horario.size(); j ++) {
            Vector horarioest=(Vector)horario.elementAt(j);          
            marqueHora(horas, horarioest) ;
        }
    %>
 
    <table width="580" border="0" cellpadding="0" align="center" cellspacing="0">
    <tr> 
        <td width="8"><img src="../img/arbIzqAz.gif" width="24" height="24"></td>
        <td width="564" valign="top"><img src="../img/puntoAz.gif" width="564" height="2.5" align="absmiddle"></td>
        <td width="8"><img src="../img/arbDerAz.gif" width="24" height="24"></td>
    </tr>
    <tr> 
        <td width="8" height="42"></td>
        <td width="564" height="42"> 
        <table width="100%" border="0" align="center">
            <tr> 
            <td height="37" rowspan="2" align="left" valign="top" width="14%"> 
                <div align="left"><font face="Verdana, Arial, Helvetica, sans-serif"><b><img src="../img/LogEci.gif" width="72" height="74"></b></font></div>
            </td>
            <td height="33" width="86%"> 
             <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif"><b><font color="#336699" size="4">ESCUELA 
              COLOMBIANA DE INGENIERIA</font></b></font></div>
            </td>
            </tr>
            <tr> 
             <td width="86%" height="55" valign="top"> 
                <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif"><font size="4">Servicios 
              a Estudiantes - Horario de Clase</font></font></div>
            </td>
            </tr>
            <tr> 
            <td height="6" colspan="2"> 
                <div><font face="Verdana, Arial, Helvetica, sans-serif"><b>Nombre: 
                <font size="2">&nbsp;<%=nombre%> </font></b> </font></div>
            </td>
            </tr>
            <tr> 
            
          <td align="center" valign="top" colspan="2"> 
            <table width="98%" border="1" bordercolor="#336699">
              <tr bgcolor="#336699">
                <td width="14%"><div align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Horas</font></b></div></td>
                <td width="14%"><div align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Lunes</font></b></div></td>
                <td width="14%"><div align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Martes</font></b></div></td>
                <td width="14%"><div align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Miercoles</font></b></div></td>
                <td width="14%"><div align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Jueves</font></b></div></td>
                <td width="14%"><div align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Viernes</font></b></div></td>
                <td width="14%"><div align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">S&aacute;bado</font></b></div></td>
              </tr>
		 <% for (int j = 0; j < 24; j++) { %>
		 <tr>
		       <%for (int i=0; i < 7; i++){ %>
		   <td>
		     <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1">
                         <%Vector vh;%>
			 <%vh = (Vector) horas.get(i) ;%>
                         &nbsp;<%=(String) vh.elementAt(j)%>&nbsp;&nbsp;
		     </font> </div>
                   </td>
                       <%}%>
                 </tr>
                 <%}%>
            </table>
            <p>&nbsp;</p>
            </td>
            </tr>
            <tr> 
             <td valign="top" colspan="2"> 
             <div align="right"> 
              <table width="45%" border="0" height="17">
                <tr> 
                  <td width="27%" height="14"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud.jsp">ANTERIOR</a> </font></b></font></div>
                  </td>
                  <td width="4%" height="14" align="center" valign="middle"> 
                    <div align="center">|</div>
                  </td>
                  <td width="22%" height="14"> 
                 <%if (ban.equals("0")){%>
                     <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud.jsp">INICIO</a></font></b></font></div>
                 <%} else {%>
                     <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud1.jsp">INICIO</a></font></b></font></div>
                 <%}%>
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
            </div>
          </td>
        </tr>
      </table>
    </td>
    <td width="8" height="42" align="right"></td>
  </tr>
  <tr> 
    <td width="8"><img src="../img/abaIzqAz.gif" width="24" height="24"></td>
    <td width="564" valign="bottom"><img src="../img/puntoAz.gif" width="564" height="2.5"></td>
    <td width="8"><img src="../img/abaDerAz.gif" width="24" height="24"></td>
  </tr>
</table>
<%}else%>
    <p>&nbsp;</p><p align="center"><b>No tiene horario asignado para este periodo</b></p>
</body>
</html>
