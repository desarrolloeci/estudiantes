/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package utiles;

/**
 *
 * @author lucero.rodriguez
 */
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.*;
import java.util.*;


public class autentica extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
       // response.setContentType("text/html;charset=iso-8859-1");

        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet correo</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet correo at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
            */
        } finally { 
            out.close();
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        processRequest(request, response);

    }

  public String InicioEmail(String usuario, String password) {
      //response.setContentType("text/html;charset=UTF-8");
        String url = new String("");
       // String host = new String("exchange.escuelaing.edu.co");
        String login = "";
        if (usuario.indexOf('@') != -1){
            usuario = usuario;
        }else{
        usuario = usuario + "@mail.escuelaing.edu.co";
        }
        
        
            long dato = 0;
            String tiene = new String();
            Properties prop = new Properties();
            prop.setProperty("mail.pop3.starttls.enable", "false");
            prop.setProperty("mail.pop3.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            prop.setProperty("mail.pop3.socketFactory.fallback", "false");
            prop.setProperty("mail.pop3.port", "995");
            prop.setProperty("mail.pop3.socketFactory.port", "995");
            Session sesion = Session.getInstance(prop);
            sesion.setDebug(true);
            
//            try {
//            Store store = sesion.getStore("pop3");
//            store.connect("mail.office365.com", usuario, password);
//            store.close();
            login = "conectado";
//            } catch (AuthenticationFailedException e) {
//                login = "-101";
//        } catch (NoSuchProviderException e) {
//                login = "-102";
//        } catch (MessagingException e) {
//                login = "-103";
//        }

        return login;

    }
}
