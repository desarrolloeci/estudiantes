<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%
    response.setHeader("Cache-Control","no-cache"); 
    String nombre = new String((String)session.getAttribute("nombre"));
    String igrad =  new String((String)session.getAttribute("igrad"));
    String iddpto =  new String((String)session.getAttribute("iddpto"));
    session.setAttribute("ceremonia", "COLECTIVA");
    PrintWriter oout = response.getWriter() ;
    Estudiante est = (Estudiante) session.getAttribute("estClase") ;
    int estado, i;
    estado = Integer.parseInt(est.getEstado());
    if(!igrad.equals("C") && !igrad.equals("O")){
        if(estado>0)
            response.sendRedirect("menuServEstud");
        else
            response.sendRedirect("menuServEstud1");
    }else{
        Vector despingopar = new Vector();
        Vector infoPar = est.getParTramGrad("4");
        for(i=0 ; i < infoPar.size() ; i++)
            despingopar.addElement((String)((Vector)infoPar.elementAt(i)).elementAt(0));
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
                                    <label id="msj">Grado Colectivo</label>
                            </font></h2>
                    </div></td>
                </tr>
                <tr>
                    <td>
                        <tr> 
          <td valign="top">
		  <fieldset><legend>Bogot&aacute; D. C., <%=despingopar.elementAt(3)%> </legend>
              <p align="left"><br>
                  <strong>SE&Ntilde;OR GRADUANDO <br>
                  Promoci&oacute;n <%=despingopar.elementAt(4)%> </strong></p>
              <p align="justify"><br>
                  Reciba un cordial saludo y perm&iacute;tame felicitarlo por
                  la culminaci&oacute;n de su proceso de formaci&oacute;n en
                  la ESCUELA COLOMBIANA DE INGENIER&Iacute;A JULIO GARAVITO,
                  augur&oacute;ndole muchos &eacute;xitos en su vida personal y profesional.</p>
              <p align="justify">Aprovecho la oportunidad para hacer algunas precisiones con
                  respecto al proceso de graduaci&oacute;n que se inicia en este
                  momento, el cual se divide en dos partes:</p>
              <p align="justify"><strong>1.</strong>	Aprobaci&oacute;n de su Grado por parte del
                Consejo Directivo, previa certificaci&oacute;n del Rector y del
                Secretario General, sobre el cumplimiento de los requisitos reglamentarios,
                y de Ley, con la expedici&oacute;n del Acta de Grado correspondiente.</p>
              <p align="justify"><strong>2. </strong>Entrega del diploma que
                lo acredita como profesional graduado de la ESCUELA COLOMBIANA
                DE INGENIER&Iacute;A JULIO GARAVITO,
                  en ceremonia colectiva o individual.  La ceremonia de entrega
                de diplomas es el acto acad&eacute;mico de mayor relevancia para
                la institucion y por lo tanto el Consejo Directivo, como m&aacute;xima
                autoridad de direcci&oacute;n de la Escuela, ha determinado su
                realizaci&oacute;n en nuestras instalaciones.</p>
              <p align="justify">Con el objetivo de poder cumplir con la organizaci&oacute;n
                  de la Ceremonia de entrega de diplomas colectiva correspondiente a esta promoción, <!--que para esta promoci&oacute;n
                  ha sido programada para el <strong><//%=despingopar.elementAt(5)%></strong>,--> es imperativo el
                  estricto cumplimiento de todos los requisitos dentro de las
                  fechas se&ntilde;aladas en el instructivo correspondiente.
                  Para ello, su solicitud de grado ser&aacute; presentada para
                  aprobaci&oacute;n en la reuni&oacute;n del Consejo Directivo
                  de la ESCUELA programada para el <strong><%=despingopar.elementAt(2)%></strong>.</p>
              <p align="justify">Si por alguna eventualidad, usted no puede cumplir con los
                  plazos se&ntilde;alados, su solicitud de grado podr&aacute; ser
                  tramitada y presentada para aprobaci&oacute;n del Consejo Directivo
                  en cualquiera de las reuniones posteriores a la de la aprobaci&oacute;n
                  de los grados en ceremonia colectiva, es decir, despu&eacute;s
                  de la reuni&oacute;n del <strong><%=despingopar.elementAt(2)%></strong>, previo cumplimiento
                  de los requisitos relacionados en el instructivo para Grado
                  Individual. Sin embargo, en esta condici&oacute;n, lamentablemente,
                  no podr&aacute; ser incluido en la Ceremonia de Grado Colectivo de esta promoción.
                  <!--del <strong><//%=despingopar.elementAt(5)%></strong>--></p>
              <p align="justify">Queda entonces, la opci&oacute;n, de recibir su diploma en
                  la siguiente Ceremonia Colectiva correspondiente a la promoci&oacute;n <strong>2016-1</strong>
                  <!--<strong><//%=despingopar.elementAt(6)%></strong>--> o recibir su diploma en ceremonia individual en fecha definida
                  por el Rector.</p>
              <p align="justify">Si durante el proceso se le presenta alg&uacute;n inconveniente
                  que le impida el cumplimiento de los requisitos dentro de las
                  fechas previstas, le solicito el favor de hac&eacute;rmelo
                  saber para que, dentro de los plazos oportunos, la ESCUELA
                  pueda tratar de colaborarle en lo posible sin contravenir el
                  principio de tratamiento equitativo y condiciones de igualdad
                  para todos los graduandos.</p>
              <p align="justify">Le agradezco su atenci&oacute;n y cumplimiento
                responsable a las normas y procedimientos establecidos para llevar
                a cabo este proceso de obtenci&oacute;n de su grado profesional,
                que una vez concluido, representa un aporte importante para su
                vida personal y la de su familia.</p>
              <p align="justify">En nombre de la Directiva de la ESCUELA y en
                el m&iacute;o
                propio, como graduado de la misma, quiero expresarle nuestro
                sentimiento de aprecio y gratitud, al contarlo como miembro de
                la orgullosa
                familia de profesionales graduados  de la ESCUELA COLOMBIANA
                DE INGENIER&Iacute;A
                JULIO GARAVITO.</p>
              <p align="left">Atentamente,</p>
              <p></p>
            <p align="left">Ing. RICARDO A. L&Oacute;PEZ CUALLA<br>
              Secretario General</p>
            </center> 
            <div align="center"><a href="InstGradoColectivo"><strong>&lt;&lt; CONTINUAR &gt;&gt;</strong></a></div></fieldset></td>
        </tr>
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
<% }%>