<%-- 
    Document   : login
    Created on : 2/12/2015, 11:02:04 AM
    Author     : Lucero
--%>

<html>
<head>
<meta charset="iso-8859-1">
<title>Servicios Académicos Estudiantes</title>

<link href="css/estilo-serviciosAcademicos.css" rel="stylesheet" type="text/css" media="all">
</head>

<body>
<div id="container">
	<header>
    	<div class="logoescuela">
        <img src="img/logo-ESCUELA.svg">
        </div>
        <img src="img/banner.jpg"/>
        <div class="osiris">Desarrollado por: Osiris y Direcci&oacute;n de Comunicaciones y Mercadeo</div>
    </header>
    <section>
    <div class="titulo">
        	<img src="img/TITULO-ServiciosAcademicos.svg">
        </div>
   	  <div id="formulario">
        <h1>Registro</h1><br/>
		  <form action="LoginEst" method="post" name="form1">
		    <p>
		      <input name="carnet" type="text" value="Usuario"/>
		      <input name="passwd" type="password" value="Contraseña"/>
              <p style="font-family:'Trebuchet MS', Arial, Helvetica, sans-serif; font-size:12px; color:#999">Todos los campos son obligatorios</p>
              <br/>
              <p>
           	 <div align="center">Ingrese el código:<img src="Captcha" id="captcha">
                    <input name="seccode" size="08" type="text" maxlength="8">
                     </div>
              </p>
            <br/>
		      <input name="boton" type="submit" value="Enviar"/>
		    </p>
		  </form>
        </div>
    </section>
        <footer>
    	<span class="programa">
            Escuela Colombiana de Ingeniería Julio Garavito
            <br/>Servicios Académicos
        </span>
    	<span class="direccion">
            AK.45 No.205-59 (Autopista Norte)<br/>
            Contact Center: +57(1) 668 3600<br/>
            Call Center: +57(1) 668 3600<br/>
            Línea Nacional Gratuita: 018000112668<br/>
            www.escuelaing.edu.co<br/>
            Bogotá, D.C. - Colombia<br/>
        </span>
    </footer>
</div>
</body>
</html>
