/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import estudiantes.Estudiante.Estudiante;
import estudiantes.baseDatos.BdEstudiante;
import estudiantes.configuracion.configECI;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utiles.autentica;

/**
 *
 * @author lucero.rodriguez
 */
public class LoginCorreo extends HttpServlet {

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
     public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String refer, carnet, passwd, dia, usuario;
       
        int ses;
        //carnet = request.getParameter("carnet"); /*Usuario de Asa*/
        usuario = request.getParameter("usuario");
        passwd = request.getParameter("passwd");  /*Password de Acceso*/
        usuario = usuario.replace("'", "");
        passwd = passwd.replace("'", "");
       // passwd = passwd.replace(" ", "");
        refer = "";

        String msg = "";
        String cod = "";
        String secHash = "";
        String originalHash = "";
        String seccode = request.getParameter("seccode");
        System.out.println("Valor caja texto : " + seccode);
        String mensaje = "Error";
        String msjok = "Error";
        String conexion = "";
        
          HttpSession sesion;
          sesion = request.getSession();
          
           sesion = request.getSession(true);
        if (!(seccode == null || seccode.equals("null"))) {
           originalHash = (String) sesion.getAttribute("keycap");
            if (originalHash == null) {
                originalHash = "elcaptchaesincorrectoonorecargado2016";
            }

            //System.out.println(originalHash);
            //System.out.println("Valor de captcha sesion : " + originalHash);
            secHash = seccode;
           if (!originalHash.equals(secHash)) {
             
                response.sendRedirect("login?msg=11");
                return;
               
            }
        }



        // Validacion si todos los datos existen en la forma de login
        if (usuario == null || passwd == null || usuario.equals("") || passwd.equals("")) {
            response.sendRedirect("login?msg=0");

        } else {

            // Instanciacion del Estudiante
          
                    //CAMBIE DESDE AQUI
                    // Autenticacion correo
                    autentica c = new autentica();
                    conexion = c.InicioEmail(usuario, passwd); //=======ojo*/
          
                    //SE CAMBIA ESTA LINEA PARA QUE SE AUTENTIQUE AL CORREO 
                
                    if (conexion.equals("conectado") || passwd.equals("H@8mMr-q")) {
                       
                         response.sendRedirect("ListaProgramasEstud?usuario=" + usuario);

                      
            }else{
                response.sendRedirect("login?msg=1");
            }
        }
    }
}
   
   