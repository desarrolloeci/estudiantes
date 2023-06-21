<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%  
        Vector prei = new Vector() ;
        response.setHeader("Cache-Control","no-cache"); 
	String nombre = new String((String)session.getAttribute("nombre"));
	String raz = new String(), traz = new String();
	PrintWriter oout = response.getWriter() ;
        Vector lispre = (Vector) session.getAttribute("lisrep") ;
         Estudiante est = (Estudiante) session.getAttribute("estClase");
        int i ;
         //validar si ya contesto todas las encuestas académicas sino enviarlo a la encuesta.
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
            //false&& para deshabilitar cuando diga liliana pedraza 
            if (false && total != totalcontesto){
                               response.sendRedirect("ListaEncuestas");
            }else {
        
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios Acad&eacute;micos - Monitorias</title>
        
        <!-- JavaScript -->
        <script type="text/javascript" src="scripts/wufoo.js"></script>
        
        <!-- CSS -->
          <link rel="stylesheet" type="text/css" href="Navegacion/css/estilo-escuela.css">
<link rel="stylesheet" href="Navegacion/css/bootstrap.min.css">
        <script language="JavaScript" type="text/JavaScript">
            function desactivar(formulario) { 
				if(document.form1.acept[0].checked){ 
					formulario.Boton.disabled = false
				} 
				if(document.form1.acept[1].checked){ 
					formulario.Boton.disabled = true
				} 
			} 
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
                                    <label id="msj">Solicitud Monitorias</label>
                            </font></h2>
                    </div></td>
                </tr>
                <tr>
                    <td>
		<form method="POST" action="Monitorias" name = "form1">			
          <table width="100%" border="0" bordercolor="#336699">              
          <tr> 
            <td> 
              <div align="left"> 
                <p><font face="Verdana, Arial, Helvetica,sans-serif" size="2"> 
                  <b>Procedimiento:</b> </font></p>
              </div>
              <ul>
                <li> 
                  <font face="Verdana, Arial, Helvetica,sans-serif" size="2"> 
                    La Vicerrector&iacute;a Acad&eacute;mica verifica el cumplimiento 
                    de los requisitos una vez se cierra la convocatoria de monitores. 
                    </font>
                </li>
                <li><font face="Verdana, Arial, Helvetica,sans-serif" size="2"> 
                  De acuerdo con la programación definitiva de asignaturas, se 
                  asigna el numero de monitores y su dedicación.</font></li>
                <li><font face="Verdana, Arial, Helvetica,sans-serif" size="2"> 
                  Las decanaturas deberán seleccionar los monitores a partir del 
                  listado enviado por la Vicerrectoría Académica, en el transcurso 
                  de las dos primeras semanas del semestre.</font></li>
                <li><font face="Verdana, Arial, Helvetica,sans-serif" size="2"> 
                  Las decanaturas una vez hayan seleccionado los monitores deberán 
                  enviar a la Vicerrectoría el listado definitivo.</font></li>
                <li><font face="Verdana, Arial, Helvetica,sans-serif" size="2"> 
                  La Vicerrectoría envía un correo a los estudiantes seleccionados, 
                  para que formalicen su monitoria.</font></li>
              </ul>
              <div align="left"> 
                <p><font face="Verdana, Arial, Helvetica,sans-serif" size="2"> 
                  <b>Tenga en cuenta que:</b> </font></p>
              </div>
              <ul>
                <li> 
                  <font face="Verdana, Arial, Helvetica,sans-serif" size="2"> 
                    La dedicación máxima para un monitor es de 6 horas/semana.</font>
                </li>
                <li><font face="Verdana, Arial, Helvetica,sans-serif" size="2"> 
                    Ningún estudiante puede iniciar labores sin realizar la formalización en la Vicerrectoría Académica.</font></li>
				<li><font face="Verdana, Arial, Helvetica,sans-serif" size="2"> 
                    Las labores de monitorias se inician en la tercera semana del semestre.</font></li>
				<li><font face="Verdana, Arial, Helvetica,sans-serif" size="2"> 
                    Se liquidaran solamente las horas trabajadas a partir de la formalización.</font></li>
				<li><font face="Verdana, Arial, Helvetica,sans-serif" size="2"> 
                    Ningún profesor está autorizado para nombrar monitores o para ordenar el inicio de actividades de los mismos.</font></li>	
              </ul>
            </td>
              </tr> 
            </table>
			<center>
            <p align="left"> 
              <input type="radio" name="acept" value="1" onClick="desactivar(this.form)">
              <font face="Verdana, Arial, Helvetica,sans-serif" size="2"> Acepto condiciones</font><br>
              <input type="radio" name="acept" value="2" onClick="desactivar(this.form)" selected checked>
              <font face="Verdana, Arial, Helvetica,sans-serif" size="2"> No Acepto condiciones </font></p>
            <p>
              <input name="Boton" type="submit" class="boton" value="Siguiente" disabled>
            </p>
          </center>
            </form>
                    </td>
                </tr>
            </table>
            <% //If de encuestas
                }
            %>
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
