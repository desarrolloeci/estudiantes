<%@ include file="../secure.jsp" %>
<%@ page import="java.util.Vector, java.text.NumberFormat" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.Estudiante.EstudFin" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%@ page import="org.apache.commons.codec.digest.DigestUtils"%>

<%  
    response.setHeader("Cache-Control","no-cache"); 
    String nombre = new String((String)session.getAttribute("nombre"));
    String ban = new String((String)session.getAttribute("ban"));
    Vector asig = new Vector () ;
    int i = 0 ;
    long val = 0;
    NumberFormat nf = NumberFormat.getIntegerInstance() ;    
    Vector tot = new Vector () ;    
    Estudiante est = (Estudiante) session.getAttribute("estClase") ;
    EstudFin efin = new EstudFin(est.getIdEst()) ;
    String pag = new String(""), modo = new String("Ordinaria"), blq;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios Académicos - Forma de Pago de derechos de Matrícula</title>
        
        <!-- JavaScript -->
        <script type="text/javascript" src="scripts/wufoo.js"></script>
        
        <!-- CSS -->
         <link rel="stylesheet" type="text/css" href="Navegacion/css/estilo-escuela.css">
<link rel="stylesheet" href="Navegacion/css/bootstrap.min.css">
        <script language="JavaScript" type="text/JavaScript">
            <!--
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
                                    <label id="msj">Forma de Pago de derechos de Matrícula</label>
                            </font></h2>
                    </div></td>
                </tr>
                <tr>
                    <td>
<% 
    if ( Integer.parseInt(est.getEstado()) <= -91) {
    
%>       
            <form method="POST" action="confpgasigp">
            <table width="640" border="0" align="center" cellpadding="0" cellspacing="1" class = "tabla">
              <tr>
                <td width="15%" align="center"><b>Cd.Asig</b></td>
                <td width="55%" align="center"><b>Asignatura</b></td>
                <td width="15%" align="center"><b>Valor</b></td>
                <td width="15%" align="center"><b>Seleccione</b></td>
              </tr>
<%      Vector lisas = new Vector(efin.getAsigPagar()) ;
        for (i = 0 ; i < lisas.size(); i++) {
            asig = (Vector) lisas.elementAt(i) ;
            pag = "checked" ;
            if ( asig.elementAt(4).toString().equals("-1") )
                pag = "" ;
%>            <tr>
                <td width="15%"><%=asig.elementAt(1)%>
                   <input type="hidden" name="ida<%=i%>" value="<%=asig.elementAt(6)%>"></td>
                <td width="55%"><%=asig.elementAt(2)%></td>
                <td width="15%" align="right">$<%=nf.format(Integer.parseInt((String) asig.elementAt(3)))%></td>
                <td width="15%" align="center">
                    <input type="checkbox" name="c<%=i%>" value="ON" <%=pag%>></td>
              </tr>
<%      }
%>
            </table>
              <p align="center" >
                <input type="hidden" name="casig" value="<%=i%>">
                <input type="submit" value="Confirma Información para el Pago" name="B1"></p>
            </form>
<% } 
  else {
      configECI cfgEci = new configECI();
      Vector lisord = new Vector(efin.getOrden()) ;
        if (lisord.size() == 1 ) {
            tot = (Vector) lisord.elementAt(i) ;
            blq = tot.elementAt(11).toString();
            if(blq.equals("N")){
                int lim = Integer.parseInt((String) tot.elementAt(6)) ;
                if (lim <= 0) {
                    val = Long.parseLong((String) tot.elementAt(5)) ;
                } else {
                    val = Long.parseLong((String) tot.elementAt(7)) ;
                    modo = "Extraordianria" ;
                }
                String claveSecreta = "11cbabc1c8f";
                int usuarioId = 26989;
                String refVenta = tot.elementAt(3).toString();
                double valor = new Double(val).doubleValue();
                String cadena = claveSecreta + "~" + usuarioId + "~" + refVenta + "~" + val + "~COP";
                String firma = DigestUtils.md5Hex(cadena);
    %>
                <table width="640" border="0" align="center" cellpadding="0" cellspacing="1" class="tabla">
                <tr>
                    <td width="30%">
                        <b> Documento </b></td>
                    <td width="70%"><%=tot.elementAt(0)%></td>
                </tr>
                <tr>
                    <td width="30%">
                        <b> Estudiante</b></td>
                    <td width="70%"><%=tot.elementAt(1)%></td>
                </tr>
                <tr>
                    <td width="30%">
                        <b> Orden Matrícula</b></td>
                    <td width="70%"><%=tot.elementAt(4)%></td>
                </tr>
                <tr>
                    <td width="30%">
                        <b> Valor </b></td>
                    <td width="70%">$ <%=nf.format(val)%>    (<%=modo%>)</td>
                </tr>
                <tr>
                    <td width="30%">
                        <b> IVA </b></td>
                    <td width="70%">$ 0.00</td>
                </tr>
                <tr>
                  <td colspan="2">
				  
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="50%"><form method="POST" action="https://gateway2.pagosonline.net/apps/gateway/index.html">
				  <div align="center">
                  <input type="hidden" name="firma" value="<%=firma%>">
                  <input type="hidden" name="usuarioId" value="26989">
                  <input type="hidden" name="descripcion" value="Pagos en linea">
                  <input type="hidden" name="refVenta" maxlength="80" value="<%=tot.elementAt(3)%>">
                  <input type="hidden" name="documentoIdentificacion" maxlength="20" value="<%=tot.elementAt(0)%>">
                  <input type="hidden" name="nombreComprador" maxlength="80" value="<%=tot.elementAt(1)%>">
                  <input type="hidden" name="extra1" maxlength="80" value="<%=tot.elementAt(4)%>">
                  <input type="hidden" name="extra2" maxlength="80" value="<%=tot.elementAt(2)%>">
                  <input type="hidden" name="plantilla" value="esccoling">
                  <input type="hidden" name="valor" maxlength="10" value="<%=val%>">
                  <input type="hidden" name="baseDevolucionIva" maxlength="8" value="0">   
                  <input type="hidden" name="iva" maxlength="8" value="0">     
                  <input type="hidden" name="moneda" value="COP">           
                  <input type="hidden" name="prueba" value="1">
                      <input type="hidden" name="casig" value="<%=i%>">
                      <input type="submit" value="Enviar" name="B1">
                  </div>
    </form></td>
    <td width="50%"><form method="POST" action="https://gateway2.pagosonline.net/apps/gateway/index.html">
				  <div align="center">
                  <input type="hidden" name="firma" value="<%=firma%>">
                  <input type="hidden" name="usuarioId" value="26989">
                  <input type="hidden" name="descripcion" value="Pagos en linea">
                  <input type="hidden" name="refVenta" maxlength="80" value="<%=tot.elementAt(3)%>">
                  <input type="hidden" name="documentoIdentificacion" maxlength="20" value="<%=tot.elementAt(0)%>">
                  <input type="hidden" name="nombreComprador" maxlength="80" value="<%=tot.elementAt(1)%>">
                  <input type="hidden" name="extra1" maxlength="80" value="<%=tot.elementAt(4)%>">
                  <input type="hidden" name="extra2" maxlength="80" value="<%=tot.elementAt(2)%>">
                  <input type="hidden" name="valor" maxlength="10" value="<%=val%>">
                  <input type="hidden" name="baseDevolucionIva" maxlength="8" value="0">   
                  <input type="hidden" name="iva" maxlength="8" value="0">     
                  <input type="hidden" name="moneda" value="COP">           
                      <input type="hidden" name="casig" value="<%=i%>">
                      <input type="submit" value="Enviar" name="B1">
                  </div>
    </form></td>
  </tr>
</table>

				  </td>
                  </tr>
                </table>
<%  
            }else{
                %>Usted se encuentra con una obligación pendiente, por favor comuníquese con
                
                <%
            }
    }else{      
        out.println("No se encontraron registros para el periodo " + cfgEci.getPerOrdenes() + " o su pago ya está registrado");
    }
 }
%>
                    </td>
                </tr>
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
