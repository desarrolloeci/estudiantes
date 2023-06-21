<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%  
    response.setHeader("Cache-Control","no-cache"); 
    String nombre = new String((String)session.getAttribute("nombre"));
    String igrad =  new String((String)session.getAttribute("igrad"));
    String iddpto =  new String((String)session.getAttribute("iddpto"));
    Estudiante est = (Estudiante) session.getAttribute("estClase") ;
    int estado;
    estado = Integer.parseInt(est.getEstado());
    if(!igrad.equals("C")){
        if(estado>0)
            response.sendRedirect("menuServEstud");
        else
            response.sendRedirect("menuServEstud1");
    }else{
        Vector infoEst = est.getDatosEst(carnet);
        Vector datosestud = (Vector)infoEst.elementAt(0) ;
        Vector datospar = est.getParProg(iddpto);
        Vector verifIngles = est.getExIngEgre(carnet);
        Vector paregre = est.getParGraduado(carnet);
        String sel = "";
        String sel1 = "";
        if(paregre.size()>0){
            if(((Vector)paregre.elementAt(0)).elementAt(1).equals("0"))
                sel1 = "checked";
            else
                sel = "checked";
        }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios Acad&eacute;micos - Ceremonia</title>
        
        <!-- JavaScript -->
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
                alert("Debe escoger una opci&oacute;n");
            }
            return false;
        }
    -->
    </script>
        
        <!-- CSS -->
        <link rel="stylesheet" href="css/comun.css" type="text/css" />
        <script language="JavaScript" type="text/JavaScript">
            <!--
            //-->
        </script>
    </head>
    <body id="public">
        <div id="container">
            <table width="770" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
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
                                    <label id="msj">Ceremonia</label>
                            </font></h2>
                    </div></td>
                </tr>
                <tr>
                  <td>
                        <fieldset> 
            <center>
              <legend>Se&ntilde;or
              estudiante <%=nombre%></legend>
              
              <br>
              <div align="left" class="texto1">Las Directivas de la Escuela Colombiana de Ingenier&iacute;a Julio Garavito 
                  se permiten informarle qu&eacute debido a las medidas decretadas por el Estado Colombiano y la Organizaci&oacute;n
                  Mundial de la Salud para la prevenci&oacute;n del COVID-19 relacionadas con distanciamiento social y el 
                  aislamiento preventivo obligatorio, ha decidido suspender temporalmente y hasta nueva orden, todos 
                  los eventos masivos, entre ellos, la Ceremonia de Imposici&oacute;n de Escudos que la Escuela realiza en 
                  honor de los estudiantes de &uacute;ltimo semestre con motivo de la finalizaci&oacute;n de sus estudios 
                  profesionales en la Instituci&oacute;n.<br>
              <br>
              La fecha y el mecanismo que la Escuela implementar&aacute; para la entrega de los Escudos, le ser&aacute; comunicada 
              oportunamente al correo electr&oacute;nico institucional, atendiendo todos los decretos e indicaciones definidos 
              por el Gobierno Nacional y las directivas de la Escuela.
              <br>
              <!--Por favor confirmar su asistencia al evento: -->             </div>
            </center> 
            <form name="formulario1" method="get" action="">
              <center>
              </center>
             <!-- <table width="100%" border="0" cellpadding="0" cellspacing="0" class="texto1">
                <tr>
                  <td width="25%" class="texto1"><strong>Usted asistir&aacute; al
                  evento?</strong></td>
                  <td width="12%"><strong>SI</strong>                    
                  <input type="radio" name="asistir" value="1" <%=sel%>></td>
                  <td width="63%"> <strong>NO
                  </strong>
                  <input type="radio" name="asistir" value="0" <%=sel1%>></td>
                </tr>
              </table>-->
            
            </form>
            Se&ntilde;or estudiante recuerde que en este momento
                        inicia el tr&aacute;mite de solicitud de candidatura a grado, siempre y cuando al finalizar el periodo 
                        acad&eacute;mico 2020-1 o el periodo acad&eacute;mico intersemestral 2020-I, cumpla con todos los requisitos 
                        acad&eacute;micos seg&uacute;n el reglamento estudiantil y este al d&iacute;a con los paz y salvos financieros, 
                        de biblioteca, de laboratorios y de ingl&eacute;s exigidos. Por favor ingrese a la p&aacute;gina Web de la Escuela, 
                        Estudiantes > Informaci&oacute;n Coordinaci&oacute;n de Grados > Proceso de grado pregrado y leer todos los instructivos 
                        (Comunicaci&oacute;n del Secretario General, Instructivo para acceder a la ceremonia de grado, C&oacute;digo de &eacute;tica profesional, 
                        Autorizaci&oacute;n de Tratamiento de datos personales y para finalizar el enlace al costado derecho Tr&aacute;mites de Matr&iacute;cula y
                        Tarjeta Profesional). 
                        <p>
        <ul>
            <b>Recuerde que: </b>
          <li>Uno de los requisitos de grado es cumplir con el examen ICFES - Saber Pro, 
              (Ley 1324 de 2009) y presentar el certificado del resultado o certificaci&oacute;n de 
            asistencia expedida por el ICFES. Si present&oacute; el examen anteriormente 
            debe entregar el Certificado del Resultado</li>
          <li>
              <b>Solo para Pregrado:</b> Del <b>1 al 12 de junio de 2020</b>, debe enviar desde su correo institucional, 
              al correo de la Coordinaci&oacute;n de Grados: coordgrados@escuelaing.edu.co, los documentos de solicitud de grado 
              que se activar&aacute;n en la sesi&oacute;n de servicios acad&eacute;micos de los estudiantes, del portal web 
              de la Escuela. Consulte los documentos que debe presentar en el enlace:
              <br>
              <a href="https://www.escuelaing.edu.co/es/comunidad/estudiantes/procedimientos/proceso_de_grado" target="_blank">ENLACE</a> en el submen&uacute;: 
              <br>
              Instructivo para acceder a la ceremonia de grado.<br>
              Se solicita enviar un solo correo electr&oacute;nico por estudiante que incluya todos los documentos de grado, para facilitar la revisi&oacute;n de los mismos.
          </li>
          <li>
              Para el programa de Ingenier&iacute;a Biom&eacute;dica, debe presentar copia del resultado 
              del examen de ingl&eacute;s aprobado por la Universidad Colegio Mayor de 
              Nuestra Señora del Rosario.
          </li>
        </ul><br>
          <div align="center"> 
                <button onclick="location.href='Grado'">Continuar</button>
           
              </div>
                                      
			</fieldset>
                        </td>
                </tr>
                <tr>
                    <td><div class="info" align="center">
                            &nbsp;
                        </div>
                        <div align="center" class="piepag">Escuela
                            Colombiana de Ingenier&iacute;a Julio Garavito<br>
                            AK. 45 No. 205-59 (Autopista Norte) / Contact Center: +57(1)
                            6683600 
                            <br>
                            Bogot&aacute;, D.C. , Colombia<br>&nbsp;
                    </div></td>
                </tr>
                <tr>
                    <td bgcolor="#EEEEEE"><img src="img/bottom.gif" alt="" width="770" height="10" id="bottom" /></td>
                </tr>
            </table>
        </div><!--container-->
    </body>
    
</html>
</html>
<% }%>