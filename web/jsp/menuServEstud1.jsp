<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%@ page import="estudiantes.baseDatos.BaseDatos" %>
<%  BaseDatos bd = new BaseDatos();
    configECI cfgEci = new configECI();
       // String carnet = request.getParameter("carnet");
        String nombre = new String((String) session.getAttribute("nombre"));
        String iddpto = new String((String) session.getAttribute("iddpto"));
      //  out.println(iddpto);
//String dpto = new String((String) session.getAttribute("iddpto"));
        String clanum = new String((String) session.getAttribute("clanum"));
        String tip_est = new String((String) session.getAttribute("tip_est"));
        String fac_cor = new String((String) session.getAttribute("fac_cor"));
        String igrad = new String((String) session.getAttribute("igrad"));
        String tipdoc = new String((String) session.getAttribute("tipdoc"));
        Vector tiempo = new Vector();
        Vector hora = new Vector();
        String año = null;
        String mes = null;
        PrintWriter oout = response.getWriter();
        Estudiante est = (Estudiante) session.getAttribute("estClase");
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
        int estado;
        estado = Integer.parseInt(est.getEstado());
        String arreglo[] = new String[500];
        String texto[] = new String[200];
        int i = 0, n = 1;
        int k = 0;
        try {
            FileReader ra = new FileReader(ruta.valruta() + "serviciosestud1.txt");
            BufferedReader entrada = new BufferedReader(ra);
            String s;
            while ((s = entrada.readLine()) != null) {
                arreglo[i] = s;
                i = i + 1;
            }
            entrada.close();
        } catch (java.io.FileNotFoundException fnfex) {
            System.out.println("Archivo no encontrado: " + fnfex);
        } catch (java.io.IOException ioex) {
        }
        session.setAttribute("ban", "1");
        session.setAttribute("estado", est.getEstado());
        session.setAttribute("tipest", tip_est);
        Vector reintegro = est.getReintegro(carnet, cfgEci.getPeriodoSig());
        Vector seguimiento = est.getSeguimiento(carnet, cfgEci.getPeriodoSig());

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios Académicos - Consultar Notas</title>
  <link rel="stylesheet" type="text/css" href="Navegacion/css/estilo-escuela.css">
<link rel="stylesheet" href="Navegacion/css/bootstrap.min.css">
        <script language="JavaScript" type="text/JavaScript">
             function votaciones(){
                document.votacion.submit()
            }
            <!--
            //-->
        </script>
    </head>
    <body id="public" style="background-color: white">
        
<div id="container"> 
  <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
    <tr> 
      <td width="770" colspan="2"> 
        <jsp:include page="encabezado" flush="true"> 
        <jsp:param name="anterior" value="menuServEstud1" />
        </jsp:include>
      </td>
    </tr>
    <tr> 
      <td colspan="3"> 
        <div class="info" align="center"> 
          <h2><font color="#666666"> <label id="msj">Servicios Académicos</label> 
            </font></h2>
        </div>
      </td>
    </tr>
    <%
        boolean hab = false;
        if (hab && (estado == -22 || estado == -19 || estado == -13)) {
                %>
    <tr> 
      <td width="770" colspan="2"> <font color="#990000"> 
        <%if (fac_cor.equals("-1")) {%>
        Una vez analizado su resultado acad&eacute;mico, el Comit&eacute; de Admisiones 
        conceptu&oacute; <strong>NO APROBAR</strong> su solicitud de readmisi&oacute;n.</font> 
        <%} else if (fac_cor.equals("0")) {%>
        <font color="#990000">Una vez analizado su resultado acad&eacute;mico, 
        el Comit&eacute; de Admisiones, conceptu&oacute; <strong>CITARLO</strong> 
        a entrevista en compa&ntilde;&iacute;a de su acudiente con la Jefe de 
        Admisiones como requisito para dar respuesta a su solicitud de readmision. 
        Para consultar dia y hora de la misma, comun&iacute;quese con la oficina 
        de admisiones.</font> 
        <%} else if (fac_cor.equals("1")) {%>
        <font color="#990000">Una vez analizado su resultado acad&eacute;mico, 
        el Comit&eacute; de Admisiones, conceptu&oacute; <strong>APROBAR</strong> 
        su solicitud de readmisi&oacute;n. Para conocer las condiciones de su 
        readmisi&oacute;n por favor consulte su cuenta de correo.Para cualquier 
        aclaraci&oacute;n comun&iacute;quese con la oficina de admisiones.</font> 
        <%}%>
      </td>
    </tr>
    <%}%>
    <tr> 
      <td width="385"> 
        <div class="urbangreymenu"> 
          <h3 class="headerbar">MENU <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></h3>
          <ul>
            <%
        String variable = "VERMAT";
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
                //  if (!texto[2].equals("matriculaEstIntermedio?per=2009-I") && !texto[2].equals("mostrarhor") && !texto[2].equals("horarioEstud") ) {
                if (!texto[2].equals("matriculaEstIntermedio?per=2012-I") && !texto[2].equals("mostrarhor")) {
                    out.println("<li><a href=\"" + texto[2] + "\">" + n + ". " + texto[1] + "</a></li>");
                } else {
                    //if (tip_est.equals("E") || tip_est.equals("R")) {
                    if (reintegro.size() > 0 || seguimiento.size() > 0) {
                        out.println("<li><a href=\"" + texto[2] + "\">" + n + ". " + texto[1] + "</a></li>");
                    }
                }
            }
            n++;
        }

        //==Opción menu tramite de grado
        //DESHABILITADO AGREGAR FALSE&& CUANDO GRADOS LO SOLICITE
        if (igrad.equals("C") || igrad.equals("O")) {
        n++;
       // out.println("<li><a href=\"TramiteGrado\">" + n + ". Trámite de Grado</a></li>");
         out.println("<li><a href=\"Grado\"> " + n + ". Trámite de Grado</a></li>");
        }

        /* if ( estado == -91 || estado == -92 || estado==-94 || estado== -96 || estado== -107 ) {

        n = n ;
        out.println("<li><a href=\"http://estudiantes.escuelaing.edu.co/estudiantes/Posgrado\">" + n + ".Encuesta Institucional para estudiantes de Posgrado Autoevaluación-Acreditación</a></li>");

        }*/

        //DESHABILITADO AGREGAR FALSE&& CUANDO GRADOS LO SOLICITE
        if (igrad.equals("O") || igrad.equals("P")) {
            int m = n + 1;
            out.println("<li><a href=http://tycho.escuelaing.edu.co/PagosenLinea/loginEst>" + m + ". Pago derechos de grado</a></li>");
        }/*if (tip_est.equals("E")) {
        int m = n ;
        out.println("<li><a href=\"ModificaPreins\">" + m + ". Preinscripción Definitiva</a></li>");
        }*/
        
        if (tip_est.equals("P")) {
        int m = n ;
        out.println("<li><a href=\"Gimnasio\">" + n + ". Inscripción Gimnasio</a></li>");
        }
                                %>
          </ul>
        </div>
      </td>
      <td width="385">
        <div align="right"> 
         
          <p align="left"><strong>&nbsp;&nbsp;&nbsp;&nbsp;<!--a href="" onClick="window.open('http://estudiantes.escuelaing.edu.co/estudiantes/correos','','height=650,width=800');return false"><b><font color="#990000"> 
            CONOZCA SU CORREO </font></b></a-->&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <br>
            <br>
            
            <a href="" onClick="window.open('html/buscarhorasig/buscarhor.htm','','height=600,width=800');return false">Consulta 
            de horario de asignatura pregrado 2020-2</a>
              
              </strong> </p>
     
               </div></td>
    </tr>
  </table>
</div><br><br>
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
<!--container-->
    </body>
    <form name='votacion' method='post' action='votacion'>
    </form>
</html>
<%session.setAttribute("clanum", clanum);
        session.setAttribute("estado", est.getEstado());
        session.setAttribute("tipest", tip_est);
        session.setAttribute("dpto", iddpto);%>
</html>
