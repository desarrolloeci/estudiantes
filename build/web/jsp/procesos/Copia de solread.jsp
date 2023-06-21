<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%  
    response.setHeader("Cache-Control","no-cache");
    String mensaje = "Usted no tiene ninguna solicitud de readmisión en curso";
    Vector infread = new Vector();
    String nombre = new String((String)session.getAttribute("nombre"));
    Estudiante est = (Estudiante) session.getAttribute("estClase") ;
    String perant = request.getParameter("perant");
    int estado;
    estado = Integer.parseInt(est.getEstado());
    if(est.getValidaSolRead(carnet, perant).size() > 0){
        infread = est.getSolRead(carnet);
        if(!infread.elementAt(0).equals("No disponible")){
            mensaje = "Su solicitud de readmisión ya fué recibida" +
                    "<br>Podrá consultar su citación a entrevista en este mismo lugar el día 6 de julio a partir " +
                    " de las 5:00 pm. Las entrevistas se realizarán entre el 7 y 9 de julio de 2009. " +
                    " La respuesta de admisión podrá consultarla el 14 de julio de 2009.";
        }else{
            est.setSolRead(carnet);
            mensaje = "Su solicitud de  Readmisión ha ingresado al sistema. " +
                    "<br>Podrá consultar su citación a entrevista en este mismo lugar el día 6 de julio a partir " +
                    " de las 5:00 pm. Las entrevistas se realizarán entre el 7 y 9 de julio de 2009. " +
                    " La respuesta de admisión podrá consultarla el 14 de julio de 2009.";
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios Académicos - Solicitud de readmisión</title>
        
        <!-- JavaScript -->
        <script type="text/javascript" src="scripts/wufoo.js"></script>
        
        <!-- CSS -->
        <link rel="stylesheet" href="css/comun.css" type="text/css" />
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
                alert("Debe escoger una opción");
            }
            return false;
        }
    -->
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
                                    <label id="msj">Solicitud de Readmisi&oacute;n</label>
                            </font></h2>
                    </div></td>
                </tr>
                <tr>
                    <td>
                        		  <fieldset> 

              <legend><b>SOLICITUD
                    DE READMISI&Oacute;N</b></legend>
              </font><br>
            <div align="center">
          <table width="80%" height="18" border="0" align="left" cellpadding="0" cellspacing="0" class="texto1">
    <tr>
                    <td valign="top"><p align="center"><%=mensaje%></p>                      </td>
                  </tr>
                </table>
                <p>&nbsp;</p>
              </div>
            
			</fieldset>                    </td>
                </tr>
                <tr>
                    <td><div class="info" align="center">
                            &nbsp;
                        </div>
                        <div align="center" class="piepag">Escuela
                            Colombiana de Ingeniería Julio Garavito<br>
                            AK. 45 No. 205-59 (Autopista Norte) / Contact Center: +57(1) 6683600 
                            <br>
                            Bogotá, D.C. , Colombia<br>&nbsp;
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
