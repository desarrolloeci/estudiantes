<%-- 
    Document   : ListaprogramasEstud
    Created on : 16/06/2017, 03:31:55 PM
    Author     : lucero.rodriguez
--%>
<!--%@ include file="secure.jsp" %-->
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*, javax.swing.*, javax.swing.Timer, java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.baseDatos.BaseDatos" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%@ page import="utiles.autentica" %>
<%
    response.setHeader("Cache-Control", "no-cache");
    PrintWriter oout = response.getWriter();
    BaseDatos bd = new BaseDatos();
    configECI configuracion= new configECI();
    // HttpSession sesion;
    Estudiante est = new Estudiante();
    Vector tiempo = new Vector();
    Vector hora = new Vector();
    String año = null;
    String mes = null;
    String Datos, Programa;
    // String usuario1 = new String((String) session.getAttribute("usuario"));

    String usuario = request.getParameter("usuario");
    usuario = usuario.replace("'", "");
    String secHash = "";
    String originalHash = "";
    String seccode = request.getParameter("seccode");
    System.out.println("Valor caja texto : " + seccode);
    String mensaje = "Error";
    String msjok = "Error";
    String conexion = "";
    if (usuario.indexOf('@') != -1) {
        usuario = usuario.replace("@mail.escuelaing.edu.co", "");
    }
    
    
    Vector carne = est.ConsultaCarne(usuario);
    HttpSession sesion;

    sesion = request.getSession(true);
    

    // session.setAttribute("ban", "0");
    otros.rutas ruta = new otros.rutas();
    String carnet = new String();
    String consulta = "select  DATEPART(year,GETDATE()) as 'Year', DATEPART(month,GETDATE()) as 'Mes'";
// String consulta = new String("SELECT DATEPART(year, GETDATE()) as 'Year',DATEPART(month,GETDATE()) as 'Month',DATEPART(day,GETDATE()) as 'Day',DATEPART(hour,GETDATE()) as 'Hour',DATEPART(minute,GETDATE()) as 'Minute',DATEPART(second,GETDATE()) as 'Seconds'");
    
    if (bd.conectar(configuracion.getUsuarioBdApolo(), configuracion.getPasswdBdApolo())) {
        tiempo = bd.consultar(consulta, 2);
        bd.desconectarBD();
        hora = (Vector) (tiempo.elementAt(0));
        año = hora.elementAt(0).toString();
        mes = hora.elementAt(1).toString();
    }

    if (usuario == null || usuario.equals("") ) {
        response.sendRedirect("login?msg=0");

    } else {
        // Autenticacion correo
        autentica c = new autentica();
        //conexion = c.InicioEmail(usuario, passwd); //=======ojo*/
        conexion = "conectado";
        //SE CAMBIA ESTA LINEA PARA QUE SE AUTENTIQUE AL CORREO 

        if (conexion.equals("conectado")) {
            if (carne.size() > 0) {
                carnet = ((Vector) carne.elementAt(0)).elementAt(0).toString();
            }
            if (carne.size() > 1) {



%>  

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
          <link rel="stylesheet" type="text/css" href="Navegacion/css/estilo-escuela.css">
<link rel="stylesheet" href="Navegacion/css/bootstrap.min.css">

        <title>Inicio</title>

        <!-- JavaScript -->
        <script type="text/javascript" src="scripts/wufoo.js"></script>
   
        <script language="JavaScript" type="text/JavaScript">

            <!--  window.open("html/mensaje.html" , "ventana1" , "width=420,height=150,scrollbars=NO, left=600, top=400") -->

            //-->
        </script>
        <script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
        <!-- POP UP ACTUALIZACION DE DATOS -->
        <script language="JavaScript">
            function Abrir_ventana (pagina) {
            var opciones="toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=yes, width=780, height=450, top=85, left=140";
            window.open(pagina,"",opciones);
            }
        </script>

    </head>
    <!-- ESTUDIANTE MAYOR DE 19 AÑOS Y QU AUN TENGA T.I.-->
    <!-- <body id="public"-->

    <body>
   <div class="container">
<div class="row">
    <div class="col-2">
        <a href="https://escuela.aguayo.co/es/"><img src="img/Navegacion/logo-escuela.svg" alt="logo escuela"></a>
    </div>
    <div class="col">
        <div class="row">
            <div class="col-12">
                    <nav class="audiencias">
                        <ul class="nav nav-justified justify-content-center">
                            <li><a href="https://escuela.aguayo.co/es/estudiantes/" class="nav-item nav-link item uno">Estudiantes</a></li>
                            <li><a href="https://escuela.aguayo.co/es/profesores-y-administrativos/" class="nav-item nav-link item uno">Profesores y administrativos</a></li>
                            <li><a href="https://escuela.aguayo.co/es/graduados/" class="nav-item nav-link item uno">Graduados</a></li>
                            <li><a href="https://escuela.aguayo.co/es/padres-o-acudientes/" class="nav-item nav-link item uno">Padres o acudientes</a></li>
                            <li><a href="https://escuela.aguayo.co/es/empresa/" class="nav-item nav-link item uno">Empresa</a></li>                            
                            <li><a href="https://escuela.aguayo.co/es/donantes/" class="nav-item nav-link item uno">Donantes</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col align-self-center">
                    <nav class="navbar navbar-expand-lg productos">
                      <div class="collapse navbar-collapse" id="main_nav">

                        <ul class="navbar-nav">
                            <li class="nav-item"> <a href="https://escuela.aguayo.co/es/campus/" class="nav-link item dos" href="#">CAMPUS</a> </li>
                            <li class="nav-item dropdown has-megamenu">
                                <a class="nav-link dropdown-toggle item dos" href="#" data-toggle="dropdown">OFERTA ACADÉMICA</a>
                                <div class="dropdown-menu megamenu" role="menu">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="col-megamenu">
                                                <h6 class="title">Carreras profesionales</h6>
                                                <ul class="list-unstyled">
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/ingenieria-civil/">Ingeniería Civil</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/ingenieria-electrica/">Ingeniería Electrica</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/ingenieria-de-sistemas/">Ingeniería de Sistemas</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/ingenieria-industrial/">Ingeniería Industrial</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/ingenieria-de-electronica/">Ingeniería Eléctronica</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/economia/">Economía</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/administracion-de-empresas/">Administración de Empresas</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/matematicas/">Matemáticas</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/ingenieria-mecanica/">Ingeniería Mecánica</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/ingenier%C3%ADa-biom%C3%A9dica/">Ingeniería Biomédica</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/ingenieria-ambiental/">Ingeniería Ambiental</a></li>
                                                </ul>
                                            </div>  <!-- col-megamenu.// -->
                                        </div><!-- end col-3 -->
                                        <div class="col-md-3">
                                            <div class="col-megamenu">
                                                <h6 class="title">Especializaciones</h6>
                                                <ul class="list-unstyled">
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/especializacion-en-economia-para-ingenieros/">Especialización en Economía para Ingenieros</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/especializacion-en-gerencia-de-operaciones/">Especialización en Gerencia de Operaciones</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/especializacion-en-desarrollo-y-gerencia-integral-de-proyectos/">Especialización en Desarrollo y Gerencia Integral de Proyectos</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/especializacion-en-diseno-construccion-y-conservacion-de-vias/">Especialización en Diseño, Construcción y Conservación de Vías</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/especializacion-en-estructuras/">Especialización en Estructuras</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/especializacion-en-gestion-integrada-de-la-seguridad-y-salud-en-el-trabajo-calidad-y-medioambiente/">Especialización en Gestión Integrada de la Seguridad y Salud en el Trabajo, Calidad y Medioambiente</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/especializacion-en-ingenieria-de-fundaciones/">Especialización en Ingeniería de Fundaciones</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/especializacion-en-recursos-hidraulicos-y-medioambiente/">Especialización en Recursos Hidráulicos y Medioambiente</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/especializacion-en-saneamiento-ambiental/">Especialización en Saneamiento Ambiental</a></li>
                                                </ul>
                                            </div>  <!-- col-megamenu.// -->
                                        </div><!-- end col-3 -->
                                        <div class="col-md-3">
                                            <div class="col-megamenu">
                                                <h6 class="title">Maestrías</h6>
                                                <ul class="list-unstyled">
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/maestria-en-gestion-de-informacion/">Maestría en Gestión de Información</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/maestria-en-ciencias-actuariales/">Maestría en Ciencias Actuariales</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/maestria-en-desarrollo-y-gerencia-integral-de-proyectos/">Maestría en Desarrollo y Gerencia Integral de Proyectos</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/maestria-en-informatica/">Maestría en Informática</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/maestria-en-ingenieria-civil/">Maestría en Ingeniería Civil</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/maestria-en-ingenieria-electronica/">Maestría en Ingeniería Electrónica</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/maestria-en-ingenieria-electrica/">Maestría en Ingeniería Eléctrica</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/maestria-en-ingenieria-industrial/">Maestría en Ingeniería Industrial</a></li>
                                                </ul>
                                            </div>  <!-- col-megamenu.// -->
                                        </div>    
                                        <div class="col-md-3">
                                            <div class="col-megamenu">
                                                <h6 class="title">Doctorado</h6>
                                                <ul class="list-unstyled">
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/doctorado-en-ingenieria/">Doctorado en Ingeniería</a></li>
                                                </ul>
                                            </div>  <!-- col-megamenu.// -->
                                        </div><!-- end col-3 -->
                                    </div><!-- end row --> 
                                </div> <!-- dropdown-mega-menu.// -->
                            </li>
                            <li><a href="https://escuela.aguayo.co/es/admisiones/" class="nav-link item dos">ADMISIONES</a></li>
                            <li><a href="https://escuela.aguayo.co/es/investigacion-e-innovacion/" class="nav-link item dos">INVESTIGACIÓN E INNOVACIÓN</a></li>
                            <li><a href="https://escuela.aguayo.co/es/la-escuela/" class="nav-link item dos">LA ESCUELA</a></li>
                            <li><a href="https://escuela.aguayo.co/es/noticias/" class="nav-link item dos">NOTICIAS</a></li>
                            <li><a href="#" class="nav-link item dos">EVENTOS</a></li>
                        </ul>
                    </div> <!-- navbar-collapse.// -->
                </nav>
            </div>
        </div>
    </div>
</div>

</div>
              <div class="container contenidos-x" style="padding-bottom: 5px" align="center">
            <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <h2>SERVICIOS ACADEMICOS ESTUDIANTES</h2>
                <div class=" col-xs-3 col-sm-3 col-md-3 col-lg-3"></div><br><br>
                <div class="shadow p-3 mb-5 bg-white rounded form-group col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <%String nomest = ((Vector) carne.elementAt(0)).elementAt(1).toString();%>
                <center> <%=nomest%></center>
     
                        <form name="form_reloj">

                            <input type="text" name="reloj" size="10" style="background-color : White; color : #990000; font-family : Verdana, Arial, Helvetica; font-size : 8pt; text-align : center; border:0px" onfocus="window.document.form_reloj.reloj.blur()">

                        </form>
                    <form name="form1" method="post" action="LoginEst">
                        <input name="usuario" type="hidden" value="<%=usuario%>">
                        <p>&nbsp;</p>

                        <p>Seleccione el programa que desea consultar:
                        <p>
                        <div align="center">
                            <select class="form-control" name="carnet" >
                                <%for (int i = 0; i < carne.size(); i++) {
                                        Datos = ((Vector) carne.elementAt(i)).elementAt(0).toString();
                                        Vector datosEst = est.ConsultaPrograma(Datos);
                                        if (datosEst.size() > 0) {
                                            for (int j = 0; j < datosEst.size(); j++) {
                                                Programa = ((Vector) datosEst.elementAt(j)).elementAt(27).toString();%>
                                <option value="<%=Datos%>"><h1><%=Programa%></h1></option>
                                    <%  }%>
                                    <%}
                                        }%>
                            </select>
                        </div>
                        </p>

                        <p>&nbsp;</p>
                        <p>
                            <input class="btn btn-danger" style="background-color: #990000;border-color: #990000"  type="submit" name="Submit" value="Enviar">
                        </p>
                        <!--%  sesion = request.getSession(true);
                            sesion.setAttribute("carnet", carnet);%-->
                    </form>
</div>
            </div>
                                </div>
            </div>
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
         
    <%} else {%>
    <jsp:forward page="LoginEst">
        <jsp:param name="carnet" value="<%=carnet%>"/>
        <jsp:param name="usuario" value="<%=usuario%>"/>
    </jsp:forward>
    <%}
            } else {
                response.sendRedirect("/index");
                    }
                }%>
</body>
</html>