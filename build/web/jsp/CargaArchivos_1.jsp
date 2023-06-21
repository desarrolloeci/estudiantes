<%-- 
    Document   : FormRegistro
    Created on : 25/11/2016, 08:52:09 AM
    Author     : Juan David Vanzina
--%>
<%@page import="javax.activation.MimetypesFileTypeMap"%>
<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="java.util.Vector"%>
<%@page import="BDatos.BDServicios"%>
<%@ include file="secure.jsp" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<%response.setHeader("Cache-Control", "no-cache");
       String mail = session.getAttribute("idusr").toString(); 
       String nombre = session.getAttribute("nomusr").toString(); 
       String Ap1 = session.getAttribute("ap1").toString(); 
       String Ap2 = session.getAttribute("ap2").toString(); 
       String documento = session.getAttribute("doc").toString();
       String id_articulo = request.getParameter("idart").toString();
       String TipoUsu = session.getAttribute("tipousu").toString();
       
       String numini = (String) request.getParameter("numini");
       String doc = (String) request.getParameter("doc");
       String down = (String) request.getParameter("down");
       
       BDServicios bd      =   new BDServicios();
       Vector Article      =   new Vector();
       Vector Autores      =   new Vector();
       Vector Nro_Autores  =   new Vector();
       Vector Archivos     =   new Vector();
       Vector res          =   new Vector();
       
       if(numini!=null && doc!=null && numini!="1"){ // Solicitud de Ordenamiento de Autores
           bd.ActualizarOrdenAutores(numini, doc, id_articulo);
       }
       
       if(down!=null){ // Solicitud de Descarga de archivos
       
           String filename = down;   
           //String filepath = "C:\\Users\\Desarrollo\\Desktop\\Proyectos\\Proyecto MicroSitio IDGIP\\Fuentes\\ZPruebasCarga\\";   
           String filepath = "/home/shares/articulos/";   
          // String filepath = "C:/Sun/Icetex";
           MimetypesFileTypeMap mimetypesFileTypeMap=new MimetypesFileTypeMap();
           response.setContentType(mimetypesFileTypeMap.getContentType(filename));   
           response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   

           java.io.FileInputStream fileInputStream=new java.io.FileInputStream(filepath + filename);  

            int i;   
            while ((i=fileInputStream.read()) != -1) {  
              out.write(i);   
            }   
            fileInputStream.close();   
       }
       
       Article  = bd.ConsultaDatosArticulo(documento, id_articulo);
       Autores  = bd.ConsultaAutoresArticulo(id_articulo);
       Archivos = bd.ConsultaArchivosArticulo(id_articulo);
               
       String Arc = "", Der = "";
       
       Nro_Autores = bd.Nro_Autores(id_articulo);
       
       int Nro_Auto = Integer.parseInt(Nro_Autores.elementAt(0).toString());
      
       String estini="";
       
%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Investigación en Desarrollo y Gerencia Integral de Proyectos - IDGIP / UNIDAD DE PROYECTOS</title>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Content-Language" content="ES" />
	<meta name="language" content="spanish" />
	<meta name="author" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
	<meta name="copyright" content="Copyright (c) 2017" />
	<meta name="description" content="Investigación en Desarrollo y Gerencia Integral de Proyectos" />
	<meta name="abstract" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito"/>
	<link rel="stylesheet" href="css/estiloIDGIP.css">
        <link href="css/tablas.css" rel="stylesheet" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" rel="stylesheet">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>

<body data-spy="scroll" data-target="#navegacion">
    <input type="hidden" value="<%=Article.elementAt(7)%>" name="EstadoSOLVER" id="EstadoSOLVER">
	<header>
		<img src="img/img-principal.jpg" class="img-responsive img-principal" alt="imagen principal">
		<div class="container-fluid">
			<div class="row franjaRojaFormulario2">
				<div class="col-sm-8 col-md-8">
					<h4>Investigación en Desarrollo y Gerencia Integral de Proyectos - IDGIP / UNIDAD DE PROYECTOS</h4>
				</div>
				<div class="col-sm-4 col-md-4 logoRojo">
					<center><img src="img/logoEscuela.png" alt="Logo escuela Colombiana de Ingeniería" class="img-responsive"></center>
				</div>
			</div>
		</div>
	</header>

    <a href="/IDGIProyectos/LogOut" class="button" >Salir</a>
    
    <nav>
		<div class="navegacion container">
			<div class="row">
				<div class="col-xs-11 col-md-11 col-md-offset-4">
					<ul class="nav nav-tabs">
					  <li role="presentation"><a href="/IDGIProyectos/InicioIDGIP">Inicio</a></li>
                                          <li role="presentation"><a href="/IDGIProyectos/CreaArticulo">Enviar Articulo</a></li>
					  <li role="presentation"><a href="/IDGIProyectos/Enviar">Pendientes</a></li>
					  <li role="presentation"><a href="/IDGIProyectos/Historial">Historial</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
    
<section>
	<article class="edicionActual">
		<div class="row">
			<div class="col-sm-12 col-md-1 col-lg-2"></div>

			<div class="col-sm-12 col-md-10 col-lg-8 formulario">
				<h1><span class="material-icons md-48">assignment</span><div class="txt-icon">ARTICULO <%=id_articulo%></div></h1>
                                
                                <a><h4>Estado: <%=Article.elementAt(7)%></h4></a>
               
                                <%if(Article.elementAt(7).equals("Aprobado con Cambios")){estini = "AC";}%>
				<div class="container">
                                    
                                    <h2>Información del Articulo:</h2>
                                    <br>
                                    
                                    <table width="100%" align="center" class="table" >
                                                    <tr> 
                                                        <td><strong>Titulo del Articulo en Español: </strong></td>
                                                        <td><%=Article.elementAt(1)%></td>
                                                    </tr>
                                                    <tr> 
                                                        <td><strong>Titulo del Articulo en Ingles: </strong></td>
                                                        <td><%=Article.elementAt(2)%></td>
                                                    </tr>
                                                    <tr> 
                                                        <td><strong>Resumen en Español: </strong></td>
                                                        <td><%=Article.elementAt(3)%></td>
                                                    </tr>
                                                    <tr> 
                                                        <td><strong>Resumen en Ingles: </strong></td>
                                                        <td><%=Article.elementAt(4)%></td>
                                                    </tr>
                                                    <tr> 
                                                        <td><strong>Palabras clave en Español: </strong></td>
                                                        <td><%=Article.elementAt(5)%></td>
                                                    </tr>
                                                    <tr> 
                                                        <td><strong>Palabras clave en Ingles: </strong></td>
                                                        <td><%=Article.elementAt(6)%></td>
                                                    </tr>
                                                    <tr> 
                                                        <td><strong>Estado: </strong></td>
                                                        <td><%=Article.elementAt(7)%></td>
                                                    </tr>
                                                    <tr> 
                                                        <td><strong>Fecha Creación: </strong></td>
                                                        <td><%=Article.elementAt(8)%></td>
                                                    </tr>
                                                    <tr> 
                                                        <td><strong>Fecha Envio: </strong></td>
                                                        <td><%=Article.elementAt(9)%></td>
                                                    </tr>
                                                    <tr> 
                                                        <td><strong>Fecha Decisión: </strong></td>
                                                        <td><%=Article.elementAt(10)%></td>
                                                    </tr>
                                                    <tr>
                                                        
                                                    </tr>
                                                  </table>
                                                 <br>
                                                 <A name="Autores"></a>
                                                 <h2>Autor(es) del documento: </h2>
                                                 <br>
                                                 <br>
                                                 <table class="table">
                                                     
                                                     <tr>
                                                        <td><strong>Autor(es):</strong></td>
                                                        <td>   <table class="table">
                                                                <tr>
                                                                    <td align="center">Nro.</td>
                                                                    <td align="center">Documento</td>
                                                                    <td align="center">Nombres</td>
                                                                    <td align="center">Correo</td>
                                                                    <td align="center">Institución</td>
                                                                    <td align="center">Ordenar Autores</td>
                                                                </tr> 
                                                                <% for ( int m = 0 ; m < Nro_Auto ; m++ ){ res = (Vector)Autores.elementAt(m); %>
                                                                <tr>
                                                                    <td align="center" width="10%" ><%=(m+1)%> &nbsp</td>
                                                                    <td align="center" width="15%" ><%=res.elementAt(0)%> &nbsp</td>
                                                                    <td align="center" width="20%" ><%=res.elementAt(1)%> &nbsp</td>
                                                                    <td align="center" width="15%" ><%=res.elementAt(2)%> &nbsp</td>                                                                    
                                                                    <td align="center" width="30%" ><%=res.elementAt(3)%> &nbsp</td>
                                                                    <td align="center" width="5%"><a href="/IDGIProyectos/CargaAutoresArchivo?idart=<%=id_articulo%>&numini=<%=(m+1)%>&doc=<%=res.elementAt(0)%>#Autores"><img src="img/flechaarriba.png" width="20" height="22" border="0"></a></td>
                                                                </tr>
                                                                <%}%>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><div id="ifYesS0" style="display:block"><strong>Agregar Autor</strong></div></td>
                                                        <td>
                                                            <div id="ifYesS1" style="display:block">
                                                            <form action="NuevoAutor" method="post" id="FormNuevoA">
                                                                <input type="hidden" value="<%=id_articulo%>" name="idart" id="idart"/>
                                                                <table border="0">
                                                                                <tr>
                                                                                    <td>&nbsp</td>
                                                                                <tr>
                                                                                <tr>
                                                                                    <td width="33%" >Ingrese el Documento del Autor&nbsp;</td>
                                                                                    <td width="33%" ><input type="number" class="col-lg-10" name="DocumentoA2" id="DocumentoA2" placeholder="Documento Nuevo Autor" required/>&nbsp;</td>
                                                                                </tr> 
                                                                                <tr>
                                                                                    <td width="33%" >Ingrese Nombres y Apellidos del Autor&nbsp;</td>
                                                                                    <td width="33%" ><input type="text" class="col-lg-10" name="NombresA2" id="NombresA2" placeholder="Nombres y Apellidos" required/>&nbsp;</td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td width="33%" >Ingrese Correo Electronico del Autor&nbsp;</td>
                                                                                    <td width="33%" ><input type="email" class="col-lg-10" name="CorreoA2" id="CorreoA2" placeholder="Correo Electronico" required/>&nbsp;</td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td width="33%" >Institución del Autor &nbsp;</td>
                                                                                    <td width="33%" ><input type="text" class="col-lg-10" name="InstitucionA2" id="InstitucionA2" placeholder="Institución" onclick=""/>&nbsp;</td>
                                                                                </tr>
                                                                                <tr><td></td>
                                                                                    <td width="33%" ><input style='width:200px; height:30px' type="submit" name="AgregarAutor" value="  Agregar Autor  "/>&nbsp;</td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>&nbsp</td>
                                                                                <tr>
                                                                            </table>
                                                            </form>
                                                            </div>    
                                                        </td>   
                                                    </tr>
                                                    <tr>
                                                                                                                 
                                                    </tr>
                                                 </table>
                                                 Si alguno de los demás autores desea registrarse para hacer seguimiento a la solicitud, Por favor clic en: <a href="/IDGIProyectos/Registro" onClick="if (window.open) { window.open('/IDGIProyectos/Registro', 'popup', 'resizable, width=800, height=1200'); return false; }">Registrar Usuario</a>
                                                 <br>
                                                 <br>
                                                 <A name="Archivos"></a>
                                                 <h2>Archivos asociados:</h2>
                                                 <br>
                                                 <table class="table">
                                                     <tr>
                                                         <td align="center" width="20%">Id. Archivo</td>
                                                         <td align="center" width="40%">Nombre</td>
                                                         <td align="center" width="10%">Tipo</td>
                                                         <td align="center" width="20%">Fecha Carga</td>
                                                         <td align="center" width="10">Descargar</td>
                                                     </tr>
                                                     <% for ( int m = 0 ; m < Archivos.size() ; m++ ){ res = (Vector)Archivos.elementAt(m); %>
                                                     <% String val_cad = "0";
                                                        if(res.elementAt(2).equals("a")){val_cad = "Articulo";
                                                        Arc = "a";
                                                        }
                                                        if(res.elementAt(2).equals("b")){val_cad = "Derechos";
                                                        Der = "b";
                                                        }
                                                        if(res.elementAt(2).equals("c")){val_cad = "Adicional";}
                                                        if(res.elementAt(2).equals("d")){val_cad = "Jurado/Admin";}
                                                      %>
                                                      
                                                     <tr>
                                                         <td align="center"><%=res.elementAt(0)%></td>
                                                         <td align="center"><%=res.elementAt(1)%></td>
                                                         <td align="center"><%=val_cad%></td>
                                                         <td align="center"><%=res.elementAt(5)%></td>
                                                         <% String Ruta;
                                                         
                                                         String ext = FilenameUtils.getExtension(res.elementAt(1).toString());
                                                         
                                                         if(res.elementAt(2).equals("a") || res.elementAt(2).equals("b")){
                                                             Ruta = res.elementAt(2)+id_articulo+"."+ext;
                                                         }
                                                         else
                                                         {
                                                             Ruta = res.elementAt(2)+id_articulo+"-"+res.elementAt(0)+"."+ext;
                                                         }
                                                         
                                                         %>
                                                         <td align="center"><a href="/IDGIProyectos/CargaAutoresArchivo?idart=<%=id_articulo%>&down=<%=Ruta%>" download><img src="img/descargar.png" width="20" height="22" border="0"></a></td>
                                                     </tr>
                                                     <%}%>
                                                 </table>
                                                 <div align='' id="ifYesS2" style="display:block">
                                                     <div id="Archivo_C" style="display:block">
                                                                        <form action="CargaArchivos" enctype="multipart/form-data" method="post"> 
                                                                            <table class="table">
                                                                                <tr><input type="hidden" value="a" name="tipo"><input type="hidden" value="CargaAutoresArchivo" name="retorno">
                                                                                    <input type="hidden" value="<%=id_articulo%>" name="articulo">
                                                                                    <input type="hidden" value="<%=Arc%>" name="verifica">
                                                                                    <td><strong>Articulo</strong></td>
                                                                                </tr><tr>
                                                                                    <td><input type="file" name="file" required/></td>
                                                                                   <td><input type="submit" value="Subir Archivo"/> </td>
                                                                                </tr>
                                                                           </table>
                                                                       </form> 
                                                     </div>
                                                     <div id="Derechos_C" style="display:block">
                                                                       <form action="CargaArchivos" enctype="multipart/form-data" method="post"> 
                                                                            <table class="table">
                                                                                <tr><input type="hidden" value="b" name="tipo"><input type="hidden" value="CargaAutoresArchivo" name="retorno">
                                                                                    <input type="hidden" value="<%=id_articulo%>" name="articulo">
                                                                                    <input type="hidden" value="<%=Der%>" name="verifica">
                                                                                    <td><strong>Derechos</strong></td>
                                                                                </tr><tr>
                                                                                   <td><input type="file" name="file" required/></td>
                                                                                   <td><input type="submit" value="Subir Archivo"/> </td>
                                                                                </tr>
                                                                           </table>
                                                                       </form> 
                                                      </div>
                                                      <div id="Other_C" style="display:block">
                                                                      <form action="CargaArchivos" enctype="multipart/form-data" method="post"> 
                                                                            <table class="table">
                                                                                <tr><input type="hidden" value="c" name="tipo"><input type="hidden" value="CargaAutoresArchivo" name="retorno">
                                                                                    <input type="hidden" value="<%=id_articulo%>" name="articulo">
                                                                                    <input type="hidden" value="c" name="verifica">
                                                                                    <td><strong>Archivos Adicionales</strong></td>
                                                                              </tr><tr>   
                                                                                   <td><input type="file" name="file" required/></td>
                                                                                   <td><input type="submit" value="Subir Archivo"/> </td>
                                                                                </tr>
                                                                           </table>
                                                                       </form> 
                                                     </div>
                                                     <br>
                                                 </div>
                                                 
                                                 <div id="ifEstado" style="display:none">
                                                        <h2>Observaciones de Jurado(s):</h2>
                                                        <textarea rows="10" class="form-control"><%=Article.elementAt(11)%></textarea>    
                                                        <br><br>
                                                 </div>
                                                 
                                                     <div id="Send" align="center" style="display:none">
                                                                    <input style='width:300px; height:40px' type="button" onclick="location.href='Enviar';" value="Guardar y Continuar Después " />
                                                                    <input style='width:300px; height:40px' type="button" onclick="location.href='Enviar?idart=<%=id_articulo%>&estin=<%=estini%>&ti=<%=Article.elementAt(1)%>';" value="Enviar Articulo" /> 
                                                     </div>
                                                     <br>
                                                     <a href="/IDGIProyectos/Historial">Ir al historial</a><br>
                                                     <a href="/IDGIProyectos/Enviar">Ir a pendientes</a>
                                                    <% if(Arc == "a" && Der == "b"){%>
                                                    
                                                            <script type="text/javascript"> document.getElementById('Send').style.display = 'block'; </script>
                                                    
                                                    <%}%>
		                </div>
                                                      
				</div>
			       
			</div>	

			<div class="col-sm-12 col-md-1 col-lg-2"></div>
		</div>
	</article>
</section>
<footer>
	<div class="footer">
		<div class="row">
			<div class="col-sm-12 col-md-4 col-md-offset-1 creditos">
				Escuela Colombiana de Ingenieria Julio Garavito <br>
				AK.45 No.205-59 (Autopista Norte) <br>
				Contact Center: +57(1) 668 3600 - Bogotá <br> 
				Línea Nacional Gratuita: 018000112668 <br>
				<hr>
				<small>Personería Jurídica 086 de enero 19 de 1973. <br>
				Acreditación institucional de alta calidad. <br>
				Res. 20273 del 27 de noviembre de 2014.  <br>
				(Vigencia 4 años). <br> <br>

				Vigilada Mineducación. <br><br></small>
			</div>
			<div class="col-sm-12 col-md-7 mapa">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3975.9262331134787!2d-74.04478278578759!3d4.78267549652671!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8e3f85e32ae0ca4b%3A0x5edd4c74e8f7220c!2sESCUELA+COLOMBIANA+DE+INGENIER%C3%8DA+JULIO+GARAVITO!5e0!3m2!1ses!2ses!4v1479245437319" width="100%" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>
			</div>
		</div>
	</div>
</footer>


<!--SCRIPT BOOTSTRAP-->	
	<script src="js/jquery.js"></script>
  	<script src="http://code.jquery.com/jquery-latest.jS"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>

<!--SCRIPT DESLIZAR SUAVE-->
	
	<script>
	$(document).ready(function(){
	  // Add scrollspy to <body>
	  $('body').scrollspy({target: ".navbar", offset: 50});

	  // Add smooth scrolling on all links inside the navbar
	  $("#navegacion a").on('click', function(event) {
	    // Make sure this.hash has a value before overriding default behavior
	    if (this.hash !== "nosotros") {
	      // Prevent default anchor click behavior
	      event.preventDefault();

	      // Store hash
	      var hash = this.hash;

	      // Using jQuery's animate() method to add smooth page scroll
	      // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
	      $('html, body').animate({
	        scrollTop: $(hash).offset().top
	      }, 1200, function(){
	   
	        // Add hash (#) to URL when done scrolling (default click behavior)
	        window.location.hash = hash;
	      });
	    }  // End if
	  });
	});
	</script>

<!-- SCRIPT VALIDAR CHECKBOX-->
<script type="text/javascript">

 if(document.getElementById('EstadoSOLVER').value != "Creado sin Enviar"){
     
     document.getElementById('ifYesS0').style.display = 'none';
     document.getElementById('ifYesS1').style.display = 'none';
     document.getElementById('ifYesS2').style.display = 'none';
     document.getElementById('Send').style.display = 'none';
     document.getElementById('ifEstado').style.display = 'block'
 }
 
  if(document.getElementById('EstadoSOLVER').value == "Aprobado con Cambios"){
     
     document.getElementById('ifYesS0').style.display = 'block';
     document.getElementById('ifYesS1').style.display = 'block';
     document.getElementById('ifYesS2').style.display = 'block';
     document.getElementById('Send').style.display = 'block';
     document.getElementById('ifEstado').style.display = 'block'
 }
 
</script>
        
</body>
</html>