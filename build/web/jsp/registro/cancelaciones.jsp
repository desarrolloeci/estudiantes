<%@ include file="../secure.jsp" %>
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%
    response.setHeader("Cache-Control", "no-cache");
    session = request.getSession(true);
    String mensaje = "";
    int ind = 0;

    String nombre = new String((String) session.getAttribute("nombre"));
    String ban = new String((String) session.getAttribute("ban"));
    String id_plan = new String((String) session.getAttribute("id_plan"));
//  String idcor = new String((String) session.getAttribute("idcor"));
    PrintWriter oout = response.getWriter();
    Estudiante est = (Estudiante) session.getAttribute("estClase");
    int estado = Integer.parseInt(est.getEstado());
    Vector datosEst = est.getDatosEst(carnet), datosestud;
    Vector Matriculas=  est.MatriculasVeces(carnet);
    int matri = Matriculas.size();
// Vector correq = est.getCorreqcancela(idcor, id_plan);
    if (datosEst.size() > 0) {
        datosestud = (Vector) datosEst.elementAt(0);
        int sem = Integer.parseInt(datosestud.elementAt(3).toString());
        // int estado= Integer.parseInt(datosestud.elementAt(3).toString());
        if (sem >= 7) {
            mensaje = "Recuerde que si realiza la cancelación de alguna de las asignaturas "
                    + " puede afectar su plan de tiempo de terminación de sus estudios.";
        }
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios Académicos - Cancelaciones</title>

        <!-- JavaScript -->
        <script type="text/javascript" src="scripts/wufoo.js"></script>

        <!-- CSS -->
          <link rel="stylesheet" type="text/css" href="Navegacion/css/estilo-escuela.css">
<link rel="stylesheet" href="Navegacion/css/bootstrap.min.css">
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function comprueba( ){
            var indice = document.form1.codigo.selectedIndex;
            if ( document.forms.form1.codigo.options[indice].value == 'N') {
            alert("Usted debe seleccionar la asignatura que desea cancelar.");
            return false;
            }

            if ( document.forms.form1.observ.value == '' ) {
            alert("Usted debe escribir la razón por la cual cancela la asignatura");
            return false;
            }

            <%if (ind == 1) {%>
            alert("Esta asignatura tiene correquisito, al cancelarla se cancelará también su respectivo correquisito. Por favor verifique si desea cancelarla");
            return false;
            <%}%>

            return true;
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
                                <label id="msj">Cancelaciones</label>
                                </font></h2>
                        </div></td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" border="0" align="center">
                            <tr>
                                <td align="center" valign="top" colspan="2">
                                    <% if (estado == 12) {%>

                            <center><b>No está autorizado para realizar proceso de cancelación.</b></center>

                            <%} else {
                                        Vector asignatura = est.getasignaturasCan(oout, carnet);
                                        int totalcancelar = asignatura.size();
                                        if (matri <= 2) {%>
                                        <center><b>Recuerde que deberá entregar un formato de solicitud firmado por el acudiente, por cada asignatura que solicite cancelar. </b></center>
                                            <%}%>
                            <form name="form1" method="post" onSubmit="return comprueba( );" action="CorreqCancela">
                                <input type="hidden" name="totalcancelar" value="<%=totalcancelar%>" >
                                <a href="http://tycho.escuelaing.edu.co/contenido/documentos/Cancelacionasignaturas.pdf" TARGET="blank" >Lineamientos institucionales para la cancelación de asignaturas</a>
                                <p>
                                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tabla">
                                    <tr>
                                        <%if (asignatura.size() > 0) {%>

                                        <td><b>Asignatura</b> &nbsp; &nbsp;
                                            <select name="codigo">
                                                <option value="N" selected>Seleccione asignatura</option>
                                                <% for (int j = 0; j < asignatura.size(); j++) {
                                                        Vector asig = (Vector) asignatura.elementAt(j);
                                                        // String idcor = asig.elementAt(3).toString();

                                                %>
                                                <option  value ="<%=asig.elementAt(1)%>*<%=asig.elementAt(2)%>*<%=asig.elementAt(3)%>"><%=asig.elementAt(1)%> Grupo: <%=asig.elementAt(2)%></option>
                                                <%}%>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><br><b class="texto"><font color="#990000">En
                                                este campo escriba la raz&oacute;n por la cual cancela
                                                la asignatura, favor no colocar <u>comas </u>dentro del
                                                texto.</font></b></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="text" name="observ" size="85" maxlength="85">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <!--<tr>
                                        <td><a href="http://www.escuelaing.edu.co/documentos/instructivo_cancelaciones_2010-1.pdf" target="_blank"><b>Observaciones
                                        a tener en cuenta en el proceso de cancelaci&oacute;n</b></a></td>
                                    </tr>-->
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div align="center">
                                                <input name="Submit" type="submit" class="boton" value="Enviar">
                                            </div>
                                        </td>
                                        <%} else {%>
                                        <td> <b>No puede realizar operaciones de cancelación por plazo o por control de asignaturas.</b></td>
                                        <%}
                                                    }%>
                                    </tr>
                                </table>
                            </form>
                    </td>
                </tr>
            </table>
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
