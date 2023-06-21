<%-- 
    Document   : PTransicion
    Created on : 24/08/2018, 08:49:44 AM
    Author     : andres.rojas
--%>

<%@page import="java.util.Vector"%>
<%@page import="estudiantes.Estudiante.Estudiante"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="utiles.Encripta"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%
    
    Encripta enc=new Encripta();
    Estudiante est = new Estudiante();
    
    //Se encripta la fecha para almacenarla en la base de datos y el sistema de transicion confirme la conexion (Seguridad)
    SimpleDateFormat sdf = new SimpleDateFormat("dd/M/yyyy");
    String date = sdf.format(new Date()); 
    date = enc.Encriptar(date);
    //Se encripta el carnet para pasarlo al sistema de transicion
    String carnetEst= (String) session.getAttribute("carnet");
    carnetEst=enc.Encriptar(carnetEst);
    est.PersisteToken(date, (String) session.getAttribute("carnet"));
    Vector prog=est.ConsultaPrograma((String) session.getAttribute("carnet"));
    String idProg=((Vector) prog.get(0)).get(35).toString();
    if(idProg.equals("268")||idProg.equals("275")){
        Integer estado = Integer.parseInt(est.getEstado());
        if (estado < 1) {
            response.sendRedirect("menuServEstud1");
        }else{
            response.sendRedirect("menuServEstud");
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>CONSULTA CAMBIO USUARIO CORREO - ESCUELA COLOMBIANA DE INGENIERÍA JULIO GARAVITO</title>
        <style>
            label {
                text-align: justify;
             }
        </style>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="Content-Language" content="ES" />
        <meta name="language" content="spanish" />
        <meta name="author" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
        <meta name="copyright" content="Copyright (c) 2018" />
        <meta name="description" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
        <meta name="abstract" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="cambioCorreo/css/seguimiento.css">     
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel="shortcut icon" type="image/x-icon" href="cambioCorreo/img/favicon.ico">
        <link href="https://fonts.googleapis.com/css?family=Arsenal" rel="stylesheet">

    </head>
    <body>

    <header>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <center><img src="cambioCorreo/img/img-header.jpg" class="img-responsive"></center>
                </div>
            </div>
        </div>
    </header>
    <section>
        <div class="container-fluid">
            <form id="myForm" name="myForm" action="menuServEstud" method="post" id="myForm"> 
                <input id="Carne" name="Carne" value="<%=carnetEst%>" type="hidden">
                <input id="aTransicion" name="aTransicion" value="1" type="hidden">
                <p align="center">
                <br>
                <br>
                <br>
                Bienvenido a este espacio diseñado para facilitar y acompañar tu <a target="_blank" href="https://tycho.escuelaing.edu.co/ptrancision/Plan_Transicion_<%=idProg%>.pdf"><font color="green"><b>PROCESO</b></font></a> para que decidas si prefieres hacer la transición al nuevo plan de estudios de tu programa o mantenerte en el plan de estudios actual. 
                Te invitamos a revisar en detalle el nuevo plan de estudios y las condiciones de transición. Esta propuesta fue preparada por la Escuela teniendo en cuenta los cambios en el entorno, las tendencias nacionales e internacionales, y el compromiso institucional con la formación de profesionales capaces de enfrentar los nuevos retos y situaciones del mundo contemporáneo.

                En este espacio podrás hacer seguimiento de tu proceso y realizar las siguientes acciones:
                <li>Desde el 18 de septiembre hasta el 28 de septiembre: Revisión y análisis del nuevo plan de estudios y de las condiciones de transición.
                <li>Desde el 24 de septiembre hasta el 5 de octubre: Solicitud a través del sistema, de una reunión con el profesor de tu programa que tu Decano haya asignado para acompañarte en este proceso.</li>
                <li>Desde el 8 de octubre hasta el 2 de noviembre: Reunión en la fecha acordada con el profesor que te acompañará en el proceso.</li>
                <li>Después de la reunión con tu profesor y hasta el 9 de noviembre: Validación en el sistema, junto con tu acudiente, de la decisión que hayas tomado con acompañamiento de tu profesor.</li>
                <li>Desde la validación en el sistema y hasta el 16 de noviembre: Validación de tu decisión por parte del Decano.</li>

                Si tienes dudas o inconvenientes en tu proceso, por favor dirígete a tu Decanatura.
                </p>
                <br>
                <%
                    
                %>
                <br>
                <center>
                    <input type="submit" value="Continuar">
                </center>
            </form>
        </div>
    </section>
<footer class="footerContainer">
    <div class="container">        
        <div class="row">
            <article class="col-sm-7 col-md-5">
                <p>                    
                    <strong>ESCUELA COLOMBIANA DE INGENIERÍA JULIO GARAVITO</strong><br/>
                    AK.45 No.205-59 (Autopista Norte)<br/>
                    <i>Contact center</i>: +57(1) 668 3600<br/>
                    Línea Nacional Gratuita: 018000112668<br/>
                    Información detallada en: www.escuelaing.edu.co<br/><br/>
                    <small>Personería Jurídica 086 de enero 19 de 1973. Acreditación institucional de alta calidad. Res. 20273 del 27 de noviembre de 2014. (Vigencia 4 años).<br>
                    Vigilada Mineducación.</small><br><br>
                    Bogotá, D.C. - Colombia<br/>

            </article>
            <article class="col-sm-5 col-md-7">
                <p>
                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1987.9617427360993!2d-74.04338482936627!3d4.783148717834411!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8e3f85e374627fe5%3A0x540783a0b074c84d!2sEscuela+Colombiana+de+Ingenier%C3%ADa!5e0!3m2!1ses!2ses!4v1424190444206" width="100%" height="280" frameborder="0" style="border:0"></iframe>
                </p>
            </article>
        </div> 
    </div>       
</footer>
    </body>
    <%
        if(false){
    %>
    <script>
        function aServiciosAcademicos() {
            
            document.forms['myForm'].action='menuServEstud';
            document.forms['myForm'].submit();

            document.forms['myForm'].action='http://weezer.escuelaing.edu.co/CambioPlan-0.9/Estudiante/CambioDePlan.xhtml';
            document.forms['myForm'].submit();
            return true;
        }
    </script>
    <%
        }
    %>
</html>
