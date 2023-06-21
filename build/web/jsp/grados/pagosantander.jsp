<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.DecimalFormat" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.Estudiante.EstudFin" %>

<%
int tmp, dg, div, dgfin, dgfin2, modtmp, i;
String ref2, tmpchar, sec, nrocarne;
response.setHeader("Cache-Control","no-cache"); 
String nombre = new String((String)session.getAttribute("nombre"));
String ban = new String((String)session.getAttribute("ban"));
String igrad = new String((String) session.getAttribute("igrad"));
if(!igrad.equals("O")){
    response.sendRedirect("menuServEstud");
}else{
    String imprimir = request.getParameter("imprimir");
    String tipopg = request.getParameter("tipo");
    PrintWriter oout = response.getWriter() ;
    //        Estudiante est = new Estudiante(carnet,oout) ;
    Estudiante est = (Estudiante) session.getAttribute("estClase") ;
    Vector datosEst = est.getInfoPerInter(carnet);
    EstudFin estfin = new EstudFin();
    //Vector veringles = est.getVerifPerInter(carnet);
    nrocarne = carnet;
    int estado = Integer.parseInt(est.getEstado());
    while(nrocarne.length() < 7){
        nrocarne = "0" + nrocarne;
    }
    if(datosEst.size()>0 /*&& veringles.size() > 0*/){
        Vector datos = (Vector)datosEst.elementAt(0);
        // Una Asignatura: 
        ref2 = "0506" + valref2(nrocarne);
        sec = "1212121212121212";
        dg = 0;
        for(i=0; i<ref2.length(); i++){
            tmpchar = String.valueOf(ref2.charAt(i));
            tmp = Integer.parseInt(tmpchar);
            tmpchar = String.valueOf(sec.charAt(i));
            tmp = tmp * Integer.parseInt(tmpchar);
            if(tmp >= 10){
                div = tmp/10;
                dg = dg + div + tmp%10;
            }else{
                dg = dg + tmp;
            }
        }
        modtmp = dg%10;
        if(modtmp > 0){
            dgfin = 10 - modtmp;
        }else{
            dgfin = 0;
        }
        if(imprimir == null){
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Pago derechos de grado</title>
        
        <!-- JavaScript -->
        <script type="text/javascript" src="scripts/wufoo.js"></script>
        
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="Navegacion/css/estilo-escuela.css">
<link rel="stylesheet" href="Navegacion/css/bootstrap.min.css">
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function MM_openBrWindow(theURL,winName,features) { //v2.0
              window.open(theURL,winName,features);
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
                        <jsp:param name="anterior" value="PagoDerGrad" />
                    </jsp:include>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="info" align="center">
                            <h2><font color="#666666">
                                    <label id="msj">Datos b&aacute;sicos
                          de pago - Derechos de Grado</label></font></h2>
                    </div></td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" border="0" align="center" class="texto">
        <tr> 
          <td height="6" colspan="2" > 
            <div>
              <div align="center">
                <p><font face="Verdana, Arial, Helvetica, sans-serif"><font color="#666666" size="2"><u></u></font></font></p>    
                <p align="justify" class="texto2">
               <%if(tipopg.equals("santander")){%> 
                Presentar esta informaci&oacute;n en el Banco Santander para recaudo
                con el c&oacute;digo 0506 
                <br>
                <br>
                El pago de los derechos de grado lo puede realizar en cualquier
                <a href="http://www.escuelaing.edu.co/documentos/listado_oficinas_santander.pdf">sucursal
                del Banco Santander a nivel nacional</a> en el horario Bancario.
                Sucursales Banco Santander , presentando al cajero el formato impreso &#8220;Datos
                b&aacute;sicos de pago&#8221;.
                <%}else if(tipopg.equals("caja")){%>
                En la Caja de la Escuela Colombiana de Ingenier&iacute;a, se
                recibir&aacute;n &uacute;nicamente pagos con tarjeta de cr&eacute;dito
                o debito, presentando al cajero el formato impreso (Datos b&aacute;sicos
                de pago), junto con el valor correspondiente. El horario de atenci&oacute;n
                es de 1:00 pm. a 5:00 pm.<br><br>
                En caso de cancelar con tarjeta de cr&eacute;dito debe venir
                  el titular de la tarjeta en caso contrario traer carta de autorizaci&oacute;n
                  autenticada y documento de identidad.<br>
                  <%}%>
                <br>
                <br>
                Una vez realizado el pago, entregue en la
                  Oficina de Coordinaci&oacute;n de Grados una copia de la consignaci&oacute;n o del recibo de caja 
                indicando el n&uacute;mero de carn&eacute; y nombre del graduando. <br>&nbsp;          
              </div>
            </div>          </td>
        </tr>
        <tr> 
          <td width="28%" align="left" valign="top">Nombre:</td>
          <td width="72%" align="left" valign="top"><%=nombre%></td>
        </tr>
        <tr> 
          <td width="28%" align="left" valign="top">Programa:</td>
          <td width="72%" align="left" valign="top"><%=datos.elementAt(2)%></td>
        </tr>
        <tr> 
          <td colspan="2" align="center" valign="top"><hr></td>
        </tr>
        <tr> 
          <td width="28%" align="left" valign="top">C&oacute;digo del estudiante:</td>
          <td width="72%" align="left" valign="top">0506<%=valref2(nrocarne)%><%=dgfin%></td>
        </tr>
        <tr> 
          <td width="28%" align="left" valign="top">Programa:</td>
          <td width="72%" align="left" valign="top"><%=valref3(datos.elementAt(5).toString())%></td>
        </tr>
        <tr> 
          <td width="28%" align="left" valign="top">Documento de identidad :</td>
          <td width="72%" align="left" valign="top"><%=datos.elementAt(3)%></td>
        </tr>
		
        <tr> 
          <td width="28%" align="left" valign="top">Valor a pagar:</td>
          <td width="72%" align="left" valign="top">$ <%=estfin.getValDerGrad()%> </td>
        </tr>
        <tr> 
          <td colspan="2" align="center" valign="top"><hr></td>
        </tr>
        <tr> 
          <td colspan="2" align="center" valign="top"> 
            <input name="Submit" type="button" onClick="MM_openBrWindow('PagoDerSantander?imprimir=imprimir&tipo=<%=tipopg%>','imp','toolbar=yes,location=yes,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=800,height=600')" value="Imprimir" class="boton">          </td>
        </tr>
        <tr> 
          <td colspan="2" align="left" valign="top"><div align="center"><b><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif">Pagar
          antes del 5 de febrero de 2009<br>
          Los pagos con tarjeta d&eacute;bito o tarjeta cr&eacute;dito &uacute;nicamente
          se recibir&aacute;n en la Caja de la Escuela de
           9:00 am. a 12:00 pm. o de 1:00 pm. a 5:00 pm.</font></b></div></td>
        </tr>

      </table>
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
<%      }else{%>
<html>
<head>
<title>Pago derechos de grado</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.texto {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function impresion(){
    window.print();
    window.close();
}
//-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" onLoad="">
<table width="640" border="1" cellpadding="0" align="center" cellspacing="0">
    <tr>
    <td width="640" height="42" valign="top"> 
    <table width="640" border="0" cellpadding="0" align="center" cellspacing="0">
    <tr>
    <td width="640" height="42" valign="top"> 
      <table width="100%" border="0" align="center" class="texto">
	  	<tr> 
          <td colspan="2" align="left" valign="top">
		  <table width="100%" border="0" align="center" class="texto">
		  <tr> 
          <td height="6" > 
            <div>
              <div align="center">
                <p><img src="img/logo.gif" width="83" height="90"></p>
              </div>
            </div>
          </td>
          <td height="6" ><p><strong>Datos b&aacute;sicos
                      de pago - Derechos de Grado</strong></p>
          <%if(tipopg.equals("santander")){%>
            <p>Presentar esta informaci&oacute;n en el Banco Santander para recaudo
                con el c&oacute;digo 0506</p></td>
          <%}%>
        </tr>	
		  </table>
		  </td>
        </tr>  
        <tr> 
          <td colspan="2"><br>
                Una vez realizado el pago, entregue en la
                  Oficina de Coordinaci&oacute;n de Grados una copia de la consignaci&oacute;n
                indicando el n&uacute;mero de carn&eacute; y nombre del graduando. <br>&nbsp;</td>
        </tr>
        <tr> 
          <td width="28%" align="left" valign="top">Nombre:</td>
          <td width="72%" align="left" valign="top"><%=nombre%></td>
        </tr>
        <tr> 
          <td align="left" valign="top">Programa:</td>
          <td align="left" valign="top"><%=datos.elementAt(2)%></td>
        </tr>
        <tr> 
          <td colspan="2" align="center" valign="top"><hr></td>
        </tr>
        <tr> 
          <td align="left" valign="top">C&oacute;digo del estudiante:</td>
          <td align="left" valign="top">0506<%=valref2(nrocarne)%><%=dgfin%></td>
        </tr>
        <tr> 
          <td align="left" valign="top">Programa:</td>
          <td align="left" valign="top"><%=valref3(datos.elementAt(5).toString())%></td>
        </tr>
        <tr> 
          <td align="left" valign="top">Identificaci&oacute;n del estudiante:</td>
          <td align="left" valign="top"><%=datos.elementAt(3)%></td>
        </tr>
		
        <tr> 
          <td align="left" valign="top">Valor a pagar:</td>
          <td align="left" valign="top">$ <%=estfin.getValDerGrad()%></td>
        </tr>
        <tr> 
          <td colspan="2" align="center" valign="top"><hr></td>
        </tr>
        <tr> 
          <td colspan="2" align="left" valign="top">
		  <div align="center"><b>Pagar
          antes del 5 de febrero de 2009<br>
          Los pagos con tarjeta d&eacute;bito o tarjeta cr&eacute;dito &uacute;nicamente
          se recibir&aacute;n en la Caja de la Escuela de
          9:00 am. a 12:00 pm. o de 1:00 pm. a 5:00 pm.</b></div></td>
          
        </tr>
      </table>
    </td>
  </tr>
</table>

    </td>
  </tr>
</table>
</body>
</html>
<%      }
    }
}
%>

<%!
    public String valref3(String ref){
        while(ref.length() < 3){
            ref = "0" + ref;
        }
        return ref;
    }
%>
<%!
    public String valref2(String ref){
        while(ref.length() < 7){
            ref = ref + "0";
        }
        return ref;
    }
%>