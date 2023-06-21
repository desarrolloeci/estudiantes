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
                                    <label id="msj">Ceremonia de entrega de Diplomas</label></font></h2>
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
  INSTRUCTIVO PARA ACCEDER A LA CEREMONIA DE ENTREGA DE DIPLOMAS</strong></div><br>
</td>
                      </tr>
                    </table>
            </div>              <!--<strong>Promoci&oacute;n <%=despinfopar.elementAt(5)%></strong>--><br>
   <p style='margin-right:0cm;margin-left:0cm;font-size:15px;font-family:"Calibri",sans-serif;margin-top:0cm;margin-bottom:8.0pt;line-height:107%;'><span style='font-size: 12px; font-family: "Times New Roman", Times, serif; color: rgb(102, 102, 102);'>Para el tr&aacute;mite de grado debe:<br>&nbsp;ENCONTRARSE A PAZ Y SALVO POR TODO CONCEPTO CON LA INSTITUCI&Oacute;N - Reglamentos Estudiantiles.</span></p>
    <p style='margin-right:0cm;margin-left:0cm;font-size:15px;font-family:"Calibri",sans-serif;margin-top:0cm;margin-bottom:8.0pt;line-height:107%;text-align:justify;'><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">Se solicita a los candidatos enviar todos los documentos de grado que se numeran a continuaci&oacute;n en un solo correo electr&oacute;nico desde el <strong>correo electr&oacute;nico institucional&nbsp;</strong>(para facilitar la identidad del estudiante y la revisi&oacute;n de documentos) &nbsp;al correo: <a href="mailto:coordgrados@escuelaing.edu.co">coordgrados@escuelaing.edu.co</a> - Oficina de Coordinaci&oacute;n de Grados:</span></span></span></p>
    <p style='margin-right:0cm;margin-left:0cm;font-size:15px;font-family:"Calibri",sans-serif;margin-top:0cm;margin-bottom:8.0pt;line-height:107%;'><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;"><strong>1. ENV&Iacute;O DE DOCUMENTOS&nbsp;</strong></span></span></span></p>
    <p style='margin-right:0cm;margin-left:0cm;font-size:15px;font-family:"Calibri",sans-serif;margin-top:0cm;margin-bottom:8.0pt;line-height:107%;'><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;"><strong><u>DOCUMENTOS POSGRADO:</u></strong> Los primeros 10 d&iacute;as de cada mes. (por favor ingrese por INTERNET EXPLORER)</span></span></span></p>
    <ol>
        <li><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">Solicitud preliminar de grado, debidamente diligenciada y firmada. Por favor verifique sus nombres, apellidos, n&uacute;mero de documento y lugar de expedici&oacute;n (los nombres y apellidos deben quedar escritos como aparece en su documento de identidad con la primera letra en May&uacute;scula y lo dem&aacute;s en min&uacute;scula con la ortograf&iacute;a propia del nombre (tildes, etc..). <strong><a href="SolicitudPreGrado">CLIC AQU&Iacute;</a> (Este documento debe quedar impreso en una solo hoja, tama&ntilde;o carta, orientaci&oacute;n vertical, en una sola cara, en papel bond blanco nuevo, sin logos ni marcas de agua de entidades)</strong></span></span></span></li>
        <li><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><strong><span style="font-family: 'Times New Roman', Times, serif;">Solicitud aprobaci&oacute;n de grado debidamente firmada. <strong><a href="SolicitudAprobGrado">CLIC AQU&Iacute;</a> (Este documento debe quedar impreso en una solo hoja, tama&ntilde;o carta, orientaci&oacute;n vertical, en una sola cara, en papel bond blanco nuevo, sin logos ni marcas de agua de entidades)</strong></span></strong></span></span></li>
        <li><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><strong><span style="font-family: 'Times New Roman', Times, serif;">Fotocopia legible de la C&eacute;dula de Ciudadan&iacute;a por ambas caras, n&iacute;tida.</span></strong></span></span></li>
        <li><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><strong><span style="font-family: 'Times New Roman', Times, serif;">Una fotograf&iacute;a reciente, de frente, tipo documento, tama&ntilde;o 3 x 4 cm, a color fondo blanco (No pueden ser selfis). Esta fotograf&iacute;a ser&aacute; utilizada para todos los efectos institucionales. La fotograf&iacute;a se debe pegar en el documento Solicitud Preliminar de Grado en el espacio indicado para tal fin.</span></strong></span></span></li>
        <li><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><strong><span style="font-family: 'Times New Roman', Times, serif;">Diligenciar, colocar fecha y firmar (Solo firmas originales), escanear y enviar desde el correo electr&oacute;nico institucional al correo: <a href="mailto:coordgrados@escuelaing.edu.co"><strong>coordgrados@escuelaing.edu.co</strong></a> el formato de Tratamiento de Datos Personales que puede ser descargado en el siguiente <a href="https://www.escuelaing.edu.co/escuela/importantDoc/instructivo-para-acceder-ceremonia-de-grados-marzo2020-1posgrado.pdf"><strong>Enlace.</strong></a></span></strong></span></span></li>
        <li><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><strong><span style="font-family: 'Times New Roman', Times, serif;">El trabajo de grado debe estar grabado en el <a href="http://repositorio.escuelaing.edu.co/bitstream/001/338/5/Gu%C3%ADa%20de%20Autoarchivo%20Trabajos%20de%20Grado.pdf"><span style="text-decoration: none;">repositorio institucional</span></a> de la Biblioteca y no tener multas.</span></strong></span></span></li>
        <li style="text-align: left;"><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><strong><span style="font-family: 'Times New Roman', Times, serif;">Debe encontrarse a paz y salvo por todo concepto (Los paz y salvos los solicita internamente la Coordinaci&oacute;n de Grados) y haber entregado toda la documentaci&oacute;n para activar el pago.</span></strong></span></span></li>
    </ol>
    <p style='margin-right:0cm;margin-left:18.0pt;font-size:15px;font-family:"Calibri",sans-serif;margin-top:0cm;margin-bottom:8.0pt;line-height:107%;text-align:justify;'><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;"><strong>NOTA PARA POSGRADO: TODOS LOS DOCUMENTOS SE DEBEN ENVIAR ESCANEADOS Y LEGIBLES DESDE SU CORREO ELECTR&Oacute;NICO INSTITUCIONAL (UN SOLO CORREO POR ESTUDIANTE CON TODOS LOS DOCUMENTOS) AL CORREO:&nbsp;</strong><a href="mailto:coordgrados@escuelaing.edu.co"><strong>coordgrados@escuelaing.edu.co</strong></a><strong>&nbsp;.LA DOCUMENTACI&Oacute;N PARA GRADO DEBE ESTAR DEBIDAMENTE DILIGENCIADA, FIRMADA Y COMPLETA.</strong></span></span></span></p>
    <p style='margin-right:0cm;margin-left:0cm;font-size:15px;font-family:"Calibri",sans-serif;margin-top:0cm;margin-bottom:8.0pt;line-height:107%;'><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;"><strong><u>DOCUMENTOS PREGRADO:</u></strong> <strong>DEL 1&ordm; AL 12 DE JUNIO DE 2020 &ndash; Ingrese por INTERNET EXPLORER en la sesi&oacute;n de servicios acad&eacute;micos del portal web de la Escuela.&nbsp;</strong></span></span></span></p>
    <ol class="decimal_type" style="list-style-type: decimal;">
        <li><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">Solicitud preliminar de grado, debidamente diligenciada y firmada. Por favor verifique sus nombres, apellidos, n&uacute;mero de documento y lugar de expedici&oacute;n (Los nombres y apellidos deben quedar escritos como aparece en su documento de identidad con la primera letra en May&uacute;scula y lo dem&aacute;s en min&uacute;scula con la ortograf&iacute;a propia del nombre (tildes, etc..). <strong><a href="SolicitudPreGrado">CLIC AQU&Iacute;</a> (Este documento debe quedar impreso en una solo hoja, tama&ntilde;o carta, orientaci&oacute;n vertical, en una sola cara, en papel bond blanco nuevo, sin logos ni marcas de agua de entidades)</strong></span></span></span></li>
        <li><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">Solicitud aprobaci&oacute;n de grado debidamente firmada. <strong><a href="SolicitudAprobGrado">CLIC AQU&Iacute;</a> (Este documento debe quedar impreso en una solo hoja, tama&ntilde;o carta, orientaci&oacute;n vertical, en una sola cara, en papel bond blanco nuevo, sin logos ni marcas de agua de entidades)</strong></span></span></span></li>
        <li><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">Fotocopia legible de la C&eacute;dula de Ciudadan&iacute;a por ambas caras, n&iacute;tida.</span></span></span></li>
        <li><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">Copia de la certificaci&oacute;n de presentaci&oacute;n o certificado de resultado del examen ICFES-Saber Pro, expedida por el ICFES (Ley 1324 de 2009) <strong>&ndash; DOCUMENTO EXIGIDO</strong> <strong>SOLO PARA PREGRADO.</strong></span></span></span></li>
        <li><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">Una fotograf&iacute;a reciente tipo documento, de frente, tama&ntilde;o 3 x 4 cm, a color, fondo blanco, (No pueden ser selfis). Esta fotograf&iacute;a ser&aacute; utilizada para todos los efectos institucionales. La fotograf&iacute;a se debe pegar en el documento Solicitud Preliminar de Grado en el espacio indicado para tal fin.</span></span></span></li>
        <li><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">Diligenciar, colocar fecha y firmar (Solo firmas originales), escanear y enviar desde el correo electr&oacute;nico institucional al correo <a href="mailto:coordgrados@escuelaing.edu.co"><strong>coordgrados@escuelaing.edu.co</strong></a> el formato de Tratamiento de Datos Personales que puede ser descargado en el siguiente <a href="https://www.escuelaing.edu.co/escuela/importantDoc/instructivo-para-acceder-ceremonia-de-grados-marzo2020-1pregrado.pdf"><strong>Enlace</strong></a><strong>.</strong></span></span></span></li>
        <li><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">En caso de que haya solicitado intenci&oacute;n de doble programa y desea continuar el Doble Programa deber&aacute; entregar el formulario correspondiente. <strong>SOLO PARA PREGRADO.</strong> <a href="http://tycho.escuelaing.edu.co/contenido/documentos/formulario_dobleprog.pdf" target="_blank"><strong>Descargar aqu&iacute;</strong></a></span></span></span></li>
        <li><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">Diligenciamiento de la Encuesta del Graduado, solicitada por el Ministerio de Educaci&oacute;n Nacional. Al tramitar la encuesta se pregunta la fecha de grado (all&iacute; debe escribir la fecha del d&iacute;a en que diligencia la encuesta) y el n&uacute;mero del acta (all&iacute; se debe escribir 0000 cuatro ceros) a trav&eacute;s de este <a href="http://encuestasole.mineducacion.gov.co/hecaa-encuestas/"><strong>Enlace</strong></a><strong>&nbsp;</strong>. <strong>SOLO PARA PREGRADO.</strong></span></span></span></li>
        <li><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">Los estudiantes de Ingenier&iacute;a Biom&eacute;dica deben enviar el certificado con el resultado del examen de ingl&eacute;s a los &nbsp;correos: <a href="mailto:Casa@urosario.edu.co">Casa@urosario.edu.co</a><span style="text-decoration: underline;">&nbsp;</span>del Rosario con copia a<span style="text-decoration: underline;">&nbsp;&nbsp;</span><a href="mailto:coordgrados@escuelaing.edu.co">coordgrados@escuelaing.edu.co</a> de la Coordinaci&oacute;n de grados de la Escuela. Despu&eacute;s del env&iacute;o de este documento, el estudiante debe llamar a la l&iacute;nea de atenci&oacute;n de la Casa UR: 2970200 opci&oacute;n 3 y 1 para completar la validaci&oacute;n del requisito.</span></span></span></li>
        <li><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">En caso de haber cursado el programa de Pregrado con &Eacute;NFASIS, debe solicitarlo por escrito a la Decanatura correspondiente del <strong>1 de Junio al 10 de julio de 2020.</strong></span></span></span></li>
        <li><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">Si usted es candidato a grado en <strong><u>doble titulaci&oacute;n con alguna instituci&oacute;n internacional</u></strong>, debe enviar al correo: coordgrados@escuelaing.edu.co, el diploma o la certificaci&oacute;n que lo acredita como graduado.</span></span></span></li>
        <li><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">Si usted present&oacute; proyecto de grado, trabajo dirigido, trabajo de investigaci&oacute;n o similar, debe estar grabado en el <a href="http://repositorio.escuelaing.edu.co/bitstream/001/338/5/Gu%C3%ADa%20de%20Autoarchivo%20Trabajos%20de%20Grado.pdf"><span style="text-decoration: none;">repositorio institucional</span></a> de la Biblioteca y no puede tener multas.</span></span></span></li>
    </ol>
    <p style='margin-right:0cm;margin-left:18.0pt;font-size:15px;font-family:"Calibri",sans-serif;margin-top:0cm;margin-bottom:8.0pt;line-height:107%;text-align:justify;'><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;"><strong>NOTA PARA PREGRADO: TODOS LOS DOCUMENTOS SE DEBEN ENVIAR ESCANEADOS Y LEGIBLES DESDE SU CORREO ELECTR&Oacute;NICO INSTITUCIONAL (UN SOLO CORREO POR ESTUDIANTE CON TODOS LOS DOCUMENTOS) AL CORREO:&nbsp;</strong><a href="mailto:coordgrados@escuelaing.edu.co"><strong>coordgrados@escuelaing.edu.co</strong></a><strong>&nbsp;.LA DOCUMENTACI&Oacute;N PARA GRADO DEBE ESTAR DEBIDAMENTE DILIGENCIADA, FIRMADA Y COMPLETA.</strong></span></span></span></p>
    <p style='margin-right:0cm;margin-left:0cm;font-size:15px;font-family:"Calibri",sans-serif;margin-top:0cm;margin-bottom:8.0pt;line-height:107%;'><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;"><strong>2. PAGO DE LOS GASTOS DE GRADO DE PREGRADO -</strong> <strong>DEL 28 DE JULIO AL 4 DE AGOSTO DE 2020 (&Uacute;NICAS FECHAS)</strong>, previo env&iacute;o de todos los documentos de grado al correo: <a href="mailto:coordgrados@escuelaing.edu.co">coordgrados@escuelaing.edu.co</a>, oficina de Coordinaci&oacute;n de Grados y se tengan los paz y salvos exigidos.</span></span></span></p>
    <p style='margin-right:0cm;margin-left:0cm;font-size:15px;font-family:"Calibri",sans-serif;margin-top:0cm;margin-bottom:8.0pt;line-height:107%;text-align:justify;'><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;"><strong>3. PAGO DE LOS GASTOS DE GRADO DE POSGRADO -</strong> Dentro de los quince (15) primeros d&iacute;as de cada mes, previo env&iacute;o de todos los documentos de grado al correo: <a href="mailto:coordgrados@escuelaing.edu.co">coordgrados@escuelaing.edu.co</a>, oficina de Coordinaci&oacute;n de Grados y se tengan los paz y salvos exigidos.</span></span></span></p>
    <p style='margin-right:0cm;margin-left:0cm;font-size:15px;font-family:"Calibri",sans-serif;margin-top:0cm;margin-bottom:8.0pt;line-height:107%;text-align:justify;'><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">El horario del Banco Ita&uacute; y la caja de la Escuela deber&aacute; consultarse previamente.</span></span></span></p>
    <p style='margin-right:0cm;margin-left:0cm;font-size:15px;font-family:"Calibri",sans-serif;margin-top:0cm;margin-bottom:8.0pt;line-height:107%;text-align:justify;'><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;"><strong>4. VALOR Y FORMA DE PAGO DE LOS GASTOS DE GRADO - PARA PREGRADO Y POSGRADO</strong><br> <br> S&oacute;lo pueden pagar gastos de grado aquellos estudiantes que cumplan con <strong><u>todos los requisitos de grado</u></strong> establecidos: <strong>VALOR A&Ntilde;O 2020: $ 633.000.</strong>&nbsp;</span></span></span></p>
    <p style='margin-right:0cm;margin-left:0cm;font-size:15px;font-family:"Calibri",sans-serif;margin-top:0cm;margin-bottom:8.0pt;line-height:107%;'><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">Usted puede realizar el pago de los gastos de grado en l&iacute;nea a trav&eacute;s del portal web de la Escuela en el enlace Comunidad &gt; Estudiantes &gt; Recibos y Pagos con cualquier medio de pago. Para pago en efectivo debe imprimir el comprobante con el c&oacute;digo de barras y pagar en cualquier sucursal del Banco de Occidente, Banco Ita&uacute;, Banco Davivienda o en la Caja de la Escuela, previa verificaci&oacute;n de horarios de atenci&oacute;n.<br>Para pago en l&iacute;nea consultar el siguiente enlace <a href="http://tycho.escuelaing.edu.co/PagosenLinea/loginEst">&gt;&gt;Pay-U en l&iacute;nea</a>. (siga las instrucciones)<br><br>Es de obligatorio cumplimiento enviar por correo electr&oacute;nico a <a href="mailto:coordgrados@escuelaing.edu.co">coordgrados@escuelaing.edu.co</a> el comprobante de pago de caja o del pago en l&iacute;nea de los gastos de grado a la Oficina de Coordinaci&oacute;n de Grados.</span></span></span></p>
    <p style='margin-right:0cm;margin-left:0cm;font-size:15px;font-family:"Calibri",sans-serif;margin-top:0cm;margin-bottom:8.0pt;line-height:107%;'><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;"><strong>NOTA:</strong> Si usted no cumple con estos requisitos dentro de las fechas indicadas, la ESCUELA asumir&aacute; que no participar&aacute; en la Ceremonia de entrega de Diplomas, correspondiente a esta promoci&oacute;n.</span></span></span></p>
    <p style='margin-right:0cm;margin-left:0cm;font-size:15px;font-family:"Calibri",sans-serif;margin-top:0cm;margin-bottom:8.0pt;line-height:107%;'><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">5. La solicitud de grado, previo cumplimiento de los requisitos reglamentarios exigidos y de los procedimientos internos, se presentar&aacute; al Consejo Directivo as&iacute;:</span></span></span></p>
    <p style='margin-right:0cm;margin-left:18.0pt;font-size:15px;font-family:"Calibri",sans-serif;margin-top:0cm;margin-bottom:.0001pt;line-height:107%;'><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">PREGRADO: En reuni&oacute;n del Consejo Directivo del <strong>mes de septiembre de 2020.</strong></span></span></span></p>
    <p style='margin-right:0cm;margin-left:18.0pt;font-size:15px;font-family:"Calibri",sans-serif;margin-top:0cm;margin-bottom:5.0pt;line-height:107%;'><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">POSGRADO: En reuni&oacute;n mensual del Consejo Directivo durante el a&ntilde;o 2020.</span></span></span></p>
    <p style='margin-right:0cm;margin-left:0cm;font-size:15px;font-family:"Calibri",sans-serif;margin-top:0cm;margin-bottom:8.0pt;line-height:107%;text-align:justify;'><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">6. &nbsp;La fecha y el mecanismo que la Escuela implementar&aacute; para la entrega de los Escudos y la Ceremonia de Grado, le ser&aacute; comunicado oportunamente al correo electr&oacute;nico institucional y se publicar&aacute; en el portal web de la Escuela Colombiana de Ingenier&iacute;a Julio Garavito, atendiendo todos los decretos e indicaciones definidos por el Gobierno Nacional y las Directivas de la Escuela para la prevenci&oacute;n del COVID-19.</span></span></span></p>
    <p style='margin-right:0cm;margin-left:0cm;font-size:15px;font-family:"Calibri",sans-serif;margin-top:0cm;margin-bottom:.0001pt;line-height:normal;text-align:justify;'><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">&nbsp;</span></span></span></p>
    <p style='margin-right:0cm;margin-left:0cm;font-size:15px;font-family:"Calibri",sans-serif;margin-top:0cm;margin-bottom:3.75pt;line-height:normal;'><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;"><strong>7. MATRICULA PROFESIONAL &ndash; SOLO PREGRADO:&nbsp;</strong><br>&nbsp;</span></span></span></p>
    <p style='margin-right:0cm;margin-left:0cm;font-size:15px;font-family:"Calibri",sans-serif;margin-top:0cm;margin-bottom:3.75pt;line-height:normal;text-align:justify;'><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">Se&ntilde;or Candidato a Grado:</span></span></span></p>
    <p style='margin-right:0cm;margin-left:0cm;font-size:15px;font-family:"Calibri",sans-serif;margin-top:0cm;margin-bottom:3.75pt;line-height:normal;text-align:justify;'><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">El tr&aacute;mite de la matr&iacute;cula (Tarjeta) Profesional es personal y lo debe realizar cada candidato a grado directamente con el Consejo Profesional que le corresponde y es de obligatorio cumplimiento para ejercer la profesi&oacute;n legalmente (cumplimiento de ley); recuerde que la experiencia laboral reconocida profesionalmente inicia a partir de la fecha de expedici&oacute;n de la tarjeta profesional.</span></span></span></p>
    <p style='margin-right:0cm;margin-left:0cm;font-size:15px;font-family:"Calibri",sans-serif;margin-top:0cm;margin-bottom:3.75pt;line-height:normal;text-align:justify;'><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">&nbsp;</span></span></span></p>
    <p style='margin-right:0cm;margin-left:0cm;font-size:15px;font-family:"Calibri",sans-serif;margin-top:0cm;margin-bottom:3.75pt;line-height:normal;text-align:justify;'><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">Ingresar al sitio Web de su Consejo Profesional y realizar los tr&aacute;mites correspondientes tal como lo indica el Consejo Profesional de cada programa, para mayor informaci&oacute;n consultar este <a href="https://www.escuelaing.edu.co/es/comunidad/estudiantes/procedimientos/2">enlace</a> y acceda al submen&uacute; que corresponda:</span></span></span></p>
    <ol style="list-style-type: decimal;">
        <li><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">Programas de Ingenier&iacute;a El&eacute;ctrica, Ingenier&iacute;a Electr&oacute;nica e Ingenier&iacute;a Mec&aacute;nica. &nbsp;</span></span></span></li>
        <li><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">Programas de Ingenier&iacute;a Civil, Ingenier&iacute;a de Sistemas, Ingenier&iacute;a Industrial e Ingenier&iacute;a Biom&eacute;dica.</span></span></span></li>
        <li><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">Programa de Econom&iacute;a: Los documentos para solicitud de matr&iacute;cula profesional indicados en el portal web de CONALPE se deben tramitar, escanear y enviar al correo electr&oacute;nico: <a href="mailto:info@conalpe.gov.co">info@conalpe.gov.co</a> con copia a coordgrados@escuelaing.edu.co</span></span></span></li>
        <li><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">Programa de Administraci&oacute;n de Empresas. Este tr&aacute;mite solo se puede realizar una vez se le haya entregado el diploma y el acta de grado.</span></span></span></li>
        <li><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;">Programa de Matem&aacute;ticas &ndash; NO APLICA.&nbsp;</span></span></span></li>
    </ol>
    <p><span style="color: rgb(102, 102, 102);"><span style="font-size: 12px;"><span style="font-family: 'Times New Roman', Times, serif;"><strong><span style="line-height: 107%;">Si requiere informaci&oacute;n adicional</span></strong><span style="line-height: 107%;">, favor comunicarse con los tel&eacute;fonos de contacto de cada Consejo Profesional o con la oficina de C<strong>oordinaci&oacute;n de Grados</strong> al correo:&nbsp;</span></span></span><span style='font-size: 12px; line-height: 107%; font-family: "Times New Roman", Times, serif;'><a href="mailto:coordgrados@escuelaing.edu.co"><strong>coordgrados@escuelaing.edu.co</strong></a></span></span></p>
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
<% }%>