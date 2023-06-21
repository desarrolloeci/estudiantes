package ajax;

import estudiantes.Estudiante.Estudiante;
import estudiantes.baseDatos.BdEstudiante;
import estudiantes.configuracion.configECI;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lrodriguez
 */
public class ModificaPreins extends HttpServlet {

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
        PrintWriter out = response.getWriter();

        /* try {
        /* TODO output your page here
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet Preinscribe</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Servlet Preinscribe at " + request.getContextPath () + "</h1>");
        out.println("</body>");
        out.println("</html>");
         */
        /*   } finally {
        out.close();
        }*/
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
        //    StringBuffer results = new StringBuffer("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?><municipios>");
        HttpSession session = request.getSession();
        PrintWriter pw = response.getWriter();
        configECI cfgEci = new configECI();
        BdEstudiante bd = new BdEstudiante();
        String identificador = request.getParameter("identificador");
        String carnet = (String) session.getAttribute("carnet");
        Estudiante actualiza = new Estudiante(carnet, pw);
        String valor = request.getParameter("valor");
        int tamamo = 0, n = 0;
        String respuesta = null;
        Vector sec = new Vector();
        Vector requisitos = new Vector();
        Vector BibliaDef = new Vector();
        int ret, inserte = 0;
        Vector VerBiblia = new Vector();
        Vector plan = new Vector();
        Vector Idprog;
        Vector Noplanestud = new Vector();

        if (valor.equals("1") && (!identificador.equals(""))) {
            String[] ident = identificador.split(",");
            for (int i = 0; i < ident.length; i++) {
                if (ident.length > 2) {
                    if (ident[i].equals(ident[i + 1])) {
                        i = (i + 1);
                    }
                }
                if ((ident[i].equals("10134")) || (ident[i].equals("9687")) || (ident[i].equals("9684")) || (ident[i].equals("9686"))) { //ELECTIVAS
                    if (actualiza.BibliaDef(carnet) > 0) {
                        inserte = 2;
                    } else {
                        inserte = 1;
                    }
                } else //Nivelatorios sin requisitos
                if (ident[i].equals("8453") || ident[i].equals("9660") || ident[i].equals("9715")) {
                    inserte = 1;
                } else if (ident[i].equals("9703")) { //PREM CON FUND.MAT
                    requisitos = actualiza.ReqEspeciales(carnet, "9565", "-200");
                    String nivel = ((Vector) requisitos.elementAt(0)).elementAt(0).toString();
                    String vv = ((Vector) requisitos.elementAt(0)).elementAt(1).toString();
                    int vistas = Integer.parseInt(vv.toString());
                    if (nivel.charAt(0) == 'M' || vistas > 0) {
                        inserte = 1;
                    } else {
                        inserte = 2;
                    }

                } else if (ident[i].equals("1209")) { //ALGEBRA LINEAL CON AGEO Y PREM
                    requisitos = actualiza.ReqEspeciales(carnet, "9704", "9703");
                    String nivel = ((Vector) requisitos.elementAt(0)).elementAt(0).toString();
                    String vv = ((Vector) requisitos.elementAt(0)).elementAt(1).toString();
                    int vistas = Integer.parseInt(vv.toString());
                    if (nivel.charAt(0) == 'A' || vistas > 1) {
                        inserte = 1;
                    } else {
                        inserte = 2;
                    }
                } else if (ident[i].equals("10178")) { //CPIC CON COMB-R
                    requisitos = actualiza.ReqEspeciales(carnet, "10212", "-200");
                    String nivel = ((Vector) requisitos.elementAt(0)).elementAt(0).toString();
                    String vv = ((Vector) requisitos.elementAt(0)).elementAt(1).toString();
                    int vistas = Integer.parseInt(vv.toString());
                    if (nivel.charAt(3) == 'M' || nivel.charAt(3) == 'A' || vistas > 0) {
                        inserte = 1;
                    } else {
                        inserte = 2;
                    }
                } else if (ident[i].equals("10179")) { //QUIG-R CON FQUI-R
                    requisitos = actualiza.ReqEspeciales(carnet, "10268", "-200");
                    String nivel = ((Vector) requisitos.elementAt(0)).elementAt(0).toString();
                    String vv = ((Vector) requisitos.elementAt(0)).elementAt(1).toString();
                    int vistas = Integer.parseInt(vv.toString());
                    if (nivel.charAt(4) == 'M' || nivel.charAt(4) == 'A' || vistas > 0) {
                        inserte = 1;
                    } else {
                        inserte = 2;
                    }
                } else if (ident[i].equals("10183")) { //BICM-R CON FBIC-R
                    requisitos = actualiza.ReqEspeciales(carnet, "10211", "-200");
                    String nivel = ((Vector) requisitos.elementAt(0)).elementAt(0).toString();
                    String vv = ((Vector) requisitos.elementAt(0)).elementAt(1).toString();
                    int vistas = Integer.parseInt(vv.toString());
                    if (nivel.charAt(5) == 'M' || nivel.charAt(5) == 'A' || vistas > 0) {
                        inserte = 1;
                    } else {
                        inserte = 2;
                    }
                } else if (ident[i].equals("9694")) { //CALC DIF CON PREM. Y AGEO
                    requisitos = actualiza.ReqEspeciales(carnet, "9703", "9704");
                    String nivel = ((Vector) requisitos.elementAt(0)).elementAt(0).toString();
                    String vv = ((Vector) requisitos.elementAt(0)).elementAt(1).toString();
                    int vistas = Integer.parseInt(vv.toString());
                    if (nivel.charAt(0) == 'A' || vistas > 1) {
                        inserte = 1;
                    } else {
                        inserte = 2;
                    }

                } else if (ident[i].equals("9704")) { //ANALISIS GEOMETRICO CON FUND.DE MATEM
                    requisitos = actualiza.ReqEspeciales(carnet, "9565", "-200");
                    String nivel = ((Vector) requisitos.elementAt(0)).elementAt(0).toString();
                    String vv = ((Vector) requisitos.elementAt(0)).elementAt(1).toString();
                    int vistas = Integer.parseInt(vv.toString());
                    if (nivel.charAt(0) == 'M' || vistas > 0) {
                        inserte = 1;
                    } else {
                        inserte = 2;
                    }
                } else if (ident[i].equals("9709")) { //FISICA MECANIK DE FLUIDOS CON FFIS
                    requisitos = actualiza.ReqEspeciales(carnet, "9660", "-200");
                    String nivel = ((Vector) requisitos.elementAt(0)).elementAt(0).toString();
                    String vv = ((Vector) requisitos.elementAt(0)).elementAt(1).toString();
                    int vistas = Integer.parseInt(vv.toString());
                    if (nivel.charAt(2) == 'A' || vistas > 0) {
                        inserte = 1;
                    } else {
                        inserte = 2;
                    }
                } else if (ident[i].equals("1370")) {//QUIMICA CON FQUIM
                    requisitos = actualiza.ReqEspeciales(carnet, "9715", "-200");
                    String nivel = ((Vector) requisitos.elementAt(0)).elementAt(0).toString();
                    String vv = ((Vector) requisitos.elementAt(0)).elementAt(1).toString();
                    int vistas = Integer.parseInt(vv.toString());
                    if (nivel.charAt(4) == 'A' || vistas > 0) {
                        inserte = 1;
                    } else {
                        inserte = 2;
                    }
                } else if (ident[i].equals("10134") || (ident[i].equals("9313")) || (ident[i].equals("18098")) || (ident[i].equals("9192")) || (ident[i].equals("9681")) || (ident[i].equals("9683")) || (ident[i].equals("9684")) || (ident[i].equals("9069")) || (ident[i].equals("9359")) || (ident[i].equals("9687")) || (ident[i].equals("9720"))) { //ESTRUCTURA DEL LENGUAJE  - ASTR-EALE CON EXOE
                    requisitos = actualiza.ReqEspeciales(carnet, "8453", "-200");
                    String nivel = ((Vector) requisitos.elementAt(0)).elementAt(0).toString();
                    String vv = ((Vector) requisitos.elementAt(0)).elementAt(1).toString();
                    int vistas = Integer.parseInt(vv.toString());

                    if (nivel.equals('X') || vistas > 0) {
                        inserte = 1;
                    } else if (nivel.charAt(3) == 'A' || vistas > 0) {
                        inserte = 1;
                    } else {
                        inserte = 2;
                    }
                } else if ((ident[i].equals("10137")) || (ident[i].equals("10138")) || (ident[i].equals("10139"))) { //INGLES
                    if (actualiza.ReqIngles(carnet, ident[i]) > 0) {
                        inserte = 1;
                    } else {
                        String req = String.valueOf(Integer.parseInt(ident[i]) - 1);
                        requisitos = actualiza.ReqEspeciales(carnet, req, "-200");
                        String vv = ((Vector) requisitos.elementAt(0)).elementAt(1).toString();
                        int vistas = Integer.parseInt(vv.toString());
                        if (vistas > 0) {
                            inserte = 1;
                        } else {
                            inserte = 2;
                        }
                    }
                }
                if (inserte == 1) {
                    sec = actualiza.SecuenciaPreinscrip();
                    String secu = new String();
                    secu = ((Vector) sec.elementAt(0)).elementAt(0).toString();
                    if (sec.size() > 0) {
                        ret = actualiza.ActSecuencia();
                    }
                    tamamo = actualiza.InsertaPreinsprim(carnet, secu, ident[i], cfgEci.getPeriodoActual());
                }

                if (inserte == 0) {
                    plan = actualiza.BuscarPlan(carnet, ident[i]);
                    if (plan.size() > 0) {
                        requisitos = actualiza.Requisitos(carnet, ident[i]);
                        String req1 = ((Vector) requisitos.elementAt(0)).elementAt(0).toString();
                        int requisito1 = Integer.parseInt(req1.toString());
                        String req2 = ((Vector) requisitos.elementAt(0)).elementAt(1).toString();
                        int requisito2 = Integer.parseInt(req2.toString());
                        if (requisito1 >= requisito2) {
                            sec = actualiza.SecuenciaPreinscrip();
                            String secu = new String();
                            secu = ((Vector) sec.elementAt(0)).elementAt(0).toString();
                            if (sec.size() > 0) {
                                ret = actualiza.ActSecuencia();
                            }
                            tamamo = actualiza.InsertaPreinsprim(carnet, secu, ident[i], cfgEci.getPeriodoActual());
                        }
                    } else {
                        Idprog = actualiza.Idprog(carnet);
                        String idprog = ((Vector) Idprog.elementAt(0)).elementAt(1).toString();
                        Noplanestud = actualiza.Noplanestud(identificador, idprog);
                        if (Noplanestud.size() > 0) {
                            String[] id = new String[5];
                            for (int x = 0; x < Noplanestud.size(); x++) {
                                id[0] = ((Vector) Noplanestud.elementAt(x)).elementAt(0).toString();
                                id[1] = ((Vector) Noplanestud.elementAt(x)).elementAt(1).toString();
                                id[2] = ((Vector) Noplanestud.elementAt(x)).elementAt(2).toString();
                                id[3] = ((Vector) Noplanestud.elementAt(x)).elementAt(3).toString();
                                id[4] = ((Vector) Noplanestud.elementAt(x)).elementAt(4).toString();
                                //}
                                for (int p = 0; p < 5; p++) {
                                    if (!id[p].equals("No disponible")) {
                                        n = n + 1;
                                    } else {
                                        id[p] = "0";
                                    }
                                }
                                VerBiblia = actualiza.VerBiblia(carnet, id[0], id[1], id[2], id[3], id[4]);
                                String ver = ((Vector) VerBiblia.elementAt(0)).elementAt(0).toString();
                                int ve = Integer.parseInt(ver.toString());
                                if (ve >= n) {
                                    sec = actualiza.SecuenciaPreinscrip();
                                    String secu = new String();
                                    secu = ((Vector) sec.elementAt(0)).elementAt(0).toString();
                                    if (sec.size() > 0) {
                                        ret = actualiza.ActSecuencia();
                                    }
                                    tamamo = actualiza.InsertaPreinsprim(carnet, secu, ident[i], cfgEci.getPeriodoActual());
                                    if (tamamo == 1) {
                                        x = Noplanestud.size();
                                    }
                                } else {
                                    n = 0;
                                    respuesta = "No ha visto los prerrequisitos para preinscribir esta asignatura";
                                }
                            }

                        } else if (Noplanestud.size() == 0) {
                            sec = actualiza.SecuenciaPreinscrip();
                            String secu = new String();
                            secu = ((Vector) sec.elementAt(0)).elementAt(0).toString();
                            if (sec.size() > 0) {
                                ret = actualiza.ActSecuencia();
                            }
                            tamamo = actualiza.InsertaPreinsprim(carnet, secu, ident[i], cfgEci.getPeriodoActual());
                        }

                    }
                }
            }

            response.sendRedirect("ModificaPreins?valor=" + valor + "&id=" + identificador);
        } else {
            tamamo = actualiza.Borrarpreins(identificador, carnet);
            if (tamamo > 0) {
                respuesta = "<root>ok</root>";
            } else {
                respuesta = "<root>error</root>";
            }
            response.setContentType("text/xml");
            pw.write(respuesta);
            pw.flush();
            pw.close();
        }

    }
}
