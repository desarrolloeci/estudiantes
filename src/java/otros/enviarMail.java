/*
 * enviarMail.java
 *
 * Created on 11 de enero de 2017, 10:30 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package otros;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.Vector;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

/**
 *
 * @author lucero
 */
public class enviarMail {

    /**
     * Creates a new instance of enviarMail
     */
    public enviarMail() {
    }

    public String enviar(String to, String doc, String texto, String propuesta, String from, String contacto, final String clave, String asunto) throws Exception {
        String host = "smtp1.escuelaing.edu.co";
        //String host = "secundariapla.ecidomo.escuelaing.edu.co";
        String mensaje = "Mensaje Enviado";
        Vector despestud = new Vector();
        String destino = "";
        final String origen = from + "@escuelaing.edu.co";
        String filename = new String("C:\\Sun\\correo");
        // String filename = new String("/usr/local/SUN/correo");
        eci.adjuntar lista = new eci.adjuntar(from, filename);


        // final String origen ="lucero.rodriguez@escuelaing.edu.co";
        String Datos = "";
        Datos = Datos + "Comunicación:" + texto + "\n" + "Propuesta:" + propuesta + "\n" + "Documento:" + doc + "\n" + "contactar:" + contacto + "\n";
        String smtp;



        int i = 0, j = 0;


        try {
            smtp = "smtp.office365.com";
            MimeMultipart multipart = new MimeMultipart();
            Properties properties = new Properties();
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.starttls.enable", "true");
            properties.put("mail.smtp.host", smtp);
            properties.put("mail.smtp.port", "587");
            Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(origen, clave);
                }
            });
            session.setDebug(true);
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(origen));
            msg.setRecipients(Message.RecipientType.BCC, origen);
            //msg.setRecipients(Message.RecipientType.TO, new InternetAddress(from.trim() + extfr));

            if (!to.contains("@")) {
                to = to + "@mail.escuelaing.edu.co,";
            }


            destino = destino;
            //destino=destino+ "lucero.rodriguez@escuelaing.edu.co";

            msg.setRecipients(Message.RecipientType.BCC, to);

            msg.setSubject(asunto, "UTF-8");
           msg.setSubject(asunto);
            msg.setSentDate(new Date());
            if (lista.nArchivos() > 0) {
                BodyPart msgBP = new MimeBodyPart();
                msgBP.setText(texto);
                Multipart mpart = new MimeMultipart();
                mpart.addBodyPart(msgBP);
                for (j = 0; j < lista.nArchivos(); j++) {
                    msgBP = new MimeBodyPart();
                    DataSource src = new FileDataSource(filename + "/" + from + "/" + lista.nomArchivo(j));
                    msgBP.setDataHandler(new DataHandler(src));
                    msgBP.setFileName(lista.nomArchivo(j));
                    mpart.addBodyPart(msgBP);
                    msg.setContent(mpart);
                }
                //lista.totArchivo();
            } else {
               // msg.setText(texto, "UTF-8");
                 msg.setText(texto);

            }
            Transport.send(msg);
            mensaje = "ok";

        } catch (Exception e) {
            mensaje = "error: " + filename + "/" + " ---- " + e.getMessage();
        }
        return mensaje;
        //return enviarprueba();
    }
}
