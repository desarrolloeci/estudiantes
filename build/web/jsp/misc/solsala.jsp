<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.Estudiante.EstudMisc" %>
<%  
    response.setHeader("Cache-Control","no-cache"); 
    PrintWriter oout = response.getWriter() ;
    Estudiante est = new Estudiante(new String("894"), oout) ;
    EstudMisc emisc = new EstudMisc("894") ;    
    Vector lissoft = new Vector(), tmpv = new Vector(), listur = new Vector() ;
    String msj = request.getParameter("msj");
    int k = 0 ;
    int MAXTURNOS = 3;
%>
<html>
<head>
<title>Solicitud de Sala de Cómputo</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.boton{
        font-size:10px;
        font-family:Verdana,Helvetica;
        font-weight:bold;
        color:white;
		background-image:url(img/blue-background.gif);
        height:25px;
		border-color: 666699;
		border-width: 2;
       }
.texto {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-style: normal;
	line-height: normal;
	font-weight: normal;
	font-variant: normal;
	text-transform: none;
	text-decoration: none;
	color: #666666;
}
a{color: blue;}
a:hover{color:#3366CC; }
-->
</style>
<script language="javascript" src="js/cal2.js">
/*
Xin's Popup calendar script-  Xin Yang (http://www.yxscripts.com/)
Script featured on/available at http://www.dynamicdrive.com/
This notice must stay intact for use
*/
</script>
<script language="javascript" src="js/cal_conf2.js"></script>
<script language="JavaScript">
function comprueba(){
    var fechaActual = new Date(); // Fecha actual

    if ( document.forms.form1.fecha.value == '') {
        alert("Usted debe seleccionar la fecha de reserva.");
        return false;
    } 
    var ja = new Array();
    var fech = document.form1.fecha.value;
    ja = fech.split("/");	
    var fecha1 = new Date(ja[0], ja[1]-1, ja[2]);
    var msegActual = fechaActual.getTime();
    var msegFecha1 = fecha1.getTime();
    var Diferencia =  msegFecha1 - msegActual;

    Diferencia /= 86400000;
    Diferencia = parseInt(Diferencia);
    if (Diferencia > 180) {
        alert("No puede hacer una reserva superior a dos semanas.");					
        return false;
    }
    return true ;
}    
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000">

<table width="640" border="0" cellpadding="0" align="center" cellspacing="0">
    <tr>     
    <td width="640" valign="top" height="255"> 
      <table width="100%" border="0" align="center">
        <tr> 
            <td valign="top">
                <%
    if(msj != null){
%>
              <div align="center">
                  <font color="#990000" face="Verdana, Arial, Helvetica, sans-serif"><strong><%=msj%></strong></font></div>
                <%
    }
%>
              </td>
        </tr>
        <tr> 
          <td valign="top">
            <fieldset> 
            <font color="#336699" face="Verdana, Arial, Helvetica, sans-serif" >
            <center><legend><font color="#666666" size="2"><b>Listado de Salas Solicitadas</b></font></legend> 
            </center>
            </font> 
       <%
       listur = emisc.getlisSalas() ;
       if (listur.size() > 0 ) { %>
            <form name="form2" method="post" action="CanceleTurnoComp"> 
            <table border="1" width="100%" class="texto">
              <tr><td width="21%"><strong>Fecha y Hora</strong></td>
                  <td width="11%" class="texto"><strong>Salón</strong></td>
                  <td width="43%"><strong>Software</strong></td>
                  <td width="15%"><strong>No. Equipo</strong></td>
                  <td width="10%"><strong>Cancele</strong></td>
              </tr>
                <% for (k = 0; k < listur.size(); k++ ) { 
                    tmpv = (Vector) listur.elementAt(k) ;
                %>
                    <tr><td><%=tmpv.elementAt(1)%></td>
                        <td><%=tmpv.elementAt(2)%></td>
                        <td><%=tmpv.elementAt(4)%></td>
                        <td><%=tmpv.elementAt(3)%></td>
                        <td><input type="checkbox" name="t<%=k%>" value="<%=tmpv.elementAt(0)%>"></td></tr>
                <% }
                %>
            </table>
              <div align="center"> <br>
                <input type="hidden" name="ntur" value="<%=k+1%>" >
                <input type="submit" name="Submit" value="Cancelar Turnos Seleccionados" size="2" class="boton">
              </div>
            </form>
       <% }  
       lissoft = emisc.getlisSoftware() ;
       if ( lissoft.size() > 0 ) {%>
            <font color="#336699" face="Verdana, Arial, Helvetica, sans-serif" > 
            <center><legend><font color="#666666" size="2"><br><b>Solicitud Sala Equipo de Cómputo</u></b></font></legend> 
            </center>
            </font> 
            <form name="form1" method="post" action="AsigneTurnoComp"> 
            <table width="100%" border="1" class="texto">
              <tr>
                <td width="20%"><strong>Fecha:</strong></td>
                <td width="30%">
                   <input type="text" name="fecha" size="10"> 
                    <small><a href="javascript:showCal('Calendar1')"> 
                        <img src="img/calendar.gif" width=16 height=16 border=0></a></small>                
                </td>
                <td width="20%"><strong>Hora</strong></td>
                <td width="30%"><select size="1" name="hora">
                    <option value="07:00">07:00</option>
                    <option value="08:30">08:30</option>
                    <option value="10:00">10:00</option>
                    <option value="11:30">11:30</option>
                    <option value="13:00">13:00</option>
                    <option value="14:30">14:30</option>
                    <option value="16:00">16:00</option>
                    <option value="17:30">17:30</option>
                  </select></td>
              </tr>
              <tr>
                <td width="20%"><strong>Software</strong></td>
                <td width="30%">
                    <select size="1" name="soft">
                <% for (k = 0; k < lissoft.size(); k++ ) { 
                    tmpv = (Vector) lissoft.elementAt(k) ;
                %>
                    <option value="<%=tmpv.elementAt(0)%>"><%=tmpv.elementAt(1)%></option>
                <% } %>
                  </select>
                </td>
                <td width="20%"><strong>Sala Solicitada:</strong></td>
                <td width="30%"><select size="1" name="sala">
                    <option value="339">Producción</option>
                    <option value="114">C1-105</option>
                    <option value="115">Idiomas</option>
                  </select>
                </td>
              </tr>
            </table>
              <div align="center"> <br>
                <input type="hidden" name="tipo" value="S">
                <input type="submit" name="Submit" value=" Buscar y Asignar Sala " 
                    size="2" class="boton" onclick="javascript: return comprueba();">
              </div>
            </form>
        <% } else {  %>
            <div align="center">Ya tiene el tope de turnos asignados para la semana</div>
        <% }  %>
            </fieldset>
          </td>
        </tr>
        <tr> 
          <td valign="top" height="12"> 
          
          </td>
          
        </tr>
      </table>
  </tr>
    <tr>
      <td height="5" colspan="3"><img src="img/bararhoriz.gif" width="640" height="5"></td>
    </tr>
</table>

</body>
</html>