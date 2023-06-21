<%@page import="utiles.Correo"%>
<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>

<% try {
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter oout = response.getWriter();
        String periodo = "PA";
        int semestud;
        Estudiante est;
        HttpSession sesion;
        sesion = request.getSession();
        //Estudiante est = (Estudiante) session.getAttribute("estClase");

        String mensaje = new String((String) session.getAttribute("mensaje"));
        String bandmenu = new String((String) session.getAttribute("ban"));
        oout.println(mensaje);
        oout.println(bandmenu);
        // String nivclas = new String((String) session.getAttribute("nivclas"));
        String nivclas = new String((String) session.getAttribute("nivclas"));
        //"MMAMAA";
        String carnet = new String((String) session.getAttribute("carnet"));
        est = new Estudiante(carnet, oout);
        //"2102333";
        //new String((String) session.getAttribute("carnet"));
        //"2102333";
        String estado = est.getEstado();
        Vector ingles = est.Ingles(carnet);
        Vector inglesver = est.InglesVer(carnet);
        Vector inglesverNivel = est.InglesVerNivel(carnet);
        String asigna = new String();
        String ingniv = new String();
        String idasig = new String();

        /* if(ingles.size()>0){
         ingniv = (String) ((Vector) ingles.elementAt(0)).elementAt(0);
         idasig = (String) ((Vector) ingles.elementAt(0)).elementAt(1);
         }else {
         ingniv="No disponible";
         asigna="";
         }*/

        /* if (idasig.equals("0") || idasig.equals("-1")) {
         asigna = "Eximido";
         }else*/ if (inglesver.size() > 0) {
            ingniv = (String) ((Vector) inglesver.elementAt(0)).elementAt(0);
            idasig = (String) ((Vector) inglesver.elementAt(0)).elementAt(1);
            // asigna = (String) ((Vector) inglesver.elementAt(0)).elementAt(2);
            asigna = "Eximido";
        } else if (inglesverNivel.size() > 0) {
            ingniv = (String) ((Vector) inglesverNivel.elementAt(0)).elementAt(0);
            idasig = (String) ((Vector) inglesverNivel.elementAt(0)).elementAt(1);
            asigna = (String) ((Vector) inglesverNivel.elementAt(0)).elementAt(2);
        } else {
            ingniv = "No disponible";
            asigna = "";
        }

        /* if (idasig.equals("0")) {
         asigna = "Eximido";
         }*/



        // String ingles = "";
        String anterior = request.getParameter("anterior");
        String home = "#";
        if (anterior == null) {
            anterior = "#";
        }
        if (bandmenu.equals("0")) {
            home = "menuServEstud";
        } else {
            home = "menuServEstud1";
        }
        Vector datosEst = est.getDatosEst(carnet);
        Hashtable ht = new Hashtable();
        ht.put("A", "Nivel Alto");
        ht.put("M", "Nivel Medio");
        ht.put("B", "Nivel B&aacute;sico");
        Vector clasific = new Vector();
        if (nivclas.length() >= 4 || nivclas.length() == 5) {
            if (ht.get(nivclas.substring(0, 1)) != null) {
                clasific.addElement(ht.get(nivclas.substring(0, 1)));
            } else {
                clasific.addElement("");
            }
            if (ht.get(nivclas.substring(1, 2)) != null) {
                clasific.addElement(ht.get(nivclas.substring(1, 2)));
            } else {
                clasific.addElement("");
            }
            if (ht.get(nivclas.substring(2, 3)) != null) {
                clasific.addElement(ht.get(nivclas.substring(2, 3)));
            } else {
                clasific.addElement("");
            }
            if (ht.get(nivclas.substring(3, 4)) != null) {
                clasific.addElement(ht.get(nivclas.substring(3, 4)));
            } else {
                clasific.addElement("");
            }
            if (nivclas.length() > 4) {
                if (ht.get(nivclas.substring(4, 5)) != null) {
                    clasific.addElement(ht.get(nivclas.substring(4, 5)));
                } else {
                    clasific.addElement("");
                }
            } else {
                clasific.addElement("");
            }
        } else {
            for (int ct = 0; ct < 6; ct++) {
                clasific.addElement("");
            }
        }
%>
<link href="css/comun.css" rel="stylesheet" type="text/css">
<link href="css/menu1.css" rel="stylesheet" type="text/css">

<!-- Inicio -->
<!--<div align="center"><img src="img/cabezote_interno3.jpg" width="774" height="177"></div>-->
<div align="center"><img src="img/serviciosestudiantes.jpg" width="772" height="228" usemap="#m_CABEZOTE"></div>
<map name="m_CABEZOTE"> 
    <area shape="rect" coords="616,57,765,72" href="http://www.escuelaing.edu.co/es/financiacion" >
    <area shape="rect" coords="545,60,607,72" href="http://www.escuelaing.edu.co/es/programas/admisiones" >
    <area shape="rect" coords="476,60,539,73" href="http://www.escuelaing.edu.co/es/programas" >
    <area shape="rect" coords="407,59,470,73" href="http://www.escuelaing.edu.co/es/comunidad/estudiantes" >
    <area shape="rect" coords="366,59,402,72" href="http://www.escuelaing.edu.co" >
</map>

<table width="100%" border="0" align="center" class="tabla">
    <%//if ((datosEst.size()>0) && ( (Integer.parseInt(estado) > 0) || (Integer.parseInt(estado) == -3) || (Integer.parseInt(estado) == -4) || (Integer.parseInt(estado) == -8) || (Integer.parseInt(estado) == -9)) ){%>
    <%
        if ((datosEst.size() > 0)) {
            for (int j = 0; j < 1; j++) {
                Vector datos = (Vector) datosEst.elementAt(j);
                int idplan = Integer.parseInt(datos.elementAt(5).toString());
                if (idplan >= 255) {
                    semestud = Integer.parseInt(datos.elementAt(3).toString());

                    // Requisito de Ingles
                /*if(semestud <= 5){
                     if(est.getReqIngles(carnet, "890").equals(""))
                     ingles = "<br>Recuerde que debe cumplir con el requisito de inglés antes de iniciar el sexto (6) semestre (clasificación mínima de Nivel 4B)<br> " +
                     "<a href=\"\" onclick=\"window.open('http://www.escuelaing.edu.co/servicios/estudiantes/ingles.htm','','height=600,width=800, toolbar=yes,scrollbars=yes,location=no,directories=yes,status=yes,menubar=yes,resizable=yes');return false\">" +
                     " << Reglamentación idioma inglés >> </a>";
                     }else if(semestud <= 10){
                     if(est.getReqIngles(carnet, "5880").equals(""))
                     ingles = "<br>Recuerde que debe cumplir con el requisito de inglés para la obtención de su grado (Certificación del logro de un nivel avanzado)<br> " +
                     "<a href=\"\" onclick=\"window.open('http://www.escuelaing.edu.co/servicios/estudiantes/ingles.htm','','height=600,width=800, toolbar=yes,scrollbars=yes,location=no,directories=yes,status=yes,menubar=yes,resizable=yes');return false\">" +
                     " << Reglamentación idioma inglés >> </a>";
                     }*/
                }
    %>
    <tr>
        <td width="88%" height="6">
            <b>Nombre:</b> &nbsp;<%=datos.elementAt(0)%>&nbsp;&nbsp;&nbsp;
            <b>Estado:</b>&nbsp;&nbsp;&nbsp;<%=datos.elementAt(4)%>&nbsp;&nbsp;&nbsp;
            <b>Plan
                de Estudios:</b>&nbsp;<%=datos.elementAt(2)%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br>
            <b>Programa:</b>&nbsp;<%=datos.elementAt(1)%>&nbsp;&nbsp;&nbsp; <b>Semestre
                :</b> &nbsp;<%=datos.elementAt(3)%>&nbsp;&nbsp;&nbsp;<b>Niv.Inglés:</b>&nbsp;<%=ingniv%> - <%=asigna%>
                <%SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy'-'HH:mm:ss");
                    Date currentTime_1 = new Date();
                    String dateString = formatter.format(currentTime_1);%>
            &nbsp;&nbsp;&nbsp;Fecha:
            <!%= dateString%>

            <!%= ingles%>

            <%Vector fecha = est.FechaBD();%>
            <%String fechasis = (String) ((Vector) fecha.elementAt(0)).elementAt(0);%>
            <%=fechasis%>
            <div align="center">
                <HR>
                <% if (bandmenu.equals("0")) {%>

                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla">
                    <tr>
                        <td width="30%"><b>NIVELES DE CLASIFICACI&Oacute;N:</b></td>
                        <td width="30%"><b>Matem&aacute;ticas:</b> <%=clasific.elementAt(0)%></td>
                        <td><b>Filosofia:</b> <%=clasific.elementAt(1)%></td>
                    </tr>
                    <tr>
                        <td width="30%"><b>F&iacute;sica:</b> <%=clasific.elementAt(2)%></td>
                        <td width="30%"><b>Lenguaje:</b> <%=clasific.elementAt(3)%></td>
                        <td><b>Qu&iacute;mica:</b> <%=clasific.elementAt(4)%> </td>
                    </tr>
                </table>
                <%}%>
                <table width="100%" border="0" class="tabla">
                    <tr>
                        <td width="50%"><%
                            if (!mensaje.equals("Bienvenido")) {
                            %>
                            <strong>
                                <marquee>
                                    <%=mensaje%>
                                </marquee>
                            </strong>
                            <%
                                }
                            %>
                        </td>
                        <!-- Botones -->
                        <td>
                            <div align="right" class="mattblacktabs">
                                <ul>
                                    <li><a href="LogOutEst"><img alt=""  src="img/door_out.png" width="16" height="16" border="0"> Cerrar</a></li>
                                    <li><a href="<%=anterior%>"><img src="img/arrow_left.png" width="16" height="16" border="0"> Anterior</a></li>
                                    <li><a href="<%=home%>"><img src="img/house.png" width="16" height="16" border="0"> Home</a></li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
    <%}
        } else {

            out.println("No hay información disponible.");
        }%>
</table>

<%
    } catch (Exception e) {
        Correo correo = new Correo();
        correo.enviar("Encabezado Estudiantes", e.getMessage());
    }
%>
