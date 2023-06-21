<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.Estudiante.EstudMisc" %>
<%  
    response.setHeader("Cache-Control","no-cache"); 
    String nombre = new String((String)session.getAttribute("nombre"));
    String ban = new String((String)session.getAttribute("ban"));
    PrintWriter oout = response.getWriter() ;
    Estudiante est = (Estudiante) session.getAttribute("estClase") ;
    EstudMisc emisc = new EstudMisc(est.getIdEst()) ;    
    Vector lissoft = new Vector(), tmpv = new Vector(), listur = new Vector() ;
    int k = 0 ;
    int MAXTURNOS = 3;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios Académicos - Solicitud de Turno</title>
        
        <!-- JavaScript -->
        <script type="text/javascript" src="scripts/wufoo.js"></script>
        
        <!-- CSS -->
         <link rel="stylesheet" type="text/css" href="Navegacion/css/estilo-escuela.css">
<link rel="stylesheet" href="Navegacion/css/bootstrap.min.css">
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function lanzarpopup(){
	var nav=navigator.userAgent.toLowerCase();;
	var isOpera=(nav.indexOf("opera")!=-1)?true:false;
	var isOpera5=(nav.indexOf("opera 5")!=-1 || nav.indexOf("opera/5")!=-1)?true:false;
	var isOpera6=(isOpera && parseInt(navigator.appVersion)>=6)?true:false;
	var isN6=(nav.indexOf("gecko")!=-1);
	var isN4=(document.layers)?true:false;
	var isMac=(nav.indexOf("mac")!=-1);
	var isIE=(document.all && !isOpera && (!isMac || navigator.appVersion.indexOf("MSIE 4")==-1))?true:false;
	var winX, winY, calOffsetX=-200, calOffsetY=16;
	if (isIE || isOpera6) {
		winX=event.screenX;
		winY=event.screenY;
  	}
  	else if (isN4 || isN6) {
		winX=3;
		winY=3;
  	}
	window.open("html/calendario.htm","cal","toolbar=0,width=250,height=250,left="+(winX+calOffsetX)+",top="+(winY+calOffsetY));
	return false;
}

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
    if (Diferencia > 7) {
        alert("No puede hacer una reserva superior a una semana.");					
        return false;
    }else{
        return true;
    }
}    
            //-->
        </script>
    </head>
  <body id="public" style="background-color: white">
        <div id="container">
            <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
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
                <tr>
                    <td colspan="2">
                        <div class="info" align="center">
                            <h2><font color="#666666">
                                    <label id="msj">Solicitud de Turno</label>
                            </font></h2>
                    </div></td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" border="0" align="center">
        <tr> 
          <td valign="top">
            <fieldset> 
            <font color="#336699" face="Verdana, Arial, Helvetica, sans-serif" >
            <center><legend><font color="#666666" size="2"><b>Turnos Activos para el Estudiante</b></font></legend> 
            </center>
            </font> 
       <%
       listur = emisc.getlisTurnos() ;
       if (listur.size() > 0 ) { %>
            <form name="form2" method="post" action="CanceleTurnoComp"> 
            <table border="1" width="100%" class="texto">
              <tr bgcolor="#336699"><td width="21%"><div align="center"><font color="#FFFFFF"><strong>Fecha y Hora</strong></font></div></td>
                  <td width="11%"><div align="center"><font color="#FFFFFF"><strong>Salón</strong></font></div></td>
                  <td width="43%"><div align="center"><font color="#FFFFFF"><strong>Software</strong></font></div></td>
                  <td width="15%"><div align="center"><font color="#FFFFFF"><strong>No. Equipo</strong></font></div></td>
                  <td width="10%"><div align="center"><font color="#FFFFFF"><strong>Cancele</strong></font></div></td></tr>
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
                <input name="cancelar" type="submit" class="boton" id="cancelar" value="Cancelar Turnos Seleccionados" size="2">
              </div>
            </form>
       <% }  
       lissoft = emisc.getlisSoftware() ;
       if ( lissoft.size() > 0 && k < MAXTURNOS) {%>
            <font color="#336699" face="Verdana, Arial, Helvetica, sans-serif" > 
            <center><legend><font color="#666666" size="2"><br><b>Solicitud Turno Equipo de Cómputo</u></b></font></legend> 
            </center>
            </font> 
            <form name="form1" method="post" action="AsigneTurnoComp"> 
            <table width="100%" border="1" class="texto">
              <tr>
                <td width="20%"><strong>Fecha:</strong></td>
                <td width="30%">
                   <input type="text" name="fecha" size="10"> 
                    <small><a href="" onClick="javascript: return lanzarpopup();"> 
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
                <td width="20%"></td>
                <td width="30%">
                </td>
              </tr>
            </table>
              <div align="center"> <br>
                <input type="hidden" name="tipo" value="T">
                <input type="submit" name="Submit" value="Buscar y Asignar Turno" size="2" class="boton" onClick="javascript:return comprueba();">
              </div>
            </form>
        <% } else {  %>
            <div align="center" class="texto"><font color="#990000">Ya tiene el tope de turnos asignados para la semana</font></div>
            <span class="texto">
            <% }  %>
            </span>            </fieldset>
          </td>
        </tr>
      </table>
                    </td>
            </table>
        </div><!--container-->
           <footer style="position: static">
    <div class="container">
        <div class="row">
            <div class="col-8 oferta-academica">
                <ul>
                <h6>Oferta Educativa</h6>  
                   <li>Carreras profesionales</li>
                   <li>Especializaciones</li>
                   <li>Maestrías</li>
                   <li>Doctorado</li>
                   <li>Educación Continuada</li>
                   <li>Escuela Internacional de Verano</li> 
               </ul>
                
            </div>
            <div class="col localizacion-redes">
                <ul> 
                    <li><img width="60%" height="60%" src="img/Navegacion/acreditacion.png" class="img-fluid" alt="acreditación institucional"></li><br>
                   <li>
                     <div class="row">
                         <div class="col-1 mr-2">
                            <img src="img/Navegacion/icono-localizacion.png" alt="localizacion">
                        </div>
                         <div class="col ml-1">
                             <p>AK. 45 n.º 205 - 59 (Autopista Norte)
                             <br>PBX: +57 (1) 668 3600 - Bogotá
                             <br>Línea nacional gratuita: 018000112668</p>
                         </div>
                     </div>
                   </li>
                   <li>
                       <ul class="list-inline">
                           <li class="list-inline-item"><a href="https://www.facebook.com/EscuelaIng/" target="_blank"><img src="img/Navegacion/icono-facebook.png" class="img-fluid" alt="facebook"></a></li>
                           <li class="list-inline-item"><a href="https://twitter.com/Escuelaing" target="_blank"><img src="img/Navegacion/icono-twitter.png" class="img-fluid" alt="twitter"></a></li>
                           <li class="list-inline-item"><a href="https://www.linkedin.com/school/escuela-colombiana-de-ingenieria/" target="_blank"><img src="img/Navegacion/icono-linkedin.png" class="img-fluid" alt="linkedin"></a></li>
                           <li class="list-inline-item"><a href="https://www.instagram.com/somoscivilescuelaing/" target="_blank"><img src="img/Navegacion/icono-instagram.png" class="img-fluid" alt="instagram"></a></li>
                           <li class="list-inline-item"><a href="https://www.youtube.com/user/escuelacolingenieria" target="_blank"><img src="img/Navegacion/icono-youtube.png" class="img-fluid" alt="youtube"></a></li>
                       </ul>
                   </li>
               </ul>
            </div>
            <div class="col-12 derechos-reservados">
                <p>
                    Todos los derechos reservados ©2011 - Escuela Colombiana de Ingeniería Julio Garavito. Personería Jurídica 086 de enero 19 de 1973. Renovación de Acreditación Institucional de Alta Calidad. Resolución 002710 del 18 de marzo de 2019 (vigencia de 6 años). Vigilada por Mineducación.
                </p>
            </div>
        </div>
    </div>
</footer>
    </body>
    
</html>
</html>
