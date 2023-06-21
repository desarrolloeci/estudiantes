
/*
 * enviarCorreoEst.java
 *
 * Created on 12 de febrero de 2007, 09:08 AM
 */
package otros;

import java.io.*;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.util.Properties;
import javax.swing.Timer;

/**
 *
 * @author 
 * @version
 */
public class enviarCorreoEst extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        /* TODO output your page here
         out.println("<html>");
         out.println("<head>");
         out.println("<title>Servlet enviarCorreoEst</title>");
         out.println("</head>");
         out.println("<body>");
         out.println("<h1>Servlet enviarCorreoEst at " + request.getContextPath () + "</h1>");
         out.println("</body>");
         out.println("</html>");
         */
        out.close();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession sesion;
        sesion = request.getSession(true);
        PrintWriter out = response.getWriter();
        otros.enviarMail enviar = new otros.enviarMail();
      
        String codimpre;
     //   empleado.setPath("correo");
        //String destino = new String("e2037452");
        //String destino = request.getParameter("paragrupo");
        String propuesta = request.getParameter("propuesta");
        String asunto = "Canal de Comunicación";
        String contacto = request.getParameter("contacto");
        String texto = request.getParameter("texto");
        String usuario= request.getParameter("usuario");
        String correo = request.getParameter("correo");
        String clave = request.getParameter("clave");
        correo = correo + "@escuelaing.edu.co";
                
        
       
              
       String carnet = (String) sesion.getAttribute("carnet");
        //out.println(clave);
        sesion.setAttribute("clave", clave);
       
        //String cc = request.getParameter("cc");
        String respuesta = new String();
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Enviar Correo</title>");
        out.println("</head>");
        out.println("<body>");
        // + "  (" + codasig + "-" + grupo + ")"
        // + "  (" + separa[1] + "-" + separa[2] + ")"
        /*empleado.getPerHorario()->*/
        try {

            //ANTESrespuesta = enviar.enviar(idgrupo, asunto, texto, "", empleado.getUsrExchange(), empleado.getPerHorario(), "@escuelaing.edu.co", clave, numgrupo);
            respuesta = enviar.enviar( correo,carnet,texto, propuesta, usuario, contacto,clave,asunto );
            //respuesta = enviar.enviarprueba();
        } catch (Exception e) {
            out.println("No se pudo enviar el correo: " + e.getMessage());
        }
        if (!respuesta.equals("ok")) {
            out.println("Ha ocurrido un error al enviar el correo.<br>Revise si el "
                    + "archivo adjunto existe<br>Intente luego o h&aacute;galo a través de la página "
                    + "<a href=\"\" onclick=\"window.open('http://correo.escuelaing.edu.co','',"
                    + "'width=650,height=450, toolbar=yes,scrollbars=yes,location=yes,directories=yes,"
                    + "status=yes,menubar=yes,resizable=no');return false\">correo.escuelaing.edu.co</a></font></b></font></p>");
            out.println(respuesta);
        } else {
           
            response.sendRedirect("Mensajes?idmsj=6");
        }
        //sesionMail = request.getSession(false);
        out.println("</body>");
        out.println("</html>");
    }

    /**
     * Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
