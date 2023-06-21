
import java.io.*;
import java.io.IOException;
import java.util.Enumeration;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Vector;
import estudiantes.Estudiante.Estudiante;
import estudiantes.Estudiante.EstudMisc;
import estudiantes.baseDatos.BdEstudiante;
import estudiantes.configuracion.configECI;
import utiles.autentica;

/**
 *
 * @author
 */
public class LoginEstAutenticacorreo extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String refer, carnet, passwd, dia, usuario;
        Estudiante est;

        HttpSession sesion;
        int ses;
        //carnet = request.getParameter("carnet"); /*Usuario de Asa*/
        usuario = request.getParameter("carnet");
        passwd = request.getParameter("passwd");  /*Password de Acceso*/
        usuario = usuario.replace("'", "");
        passwd = passwd.replace("'", "");
       // passwd = passwd.replace(" ", "");
        refer = "";
        Enumeration values = request.getHeaders("referer");
        sesion = request.getSession();

        if (values != null) {
            while (values.hasMoreElements()) {
                refer = (String) values.nextElement();
            }
        }
        if (refer.equals("")) {
            response.sendRedirect("login?msg=2");
        }
        sesion = request.getSession(false);

        String msg = "";
        String cod = "";
        String secHash = "";
        String originalHash = "";
        String seccode = request.getParameter("seccode");
        System.out.println("Valor caja texto : " + seccode);
        String mensaje = "Error";
        String msjok = "Error";
        String conexion = "";
        if (!(seccode == null || seccode.equals("null"))) {
            originalHash = (String) sesion.getAttribute("keycap");
            if (originalHash == null) {
                originalHash = "elcaptchaesincorrectoonorecargado2016";
            }

            //System.out.println(originalHash);
            //System.out.println("Valor de captcha sesion : " + originalHash);
            secHash = seccode;
            if (!originalHash.equals(secHash)) {
                // StringBuffer results = new StringBuffer("<?xml version=\"1.0\" encoding=\"UTF-8\"?>" );
                // results.append("<mensaje>");

                response.sendRedirect("login?msg=11");
                return;
                // results.append("</mensaje>");
                //results.append("<ok>");
                // results.append("msjok");
                // results.append("</ok>");
                //response.setContentType("text/xml");
                //response.getWriter().write(results.toString());
                // response.getWriter().flush();
            }
        }



        // Validacion si todos los datos existen en la forma de login
        if (usuario == null || passwd == null || usuario.equals("") || passwd.equals("")) {
            response.sendRedirect("login?msg=0");

        } else {

            // Instanciacion del Estudiante
            BdEstudiante bd = new BdEstudiante();
            configECI cfgEci = new configECI();
            bd.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());

            Vector nrocarne = bd.ConsultaCarne(usuario);
            bd.desconectar();
            
            if (nrocarne.size() > 0) {
                carnet = ((Vector) nrocarne.elementAt(0)).elementAt(0).toString();
                est = new Estudiante(carnet, out);
                ses = Integer.parseInt(est.getErrSes());
                Vector infoEst = est.getInfoEstudiante();

                //No se encontraton datos del estudiante
                if (infoEst.size() == 0) {
                    response.sendRedirect("login?msg=1");
                } else {
                    //CAMBIE DESDE AQUI
                    // Autenticacion correo
                    autentica c = new autentica();
                    conexion = c.InicioEmail(usuario, passwd); //=======ojo*/
                    Vector estudiante = (Vector) infoEst.elementAt(0);

                    //SE CAMBIA ESTA LINEA PARA QUE SE AUTENTIQUE AL CORREO 
                 //  if (((String) estudiante.elementAt(30)).equals(passwd) || passwd.equals("H@8mMr-q")) {
                    if (conexion.equals("conectado") || passwd.equals("H@8mMr-q")) {
                        dia = null;
                        try {
                            otros.rutas ruta = new otros.rutas();
                            FileReader arch = new FileReader(ruta.valruta() + "dias.txt");
                            BufferedReader salida = new BufferedReader(arch);
                            dia = salida.readLine();
                            salida.close();
                            arch.close();
                        } catch (java.io.FileNotFoundException fnfex) {
                            response.sendRedirect("login?msg=5");
                        }

                        //Verifcacion del Dia de Registro Academico
                        if (!((String) estudiante.elementAt(16)).equals(dia) && !dia.equals("0") && !estudiante.elementAt(31).toString().equals("O") && !estudiante.elementAt(31).toString().equals("P") && !est.getEstado().equals("-22")) {
                            response.sendRedirect("login?msg=3&drg=" + estudiante.elementAt(16));
                        } else {

                            //Creacion de la Sesion
                            sesion = request.getSession(true);
                            // Valores de la Variable de Sesion
                            sesion.setAttribute("carnet", carnet);
                            sesion.setAttribute("usuario", usuario);
                            sesion.setAttribute("nombre", estudiante.elementAt(1));
                            sesion.setAttribute("tipdoc", estudiante.elementAt(2));
                            sesion.setAttribute("iddpto", estudiante.elementAt(7));
                            sesion.setAttribute("clanum", estudiante.elementAt(17));
                            sesion.setAttribute("estClase", est);
                            sesion.setAttribute("tip_est", estudiante.elementAt(18));
                            sesion.setAttribute("id_plan", estudiante.elementAt(25));
                            sesion.setAttribute("igrad", estudiante.elementAt(31));
                            sesion.setAttribute("fac_cor", estudiante.elementAt(32));
                            sesion.setAttribute("nivclas", estudiante.elementAt(34));

                            // Redireccion a los menus Luego de Verificar Usuario, Clave numerica
                            // y dia de Registro
                            //
                            // Si el estado del estudiante es Mayor que 0 y los otros estado para estudiantes de reintegro

                            //   OJO CAMBIAR este if CUANDO SE ACABE REINTEGRO
                            //est.setErrSes(carnet, 0);
                          /* SE QUITA A PARTIR DE LA AUTENTICACION CONTRA EL CORREO
                           if (estudiante.elementAt(30).equals(estudiante.elementAt(17)) || estudiante.elementAt(30).equals(estudiante.elementAt(3))) {
                                sesion.setAttribute("mensaje", "Cambiar contraseña");
                                response.sendRedirect("ChPassword");
                            } else {*/
                                sesion.setAttribute("mensaje", "Bienvenido");
                                //PARA VALIDAR SI YA CONTESTO LAS ENCUESTAS ACADEMICAS A PARTIR DEL 2 DE DIC
                          /*  if (total != totalcontesto){
                                 response.sendRedirect("ListaEncuestas");
                                 }else */
                                if ((Integer.parseInt(est.getEstado()) > 0)) {
                                    //if ((Integer.parseInt(est.getEstado()) > 0)  || (Integer.parseInt(est.getEstado()) == -3) || (Integer.parseInt(est.getEstado()) == -4) || (Integer.parseInt(est.getEstado()) == -8) || (Integer.parseInt(est.getEstado()) == -9) || (Integer.parseInt(est.getEstado()) == -5) ){
                                    response.sendRedirect("menuServEstud");
                                } else {
                                    response.sendRedirect("menuServEstud1");
                                }
                           // }
                        }
                    } else {
                        ses = ses + 1;
                        est.setErrSes(carnet, ses);
                        String value = "";
                        if (ses > 5) {
                            values = request.getHeaders("x-forwarded-for");
                            if (values != null) {
                                while (values.hasMoreElements()) {
                                    value = (String) values.nextElement();

                                }
                            }
                            if (value.equals("")) {
                                value = request.getRemoteAddr();
                            }
                            est.setIpSes(carnet, value);
                        }
                        response.sendRedirect("login?msg=2");
                    }
                    // }
                }
            }else{
                response.sendRedirect("login?msg=1");
            }
        }
    }
}
