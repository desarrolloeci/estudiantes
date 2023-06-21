<%-- 
    Document   : Creditos
    Created on : 12/05/2015, 11:28:40 AM
    Author     : Lucero
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="../secure.jsp" %>
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%
    response.setHeader("Cache-Control", "no-cache");
    session = request.getSession(true);
    String mensaje = "";
    int ind = 0;
    int faltan = 0;
    float prome = 0;
    String nombre = new String((String) session.getAttribute("nombre"));
    String ban = new String((String) session.getAttribute("ban"));
    String id_plan = new String((String) session.getAttribute("id_plan"));
    PrintWriter oout = response.getWriter();
    Estudiante est = (Estudiante) session.getAttribute("estClase");
    Vector datosEst = est.getDatosEst(carnet), datosestud;

    configECI confEci = new configECI();
    Vector can = est.ConsultacredistosE(confEci.getPeriodoSig(), carnet);
    String periodo = confEci.getPeriodoSig();
    Vector matriculas = est.MatriculasSinPI(carnet);
    int matriculasSinPI = matriculas.size();
    if (datosEst.size() > 0) {
        datosestud = (Vector) datosEst.elementAt(0);
        int sem = Integer.parseInt(datosestud.elementAt(3).toString());
    }

    Vector Promedio = est.Promedio(carnet);
    int Maximo = Integer.parseInt(est.getMax());
    String prom = ((Vector) Promedio.elementAt(0)).elementAt(0).toString();
    prome = Float.parseFloat(prom);
    Vector acursado = est.getCreditos(carnet, id_plan, oout);
    Vector acursar = est.Creditosacursar(carnet, id_plan);
    String debecursar = ((Vector) acursar.elementAt(0)).elementAt(0).toString();
    int totalcursar = Integer.parseInt(debecursar);
    String cursado = ((Vector) acursado.elementAt(0)).elementAt(0).toString();
    int totalcursado = Integer.parseInt(cursado);
    faltan = totalcursar - totalcursado;
   // String annoactual = periodo.substring(0, 4);
   
   //Se verifica si el estudiante hizo transicion
   //Se consulta el registro del simulador de transicion para saber si el estudiante se cambio o no de plan
    Vector step=(Vector) est.VeriTransicion(carnet);
    //Se verifica si hubo resultados
    if(step.size()>0){
        step=(Vector) step.get(0);
    }else{
        if(est.EstIngresoDespuesTransicion(carnet).size()>0){
            //se asigna el step 0 de TIENE PLAN NUEVO DESDE EL PRINCIPIO porque debe ser un estudiante nuevo
            step= new Vector();
            step.add("0");
        }else{
            step= new Vector();
            step.add("6");
        }
    }
    
    //Se compara fecha para restringir solo antes de la fecha limite
    String fecha_limite="16/07/2020";  
    Date fecha_limite_creditos_extra=new SimpleDateFormat("dd/MM/yyyy").parse(fecha_limite);  
    Date hoy = new Date();
    Boolean solicitud_habilitada=hoy.before(fecha_limite_creditos_extra);


    //si es 5, el estudiante hizo transicion
    String paso=step.get(0).toString().trim();

    String per = periodo.substring(5, 6);%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios Académicos - Solicitud de crédito adicionales</title>

        <!-- JavaScript -->
        <script type="text/javascript" src="scripts/wufoo.js"></script>

        <!-- CSS -->
        <link rel="stylesheet" href="css/comun.css" type="text/css" />
        <script language="JavaScript" type="text/JavaScript">

        </script>
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
    </table>
    <p>
    <form name="form1" method="post" action="RespuestaCreditosE">
        <a href="http://tycho.escuelaing.edu.co/contenido/documentos/Creditosadicionales.pdf" TARGET="blank" >Lineamientos institucionales para asignación de créditos académicos adicionales.</a>
        <p>
        <table width="770" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
            <% if (matriculasSinPI < 4) {%>
            <tr>
                <td>
                    <b>Recuerde que sólo podrá solicitar créditos adicionales a partir de su cuarta matrícula académica en la Escuela (sin incluir matrículas de periodos intermedios). </b>
                </td>       
            </tr>
            <%} else if (can.size() > 0) {%>
            <tr>
                <td>
                    <b>No puede realizar solicitud de créditos adicionales por plazo o porque ya realizó esta solicitud. </b>
                </td>       
            </tr>
            <%} else if ((!paso.equals("5"))&&(prome < 3.80 && per.equals("1") && faltan > 29)) {%>

            <tr>
                <td>
                    <b>No puede realizar solicitud de créditos adicionales por promedio. </b>
                </td>       
            </tr>

            <%} else if ((!paso.equals("5"))&&(prome < 3.80 && per.equals("2") && faltan > 21)) {%>

            <tr>
                <td>
                    <b>No puede realizar solicitud de créditos adicionales por promedio. </b>
                </td>       
            </tr>
            <% } else if (est.getEstado().equals("12") || Maximo <= 9) {%>
            <tr>
                <td>
                    <b>No está autorizado para realizar  solicitud de créditos adicionales </b>
                </td>       
            </tr>

            <%} else if (!solicitud_habilitada) {%>
            <tr>
                <td>
                    <b>No está autorizado para realizar la solicitud porque ya pasó la fecha límite</b>
                </td>       
            </tr>

            <%} else {%>
            <tr>
                <td colspan="2">
                    <div class="info" align="center">
                        <h2><font color="#666666"> <label id="msj">Créditos Adicionales</label> </font></h2>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" align="center">
                        <tr>

                            <td width="35%"> <b><font size="2">Seleccione el número de créditos 
                                    adicionales a solicitar:</font></b></td>
                            <td width="65%"> 
                                <p>&nbsp;</p>
                                <select name="creditos">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <!--<option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>-->
                                </select>
                            </td>
                        <tr>
                            <td width="35%"> <b><font size="2">Justificaci&oacute;n</font></b></td>


                            <td width="65%"> 
                                <input type="text" name="justif" size="100" maxlength="100"></td>
                        </tr>

                        <tr>
                            <td colspan="2"> 

                                <div align="right">
                                    <p>&nbsp;</p>

                                    <p align="center"> 
                                        <input type="submit" name="Submit" value="Enviar">
                                    </p>
                                </div>

                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td bgcolor="#EEEEEE"><img src="img/bottom.gif" alt="" width="770" height="10" id="bottom" /></td>
            </tr>
        </table>
        <%}%>
        <p>
        <table width="770" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
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
        </table>
    </p>
</form>
