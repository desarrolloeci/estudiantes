<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%
        response.setHeader("Cache-Control", "no-cache");
        String nombre = new String((String) session.getAttribute("nombre"));
        String igrad = new String((String) session.getAttribute("igrad"));
        String iddpto = new String((String) session.getAttribute("iddpto"));
        String impr = request.getParameter("imprimir");
        PrintWriter oout = response.getWriter();
        Estudiante est = (Estudiante) session.getAttribute("estClase");
        Vector solicitud = est.getSolPreGrad(carnet);
        int estado, i;
        estado = Integer.parseInt(est.getEstado());
        if (!igrad.equals("C") && !igrad.equals("O")) {
            if (estado > 0) {
                response.sendRedirect("menuServEstud");
            } else {
                response.sendRedirect("menuServEstud1");
            }
        } else {
            Vector despinfopar = new Vector();
            Vector infoPar = est.getParTramGrad("5");
            Vector despinfopar2 = est.getParTramGrad("6");
            for (i = 0; i < infoPar.size(); i++) {
                despinfopar.addElement((String) ((Vector) infoPar.elementAt(i)).elementAt(0));
            }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios Acad&eacute;micos - Grado Individual</title>

        <!-- JavaScript -->
        <script type="text/javascript" src="scripts/wufoo.js"></script>

        <!-- CSS -->
        <%  if (impr != null) {%>
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
            .texto1 {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 12px;
                font-style: normal;
                line-height: normal;
                font-weight: normal;
                font-variant: normal;
                text-transform: none;
                text-decoration: none;
                color: #333333;
            }
            -->
        </style>
        <%  } else {%>
        <link rel="stylesheet" type="text/css" href="Navegacion/css/estilo-escuela.css">
<link rel="stylesheet" href="Navegacion/css/bootstrap.min.css">
        <%  }%>
        <script language="JavaScript" type="text/JavaScript">
            <!--
            //-->
        </script>
    </head>
      <body id="public" style="background-color: white">
        <div id="container">
            <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
                <tr>
                    <td colspan="2" bgcolor="#EEEEEE"><%if (impr == null) {%><img src="img/top.gif" alt="" width="770" height="10" id="top" /><%}%></td>
                </tr>
                <tr>
                    <td>
                        <%if (impr == null) {%>
                        <jsp:include page="encabezado" flush="true">
                            <jsp:param name="anterior" value="menuServEstud" />
                        </jsp:include>
                        <%}%>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="info" align="center">
                            <h2><font color="#666666">
                                    <label id="msj">Grado individual</label>
                            </font></h2>
                    </div></td>
                </tr>
                <tr>
                    <td>
                        <div align="center">
                            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tabla">
                                <tr>
                                    <td width="15%"><img src="img/logo.gif" width="83" height="90"></td>
                                    <td width="85%"><div align="left"><strong>ESCUELA
                                                COLOMBIANA DE INGENIER&Iacute;A &quot;JULIO
                                                GARAVITO&quot;<br>
                                            INSTRUCTIVO PARA ACCEDER A LA CEREMONIA DE GRADOS INDIVIDUAL</strong><br>
                                            GRADUANDOS EN LOS PROGRAMAS DE PREGRADO Y POSGRADO
                                            
                                    </div>                          </td>
                                </tr>
                            </table>
                        </div>              <strong>Promoci&oacute;n <%=despinfopar.elementAt(3)%></strong><br>
                        <p>Para el tr&aacute;mite de grado debe:<br>
                            ENCONTRARSE A PAZ Y SALVO POR TODO CONCEPTO CON LA INSTITUCI&Oacute;N
                        Reglamento Estudiantil Art&iacute;culo 106</p>
                        Favor entregar en la Oficina de Coordinaci&oacute;n de Grados
                        bloque A primer piso ventanilla No.8, la siguiente documentaci&oacute;n:<br>                    <br>
                        1.	ENTREGA DE DOCUMENTOS ANTES DEL <strong> <%=despinfopar.elementAt(0)%></strong>.<br>
                        1.1 Solicitud preliminar de grado.
                        <% if (solicitud.elementAt(17).equals("")) {%>
                        <strong><a href="SolicitudPreGrado">CLIC AQU&Iacute;</a></strong><br>
                        <% } else {%>
                        <strong><a href="ImprimirSolPreGrad">CLIC AQU&Iacute;</a></strong><br>
                        <% }%>
                        1.2 Solicitud aprobaci&oacute;n de grado. <strong><a href="SolicitudAprobGradoIndiv">CLIC
                        AQU&Iacute;</a></strong><br>
                        1.3 Fotocopia legible de la C&eacute;dula de Ciudadan&iacute;a
                        por ambas caras, ampliada a 150%.<br>                        
                        1.4 Certificaci&oacute;n de presentaci&oacute;n o certificado de resultado del examen
                      ECAES o Saber Pro,  expedida por el ICFES (Ley 1324 de 2009) SOLO PARA PREGRADO.<br>
                        1.5  Una fotograf&iacute;a reciente, de
                        frente, tama&ntilde;o
                        3 x 4 cm., a color fondo blanco. (No pueden ser instant&aacute;neas).<br>
                        1.6 En caso que haya solicitado intenci&oacute;n de doble
                        programa y desea continuar el Doble Programa deber&aacute; entregar
                        el formulario correspondiente. <strong><a href="http://tycho.escuelaing.edu.co/contenido/documentos/formulario_dobleprog.pdf" target="_blank">Descargar aquí</a></strong><br>
                        <%if(estado!=-107){ %>
                        1.7 Diligenciamiento de la Encuesta del Momento del Grado, solicitada por el Ministerio de Educación Nacional a través del siguiente link:
                        <a href="http://www.graduadoscolombia.edu.co/encuesta/" target="_blank">http://www.graduadoscolombia.edu.co/encuesta/</a><br>
                        <%}%>
                        <p><B>NOTA:</B> Sin la entrega de estos documentos no se puede activar el pago.</p>
                        <p>                      
                        2.	PAGO DE LOS GASTOS DE GRADO DEL <strong><%=despinfopar.elementAt(7)%></strong> </p>
                        <p> S&oacute;lo pueden pagar gastos de grado aquellos estudiantes
                        que cumplan con todos los requisitos establecidos:<br><strong> VALOR: $ <%=despinfopar.elementAt(8)%></strong></p>
                        <p>
                            Usted puede realizar este pago en línea o en la caja de la Escuela únicamente con tarjeta débito o crédito.  Para pago en efectivo imprimir el comprobante con el código de barras y páguelo en cualquier sucursal del Banco de Occidente, Banco Corpbanca, Banco Davivienda. <br>
                      <a href="http://tycho.escuelaing.edu.co/PagosenLinea/loginEst"> >>Pagos en línea.</a> (siga las instrucciones)
                            <!--<br>Debe entregar el recibo de caja o la consignación en la Oficina de Coordinación
                            de Grados<br>-->
                        </p>
                        <p align="justify">3. Debe entregar copia del recibo de caja o la
                            consignaci&oacute;n en la Oficina de Coordinaci&oacute;n de Grados.
                            </p>
                        <p align="justify">4. La solicitud de grado se presentar&aacute; al
                            Consejo Directivo el mes siguiente a su solicitud, previo cumplimiento
                            de los requisitos exigidos y de
                        procedimiento interno.</p>
                        <p>5. La entrega del diploma se realizar&aacute; en la fecha
                            fijada por la direcci&oacute;n de la
                            Escuela despu&eacute;s de la reuni&oacute;n del Consejo
                        Directivo.</p>
                        <p>6. <font color="#990000">El tr&aacute;mite de la tarjeta de la matr&iacute;cula
                                profesional ser&aacute; de responsabilidad del egresado.
                                La Escuela no se hace responsable del tr&aacute;mite en
                        la modalidad de grado individual.</font></p>
                        <br>
                        <strong>SI REQUIERE INFORMACI&Oacute;N ADICIONAL</strong>,
                        FAVOR COMUNICARSE CON LA OFICINA DE <strong>COORDINACI&Oacute;N
                        DE GRADOS, </strong>  bloque A primer piso, ventanilla N° 8, de 8:30 a.m. a 1:00 p.m. y de 2:00 p.m. a 5:00 p.m.<br> Tel&eacute;fono 6683600 Ext.
                    339 coordgrados@escuelaing.edu.co o luz.ospina@escuelaing.edu.co
                        <%if (impr == null) {%>
                        <form name="form1" method="post" action="">
                            <div align="center">
                                <input name="imprimir" type="submit" id="imprimir" value="Imprimir" class="boton" onclick="javascript: return enviar();">
                            </div>
                        </form>
                        <%}%>
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
<%}%>