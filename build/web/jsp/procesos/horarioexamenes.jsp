<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>

<%  
	String nombre = new String((String)session.getAttribute("nombre"));
	String ban = new String((String)session.getAttribute("ban"));
	PrintWriter oout = response.getWriter() ;
        //Estudiante est = new Estudiante(carnet,oout) ;
        Estudiante est = (Estudiante) session.getAttribute("estClase") ;
        configECI cfgEci = new configECI();
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
            //DESHABILITA SERVICIO SI NO CONTESTO ENCUESTAS
            //ESTE FALSE SE QUITA CUANDO LO SOLICITE LILIANA PEDRAZA
            if (false && total != totalcontesto){
                response.sendRedirect("ListaEncuestas");
            }else {
        

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios Académicos - Horario Exámenes</title>
        
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
                    
                    <jsp:include page="encabezado" flush="true">
                        <jsp:param name="anterior" value="menuServEstud" />
                    </jsp:include>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="info" align="center">
                            <h2><font color="#666666">
                                    <label id="msj">Horario Ex&aacute;menes</label>
                            </font></h2>
                    </div></td>
                </tr>
                <tr>
                    <td>
<%Vector horario = est.getHorarioEx(carnet, cfgEci.getPeriodoActual(), oout);%>
            <%//QUITAR ESTE FALSE DESPUES DE CONTINGENCIA COVID 19
                if (false && horario.size() <= 0){%>
            <p> 
              <center>
                <b><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif">No se encontraron registros en la base de datos, para este 
                periodo</font></b> 
              </center>
            
            <%}else{%>
            <h2>Los exámenes finales de las asignaturas que pudieron continuar con actividades no presenciales, se realizarán entre el 11 y el 22 de mayo de 2020 en el horario de clases establecido para el primer semestre de 2020</h2>
            <!--table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#336699">
              <tr bgcolor="#336699"> 
                <td width="20%"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Asignatura</font></b></td>
                <td width="40%"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Día 
                  de exámen</font></b></td>
                <td width="20%"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Hora</font></b></td>
                <td width="20%"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Salón</font></b></td>
              </tr>
              <% for ( int j = 0 ; j < horario.size() ; j++ ){
		Vector horarioex = (Vector)horario.elementAt(j) ;
                if(!horarioex.elementAt(3).equals("0")){
		%>
              <tr> 
                <td width="20%"><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif"><%=horarioex.elementAt(1)%></font></td>
                <td width="40%"><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif"><%=horarioex.elementAt(2)%></font></td>
                <td width="20%"><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif"><%=horarioex.elementAt(3)%></font></td>
                <td width="20%"><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif"><%=horarioex.elementAt(4)%></font></td>
              </tr>
              <%}
                }%>
            </table-->
            <%}%>
            <br>
          </td>
        </tr>
            </table>
            <%//IF DE CONTESTO ENCUESTAS
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
