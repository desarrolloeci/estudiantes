<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*, javax.swing.*, javax.swing.Timer, java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.baseDatos.BaseDatos" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%
    response.setHeader("Cache-Control", "no-cache");
    PrintWriter oout = response.getWriter();
    BaseDatos bd = new BaseDatos();
    configECI cfgEci = new configECI();
    Estudiante est = (Estudiante) session.getAttribute("estClase");
    Vector tiempo = new Vector();
    Vector hora = new Vector();
    String año = null;
    String mes = null;

    String nombre = new String((String) session.getAttribute("nombre"));
    String clanum = new String((String) session.getAttribute("clanum"));
    String tip_est = new String((String) session.getAttribute("tip_est"));
    String id_plan = new String((String) session.getAttribute("id_plan"));
    String dpto = new String((String) session.getAttribute("iddpto"));
    String igrad = new String((String) session.getAttribute("igrad"));
    String tipdoc = new String((String) session.getAttribute("tipdoc"));
    String nivclas = new String((String) session.getAttribute("nivclas"));

    session.setAttribute("ban", "0");
    otros.rutas ruta = new otros.rutas();
    String consulta = "select  DATEPART(year,GETDATE()) as 'Year', DATEPART(month,GETDATE()) as 'Mes'";
// String consulta = new String("SELECT DATEPART(year, GETDATE()) as 'Year',DATEPART(month,GETDATE()) as 'Month',DATEPART(day,GETDATE()) as 'Day',DATEPART(hour,GETDATE()) as 'Hour',DATEPART(minute,GETDATE()) as 'Minute',DATEPART(second,GETDATE()) as 'Seconds'");
    if (bd.conectar(cfgEci.getUsuarioBdApolo(), cfgEci.getPasswdBdApolo())) {
        tiempo = bd.consultar(consulta, 2);
        bd.desconectarBD();
        hora = (Vector) (tiempo.elementAt(0));
        año = hora.elementAt(0).toString();
        mes = hora.elementAt(1).toString();

    }
    int respuesta = est.Insertaestadis(año, mes, carnet);

    Vector CuantosEnc = est.AsignaEncuestaA(carnet);
     Vector cuantos = new Vector();
     cuantos = (Vector) CuantosEnc.elementAt(0);
     int total;
     //validar si ya contesto todas las encuestas académicas sino enviarlo a la encuesta.
     total= (Integer.parseInt((String) cuantos.elementAt(0)));  //cuantos debe contestar en la encuesta academica
           
     Vector contesto = est.ContestaEncuestaA(carnet);
     Vector valorcontesto = new Vector();
     valorcontesto = (Vector) contesto.elementAt(0);
     int totalcontesto;
     totalcontesto = (Integer.parseInt((String) valorcontesto.elementAt(0))); //cuantas asignaturas contesto
     
     //QUITAR/PONER EL FALSE PARA HABILITAR/DESHABILITAR SERVICIOS EN ENCUESTAS ACADEMICAS
     
     if (false&&total != totalcontesto){
     response.sendRedirect("ListaEncuestas");
     }else {


    //Archivo de menu
    int estado;
    String semestre;
    int edad = 0;
    estado = Integer.parseInt(est.getEstado());   
    semestre = "1";
   
            
    if (estado < 1) {
        response.sendRedirect("menuServEstud1");
    }
    String arreglo[] = new String[500];
    String texto[] = new String[200];
    int i = 0, n = 1;
    int k = 0;
    try {
//FileReader ra = new FileReader("../confEci/serviciosestud.txt");  
//***********ARCHIVO LOCAL********
//FileReader ra = new FileReader("D:\\jakarta-tomcat-3.2.1\\confEci\\serviciosestud.txt");
//***********ARCHIVO ECINFO2******
        FileReader ra = new FileReader(ruta.valruta() + "serviciosestud.txt");
        BufferedReader entrada = new BufferedReader(ra);
        String s;
        while ((s = entrada.readLine()) != null) {
            arreglo[i] = s;
            i = i + 1;
        }
        entrada.close();
        ra.close();
    } catch (java.io.FileNotFoundException fnfex) {
        System.out.println("Archivo no encontrado: " + fnfex);
    } catch (java.io.IOException ioex) {
        System.out.println("Error al leer el archivo: " + ioex);
    }

    Vector datosEst = est.getDatosEst(carnet);
    Vector infoOrden = est.getOrdenes(carnet, cfgEci.getPeriodoSig());
    Vector e = est.getEdad(carnet);    
    Boolean convocadoSaberPro=est.ConvocadoSaberPro(carnet, "", "");

//=================================
//= Gastos de Asistencia a ceremonia
    //Debe permanecer en 0  1 solo para pruebas
    int as = 0;
    String sel = "";
    String sel1 = "";
    Vector paregre = est.getParGraduado(carnet);
    if (paregre.size() > 0) {
        //if(((Vector)paregre.elementAt(0)).elementAt(1).equals("0"))
        //   as = 0 ;
        // else
        as = 1;
    }
%>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

        <link type="text/css" href="css/jquery.jscrollpane.css" rel="stylesheet" media="all" />

        <title>Inicio</title>

        <!-- JavaScript -->
        <script type="text/javascript" src="scripts/wufoo.js"></script>

        <!-- CSS -->
         <link rel="stylesheet" type="text/css" href="Navegacion/css/estilo-escuela.css">
<link rel="stylesheet" href="Navegacion/css/bootstrap.min.css">
        <script language="JavaScript" type="text/JavaScript">

           
           //window.open("html/mensaje.html" , "ventana1" , "width=420,height=150,scrollbars=NO, left=600, top=400")
           
           
           <!--

            function reservaLab(){
            document.form.submit()
            }

            function preinscripcion(){
            document.form1.submit()
            }

            function votaciones(){
            document.votacion.submit()
            }
            -->
        </script>
        <script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
        <!-- POP UP ACTUALIZACION DE DATOS -->
        <script language="JavaScript">
            function Abrir_ventana(pagina) {
                var opciones = "toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=yes, width=780, height=450, top=85, left=140";
                window.open(pagina, "", opciones);
            }
        </script>

    </head>
    <!-- ESTUDIANTE MAYOR DE 19 AÑOS Y QU AUN TENGA T.I.-->
    <!-- <body id="public"-->

    <body onload="mueveReloj()" style="background-color: white;">
        
        

        <% if (tipdoc.equals("T") && edad > 6935) {%>
        onload="Abrir_ventana('PopupActualiza')">
        <% } else {%>

        <% }%>

        <!-- Inicio Container -->
        <div id="container">
            <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
                <tr>
                    <td colspan="2" bgcolor="#EEEEEE"><img src="img/top.gif" alt="" width="770" height="10" id="top" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <jsp:include page="encabezado" flush="true"/>

                    </td>
                </tr>

                <!--<tr>
                    <td colspan="2">
                        <div class="info" align="center">
                            <h2><font color="#666666">
                                    <label id="msj">Servicios Académicos</label>
                            </font></h2>
                        </div>
                    </td>
                </tr>-->
                <tr>
                    <td colspan="2">

                    </td>
                </tr>
                <tr>
                    <!-- Menu Estudiantes -->
                    <td width="260" valign="top">                      
                        <!--<div class="menu_izq2">-->
                        <div class="urbangreymenu">
                            <h3 class="headerbar">MENU</h3>
                            <ul>
                                <%
                                    for (int j = 0; j < i; j++) {
                                        StringTokenizer st = new StringTokenizer(arreglo[j], ",");
                                        k = 0;
                                        while (st.hasMoreTokens()) {
                                            texto[k] = st.nextToken();
                                            k = k + 1;
                                        }
                                        if (texto[0].equals("0")) {
                                            out.println("<li>" + n + ". " + texto[1] + "</li>");
                                        } else {
                                            out.println("<li><a href=\"" + texto[2] + "\">" + n + ". " + texto[1] + "</a></li>");
                                        }
                                        n++;
                                    }
                                    if (infoOrden.size() > 0) {

                                        n++;
                                        out.println("<li><a href=\"RegPago\">" + n + ". Registrar pago matrícula</a></li>");
                                    }
                                    /*out.println("<li><a href=\"\" onclick=\"window.open('http://practicas.escuelaing.edu.co/correoProfesor/enviarCorreoImpresion?userst=@mail.escuelaing.edu.co&nombre=" + nombre + "&user=e" + carnet + "','','width=600,height=400, toolbar=yes,scrollbars=yes,location=no,directories=yes,status=yes,menubar=yes,resizable=yes');return false\">" + n +
                                     ". Servicio de Impresión</a></li>");
                                     if (est.getDpto().equals("16")) {
                                     n++;
                                     out.println("<li><a href=\"\" onclick=\"window.open('http://tycho.escuelaing.edu.co/contenido/documentos/osiris/docest/" + carnet + ".pdf');return false\">" + n + ". Plan de transición</a></li>");
                                     }*/

                                    //== Opción Menu tramite de grado
                                    //DESHABILITADO (FALSE&&) HASTA QUE INFORME GRADOS
                                    if (igrad.equals("C") || igrad.equals("O")) {
                                        n++;
                                        out.println("<li><a href=\"Grado\"> " + n + ". Trámite de Grado</a></li>");
                                        //out.println("<li><a href=\"TramiteGrado\"> " + n + ". Trámite de Grado</a></li>");
                                    }
                                    //DESHABILITADO HASTA QUE INFORME GRADOS
                                    if (igrad.equals("O") || igrad.equals("P")) {
                                        n++;
                                        out.println("<li><a href=http://tycho.escuelaing.edu.co/PagosenLinea/loginEst> + n +Pago derechos de grado</a></li>");
                                    }
                                %>

                            </ul>
                        </div>                
                    </td>

                    <!--fin menu estudiantes -->
                    <td width="510" valign="top">
                        <br> 
                        <div align="right"> 
                            <!--//tycho.escuelaing.edu.co/contenido/servicios/estudiantes-->
                            <!-- http://estudiantes.escuelaing.edu.co/estudiantes/html/buscarhorasig/buscarhor.htm o html/buscarhorasig/buscarhor.htm-->

                            <!--http://estudiantes.escuelaing.edu.co/estudiantes/correos
                            http://10.10.1.93:8084/correos-->
                            <p align="left"><strong>&nbsp;&nbsp;&nbsp;&nbsp;<!--a href="" onClick="window.open('http://estudiantes.escuelaing.edu.co/estudiantes/correos', '', 'height=650,width=800');
                return false"><b><font color="#990000"> 
                                            CONOZCA SU CORREO </font></b></a-->&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                    <!--DESCOMENTAR EN FECHAS DE REGISTRO-->
                                    <a href="" onClick="window.open('html/buscarhorasig/buscarhor.htm','','height=600,width=800');return false">Consulta 
                                    de horario de asignaturas 2020-2</a></strong> </p>
                            <!--html/consultdia/consulta.htm-->
                            <p> <strong><a href="html/consultdia/consulta.htm"><font size="3">Consulte
                                    AQU&Iacute; su dia de Registro</font></a><font size="3">&nbsp;</font></strong>
                            <%if(false){
                                if(convocadoSaberPro){%>
                                <p align="left">
                                    <font size="3">
                                    Usted está autorizado para presentar el examen Saber Pro 2019. Le informamos que el 21 de junio se vence el plazo para iniciar su proceso de inscripción.
                                    Conozca todo el cronograma del proceso este <a href="https://www.escuelaing.edu.co/escuela/saberpro/instructivo.php" target="_blank">enlace</a>    
                                    </font>
                                </p>
                                <%}else{%>
                                <p align="left">
                                    <font size="3">
                                    Usted no debe presentar el examen SaberPro en el año 2019.
                                    </font>
                                </p>
                                <%}
                            }%>
                        </div>
                        <b>
                            <!-- Requisito de ingles -->
                            <%int semestud;
                                String ingles = "";
                                if ((datosEst.size() > 0)) {

                                    for (int j = 0; j < 1; j++) {
                                        Vector datos = (Vector) datosEst.elementAt(j);
                                        int idplan = 0;
                                        /*if(idplan >= 255){
                                         semestud = Integer.parseInt(datos.elementAt(3).toString());
                                         if(semestud <= 5){
                                         if(est.getReqIngles(carnet, "890").equals(""))
                                         ingles = "&#8226; Recuerde que debe cumplir con el requisito de inglés antes de iniciar el sexto (6) semestre (clasificación mínima de Nivel 4B)<br> " +
                                         "<a href=\"\" onclick=\"window.open('http://www.escuelaing.edu.co/servicios/estudiantes/ingles.htm','','height=600,width=800, toolbar=yes,scrollbars=yes,location=no,directories=yes,status=yes,menubar=yes,resizable=yes');return false\">" +
                                         " << Reglamentación idioma inglés >> </a>";
                                         }else if(semestud <= 10){
                                         if(est.getReqIngles(carnet, "5880").equals(""))
                                         ingles = "&#8226; Recuerde que debe cumplir con el requisito de inglés para la obtención de su grado (Certificación del logro de un nivel avanzado)<br> " +
                                         "<a href=\"\" onclick=\"window.open('http://www.escuelaing.edu.co/servicios/estudiantes/ingles.htm','','height=600,width=800, toolbar=yes,scrollbars=yes,location=no,directories=yes,status=yes,menubar=yes,resizable=yes');return false\">" +
                                         " << Reglamentación idioma inglés >> </a>";
                                         }
                                         }
                                         out.println(ingles);*/
                                    }
                                }
                            %>

                        </b><br><div class="info" align="center">
                            &nbsp;
                        </div>

                        <!--  <p><font size="2" color="#990000">La Oficina de Registro y Control Académico Informa que durante
                                los d&iacute;as 30-31 de julio y 01 de agosto no habr&aacute; servicio de elaboraci&oacute;n
                                de horarios por internet en el horario de 3:00 a 6:00 p.m.</font>-->
                        <p><br>
                            <!-- <strong><font color="#990000">Modificaci&oacute;n al Reglamento Estudiantil 
                             de Pregrado <a href="http://tycho.escuelaing.edu.co/contenido/osiris/mod_reglamento.pdf">[CLIC 
                             AQUI]</a></font></strong><br>
                             <br>
                             <br>
                             <strong><font color="#990000">Modificación Salones de Clase Bloque C, 
                             Sábado 25 de Septiembre <a href="http://tycho.escuelaing.edu.co/contenido/osiris/MensajeEstudiantes.pdf">[CLIC 
                             AQUI]</a></font></strong><br>-->
                            <br>
                            <!--  Instructivos 2010-1 <br>
                                          <br>
                                          <a href="#" onClick="window.open('http://tycho.escuelaing.edu.co/contenido/documentos/Instrucciones primer_semestre_2010.pdf','','height=450,width=640');return false">&middot;Estudiantes Nuevos &ndash; Instructivo de elaboraci&oacute;n de   horarios</a><br>
                                          <a href="#" onClick="window.open('http://tycho.escuelaing.edu.co/contenido/documentos/Instructivo_Sistemas_2010.pdf','','height=450,width=640');return false">&middot;Estudiantes Ingenier&iacute;a de Sistemas &ndash; Instructivo de elaboraci&oacute;n de   horarios</a><br>
                                          <a href="#" onClick="window.open('http://tycho.escuelaing.edu.co/contenido/documentos/Instructivo primiparos_industrial_2010-1.pdf','','height=450,width=640');return false">&middot;Estudiantes Nuevos de Ingenier&iacute;a Industrial &ndash; Instructivo de elaboraci&oacute;n   de horarios</a> <br>
                                          <a href="#" onClick="window.open('http://tycho.escuelaing.edu.co/contenido/documentos/Instructivo_Industrial_2010-1.pdf','','height=450,width=640');return false">&middot;Estudiantes Antiguos de Ingenier&iacute;a Industrial &ndash; Instructivo de elaboraci&oacute;n   de horarios</a> <br>
                                          <a href="#" onClick="window.open('http://tycho.escuelaing.edu.co/contenido/documentos/Instructivo_Electrica_2010-1.pdf','','height=450,width=640');return false">&middot;Estudiantes Ingenier&iacute;a Eléctrica&ndash; Instructivo de elaboraci&oacute;n de horarios</a><br>-->
                            <!--img src="Captcha"-->
                            <br>
                            <%//DESHABILITADO (FALSE&&) HASTA QUE INFORME GRADOS
              if ((igrad.equals("C") && (as == 0))){%>
                            <!--   Imposición de Escudos-->
                        <table width="100%">
                            <tr class="textocom">
                                <td height="19" colspan="2">
                                    <div align="center">
                                        <h4>
                                            <script type="text/javascript">
            AC_FL_RunContent('codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0', 'width', '500', 'height', '30', 'src', 'img/grados/egresado', 'quality', 'high', 'pluginspage', 'http://www.macromedia.com/go/getflashplayer', 'movie', 'img/grados/egresado'); //end AC code
                                            </script><noscript><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="500" height="30">
                                                <param name="movie" value="img/grados/egresado.swf">
                                                <param name="quality" value="high">
                                                <embed src="img/grados/egresado.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="500" height="30"></embed>
                                            </object></noscript>
                                        </h4>
                                    </div>
                                    <div align="center">
                                        <h4><a href="ImpoEscudo">
                                                <strong>Confirme su asistencia a la Imposición de Escudos<br><br>&lt;&lt;
                                                    HACIENDO CLIC AQU&Iacute; &gt;&gt;</strong></a><br>
                                        </h4>
                                    </div></td>
                            </tr>
                        </table>
                        <!-- Fin Imposición Escudos -->
                        <%  }%><br>
                    </td>
                </tr>
            </table>
        </div>
        <!-- fin container-->
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
    <%}%>
    <form name='votacion' method='post' action='votacion'>
    </form>


</html>
<%//SimpleDateFormat formatter = new SimpleDateFormat ("yyyy.MM.dd 'Hora' hh:mm:ss ");
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy'-'HH:mm:ss");
    Date currentTime_1 = new Date();
    String dateString = formatter.format(currentTime_1);
    FileWriter arch = new FileWriter(ruta.valruta() + "logestud.log", true);
    BufferedWriter arch1 = new BufferedWriter(arch);
    PrintWriter entrada = new PrintWriter(arch1);
    String fec = (String) carnet + "," + (String) dateString;
    entrada.println(fec);
    entrada.close();
    arch.close();
    arch1.close();
    session.setAttribute("clanum", clanum);
    session.setAttribute("estado", est.getEstado());
    session.setAttribute("tipest", tip_est);
    session.setAttribute("idplan", id_plan);
    session.setAttribute("dpto", dpto);
    session.setAttribute("nivclas", nivclas);
%>
<% //ESTO ES SOLO POR RENOVACION CURRICULAR
    String carnetTransicion=request.getParameter("Carne");
    String banTransicion=request.getParameter("aTransicion");
    if(carnetTransicion!=null&&banTransicion!=null){
        if(banTransicion.equals("1")){
            %>
            <form method="post" id="myFormu" name="myFormu" action="http://weezer.escuelaing.edu.co/CambioPlan-0.9/Estudiante/CambioDePlan.xhtml">
                <input id="Carne" name="Carne" value="<%=carnetTransicion%>" type="hidden">
            </form>
            <script>
                document.getElementById("myFormu").submit();
            </script>
            <%
        }
    }
%>