
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
public class LoginEstNuevo extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String refer, carnet, passwd, dia, usuario, seccode;
        Estudiante est;

        HttpSession sesion;
        int ses;
        carnet = request.getParameter("carnet");
        /*Usuario de Asa*/
        usuario = request.getParameter("usuario");
        
        refer = "";
        String conexion = "";
        Enumeration values = request.getHeaders("referer");
        sesion = request.getSession();

        // Autenticacion correo
        autentica c = new autentica();
        conexion = "conectado"; //=======ojo*/

        //SE CAMBIA ESTA LINEA PARA QUE SE AUTENTIQUE AL CORREO 
        est = new Estudiante(carnet, out);
        ses = Integer.parseInt(est.getErrSes());
        if (conexion.equals("conectado")) {

            if (values != null) {
                while (values.hasMoreElements()) {
                    refer = (String) values.nextElement();
                }
            }
            if (refer.equals("")) {
                request.setAttribute("error", "El usuario no se ha autenticado correctamente");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
           
            }
            sesion = request.getSession(false);

            String msg = "";
            String cod = "";

            // Instanciacion del Estudiante
            if (carnet == null || carnet.equals("")) {
               request.setAttribute("error", "El usuario no se ha autenticado correctamente");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
           

            } else {

                // Instanciacion del Estudiante
                Vector infoEst = est.getInfoEstudiante();

                if (infoEst.size() == 0) {
                   request.setAttribute("error", "Usuario desconocido");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
           
                } else {
                    Vector estudiante = (Vector) infoEst.elementAt(0);

                    dia = null;
                    try {
                        otros.rutas ruta = new otros.rutas();
                        FileReader arch = new FileReader(ruta.valruta() + "dias.txt");
                        BufferedReader salida = new BufferedReader(arch);
                        dia = salida.readLine();
                        salida.close();
                        arch.close();
                    } catch (java.io.FileNotFoundException fnfex) {
                       request.setAttribute("error", "Error del Servidor");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
           
                    }

                    //Verifcacion del Dia de Registro Academico
                    if (!((String) estudiante.elementAt(16)).equals(dia) && !dia.equals("0") && !estudiante.elementAt(31).toString().equals("O") && !estudiante.elementAt(31).toString().equals("P") && !est.getEstado().equals("-22")) {
                       request.setAttribute("error", "Este no es su D&iacute;a de Registro Acad&eacute;mico");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
           
                    } else {

                        //Creacion de la Sesion
                        sesion = request.getSession(true);
                        // Valores de la Variable de Sesion
                        sesion.setAttribute("carnet", carnet);
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
                        sesion.setAttribute("mensaje", "Bienvenido");
                        sesion.setAttribute("usuario", usuario);
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
                    }
                }
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
           request.setAttribute("error", "El usuario no se ha autenticado correctamente");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
           
        }

    }
}
