<%-- 
    Document   : ConsulCambioCorreo
    Created on : 16/08/2018, 10:45:22 AM
    Author     : andres.rojas
--%>

<%@page import="estudiantes.Estudiante.Estudiante"%>
<%@page import="java.util.Vector"%>
<%@page import="estudiantes.baseDatos.BdEstudiante"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%
    String documento = request.getParameter("documento");
    Estudiante es = new Estudiante();
    Boolean noEncontrado=false;
    Boolean correoCambia=false;
    Boolean tieneNuevo=false;
    String nombreEst="";
    String correoViejo="";
    String correoNuevo="";
    String correoRegistro="";
    if(documento != null && !documento.equals("")){
        Vector cambCorreo=es.ConsulCambioCorreo(documento);
        if(cambCorreo.size()<=0){
            noEncontrado=true;
        }else{
            nombreEst=((Vector)cambCorreo.get(0)).get(0).toString();
            correoViejo=((Vector)cambCorreo.get(0)).get(1).toString();
            correoNuevo=((Vector)cambCorreo.get(0)).get(2).toString();
            correoRegistro=((Vector)cambCorreo.get(0)).get(3).toString();
            if(!correoViejo.equals("No disponible")){
                correoCambia=true;
            }
            if(!correoNuevo.equals("No disponible")&&!correoNuevo.equals("")){
                tieneNuevo=true;
            }
        }
        
    }else{
        noEncontrado=true;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>CONSULTA CAMBIO USUARIO CORREO - ESCUELA COLOMBIANA DE INGENIERÍA JULIO GARAVITO</title>
    <style>
        label {
            text-align: justify;
         }
         .jumbotron{
             background-color: aquamarine;
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
<!--CONTENIDOS-->
<%if(documento!=null && !documento.equals("")){%>
    <%if(noEncontrado){%>
        <section>
            <div class="jumbotron">
                <div class="container inscripcion">
                    <div class="row">
                        <div class="container">
                            <h2>Por favor verifique su número de documento e intente de nuevo.</h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    <%}else if(tieneNuevo){%>
        <section>
            <div class="jumbotron ">
                <div class="container inscripcion">
                    <div class="row">
                        <div class="container">
                            <h3>Estimado estudiante <b><%=nombreEst%></b>,</h3>
                            <br>
                            <h3>
                                Usted presenta un cambio en su correo electrónico.
                            </h3>
                            <br>
                            <h3 align="justify">Su usuario de correo electrónico institucional paso de ser <b><%=correoViejo%></b> a ser <b><%=correoNuevo%></b>, 
                                por favor use este último para autenticarse a los servicios institucionales, su contraseña seguirá siendo la misma.
                                Cualquier inconveniente por favor comunicarse con Osiris a las extensiones: 536 o 333.
                            </h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    <%}else if(correoCambia){%>
        <section>
            <div class="jumbotron">
                <div class="container inscripcion">
                    <div class="row">
                        <div class="container">
                            <h3>Estimado estudiante <b><%=nombreEst%></b>,</h3>
                            <br>
                            <h3 align="justify">Su usuario de correo electrónico institucional <b><%=correoViejo%></b> cambiará, por favor consulte de nuevo este servicio despues del <b>10 de octubre de 2018</b>, 
                                de lo contrario no podrá autenticarse en los servicios que ofrece la Escuela Colombiana de Ingeniería Julio Garavito después de dicha fecha.</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    <%}else{%>
        <section>
            <div class="jumbotron">
                <div class="container inscripcion">
                    <div class="row">
                        <div class="container">
                            <h3>Estimado estudiante <b><%=nombreEst%></b>,</h3>
                            <br>
                            <h3 align="justify">Su usuario de correo electrónico institucional <%=correoRegistro%> <b>no cambiará</b>, 
                                podrá seguir autenticandose en los servicios que ofrece la Escuela Colombiana de Ingeniería Julio Garavito con el mismo usuario que ha venido usando.</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    <%}%>
<%}else{%>
    <section>
        <div class="jumbotron">
            <div class="container inscripcion">
                <div class="row">
                    <div class="col-sm-7 col-md-6 col-md-offset-1">
                        <h1>Consulta de Cambio de Usuario de Correo Electrónico Institucional</h1>
                    </div>
                    <div class="col-sm-5 col-md-5">
                        <div class="formulario">
                            <form class="form-horizontal" method="post" action="ConsulCambioCorreo">
                          <div class="form-group">
                            <label for="" class="col-sm-9 col-md-5 control-label">Documento de Identificación:</label>
                            <div class="col-sm-12 col-md-7">
                                <input type="number" class="form-control" name="documento" id="documento" placeholder="Su documento registrado" required="">
                            </div>
                          </div>
                          <div class="form-group">
                            <div class="col-md-offset-5 col-md-7">
                              <button type="submit" class="btn btn-default">Consultar</button>
                            </div>
                          </div>
                        </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<%}%>


<!--FOOTER-->
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
</html>