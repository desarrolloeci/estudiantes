<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Actas.ActaJava" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>


<%  
        response.setHeader("Cache-Control","no-cache"); 
	String cnum = new String((String)session.getAttribute("clanum"));
        ActaJava acta = new ActaJava() ;
        String opcion, firma, obs ;	
	String prog = new String();
	acta.consultarActa(carnet,cnum) ; 
        BdEstudiante bdEst = new BdEstudiante();
        String ret="";
        
        String proced = bdEst.ProcedimientoActas(carnet, ret);
%>
<html>
<head>
<title>Servicios a Estudiantes</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <link rel="stylesheet" type="text/css" href="Navegacion/css/estilo-escuela.css">
<link rel="stylesheet" href="Navegacion/css/bootstrap.min.css">
<style type="text/css">
<!--
a  { text-decoration: none }
.texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}
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
-->
</style>
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
                                    <label id="msj">Solicitud de Renovaci&oacute;n de Matricula y Acta</label>
                                </font></h2>
                        </div></td>
                </tr>
                <tr>
                    <td>
                        <fieldset><legend>Escuela
                                Colombiana de Ingenier&iacute;a -
                                Solicitud de Renovaci&oacute;n de Matricula y Acta</legend>
                            <form name="form1" method="post" action="firmaactaJava">
                                <%if (!acta.getEstado().equals("3") && !acta.getEstado().equals("12") && !acta.getEstado().equals("10")) {
                                                // El estudiante no es de primer semestre ni de seguimiento académico
                                                if (acta.getRespuesta().equals("S")) {
                                                 //   String valren = acta.getValRen();
                                                   String valren= proced;
                                                    char buf[] = new char[6];//
                                                    valren.getChars(0, 6, buf, 0);
                                                    //Para periodo Intermedio se hizo el cambio
                                                    if (buf[0] == '0' && buf[1] == '0' && buf[2] == '0' && buf[3] == '0' && buf[4] == '0' && buf[5] == '0') {%>
                                <p align="left">De acuerdo al art&iacute;culo
                                    No. 19 del Reglamento Estudiantil, por medio
                                    de la presente, solicito la renovaci&oacute;n
                                    de la matr&iacute;cula para
                                    el segundo periodo del a&ntilde;o 2014
                                    <!--per&iacute;odo intersemestral del a&ntilde;o 2008-->,
                                    la cual estar&aacute; condicionada
                                    al resultado acad&eacute;mico obtenido en
                                    el segundo per&iacute;odo
                                    del a&ntilde;o.</p>
                                <p align="left" >Renovaci&oacute;n de Matr&iacute;cula <!--Intersemestral--> &#8211; <strong>2014-2</strong>
                                    Programa: <strong><%=acta.getNomDpto()%></strong></p>
                                <p align="left" >Estudiante: <strong><%=acta.getNomEst()%></strong></p>
                                <p align="left"><span >Autorizado a tomar las asignaturas,
                                        seg&uacute;n las condiciones indicadas
                                        en el art&iacute;culo No. 43 del Reglamento Estudiantil. El resultado acad&eacute;mico
                                        no afectar&aacute; el estado del estudiante en lo referente a las condiciones
                                        de permanencia para el primer per&iacute;odo del a&ntilde;o en curso, salvo
                                        en el caso de haber reprobado por tercera vez una asignatura.</span>  </p>
                                <form name="form1" method="get" action="">
                                    <input type="hidden" name="actfir" value="firmar" id="actfir">
                                    <input name="Submit" type="submit" class="boton" value="Acepto las condiciones de renovación">
                                </form>
                                <%} else {%>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td colspan="5"><div align="justify"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Por
                                                    medio de la presente solicito la renovaci&oacute;n de
                                                    la matr&iacute;cula
                                                    para el segundo per&iacute;odo acad&eacute;mico <!--per&iacute;odo intermedio--> 2014
                                                    (Art. 18 Reglamento Estudiantil)</font></div></td>
                                    </tr>
                                    <tr>
                                        <td colspan="5">
                                            <div align="left"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Renovaci&oacute;n
                                                    de matr&iacute;cula para 2014-2</font><font face="Verdana, Arial, Helvetica, sans-serif" size="1">
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Programa:
                                                    <%=acta.getNomDpto()%></font></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="5"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><br>Estudiante:
                                                <b><%=acta.getNomEst()%></b></font></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" height="12">
                                            <%if (buf[0] == '1') {%>
                                            <div align="left"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><b><font color="#CC0033" size="2"><b>Autorizado
                                                                a matricularse sin observaciones</b></font></b></font>
                                                                <%}%>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="64%" >
                                            <%if (buf[1] == '1') {%>
                                            <span class="texto"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><b><font size="2">No
                                                            Autorizado</font></b></font><font size="2">.<font face="Verdana, Arial, Helvetica, sans-serif" color="#CC0033"><b>No
                                                            cumplio prueba reglamentaria (Promedio periodo menor que
                                                            3.0)</b></font></font>
                                            </span>
                                            <%}%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="64%">
                                            <%if (buf[2] == '1') {%>
                                            <font size="2"><span class="texto"><font face="Verdana, Arial, Helvetica, sans-serif"><b>No
                                                            Autorizado</b></font>. <font face="Verdana, Arial, Helvetica, sans-serif" color="#CC0033"><b>Promedio
                                                            acumulado menor que 3.0</b></font></span></font>
                                                            <%}%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="64%">
                                            <%if (buf[3] == '1') {%>
                                            <font size="1" face="Verdana, Arial, Helvetica, sans-serif"><b><font size="2">No
                                                        Autorizado</font></b></font><font size="2">.    <font face="Verdana, Arial, Helvetica, sans-serif" color="#CC0033"><b>Perdio
                                                        por tercera vez una asignatura</b></font></font>
                                                        <%}%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="64%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">&nbsp;</font></td>
                                    </tr>
                                    <tr>
                                        <td width="64%">
                                            <%if (buf[4] == '1') {%>
                                            <font size="1" face="Verdana, Arial, Helvetica, sans-serif"><b><font size="2">Autorizado
                                                        a matricularse con las siguientes observaciones:</font></b></font><font size="2" face="Verdana, Arial, Helvetica, sans-serif" color="#CC0033"><b> Estar&aacute; en
                                                    prueba reglamentaria, debe obtener en el semestre un promedio
                                                    mayor o igual a 3.0</b></font>
                                                    <%}%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="64%">
                                            <%if (buf[5] == '1') {%>
                                            <font size="1" face="Verdana, Arial, Helvetica, sans-serif"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><b><font size="2">Autorizado
                                                                a matricularse con las siguientes observaciones</font></b></font><font size="2">: <font color="#CC0033"><b>Cursar&aacute; por
                                                                tercera vez una asignatura</b></font></font></b></font>
                                                                <%}%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="64%"></td>
                                    </tr>
                                    <tr bgcolor="#F0F0F0">
                                        <td>
                                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000"><b>ACTA
                                                        DE MATRICULA PARA: <%=acta.getNomDpto()%> &nbsp;2014-2</b></font></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="5">
                                            <p align="justify"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">En
                                                    la fecha: <b><%=acta.getNomEst()%></b> luego de haber sido
                                                    admitido como estudiante de la <b>ESCUELA COLOMBIANA DE
                                                        INGENIERIA </b> y cumplir los requisitos prescritos, formaliza
                                                    su matricula declarando que <b><%=acta.getNomAcud()%></b>
                                                    ser&aacute; su acudiente y se compromete a acatar el Reglamento
                                                    de la <b>ESCUELA, </b>según el cual "la matrícula formaliza
                                                    el acceso a los derechos del estudiante y a los deberes
                                                    que de ellos se desprenden. Especialmente, significa que
                                                    el estudiante comparte los postulados contenidos en la declarción
                                                    de Principios&quot;. <br>
                                                    El buzón de correo electrónico asignado por la Escuela es
                                                    para el uso académico y administrativo de la relación de
                                                    la Escuela con el Estudiante.</font></p>
                                            <p><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><b>Observaciones:</b>
                                                    <input type="text" name="observ" size="80" maxlength="80">
                                                </font><BR>
                                                <%//if (acta.getRespuesta().equals("I")){%>
                                                <!--<b><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#CC0033"><blink>Su
                          renovación de matricula queda sujeta a la presentación de
                          los documentos de Seguridad Social antes de septiembre 10
                          de 2004</blink></font></b>. -->
                                                <%//}%>
                                            <center>
                                                <font face="Verdana, Arial, Helvetica, sans-serif" size="1">
                                                    <input name="Submit" type="submit" class="boton" value="Aceptar Renovación y Acta de Matricula">
                                                </font>
                                            </center>
                                        </td>
                                    </tr>
                                </table>
                                <%}%>
                            </form>
                        </fieldset>
                        <div align="right"></div>
                        <p>&nbsp;</p>
                        <%} else {%>
                        <!--jsp:include page="encabezado" flush="true"/-->
                        <%if (acta.getRespuesta().equals("E")) {%>
                        <br>
                        <center>
                            <p><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">ERROR
                                        EN LA BASE DE DATOS. POR FAVOR INTENTE MAS TARDE.</font></b></p><br>
                        </center>
                        <%} else if (acta.getRespuesta().equals("A")) {%>
                        <br>
                        <center>
                            <p><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">HA OCURRIDO UN ERROR CON
                                        SU MATRICULA O USTED NO HA FIRMADO EL ACTA, COMUNIQUESE CON REGISTRO</font></b></p><br>
                        </center>
                        <%} else if (acta.getRespuesta().equals("D")) {%>
                        <br>
                        <center>
                            <p><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">HOY
                                        NO ES SU DIA DE REGISTRO O USTED YA FIRMO EL ACTA.</font></b></p><br>
                        </center>
                        <%} else if (acta.getRespuesta().equals("F")) {%>
                        <br>
                        <center>
                            <p><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">USTED
                                        TIENE DEUDAS PENDIENTES CON ALGUNA DEPENDENCIA, POR FAVOR ACERCARSE
                                        A LA UNIVERSIDAD</font></b></p><br>
                        </center>
                        <%} else {%>
                        <br>
                        <center>
                            <p><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">ERROR EN LA OPERACION. O EL SERVIDOR SE ENCUENTRA OCUPADO</font></b></p><br>
                        </center>
                        <%}%>
                        <%}%>
                        <%
                            String valor = "n";
                            firma = proced.concat("-");
                            session.setAttribute("firma", firma);
                        %>
                    </td>
                </tr>
                <%} else {%>
                <br>
                <center>
                    <p><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">SI NO HA FIRMADO SU ACTA DE MATRICULA
                                DIRIJASE A LA OFICINA DE REGISTRO</font></b></p><br>
                </center>
                <% }%>
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

