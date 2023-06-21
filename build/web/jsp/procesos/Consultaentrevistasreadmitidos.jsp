<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%  
    response.setHeader("Cache-Control","no-cache");
    String mensaje = "Usted no tiene ninguna solicitud de readmisión en curso";
    configECI cfgEci = new configECI();
    Vector infread = new Vector();
    String nombre = new String((String)session.getAttribute("nombre"));
    Estudiante est = (Estudiante) session.getAttribute("estClase") ;
    String prog="";
    String dpto = est.getDpto();
    String docEst = est.getDocest();
    BdEstudiante bdest = new BdEstudiante() ;
    bdest.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
    Vector estud = bdest.EntrevistasRead(docEst, dpto) ;
    Vector estadoread = bdest.EstadoReadmision(docEst, dpto) ;
    bdest.desconectar();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios Académicos - Solicitud de readmisión</title>
        
        <!-- JavaScript -->
        <script type="text/javascript" src="scripts/wufoo.js"></script>
        
        <!-- CSS -->
         <link rel="stylesheet" type="text/css" href="Navegacion/css/estilo-escuela.css">
<link rel="stylesheet" href="Navegacion/css/bootstrap.min.css">
        <script language="javascript">
        <!--
        function validar() { 
            if(document.formulario1.asistir[0].checked){
                document.formulario1.target = "ventanaAsistir";
                document.formulario1.action = "ImpInvitacion";
                window.open("", "ventanaAsistir", "toolbar=no,scrollbars=yes,location=no,directories=yes,status=no,menubar=yes,resizable=yes");
                document.formulario1.submit();
                return false;
            }else if(document.formulario1.asistir[1].checked){
                if(confirm("Confirma que no desea asistir al evento?")){
                    document.formulario1.target = "ventanaAsistir";
                    document.formulario1.action = "ImpInvitacion";
                    window.open("", "ventanaAsistir", "toolbar=no,scrollbars=yes,location=no,directories=yes,status=no,menubar=yes,resizable=yes");
                    document.formulario1.submit();
                    history.back();
                }
            }else{
                alert("Debe escoger una opción");
            }
            return false;
        }
    -->
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
                                    <label id="msj">Entrevistas de Readmisi&oacute;n</label>
                            </font></h2>
                    </div></td>
                </tr>
                <tr>
                    <td>
                        		  <fieldset> 

              <legend><b>ENTREVISTAS</b></legend>
              </font><br>
            <div align="center">
<%if((estadoread.size()) == 0){%>


    <table width="70%" border="0" cellspacing="0" cellpadding="0" height="20"  class="texto1" align="center">
        <tr>
            <td>
                <div align="center"><br>
                    No está autorizado para realizar este proceso, por favor comuníquese con
                    la Oficina de Admisiones. <br>
                Tel&eacute;fono: 6683600 Ext: 274, 263 o 101. </div>
            </td>
        </tr>
    </table>


    <%
    } else {
        %>
        <table width="90%" border="0" cellspacing="0" cellpadding="0"  align="center" class="texto1">
    <tr>
        <td>&nbsp;</td>
    </tr>
        <%
        for ( int k = 0 ; k < estadoread.size() ; k++ ){
            Vector readmi = (Vector)estadoread.elementAt(k) ;%>

    
    <%if (readmi.elementAt(1).equals("13")){
    prog="INGENIERIA CIVIL";

    }else if (readmi.elementAt(1).equals("14")){
    prog="INGENIERIA ELECTRICA";

    }else if (readmi.elementAt(1).equals("15")){
    prog="INGENIERIA DE SISTEMAS";

    }else if (readmi.elementAt(1).equals("16")){
    prog="INGENIERIA INDUSTRIAL";

    }else if (readmi.elementAt(1).equals("17")){
    prog="INGENIERIA ELECTRONICA";

    }else if (readmi.elementAt(1).equals("18")){
    prog="ECONOMIA";

    }else if (readmi.elementAt(1).equals("19")){
    prog="ADMINISTRACION DE EMPRESAS";

    }else if (readmi.elementAt(1).equals("20")){
    prog="MATEMATICAS";

    }else if (readmi.elementAt(1).equals("260")){
    prog="INGENIERIA MECANICA";

    }%>
    <tr>
        <td>Estudio de admisi&oacute;n para el programa de <b><%=prog%></b></td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td height="19">
            <p><%=readmi.elementAt(0)%></p>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>Apreciado Aspirante:</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>


    <%if (readmi.elementAt(3).equals("0")){
    // out.println(readmi.elementAt(3));
    for ( int j = 0 ; j < estud.size() ; j++ ){
    Vector estudiante = (Vector)estud.elementAt(j) ;%>
    <tr>
        <td>
            Como parte del estudio de su solicitud de readmisi&oacute;n  le informamos que deber&aacute; presentar  entrevistas así:
                 el pr&oacute;ximo <%=estudiante.elementAt(2)%>, a las <%=estudiante.elementAt(3)%>
            en la <%=estudiante.elementAt(6)%></b>, con PSC: <%=estudiante.elementAt(7)%>  en <B>COMPAÑIA DE SU ACUDIENTE</B> y
            el próximo <b> <%=estudiante.elementAt(10)%>, a las <%=estudiante.elementAt(11)%>
            en la <%=estudiante.elementAt(13)%></b>, con PSC: <%=estudiante.elementAt(12)%>
            <br>El 14 de Julio deberá consultar la respuesta a su solicitud de Readmisión en los Servicios Académicos</br>
            <p>Cordialmente</p>
            <p>Oficina de Admisiones</p>
            <p>Ext.274,263 &oacute; 101</p>
        </td>
    </tr>
    <%}
    }else if (readmi.elementAt(3).equals("1")){%>
            <tr> 
              <td> 
                <p><br>
                  Le informamos que su solicitud de Readmisi&oacute;n para el 
                  periodo <%=cfgEci.getPerOrdenes()%> </b>, ha sido aprobada. <br>
                </p>
                <p>Deberá cursar todas las asignaturas correspondientes al Primer 
                  Nivel del plan de estudios vigente para el <%=cfgEci.getPerOrdenes()%>. Se le retirarán 
                  del Registro todas las notas obtenidas en todos los cursos aprobados 
                  o no aprobados hasta el momento para efectos de las condiciones 
                  de permanencia expresadas en le Reglamento Estudiantil y la 
                  expedición de certificados (Artículo 92, Reglamento Estudiantil). 
                  <br>
                </p>
                <p>Deber&aacute; presentar ex&aacute;men de clasificaci&oacute;n 
                  as&iacute;.</p>
                <ul>
                  <li>Jueves 30 de Junio a las 10:00 a.m : Matem&aacute;ticas 
                    (Para todos los programas) </li>
                  <li>Jueves 30 de Junio a la 01:00 p.m : Lenguaje (Para todos 
                    los programas)</li>
                  <li>Jueves 30 de Junio a las 03:00 p.m: F&iacute;sica (&Uacute;nicamente 
                    para los programas de Ingenier&iacute;a y Matem&aacute;ticas).</li>
                </ul>
                <p>Deber&aacute; cumplir con las condiciones de permanencia expresadas 
                  en el Art. 90 del Reglamento Estudiantil, en las cuales se exige 
                  obtener un promedio acumulado de calificaciones igual o superior 
                  a tres coma cero (3,0), incluido el último período académico 
                  cursado y no reprobar por tercera vez una asignatura. </p>
                <p>La Inducci&oacute;n se llevar&aacute; a cabo el 27, 28 y 29 
                  de Julio a partir de las 8:00 a.m en el Aula M&aacute;xima. 
                  Adicionalmente con el &aacute;nimo de favorecer su desempe&ntilde;o 
                  acad&eacute;mico en la Escuela se requiere la presencia de los 
                  padres del estudiante el 29 de julio a las 4:00 p.m. en el Aula 
                  M&aacute;xima, donde se dar&aacute; a conocer el programa de 
                  acompa&ntilde;amiento, as&iacute; como la programaci&oacute;n 
                  de las reuniones que se desarrollar&aacute;n durante el semestre.</p>
                <p>La Escuela le asignar&aacute; un consejero acad&eacute;mico 
                  el cual le ser&aacute; informado durante la primera semana de 
                  clases a trav&eacute;s de su decanatura.</p>
                <p>El plan de estudios que le corresponde ser&aacute; el vigente 
                  para el <%=cfgEci.getPerOrdenes()%>, el cual puede consultar a trav&eacute;s de la 
                  p&aacute;gina web de la Escuela.<br>
                </p>
                <p>Deberá imprimir nuevamente su orden de pago para cancelar los 
                  derechos de matrícula correspondientes. Una vez haya cancelado 
                  deberá firmar acta de matrícula y realizar su horario en las 
                  fechas programadas para tal fin. <br>
                </p>
                <p>Le deseamos éxitos en el desarrollo de sus estudios. <br>
                  <br>
                  Atentamente, <br>
                  Psi. Nancy Barrero Ramírez Jefe de Admisiones </p>
                </td>
</tr>
<%}
}
%>
</table>
<%
}
%>
              <p>&nbsp;</p>
              </div>
            
			</fieldset>                    </td>
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
