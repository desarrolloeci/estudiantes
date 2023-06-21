<%@ page import="java.lang.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<%
//Construimos la fecha actual como fecha de alta
Calendar fechaActual= new GregorianCalendar();
int anio_ape=fechaActual.get(Calendar.YEAR);

String mes_ape2 = "";
String dia_ape2 = "";
String hora_ape2 = "";
String minuto_ape2 = "";

int mes_ape=fechaActual.get(Calendar.MONTH) + 1;
if (mes_ape <10) mes_ape2 = "0" + mes_ape;
else mes_ape2 = "" + mes_ape;

int dia_ape=fechaActual.get(Calendar.DAY_OF_MONTH);
if (dia_ape <10) dia_ape2 = "0" + dia_ape;
else dia_ape2 = "" + dia_ape;


String fecha_ing = mes_ape2 +"/"+dia_ape2+"/"+anio_ape;
String Datos="";

String men=request.getParameter("pregunta");Datos=Datos + men + "\n";
String correo="webmaster@escuelaing.edu.co";

Datos=Datos + "\n\n" + "Fecha de ingreso :" + fecha_ing + "\n";
//Se crea el TroubleTicket 	
//Enviar Mail a Responsables:
	Properties props = new Properties();
	//props.put("mail.smtp.host", "200.24.7.182");
	props.put("mail.smtp.host", "pop3.escuelaing.edu.co");
	Session s = Session.getInstance(props,null);
	MimeMessage mensajeMail = new MimeMessage(s);
	//InternetAddress from = new InternetAddress("webmaster@escuelaing.edu.co");	
        InternetAddress from = new InternetAddress(correo);	
	mensajeMail.setFrom(from);	
	
	//Destinatario:
	InternetAddress to = new InternetAddress("palvarad@escuelaing.edu.co"); 
	mensajeMail.addRecipient(Message.RecipientType.TO, to);  

	//Otros destinos:
	to = new InternetAddress("webmaster@escuelaing.edu.co");
	mensajeMail.addRecipient(Message.RecipientType.CC, to);	
		
	String asunto="Preguntas e inquietudes al rector";
	String texto="Mi pregunta e inquietud es: \n\n" + Datos + "\n\n"; 
	mensajeMail.setSubject(asunto);
	mensajeMail.setText(texto);
	Transport.send(mensajeMail);
%>
<html>
<head>
<title>Servicios Academicos - Actualizacion de Datos</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<%response.sendRedirect("http://www.escuelaing.edu.co");%>

</body>
</html>