<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*, javax.swing.*, javax.swing.Timer, java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter oout = response.getWriter();
        String nombre = new String((String) session.getAttribute("nombre"));
        String clanum = new String((String) session.getAttribute("clanum"));
        String tip_est = new String((String) session.getAttribute("tip_est"));
        String id_plan = new String((String) session.getAttribute("id_plan"));
        String dpto = new String((String) session.getAttribute("iddpto"));
        String igrad = new String((String) session.getAttribute("igrad"));
        String tipdoc = new String((String) session.getAttribute("tipdoc"));
        Estudiante est = (Estudiante) session.getAttribute("estClase");
        session.setAttribute("ban", "0");
        otros.rutas ruta = new otros.rutas();
//Archivo de menu
        int estado;
        int edad=0;
        estado = Integer.parseInt(est.getEstado());
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
        configECI cfgEci = new configECI();
        Vector infoOrden = est.getOrdenes(carnet, cfgEci.getPeriodoSig());
        Vector e = est.getEdad(carnet);
        Vector ed = (Vector) e.elementAt(0);%>
   

    <!-- && (!ed.elementAt(0).equals(" ") || !ed.elementAt(0).equals("No disponible"))-->
       <% if (ed.size() > 0 && !ed.elementAt(0).equals("No disponible") ){
            String a = ed.elementAt(0).toString();
            edad = Integer.parseInt(a);
   }%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Inicio</title>

        <!-- JavaScript -->
        <script type="text/javascript" src="scripts/wufoo.js"></script>

        <!-- CSS -->
        <link rel="stylesheet" href="css/comun.css" type="text/css" />
        <script language="JavaScript" type="text/JavaScript">
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
    <body id="public"
          <% if (tipdoc.equals("T") && edad > 6935) {%>
          onload="Abrir_ventana('PopupActualiza')">
        <% } else {%>
        
        <% }%>

        <!-- Inicio Container -->
        <div id="container">
            <table width="770" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
                <tr>
                    <td colspan="2" bgcolor="#EEEEEE"><img src="img/top.gif" alt="" width="770" height="10" id="top" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <jsp:include page="encabezado" flush="true"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="info" align="center">
                            <h2><font color="#666666">
                                    <label id="msj">Servicios Académicos</label>
                            </font></h2>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">

                    </td>
                </tr>
                <tr>
                    <!-- Menu Estudiantes -->
                    <td width="260" valign="top">
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
          out.println("<li><a href=\"\" onclick=\"window.open('http://practicas.escuelaing.edu.co/correoProfesor/enviarCorreoImpresion?userst=@mail.escuelaing.edu.co&nombre=" + nombre + "&user=e" + carnet + "','','width=600,height=400, toolbar=yes,scrollbars=yes,location=no,directories=yes,status=yes,menubar=yes,resizable=yes');return false\">" + n +
                  ". Servicio de Impresión</a></li>");
         /* if (est.getDpto().equals("16")) {
              n++;
              out.println("<li><a href=\"\" onclick=\"window.open('http://tycho.escuelaing.edu.co/contenido/documentos/osiris/docest/" + carnet + ".pdf');return false\">" + n + ". Plan de transición</a></li>");
          }*/
          if (igrad.equals("C") || igrad.equals("O")) {
              n++;
              out.println("<li><a href=\"TramiteGrado\"> " + n + ". Trámite de Grado</a></li>");
          }

          if (igrad.equals("O") || igrad.equals("P")) {
              n++;
              out.println("<li><a href=http://tycho.escuelaing.edu.co/PagosenLinea/loginEst> + n +Pago derechos de grado</a></li>");
          }%>
                            </ul>
                        </div>
                    </td>

                    <!--fin menu estudiantes -->
                    <td width="510" valign="top">
                        <div align="right"><strong><a href="" onClick="window.open('http://tycho.escuelaing.edu.co/contenido/servicios/estudiantes/buscarhorasig/buscarhor.htm','','height=600,width=800');return false">Consulta
                            de horario de asignatura</a></strong>
                        </div>
                        <br><b>
                            <!-- Requisito de ingles -->
                            <%

          int semestud;
          String ingles = "";
          if ((datosEst.size() > 0)) {
              for (int j = 0; j < 1; j++) {
                  Vector datos = (Vector) datosEst.elementAt(j);
                  int idplan = Integer.parseInt(datos.elementAt(5).toString());
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
                        </div><br>
                        &#8226; La Oficina de Registro Informa que: <br>
                        <br>
                        <strong><font color="#990000">Modificaci&oacute;n al Reglamento
                        Estudiantil de Pregrado <a href="http://tycho.escuelaing.edu.co/contenido/osiris/mod_reglamento.pdf">[CLIC AQUI]</a></font></strong><br>
                        <br>
                            <br>
                        <strong><font color="#990000">Modificación Salones de Clase Bloque C, Sábado 25 de Septiembre <a href="http://tycho.escuelaing.edu.co/contenido/osiris/MensajeEstudiantes.pdf">[CLIC AQUI]</a></font></strong><br>
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

                        <%
          if (igrad.equals("C")) {%>
                     <!--   Imposición de Escudos-->
                        <table width="100%">
                            <tr class="textocom">
                                <td height="19" colspan="2">
                                    <div align="center">
                                        <h4>
                                            <script type="text/javascript">
                                                AC_FL_RunContent( 'codebase','http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0','width','500','height','30','src','img/grados/egresado','quality','high','pluginspage','http://www.macromedia.com/go/getflashplayer','movie','img/grados/egresado' ); //end AC code
                                            </script><noscript><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="500" height="30">
                                                    <param name="movie" value="img/grados/egresado.swf">
                                                    <param name="quality" value="high">
                                                    <embed src="img/grados/egresado.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="500" height="30"></embed>
                                            </object></noscript>
                                        </h4>
                                    </div>
                                   <!-- <div align="center">
                                        <h4><a href="ImpoEscudo">
                                                <strong>Confirme su asistencia a la Imposición de Escudos<br><br>&lt;&lt;
                                            HACIENDO CLICK AQU&Iacute; &gt;&gt;</strong></a><br>
                                        </h4>
                                </div>--></td>
                            </tr>
                        </table>
                        <!-- Fin Imposición Escudos -->
                        <%  }%><br>
                    </td>
                </tr>
                <!-- Pie de Página -->
                <tr>
                    <td colspan="2"><div class="info" align="center">
                            &nbsp;
                        </div>
                        <div align="center" class="piepag">Escuela
                            Colombiana de Ingeniería Julio Garavito<br>
                            AK. 45 No. 205-59 (Autopista Norte) / Contact Center: +57(1) 6683600 
                            <br>
                            Bogotá, D.C. , Colombia<br>&nbsp;
                    </div></td>
                </tr>
                <!-- Fin Pie de Página -->
                <tr>
                    <td colspan="2" bgcolor="#EEEEEE"><img src="img/bottom.gif" alt="" width="770" height="10" id="bottom" /></td>
                </tr>
            </table>
        </div>
        <!-- fin container-->
    </body>
   <!-- http://localhost:8080-->
   <!-- <form name='votacion' method='post' action='http://tycho.escuelaing.edu.co/votaciones/votacion'>
        <input type='hidden' name='carnet' value='<!%=carnet%>'>
    </form>-->
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
//entrada.println(cadena);                 
            entrada.close();
            arch.close();
            arch1.close();
            session.setAttribute("clanum", clanum);
            session.setAttribute("estado", est.getEstado());
            session.setAttribute("tipest", tip_est);
            session.setAttribute("idplan", id_plan);
            session.setAttribute("dpto", dpto);
         %>