/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package otros;

import estudiantes.Estudiante.Estudiante;
import estudiantes.configuracion.configECI;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lucero.rodriguez
 */
public class enviarcomunicacion extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        //  String host = "smtp1.escuelaing.edu.co";
        Estudiante Est = new Estudiante();
        Estudiante emisc = new Estudiante();
        HttpSession sesion = request.getSession(true);

        String carnet = (String) sesion.getAttribute("carnet");
        String smtp;
        String mensaje = new String("Su solicitud ha sido enviada exitosamente, pronto le estaremos contactando");
        String Datos = "";
        String propuesta = request.getParameter("propuesta");
        String asunto = "Canal de Comunicación";
        String contacto = request.getParameter("contacto");
        String comunicado = request.getParameter("comunicado");
        String usuario = request.getParameter("usuario");
        String correo = request.getParameter("correo");
        final String clave = request.getParameter("clave");
        configECI cfgEci = new configECI();
        if(!usuario.contains("@mail.escuelaing.edu.co")){
            usuario = usuario + "@mail.escuelaing.edu.co";
        }
        final String email = usuario;
        if(!correo.contains("@escuelaing.edu.co")){
            correo=correo + "@escuelaing.edu.co";
        }
        String to = correo;
        if (contacto.equals("S")) {
            contacto = "SI";
        } else if (contacto.equals("N")) {
            contacto = "NO";
        }
        Datos = Datos + "Comunicación: " + comunicado + "\n" + "Propuesta: " + propuesta + "\n" + "Documento: " + carnet + "\n" + "contactar: " + contacto + "\n";

        try {
            smtp = "smtp.office365.com";
            //   MimeMultipart multipart = new MimeMultipart();
            Properties properties = new Properties();
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.starttls.enable", "true");
            properties.put("mail.smtp.host", smtp);
            properties.put("mail.smtp.port", "587");
            Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(email, clave);
                }
            });
            session.setDebug(true);
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(email));
            msg.setRecipients(Message.RecipientType.BCC, to);

            msg.setSubject(asunto);
            msg.setSentDate(new Date());
            Datos = Datos + "\n\n";
            //  texto = Datos + "\n\n";
            msg.setText(Datos);
            Transport.send(msg);


            // mensaje = "ok";
        } catch (Exception e) {
            mensaje = "Problemas con el envio del correo " + e.getMessage();
        }
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Formulario Solicitud Información</title>");
        out.println("</head>");
        out.println("<body>");


        //out.println("<h2> " + mensaje + "</h2>");
        int ret = emisc.CanalComunica(carnet, comunicado, propuesta, contacto, cfgEci.getPeriodoActual());
        response.sendRedirect("RespuestaCanal");
        out.println("</body>");
        out.println("</html>");
        out.close();
    }
}