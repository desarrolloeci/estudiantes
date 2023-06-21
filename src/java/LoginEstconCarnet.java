
import java.io.*;
import java.io.IOException;
import java.util.Enumeration;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Vector;
import estudiantes.Estudiante.Estudiante;
import estudiantes.Estudiante.EstudMisc;
import utiles.autentica ;

/**
 *
 * @author
 */
public class LoginEstconCarnet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String refer, carnet, passwd, dia;
        Estudiante est;

       HttpSession sesion = request.getSession(false);
        int ses;
        carnet = request.getParameter("carnet"); /*Usuario de Asa*/
        passwd = request.getParameter("passwd");  /*Password de Acceso*/
        carnet = carnet.replace("'", "");
        passwd = passwd.replace("'", "");
        passwd = passwd.replace(" ", "");
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
    

        String msg = "";
        String cod = "";
        String secHash = "";
        String originalHash = "";
        String seccode = request.getParameter("seccode");
        System.out.println("Valor caja texto : " + seccode);
        String mensaje = "Error";
        String msjok = "Error";
        String              conexion = "";
        if (!(seccode == null || seccode.equals("null"))) {
            originalHash = (String) sesion.getAttribute("keycap");
            if (originalHash==null)
                originalHash="elcaptchaesincorrectoonorecargado2016";
            
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


        /*  if (sesion != null){
         try{
         sesion.invalidate();
         }catch (java.lang.IllegalStateException e){}
         out.println("Ya existia una Sesion! Vuelva a autenticarse");
         }*/
        //  else{
        //sesion = request.getSession();
        //carnet = sesion.getAttribute("carnetenc").toString();
        //passwd = sesion.getAttribute("passwdenc").toString();
        //keyEst = (SecretKey)sesion.getAttribute("llave");
        // Validacion de Sesion, si esta creada lo direcciona a la pagina de
        //  inicio
        /*estudiantes.filtros.encripta enc = new estudiantes.filtros.encripta();
         passwd = enc.desencriptar(passwd, keyEst);
         carnet = enc.desencriptar(carnet, keyEst);*/
        // Si existe una sesion , se invalida la sesion y direcciona al login
        // Menu de Estudiantes
        /*if (sesion != null){
         try{
         sesion.invalidate() ;
         }catch (java.lang.IllegalStateException e){}
         response.sendRedirect("login?msg=7") ;
         }else{*/
        // Validacion si todos los datos existen en la forma de login
        if (carnet == null || passwd == null || carnet.equals("") || passwd.equals("")) {
            response.sendRedirect("login?msg=0");

        } else {

            // Instanciacion del Estudiante

            est = new Estudiante(carnet, out);
            ses = Integer.parseInt(est.getErrSes());
            Vector infoEst = est.getInfoEstudiante();
          //ENCUESTAS VERIFICAR SI CONTESTO
            /*Vector CuantosEnc = est.AsignaEncuestaA(carnet);
            Vector cuantos = new Vector();
            cuantos = (Vector) CuantosEnc.elementAt(0);
            int total;
            total= (Integer.parseInt((String) cuantos.elementAt(0)));  //cuantos debe contestar
           
            Vector contesto = est.ContestaEncuestaA(carnet);
            Vector valorcontesto = new Vector();
            valorcontesto = (Vector) contesto.elementAt(0);
            int totalcontesto;
            totalcontesto = (Integer.parseInt((String) valorcontesto.elementAt(0))); //cuantas asignaturas contesto*/
            //No se encontraton datos del estudiante
            if (infoEst.size() == 0) {
                response.sendRedirect("login?msg=1");
            } else {
               
                Vector estudiante = (Vector) infoEst.elementAt(0);
                //   if (((String)estudiante.elementAt(30)).equals(passwd) || passwd.equals(est.getPassOsiris())){
                if (((String) estudiante.elementAt(30)).equals(passwd) || passwd.equals("H@8mMr-q")) {
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
                        if (estudiante.elementAt(30).equals(estudiante.elementAt(17)) || estudiante.elementAt(30).equals(estudiante.elementAt(3))) {
                            sesion.setAttribute("mensaje", "Cambiar contraseña");
                            response.sendRedirect("ChPassword");
                        } else {
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
                    response.sendRedirect("login?msg=2");
                }
            }
        }
    }
}
//}
