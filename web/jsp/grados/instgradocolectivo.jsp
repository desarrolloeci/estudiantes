<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%  
    response.setHeader("Cache-Control","no-cache"); 
    String nombre = new String((String)session.getAttribute("nombre"));
    String igrad =  new String((String)session.getAttribute("igrad"));
    String iddpto =  new String((String)session.getAttribute("iddpto"));
    String impr = request.getParameter("imprimir");
    PrintWriter oout = response.getWriter() ;
    Estudiante est = (Estudiante) session.getAttribute("estClase") ;
    Vector solicitud = est.getSolPreGrad(carnet);
    int estado, i;
    estado = Integer.parseInt(est.getEstado());
    if(!igrad.equals("C") && !igrad.equals("O")){
        if(estado>0)
            response.sendRedirect("menuServEstud");
        else
            response.sendRedirect("menuServEstud1");
    }else{
        Vector despinfopar = new Vector();
        Vector infoPar = est.getParTramGrad("4");
        Vector despinfopar2 = est.getParTramGrad("6");
        for(i=0 ; i < infoPar.size() ; i++)
            despinfopar.addElement((String)((Vector)infoPar.elementAt(i)).elementAt(0));
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios Acad&eacute;micos - Grado Colectivo</title>
        
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
                    <%if(impr == null){%>
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
                                    <label id="msj">Grado Colectivo</label></font></h2>
                    </div></td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" border="0" align="center" class="tabla">

        <tr> 
          <td valign="top">
                  <div align="center">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tabla">
                      <tr>
                        <td width="15%"><img src="img/logo.gif" width="83" height="90"></td>
                        <td width="85%"><div align="left"><strong>ESCUELA COLOMBIANA
                            DE INGENIER&Iacute;A &quot;JULIO GARAVITO&quot;<br>
  INSTRUCTIVO PARA ACCEDER A LA CEREMONIA DE GRADOS COLECTIVA</strong><br>
  GRADUANDOS EN LOS PROGRAMA DE:</div>                          <p align="left"> INGENIER&Iacute;A CIVIL, EL&Eacute;CTRICA,
                            SISTEMAS, INDUSTRIAL, ELECTR&Oacute;NICA, ECONOM&Iacute;A,
                        ADMINISTRACI&Oacute;N, MATEM&Aacute;TICAS E INGENIERÍA MECÁNICA</p></td>
                      </tr>
                    </table>
            </div>              <!--<strong>Promoci&oacute;n <%=despinfopar.elementAt(5)%></strong>--><br>              <p>Para el tr&aacute;mite de grado debe:<br>
              ENCONTRARSE A PAZ Y SALVO POR TODO CONCEPTO CON LA INSTITUCI&Oacute;N
               Reglamento Estudiantil Art&iacute;culo 106</p>              
            <p>Favor entregar en la Oficina de Coordinaci&oacute;n de Grados
                    bloque A primer piso ventanilla No.8, la siguiente documentaci&oacute;n:<br><br>
                    1.	ENTREGA DE DOCUMENTOS PARA PREGRADO DEL <strong> <%=despinfopar.elementAt(0)%></strong> HASTA <strong><%=despinfopar.elementAt(1)%></strong> Y PARA POSGRADO DEL 13 AL 19 DE AGOSTO de 2015.<br>
                    
                    1.1 Solicitud preliminar de grado.
                     <!% if (solicitud.elementAt(17).equals("")){%>
                        <strong><a href="SolicitudPreGrado">CLIC AQU&Iacute;</a></strong><br>
                     <!% } else {%>
                       <!-- <strong><a href="ImprimirSolPreGrad">CLIC AQU&Iacute;</a></strong><br>-->
                     <!% } %>

                      1.2 Solicitud aprobaci&oacute;n de grado. <strong><a href="SolicitudAprobGrado">CLIC
                      AQU&Iacute;</a></strong><br>1.3 Fotocopia legible de la C&eacute;dula de Ciudadan&iacute;a
                    por ambas caras, ampliada a 150%.<br>
                      1.4 Certificaci&oacute;n de presentaci&oacute;n o certificado de resultado del examen
                      ECAES o Saber Pro,  expedida por el ICFES (Ley 1324 de 2009) SOLO PARA PREGRADO.
                      <br>
                      1.5 Una fotograf&iacute;a reciente, de
                      frente, tama&ntilde;o
                    3 x 4 cm, a color fondo blanco, (No pueden ser instant&aacute;neas).<br>
                        1.6 En caso que haya solicitado intenci&oacute;n de doble
                    programa y desea continuar el Doble Programa deber&aacute; entregar
                    el formulario correspondiente. Solo para pregrado. <strong><a href="http://tycho.escuelaing.edu.co/contenido/documentos/formulario_dobleprog.pdf" target="_blank">Descargar aquí</a></strong>
                      <br>
                      <%if(estado!=-107){ %>
                      1.7 Diligenciamiento de la Encuesta del Momento del Grado, solicitada por el Ministerio de Educación Nacional, donde pregunta la fecha de grado escriba la del día que la diligencia, a través del siguiente link:
                      <a href="http://www.graduadoscolombia.edu.co/encuesta/" target="_blank">http://www.graduadoscolombia.edu.co/encuesta/</a>. Solo para pregrado.<br><br>
                      <%}%>
                      2. PAGO DE LOS GASTOS DE GRADO DEL <strong><%=despinfopar.elementAt(9)%></strong> AL <strong><%=despinfopar.elementAt(10)%> </strong> PARA PREGRADO Y PARA POSGRADO DEL 14 HASTA EL 20 DE AGOSTO de 2015. El horario del banco Corpbanca de la Escuela es de 8:30 a.m. a 1:00 p.m. y de 2:00 p.m. a 4:00 p.m. y la caja de la escuela de 8:00 a.m. a 12:00 p.m y de 1:00 p.m. a 4:00 p.m.</p>
                    <p> S&oacute;lo pueden pagar gastos de grado aquellos estudiantes
                    que cumplan con todos los requisitos establecidos:<br><strong> VALOR: $ <%=despinfopar.elementAt(11)%></strong><br>

                        <!--Puede pagar en la Caja de la ESCUELA, en las siguientes
                    modalidades: <br>-	Tarjeta de cr&eacute;dito (titular de la tarjeta con c&eacute;dula)<br>
                      - Tarjeta d&eacute;bito<br>
                      -	Cheque personal, previamente avalado por Fenalco o Covinoc <br>
                      -	Cheque de gerencia<br>
                      -	Combinaci&oacute;n de cualquiera de las anteriores con
                      efectivo, </p>            
                    <p> Si usted va a cancelar en efectivo:<br> Deber&aacute; hacer
                      una consignaci&oacute;n en el Banco de Occidente cuenta
                      No. 255-03548-7 o en el Banco BBVA cuenta No. 310-00109-4
                      a favor de la Escuela Colombiana de Ingenier&iacute;a
  Julio Garavito. <br> Debe entregar copia del recibo de caja o la consignaci&oacute;n
                      en la Oficina de Coordinaci&oacute;n de Grados. En este
                      recibo debe registrar el nombre del graduando, su documento
                      de identidad y en el campo Referencia debe indicar el No.
                      del Carn&eacute;. --></p>
                    <p align="justify"> Usted puede realizar este pago en línea o en la caja de la Escuela únicamente con tarjeta débito o crédito.  Para pago en efectivo imprimir el comprobante con el código de barras y páguelo en cualquier sucursal del Banco de Occidente, Banco Corpbanca, Banco Davivienda. <br>
                      <a href="http://tycho.escuelaing.edu.co/PagosenLinea/loginEst"> >>Pagos en línea.</a> (siga las instrucciones)<br>
                      Debe entregar el recibo de caja o la consignación en la Oficina de Coordinación de Grados.<br></p>
                    <p align="justify"><strong>NOTA:</strong> Si usted no cumple con estos requisitos dentro de
                      las fechas indicadas, la ESCUELA asumir&aacute; que no
                      participar&aacute; en la Ceremonia de entrega de Diplomas Colectiva correspondiente a esta promoción. <!--del <strong><11%=despinfopar.elementAt(5)%></strong></strong>--></p>
            <p align="justify">3. La solicitud de grado, previo cumplimiento
              de los requisitos exigidos y de procedimiento interno, se presentar&aacute; al
              Consejo Directivo en su reuni&oacute;n
  del <strong><%=despinfopar.elementAt(2)%></strong></p>
                    <p>4.	La entrega de las tarjetas de invitaci&oacute;n a la
                      ceremonia de entrega de diplomas, se realizar&aacute;
  del <%out.println(((Vector)despinfopar2.elementAt(0)).elementAt(0));%>en la Oficina de Coordinaci&oacute;n de Grados,  bloque A primer piso,
  ventanilla N° 8, de 8:30 a.m. a 1:00 p.m. y de 2:00 p.m. a 4:30 p.m.</p>
                    <p><fieldset><legend>MATRICULA PROFESIONAL</legend>
                     <a href="http://www.escuelaing.edu.co/es/comunidad/estudiantes/procedimientos/2">
 http://www.escuelaing.edu.co/es/comunidad/estudiantes/procedimientos/2</a><BR>
                    Señor:  GRADUANDO

Si desea que la Escuela le colabore en la obtención de su <u>matrícula profesional</u>, deberá diligenciar
el formulario correspondiente a su programa, que se encuentra ubicado en la página
web &quot;www.escuelaing.edu.co&quot;, Servicios a Estudiantes, Proceso de
Grado,en la opción Trámite de
matrícula profesional. Una vez diligenciado el formulario debe entregarlo junto
con los documentos exigidos en la Oficina de Coordinación de Grados del 29 de julio al 05 de agosto de 2015.
                    </fieldset><br>
                    <strong>SI REQUIERE INFORMACI&Oacute;N ADICIONAL</strong>,
                    FAVOR COMUNICARSE CON LA OFICINA DE <strong>COORDINACI&Oacute;N DE
                    GRADOS,</strong> bloque A primer piso, ventanilla N° 8, de 8:30 a.m. a 1:00 p.m. y de 2:00 p.m. a 5:00 p.m.<br> Tel&eacute;fono 6683600 Ext.
                    339 coordgrados@escuelaing.edu.co o luz.ospina@escuelaing.edu.co
                    <%if(impr == null){%>
                <form name="form1" method="post" action="">
                    <div align="center">
                        <input name="imprimir" type="submit" id="imprimir" value="Imprimir" class="boton" onclick="javascript: return enviar();">
                    </div>
            </form>
            <%}%>
        </td>
        </tr>
      </table>                    </td>
                </tr>
            </table>
        </div><!--container-->
    </body>
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
</html>
</html>
<% }%>