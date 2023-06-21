<%-- 
    Document   : formencuestaposgrados
    Created on : 4/07/2017, 02:12:04 PM
    Author     : lucero.rodriguez
--%>

<%@ include file= "../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>

<%HttpSession sesion;
    PrintWriter oout = response.getWriter();
    Estudiante est = (Estudiante) session.getAttribute("estClase");
    String descripfactor = "";
    String nombrefactor = "";
    String grupo = "";
    String iden = "";
    String prog = "";
    String descripcion = "";
    String id_encuestado = "";
    String per = "";
    String tipo = "";
    String asignatura = "";
    String nro= "";
    String datos = request.getParameter("datos");
    //String dato2 = request.getParameter("grupo1");
     // out.println(datos);
    StringTokenizer st = new StringTokenizer(datos, "*");
    int w = 0;
    String texto[] = new String[2000];
    while (st.hasMoreTokens()) {
        texto[w] = st.nextToken();
        w = w + 1;
    }
    grupo = (String) texto[0];
    iden = (String) texto[1];
    prog = (String) texto[2];
    descripcion = (String) texto[2];
    id_encuestado = (String) texto[3];
    per = (String) texto[4];
    tipo = (String) texto[5];
    asignatura= (String) texto[6];
    nro= (String) texto[7];
    
    asignatura= asignatura.replace ("á", "a");
    asignatura= asignatura.replace ("é", "e");
    asignatura= asignatura.replace ("í", "i");
    asignatura= asignatura.replace ("ó", "o");
    asignatura= asignatura.replace ("ú", "u");
    session = request.getSession(true);

    int CodFactor = 0;

    Vector FactorEnc = est.FactoresEnc(iden);
    Vector Profesor = est.ProfesorEncuesta(grupo, per, nro);
    String nomprof = "";
    if (Profesor.size()>0){
    nomprof = ((Vector) Profesor.elementAt(0)).elementAt(0).toString();
    }
    if (FactorEnc.size() > 0) {
        int totfac = FactorEnc.size();
        int maxi = 0;
        Vector maximo = est.MáximoFactor(id_encuestado, iden);

        String max = ((Vector) maximo.elementAt(0)).elementAt(0).toString();
        if (max.equals("No disponible")) {
            maxi = 0;
        } else {

            maxi = Integer.parseInt(max);
        }

        int cuentafac = 0;
        String dato = "";%>
<html>
    <head>
        <link href="css/encuestaODI.css" rel="stylesheet" type="text/css" media="all"/>
        <style>
            @font-face {
                font-family: "Open Sans Condensed";
                src: url(../web-fonts/opensans_light_macroman/OpenSans-Light-webfont.eot);
                src: url(../web-fonts/opensans_light_macroman/OpenSans-Light-webfont.svg);
                src: url(../web-fonts/opensans_light_macroman/OpenSans-Light-webfont.woff);
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
        <title>Encuestas Autoevaluación con fines de Acreditación Institucional</title>
        <link href="css/encuestaODI.css" rel="stylesheet" type="text/css" media="all"/>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <SCRIPT LANGUAGE="JavaScript">

            function comprueba(contador, CodFactor) {
            var nombre, valida, comentarios, p;
            for (i = 1; i <= contador; i++) {

            p = new String("p" + i);

            nombre = new String("P" + CodFactor + i);

            if (document.forms.form1.comentarios.value.length > 500) {
            alert("Los comentarios no pueden exceder los 500 caracteres");
            document.form1.comentarios.style.backgroundColor = '#ffcc00';
            return false;
            }

            if (document.forms.form1.aspectos.value.length > 500) {
            alert("Los aspectos a mejorar no puede exceder los 500 caracteres");
            document.form1.aspectos.style.backgroundColor = '#ffcc00';
            return false;
            }

            valida = document.getElementById("valida" + i).value;
            if (valida == 3) {
            if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked) {
            alert("Por favor responda todos los campos de la encuesta");
            document.forms.form1[nombre][0].style.outline = '1px solid #990000';
            document.forms.form1[nombre][1].style.outline = '1px solid #990000';
            document.forms.form1[nombre][2].style.outline = '1px solid #990000';
            document.forms.form1[nombre][0].focus();
            return false;
            }
            }

            if (valida == 4) {
            if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked && !document.forms.form1[nombre][3].checked) {
            alert("Por favor responda todos los campos de la encuesta");
            document.forms.form1[nombre][0].style.outline = '1px solid #990000';
            document.forms.form1[nombre][1].style.outline = '1px solid #990000';
            document.forms.form1[nombre][2].style.outline = '1px solid #990000';
            document.forms.form1[nombre][3].style.outline = '1px solid #990000';
            document.forms.form1[nombre][0].focus();
            return false;
            }
            } else if (valida == 5) {

            if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked && !document.forms.form1[nombre][3].checked && !document.forms.form1[nombre][4].checked) {
            alert("Por favor responda todos los campos de la encuesta");
            document.forms.form1[nombre][0].style.outline = '1px solid #990000';
            document.forms.form1[nombre][1].style.outline = '1px solid #990000';
            document.forms.form1[nombre][2].style.outline = '1px solid #990000';
            document.forms.form1[nombre][3].style.outline = '1px solid #990000';
            document.forms.form1[nombre][4].style.outline = '1px solid #990000';
            document.forms.form1[nombre][0].focus();
            return false;
            }

            } else if (valida == 6) {
            if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked && !document.forms.form1[nombre][3].checked && !document.forms.form1[nombre][4].checked && !document.forms.form1[nombre][5].checked) {
            alert("Por favor responda todos los campos de la encuesta");
            document.forms.form1[nombre][0].style.outline = '1px solid #990000';
            document.forms.form1[nombre][1].style.outline = '1px solid #990000';
            document.forms.form1[nombre][2].style.outline = '1px solid #990000';
            document.forms.form1[nombre][3].style.outline = '1px solid #990000';
            document.forms.form1[nombre][4].style.outline = '1px solid #990000';
            document.forms.form1[nombre][5].style.outline = '1px solid #990000';
            document.forms.form1[nombre][0].focus();
            return false;
            }
            } else if (valida == 7) {
            if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked && !document.forms.form1[nombre][3].checked && !document.forms.form1[nombre][4].checked && !document.forms.form1[nombre][5].checked && !document.forms.form1[nombre][6].checked) {
            alert("Por favor responda todos los campos de la encuesta");
            document.forms.form1[nombre][0].style.outline = '1px solid #990000';
            document.forms.form1[nombre][1].style.outline = '1px solid #990000';
            document.forms.form1[nombre][2].style.outline = '1px solid #990000';
            document.forms.form1[nombre][3].style.outline = '1px solid #990000';
            document.forms.form1[nombre][4].style.outline = '1px solid #990000';
            document.forms.form1[nombre][5].style.outline = '1px solid #990000';
            document.forms.form1[nombre][6].style.outline = '1px solid #990000';
            document.forms.form1[nombre][0].focus();
            return false;
            }
            }

            }//for
            return true;

            }

            function confirmacion() {
            var pregunta = confirm("Recuerde que hasta el momento usted ha respondido parcialmente la encuesta. Su opinión es muy importante, por lo que lo invitamos a terminarla y enviarla oportunamente para tener en cuenta sus apreciaciones y comentarios.")
            if (pregunta) {
            window.location = "LogOutEst";
            }
            else {
            alert("Gracias por permanecer en la página!")
            }
            }
            
            

        </SCRIPT>
        <style type="text/css"></style>
    </head>
    <body>

        <% int valida = 0;%>
        <!--NUEVO-->

        <% Vector preguntas = est.PreguntasEnc(iden);
      
            int total = preguntas.size();%>
        <form name="form1"  method="post"  action="autoevaluacionNuevo">
            <input type="hidden" name="prog" value="<%=prog%>">
            <input type="hidden" name="total" value="<%=total%>">      
            <input type="hidden" name="idenc" value="<%=iden%>">
            <input type="hidden" name="tipo" value="<%=tipo%>">
            <input type="hidden" name="asignatura" value="<%=asignatura%>">
            <input type="hidden" name="nro" value="<%=nro%>">

            <%
                int i = 0;

                //PREGUNTAS POR CADA FACTOR
                Vector Contesto = est.ContestoFactor(id_encuestado, iden);
                int totalcontesto = Contesto.size();
                if (totalcontesto == totfac) {
                    int Encuestado = est.Encuestado(id_encuestado, iden);%>
            <p>
            <div id="container">
                <!--inicio header-->
                <header>
                </header>
            </div>
            <br>
            <center><h4>La Institución agradece sus valiosos aportes que sin duda contribuirán al éxito de los procesos de autoevaluación y a la mejora continua.</h4></center>
            <br><br>
            <p>

            <center><h3><a href="LogOutEst"> Salir </a></h3></center>  
            <br>
            <center><h3><a href="ListaEncuestasPosgrados"> Regresar </a></h3></center>  
                        <%} else {
                            //Vector FactorE = (Vector) FactorEnc.elementAt(maxi);
                            Vector FactorE = (Vector) FactorEnc.elementAt(totalcontesto);
                            String nombre = "factor";
                            CodFactor = (Integer.valueOf((String) FactorE.elementAt(0))).intValue();
                            Vector Factores = est.Factores(CodFactor);
                            descripfactor = ((Vector) Factores.elementAt(0)).elementAt(0).toString();
                            nombrefactor = ((Vector) Factores.elementAt(0)).elementAt(1).toString();
                            String nomfac = nombre + CodFactor;

                            Vector preguntasFactor = est.PreguntasEncFactor(iden, CodFactor);
                            //    int pregfac = preguntasFactor.size();
                            //CUANTOS FACTORES TIENE LA ENCUESTA

                            if ((preguntasFactor.size() > 0)) {
                                int contador = preguntasFactor.size();
                                // int y = 5;
                                int t = 0;

                                for (int k = 0; k < contador; k++) {
                                    Vector PregFactor = (Vector) preguntasFactor.elementAt(k);
                                    String identifica = PregFactor.elementAt(0).toString();
                                    String hasta = PregFactor.elementAt(4).toString();
                                    valida = Integer.parseInt(hasta);

                                    if (t == 0) {%>
            <div id="container">
                <!--inicio header-->
                <header> </header> 
                <!--inicio section-->
                <!--inicio aside-->
                <!-- <h1><center>
                         <font size="5" color="#800000"><b>Factor <!%=CodFactor%></b></font> 
                     </center>
                 </h1>-->
                <p></p>
                
    <table width="50%" border="0">
      <tr> 
        <td colspan="7"> 
          <div align="left"><font size="2" color="#800000"><b>Asignatura:</b> 
            </font> </div>
        </td>
        <td width="88%"><%=asignatura%> </td>
      </tr>
      <tr> 
        <td colspan="7"> 
          <div align="left"><font size="2" color="#800000"><b> Profesor : </b> 
            </font> </div>
        </td>
        <td width="88%"><%=nomprof%></td>
      </tr>
    </table>
                <h1>
                    <center>
                        <b><font size="5" color="#800000"><%=nombrefactor%></font></b> 
                    </center></h1>
                <p>
                    <font size="3" >&nbsp;</font> 
                    <%t++;
                                    }%>

                <table width="100%" border="0">
                    <tr> 
                        <td colspan="8"> <font size="2" color="#800000"><b><%=k + 1%>. <%=PregFactor.elementAt(2)%></b></font></td>
                    </tr>
                    <tr> 
                        <td colspan="8">&nbsp; </td>
                    <tr> 
                    <p><font color="#990000"><b>
                            <!--%=Factores.elementAt(0)%-->
                        </b> </font></p>
                    <input type="hidden" id="valida<%=k + 1%>" value="<%=valida%>">
                    <input type="hidden" name="total" value="<%=total%>">
                    <input type="hidden" name="idenc" value="<%=iden%>">
                    <input type="hidden" name="prog" value="<%=prog%>">
                    <input type="hidden" name="confactor" value="<%=contador%>">
                    <input type="hidden" name="CodFactor" value="<%=CodFactor%>">
                    <input type="hidden" name="identifica<%=k + 1%>" value="<%=identifica%>">
                    <input type="hidden" name="indice<%=k + 1%>" value="<!%=indice%>">
                    <input type="hidden" name="nomfac" value="<%=nomfac%>">
                    <input type="hidden" name="descripcion" value="<%=descripcion%>">
                    <input type="hidden" name="id_encuestado" value="<%=id_encuestado%>">
                    <input type="hidden" name="per" value="<%=per%>">
                    <input type="hidden" name="grupo" value="<%=grupo%>">
                    <tr> 
                        <td  bgcolor="#F4F4F4"> 
                            <table  width="100%" border ="1" height="30">
                                <tr>
                                    <td><font size="2"> <%=PregFactor.elementAt(6)%></font></td>
                                </tr>
                            </table>
                        </td>
                        <td bgcolor="#F4F4F4">
                            <table width="100%" border ="1" height="30">
                                <tr>
                                    <td><font size="2"><%=PregFactor.elementAt(7)%></font></td>
                                </tr>
                            </table>
                        </td>
                        <td bgcolor="#F4F4F4">
                            <table width="100%" border ="1" height="30">
                                <tr>
                                    <td><font size="2"><%=PregFactor.elementAt(8)%></font></td>
                                </tr>
                            </table>
                        </td>
                        <% if (PregFactor.elementAt(4).equals("4")) {%>
                        <td bgcolor="#F4F4F4">
                            <table width="100%" border ="1" height="30">
                                <tr>
                                    <td><font size="2"><%=PregFactor.elementAt(9)%></font></td>
                                </tr>
                            </table>
                        </td>
                        <% }
            if (PregFactor.elementAt(4).equals("5")) {%>
                        <td bgcolor="#F4F4F4">
                            <table width="100%" border ="1" height="30">
                                <tr>
                                    <td><font size="2"><%=PregFactor.elementAt(9)%></font></td>
                                </tr>
                            </table>
                        </td>
                        <td bgcolor="#F4F4F4">
                            <table width="100%" border ="1" height="30">
                                <tr>
                                    <td><font size="2"><%=PregFactor.elementAt(10)%></font></td>
                                </tr>
                            </table>
                        </td>
                        <%}
            if (PregFactor.elementAt(4).equals("6")) {%>
                        <td  bgcolor="#F4F4F4">
                            <table width="100%" border ="1" height="30">
                                <tr>
                                    <td><font size="2"><%=PregFactor.elementAt(9)%></font></td>
                                </tr>
                            </table>
                        </td>
                        <td  bgcolor="#F4F4F4">
                            <table width="100%" border ="1" height="30">
                                <tr>
                                    <td><font size="2"><%=PregFactor.elementAt(10)%></font></td>
                                </tr>
                            </table>
                        </td>
                        <td  bgcolor="#F4F4F4">
                            <table width="100%" border ="1" height="30">
                                <tr>
                                    <td><font size="2"><%=PregFactor.elementAt(11)%></font></td>
                                </tr>
                            </table>
                        </td>
                        <%}
            if (PregFactor.elementAt(4).equals("7")) {%>
                        <td bgcolor="#F4F4F4">
                            <table width="100%" border ="1" height="30">
                                <tr>
                                    <td><font size="2"><%=PregFactor.elementAt(9)%></font></td>
                                </tr>
                            </table>
                        </td>
                        <td  bgcolor="#F4F4F4">
                            <table width="100%"  border ="1" height="30">
                                <tr>
                                    <td><font size="2"><%=PregFactor.elementAt(10)%></font></td>
                                </tr>
                            </table>
                        </td>
                        <td  bgcolor="#F4F4F4">
                            <table width="100%" border ="1" height="30">
                                <tr>
                                    <td><font size="2"><%=PregFactor.elementAt(11)%></font></td>
                                </tr>
                            </table>
                        </td>
                        <td  bgcolor="#F4F4F4">
                            <table  width="100%" border ="1" height="30">
                                <tr>
                                    <td><font size="2"><%=PregFactor.elementAt(12)%></font></td>
                                </tr>
                            </table>
                        </td>
                        <%}%>
                    </tr>
                    <tr> 
                        <%  dato = PregFactor.elementAt(4).toString();
                            int cuantos = Integer.parseInt(dato);
                            int x = cuantos;
            //int a = (cuantos - 1);
            int a = 0;

            for (int p = 1; p <= cuantos; p++) {%>
                        <% String valores = PregFactor.elementAt(5).toString().substring(a, p);
                            a++;
                            // String valores = pregunta.elementAt(5).toString().substring(a, x);
            //a--;
            //x--;%>
                        <td id="p<%=k + 1%>">
                            <table width="100%" border ="1" height="30">
                                <tr>
                                    <td> 
                                        <p>&nbsp;</p>
                                        <p> 
                                        <div align="center"> 
                                            <input type="radio" name="P<%=CodFactor%><%=k + 1%>" value="<%=valores%>|<%=PregFactor.elementAt(0)%>">
                                        </div></p>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <%}%>
                    </tr>
                    <tr> 
                    <tr valign="middle"> 
                        <!--td colspan="8">
                                                        <b>Comentarios:</b>
                                                    </td-->
                    </tr></tr>
                    <td class="linea" colspan="8">
                        <hr>
                    </td>
                    <%}%>
                    <tr> 
                        <td colspan="8"> 
                            <p>Aspectos para mejorar:</p>
                            <p> 
                                <textarea name="aspectos" rows="2" cols="120" maxlength="500"></textarea>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="7">
                            <p>Comentarios y sugerencias:</p>
                            <p> 
                                <textarea name="comentarios" rows="2" cols="120" maxlength="500"></textarea>
                            </p>
                        </td>
                    </tr>
                    <tr> 
                        <td colspan="7"> 
                            <div align="center"> 
                                <input type="submit" name="Submit" class="input boton" value="GUARDAR Y SIGUIENTE" onclick="return comprueba(<%=contador%>,<%=CodFactor%>);">
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
        <div id="container">

            <table  width="100%" border="0">
                <tr>
                    <td> 
                        <div align="center">
                            <input class="boton" type="submit" name="Submit" value="SALIR"  onClick="confirmacion()" >
                        </div>
                    </td>
                </tr>
            </table>

        </div>

        <% }
                    //  s = FactorEnc.size();
                }
            }%>

        <h1>&nbsp;</h1>
        <h1 align="center">&nbsp;</h1>
        <div align="center"></div>

        <script src="js/jquery.js"></script>
        <script src="http://code.jquery.com/jquery-latest.jS"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
