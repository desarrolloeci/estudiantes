<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%
        Vector prei = new Vector();
        response.setHeader("Cache-Control", "no-cache");
        String nombre = new String((String) session.getAttribute("nombre"));
        String nomas, prioas, cha = new String(), chb = new String();
        String prog = new String();
        PrintWriter oout = response.getWriter();
        Estudiante est = new Estudiante(carnet, oout);
        Vector lispre = est.getPreinscripcion(carnet);
        int i, crtot, cras, cradic;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios Acad&eacute;micos - Preinscripci&oacute;n</title>

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
                                    <label id="msj">Preinscripci&oacute;n</label>
                            </font></h2>
                    </div></td>
                </tr>
                <tr>
                    <td>
                        <span class="textocom">
                            <MARQUEE>
                                <font color="#990000">ATENCIÓN!!: Si es la primera vez que consulta la preinscripción
                                debe confirmarla con el boton correspondiente</font>
                            </MARQUEE>
                            <br>Solo
                            preinscriba las asignaturas teóricas y en el orden dado.<br>
                            La prioridad indica el nivel de certeza con el que tomará la asignatura.
                        </span>
                        <form method="POST" action="ProcesoPreinscripcion">
                            <table width="100%" border="1" bordercolor="#336699">
                                <tr bgcolor="#336699">
                                    <td width="20%">
                                        <div align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Asignaturas</font></b></div>
                                    </td>
                                    <td width="20%">
                                        <p align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Prioridad</font></b>
                                    </td>
                                    <td width="10%">
                                        <p align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Créditos</font></b>
                                    </td>
                                    <td width="20%">
                                        <div align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Asignaturas</font></b></div>
                                    </td>
                                    <td width="20%">
                                        <p align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Prioridad</font></b>
                                    </td>
                                    <td width="10%">
                                        <div align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Créditos</font></b></div>
                                    </td>
                                </tr>
                                <%  crtot = 0;
        cradic = 0;
        for (i = 0; i < lispre.size(); i++) {
            prei = (Vector) lispre.elementAt(i);
            nomas = "as" + i;
            prioas = "pr" + i;
            cras = (Integer.valueOf((String) prei.elementAt(2))).intValue();
            if (((String) prei.elementAt(3)).equals("A")) {
                cradic = cradic + cras;
            } else {
                crtot = crtot + cras;
            }
            if (((String) prei.elementAt(1)).equals("0")) {
                cha = "checked";
                chb = "";
            } else {
                chb = "checked";
                cha = "";
            }
            if (i % 2 == 0) {
                                %>
                                <tr>
                                    <%      }%>
                                    <td>
                                        <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1">
                                                <input type="text" name="<%=nomas%>" size="5" value="<%=(String) prei.elementAt(0)%>">
                                        </font> </div>
                                    </td>
                                    <td>
                                        <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1">
                                                <input type="radio" value="0" <%=cha%> name="<%=prioas%>">
                                                Alta
                                                <input type="radio" name="<%=prioas%>" value="1" <%=chb%>>
                                        Baja</font> </div>
                                    </td>
                                    <td>
                                        <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1">
                                        <%=(String) prei.elementAt(2)%></font>
                                    </td>
                                    <%      if (i % 2 != 0) { %>
                                </tr>
                                <%      }
        }
                                %>
                                <tr>
                                    <td>
                                        <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1">
                                                <input type="text" name="asf1" size="5" value="">
                                        </font> </div>
                                    </td>
                                    <td>
                                        <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1">
                                                <input type="radio" value="0" checked name="priof1">
                                                Alta
                                                <input type="radio" name="priof1" value="1">
                                        Baja</font> </div>
                                    </td>
                                    <td>
                                        <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1">
                                        &nbsp;</font> </div>
                                    </td>
                                    <td>
                                        <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1">
                                                <input type="text" name="asf2" size="5" value="">
                                        </font> </div>
                                    </td>
                                    <td>
                                        <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1">
                                                <input type="radio" value="0" checked name="priof2">
                                                Alta
                                                <input type="radio" name="priof2" value="1">
                                        Baja</font> </div>
                                    </td>
                                    <td>
                                        <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1">
                                        &nbsp;</font> </div>
                                    </td>
                                </tr>
                            </table>
                            <input type="hidden" name="ncampos" size="2" value="<%=i%>">
                            <br>
                            <span class="textocom">Total
                                créditos preinscritos con asignaturas del plan y opcionales <%=crtot%> <br>
                                Total créditos preinscritos con asignaturas
                            adicionales <%=cradic%></span><br>
                            <br>
                            <input name="B1" type="submit" class="boton" value="Confirmar esta preinscripción">
                        </form>
                        <p class="textocom">Las
                            asignaturas preinscritas están sujetas al cumplimineto de sus
                        requisitos.</p>
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
