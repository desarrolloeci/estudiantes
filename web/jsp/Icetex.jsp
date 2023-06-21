<%-- 
    Document   : Icetex
    Created on : 27/10/2016, 10:34:06 AM
    Author     : lucero.rodriguez
--%>
<%@page import="java.text.DateFormat"%>
<%@page import="utiles.Correo"%>
<%@ include file="secure.jsp" %>
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*, javax.swing.*, javax.swing.Timer, java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%
    response.setHeader("Cache-Control", "no-cache");
    session = request.getSession(true);
    String mensaje = "";
    int ind = 0;
    String nombres = new String((String) session.getAttribute("nombre"));
    String nombre = "";
    String pilo = "";
    String linea = "";
    String tipo = "";
    String valormatricula = "";
    eci.adjuntar adjuntar;
    String ban = new String((String) session.getAttribute("ban"));
    String id_plan = new String((String) session.getAttribute("id_plan"));
    PrintWriter oout = response.getWriter();
    Estudiante est = (Estudiante) session.getAttribute("estClase");
    Vector datosEst = est.getDatosEst(carnet), datosestud;
    configECI confEci = new configECI();
    String ruta = new String();
    String estado = new String();
    String operacion = "n";
    Vector can = est.ConsultacredistosE(confEci.getPeriodoActual(), carnet);

    //validar si ya contesto todas las encuestas académicas sino enviarlo a la encuesta.
   Vector CuantosEnc = est.AsignaEncuestaA(carnet);
     Vector cuantos = new Vector();
     cuantos = (Vector) CuantosEnc.elementAt(0);
     int total;
     //validar si ya contesto todas las encuestas académicas sino enviarlo a la encuesta.
     total = (Integer.parseInt((String) cuantos.elementAt(0)));  //cuantos debe contestar en la encuesta academica

     Vector contesto = est.ContestaEncuestaA(carnet);
     Vector valorcontesto = new Vector();
     valorcontesto = (Vector) contesto.elementAt(0);
     int totalcontesto;
     totalcontesto = (Integer.parseInt((String) valorcontesto.elementAt(0))); //cuantas asignaturas contesto
     //ESTE FALSE SE QUITA CUANDO LO SOLICITE LILIANA PEDRAZA
    if (false && total != totalcontesto) {
     response.sendRedirect("ListaEncuestas");
     } else {
    if (datosEst.size() > 0) {
        datosestud = (Vector) datosEst.elementAt(0);
        int sem = Integer.parseInt(datosestud.elementAt(3).toString());
        pilo = datosestud.elementAt(6).toString();

    }
    Vector icetex = est.Renovar_Icetex(carnet, confEci.getPeriodoSig());
    Vector Valor = est.Valor_Matricula(carnet, confEci.getPeriodoSig());
    if (Valor.size() > 0) {
        for (int p = 0; p < icetex.size(); p++) {
            Vector valormatric = (Vector) Valor.elementAt(p);
            valormatricula = valormatric.elementAt(0).toString();

        }
    }%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Renovación Icetex</title>
        <script language="JavaScript" type="text/JavaScript">
            <%if (pilo.equals("S")) {%>
            window.open("html/mensajeicetex.html" , "ventana1" , "width=420,height=150,scrollbars=NO, left=600, top=400") 
            <%}%>


            function ValidarMod() {
            var max = document.fmArchivos.chElim.length
            var j = 0
            for (i = 0; i < max; i++) {
            if (document.fmArchivos.chElim[i].checked == true)
            j++;
            }
            if (j = 0) {
            alert("Para modificar tiene que seleccionar un recurso")
            } else if (j > 1) {
            alert("Solo puede seleccionar un campo")
            } else {
            document.action = 'LA OTRA ACCION'
            document.submit()
            }
            }


            function ValidarChk(temp) {
            var max = document.fmArchivos.chElim.length
            var vall = false
            for (i = 0; i < max; i++) {
            if (document.fmArchivos.chElim[i].checked == true)
            vall = true
            }
            if (temp == 1) {
            vall = true
            }
            if (vall == true)
            document.fmArchivos.submit()
            else
            alert("Para eliminar tiene que seleccionar algun recurso")
            }

            function chkAll() {
            var max = document.fmArchivos.chElim.length
            var vall
            if (document.fmArchivos.chAll.checked == true)
            vall = true
            else
            vall = false
            for (i = 0; i < max; i++) {
            document.fmArchivos.chElim[i].checked = vall
            }
            }


            function chkUn() {
            var max = document.fmArchivos.chElim.length
            var vall = true
            if (document.fmArchivos.chAll.checked == true)
            document.fmArchivos.chAll.checked = false
            for (i = 0; i < max; i++) {
            vall = vall && document.fmArchivos.chElim[i].checked
            }
            if (vall == true)
            document.fmArchivos.chAll.checked = true
            }

            function adjuntar() {
            document.forminsc.action = "Backup";
            //window.open("", "ventanaImpreNotas", "toolbar=no,scrollbars=yes,location=no,directories=yes,status=no,menubar=yes,resizable=yes");
            ///document.formulario.submit();
            }

            function validar(formulario, archivo) {
            var b = archivo.split('.');

            if (document.formulario.tipo.value == "NULL"){
            alert("Por favor seleccione el tipo de matricula");
            document.formulario.tipo.style.backgroundColor = '#ffcc00';
            document.formulario.tipo.focus();
            return false;
            }
            
            if (document.formulario.tipo.value== "MM") {
            if (confirm("Recuerde que al seleccionar esta opción cursara sólo 9 créditos académicos el próximo semestre")) {
                        return true;
                    } else {
                        return false;
                    }
            }

            if (b[b.length - 1] == 'pdf') {
            var nomar = document.formulario.archivoupload.value;
            var x = archivo.split('\\');
            nomar = x[x.length - 1];
            document.formulario.action = 'FileUploadEstudiantes';
            return true;
            }

            else {
            alert('Error: El archivo debe ser .pdf');
            return false;
            }
            }

        </script>

    </head>

    <body>

        <div id="container">
            <table width="770" border="0" align="center" cellpadding="0" cellspacing="0" class="textoimpremas">
                <tr>
                    <td colspan="2" bgcolor="#EEEEEE"><img src="img/top.gif" alt="" width="770" height="10" id="top" /></td>
                </tr>
                <tr>
                    <td>
                        <jsp:include page="encabezado" flush="true">
                            <jsp:param name="anterior" value="menuServEstud" />
                        </jsp:include></td>
                </tr>
            </table>

    <%if (icetex.size() > 0) {
        for (int a = 0; a < icetex.size(); a++) {
            Vector dato = (Vector) icetex.elementAt(a);
            linea = dato.elementAt(4).toString();
            estado = dato.elementAt(1).toString();
            tipo = dato.elementAt(5).toString();

        }
        if (estado.equals("1") || (estado.equals("2")) || (estado.equals("4"))) {
                    if (estado.equals("4")){%>
                          <p><center><b> Su formato de renovación NO se ha recibido a satisfacción.  Por favor vuelva a cargar el formato.  
                        Recuerde que debe ser en un solo archivo las dos hojas y diligenciar ciudad, fecha y firma en el formato. </b></center>
                   <% }
                    //response.sendRedirect("MensajeIcetex?valormatricula="+ valormatricula);
                    //} 
                    //else {
                    nombre = "ri" + carnet + ".pdf";

                    String programa = "";
                    //ruta = "C:/Sun/Icetex";

                    ruta = "/home/shares/doc_admin/Icetex";

                    adjuntar = new eci.adjuntar("RenovacionIcetex", ruta);

                    if (operacion == null) {
                        operacion = "n";
                    } else if (operacion.compareTo("ar") == 0) {
                        out.println("entra");
                        String[] chElim;
                        int lngCh;
                        Integer idRec;
                        chElim = request.getParameterValues("chElim");
                        lngCh = chElim.length;
                        for (int i = 0; i < lngCh; i++) {
                            if (chElim[i].compareTo("null") != 0) {
                                adjuntar.rmArchivo((String) chElim[i]);
                            }
                        }

            %>


            <%
            } else {
            %>

            <p>&nbsp;</p>
            <form enctype="multipart/form-data" method="post" name="formulario" action="FileUploadEstudiantes">

                <table align="center" width="535" border="1" class="textoimpremas">
                    <tr> 
                        <td width="233"><b>Periodo a renovar</b></td>
                        <td width="144"><%=confEci.getPeriodoSig()%></td>
                    </tr>
                    <tr> 
                        <td width="233"><b>C&oacute;digo estudiante:</b></td>
                        <td width="144"><%=carnet%></td>
                    </tr>
                    <tr> 
                        <td width="233"><b>Documento:</b></td>
                        <td width="144"><%=est.getDocest()%></td>
                    </tr>

                    <tr> 
                        <td width="233"><b>Valor de la matr&iacute;cula:</b></td>
                        <td width="144"><%=valormatricula%></td>
                    </tr>
                    <tr> 
                        <td width="233"><b>L&iacute;nea de cr&eacute;dito:</b></td>
                        <td width="144"><%=linea%> </td>
                    </tr>
                    <tr> 
                        <td width="233"><b>Tipo de matrícula:</b></td>
                        <td width="144"> 

                            <select name="tipo">
                                <option value="NULL">Seleccione </option>
                                <option value="MC">MATRICULA COMPLETA</option>
                                <option value="MM">MEDIA MATRICULA </option>
                                <option value="P">PRACTICA PROFESIONAL</option>
                                <option value="M">MOVILIDAD</option>
                                <option value="A">APLAZAR</option>
                            </select>

                        </td>
                    </tr>
                </table>

                <table align="center" width="535" border="0" cellpadding="0" cellspacing="0" >

                    <!--p align="center"><font color="#990000" size="2"><a href="https://www.escuelaing.edu.co/escuela/importantDoc/Apoyo-Instructivo-Renovacion.pdf" TARGET="blank">CONSULTE EL INSTRUCTIVO AQUI</a></font></p-->
                    <p>
                    <center>Si tiene alguna inquietud, esta será atendida en la Oficina de Apoyo Financiero, Bloque A primer piso</center></p>
                    <tr><td><b><center></center></b></td></tr>
                    <tr>
                        <td bgcolor="#FFFFFF">
                            <% if (operacion.equals("n")) {
                                    int i = 0;%>

                            <table width="750" border="0" align="center" cellspacing="0" class="textocom">

                                <%
                                    DateFormat dateFormatter = DateFormat.getDateInstance(DateFormat.MEDIUM);
                                    long x = adjuntar.fecArchivo(nombre);
                                    String f = "";
                                    if (!(x == 0)) {
                                        Date fec = new Date(adjuntar.fecArchivo(nombre));
                                        f = dateFormatter.format(fec);
                                    }

                                %>
                                <tr>
                                    <td width="11%">
                                        <div align="center">
                                            <!--    <input type="checkbox" name="chElim" onClick="chkUn()" value = "<%=adjuntar.nomArchivo(nombre)%>">-->
                                        </div></td>
                                    <td width="50%">
                                        <div align="center"> </div>
                                        <div align="center"><!%=adjuntar.nomArchivo(nombre)%> </div></td>
                                    <td width="21%">
                                        <div align="center"><!%=adjuntar.tamarch(nombre)%> </div></td>
                                    <td width="18%">
                                        <div align="center"><!%=f%></div></td>
                                </tr>

                                <table width="400" border=0" align="center" cellspacing="0" class="textocom">
                                    <tr>
                                        <td width="120" valign="top" >
                                            <div align="left" class="resaltados">Cargar hoja de renovación:</div></td>


                                    <input name="carnet" type="hidden" value="<%=carnet%>">

                                    <input name="spath" type="hidden" id="spath3" value="correo">
                                    <input name="on" type="hidden" value="n">
                                    <input name="fpath" type="hidden" value="<%=ruta%>">
                                    <input name="nombre" type="hidden" value="<%=nombre%>">
                                    <input name="periodo" type="hidden" value="<%=confEci.getPeriodoSig()%>">

                                    <input name="carnet" type="hidden" value="<%=carnet%>">
                                    <input name="periodo" type="hidden" value="<%=confEci.getPeriodoSig()%>">
                                    <input name="documento" type="hidden" value="<%=est.getDocest()%>">
                                    <input name="valormatricula" type="hidden" value="<%=valormatricula%>">
                                    <input name="linea" type="hidden" value="<%=linea%>">


                                    <input name="nomestud" type="hidden" value="<!%=datos.elementAt(2)%>">

                                    <td>
                                        <table width="300" border="1" cellspacing="0" bordercolor="#FFD006" >
                                            <tr>
                                                <td>
                                                    <p align="left">
                                                        <input type="file" size="30" maxlength="300" name="archivoupload" class="campotext">
                                                    </p>
                                                    <p>
                                            <center>
                                                <input type="submit" name="uploadservlet" value="Adjuntar"  class="boton" onclick="return validar(this.formulario, this.form.archivoupload.value)">
                                            </center>
                                        </p></td>
                                    </tr>
                                </table></td>
                        </form>
                    </tr>
                </table>
                <%    } else {%>
                <div align="center" class="textocom"><strong class="titulos">Ha ocurrido un error al subir el archivo: </strong> <br>
                    <span class="contenidos"> - Recuerde que el tama&ntilde;o del archivo no debe ser superior a 50 Mb<br>
                        - Compruebe la ruta de la cual esta tomando el archivo<br>
                        - Evite las rutas largas<br>
                        - <em><font color="#990000" size="1"><%=operacion%></font></em><br>
                        <a href="Documentacion?on=n&spath=<!%=spath%>">Volver</a></span></div>

                </table>

                <% }
                    }
                } else if (estado.equals("3")) {%>
                <p><center><b> Su documento ha sido validado exitosamente. <br> Recuerde revisar la respuesta de renovación, cancelar o legalizar en la fechas establecidas </b>
                    <br>
                    <!--b><a target="_blank" href="https://tycho.escuelaing.edu.co/contenido/admisiones/pregrado/renovacion-icetex.html">FECHAS IMPORTANTES</a></b-->
                    <br>
                    <b><a target="_blank" href="https://www.escuelaing.edu.co/escuela/importantDoc/instructivo-legalizacion-icetex.pdf">INSTRUCTIVO LEGALIZACIÓN</a></b>
                    </center>
                    <%} 
                    } else {%>
                <p><center><b>Usted no se encuentra habilitado para realizar este proceso</b></center></p>

                <%}
                     }%>
        </div>
    </body>
</html>
