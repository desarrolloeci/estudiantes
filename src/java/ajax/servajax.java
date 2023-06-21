/*
 * servajax.java
 *
 * Created on 13 de noviembre de 2007, 02:00 PM
 */
package ajax;

import java.io.*;
import java.util.Vector;
import javax.servlet.*;
import javax.servlet.http.*;
import estudiantes.Estudiante.EstudMisc;
import estudiantes.Estudiante.Estudiante;
import estudiantes.Modreg.Operacion;
import estudiantes.Modreg.Solicitud;
import estudiantes.configuracion.configECI;

public class servajax extends HttpServlet {

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
         out.println("<title>Servlet servajax</title>");
         out.println("</head>");
         out.println("<body>");
         out.println("<h1>Servlet servajax at " + request.getContextPath () + "</h1>");
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
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=iso-8859-1");
        EstudMisc comgen = new EstudMisc();
        Vector temp;
        String id_dpto = request.getParameter("id_dpto");
        Vector munic = comgen.getMunicipios(id_dpto);

        StringBuffer results = new StringBuffer("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?><municipios>");
        for (int i = 0; i < munic.size(); i++) {
            temp = (Vector) munic.elementAt(i);
            results.append("<municipio>");
            results.append(temp.elementAt(1));
            results.append("</municipio>");
            results.append("<idmunicipio>");
            results.append(temp.elementAt(0));
            results.append("</idmunicipio>");
        }
        results.append("</municipios>");
        response.setContentType("text/xml");
        //response.getWriter().write(results.toString());
        out.println(results.toString());
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
        PrintWriter out = response.getWriter();
        HttpSession sesion;
        sesion = request.getSession(false);
        String carnet = (String) sesion.getAttribute("carnet").toString();
        response.setContentType("text/html;charset=UTF-8");
        Vector temp, asig, temp2;
        String msg = "";
        String cod = "";
        String secHash = "";
        String originalHash = "";
        int resultado = 0;
        String seccode = request.getParameter("seccode");
        System.out.println("Valor caja texto : " + seccode);
        String mensaje = "Error";
        String msjok = "Error";
        configECI cfgEci = new configECI();
        String perreg = cfgEci.getPeriodoHor();
        if (!(seccode == null || seccode.equals("null"))) {
            originalHash = (String) sesion.getAttribute("keycap");
            System.out.println(originalHash);
            System.out.println("Valor de captcha sesion : " + originalHash);
            secHash = seccode;
            if (!originalHash.equals(secHash)) {
                StringBuffer results = new StringBuffer("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>"
                        + "<asignatura>");
                results.append("<mensaje>");
                results.append("El código es incorrecto, verifíquele e intente nuevamente.");
                results.append("</mensaje>");
                results.append("<ok>");
                results.append("msjok");
                results.append("</ok>");
                results.append("</asignatura>");
                response.setContentType("text/xml");
                response.getWriter().write(results.toString());
                response.getWriter().flush();
            }
        }
        if (originalHash.equals(secHash)) {
            //****** RETARDO DE 5 SEGUNDOS PARA PRUEBAS ******
        /*try {
             Thread.sleep(5000);
             } catch (InterruptedException ex) {
             ex.printStackTrace();
             }*/
            //***************************************************
            //***** OJO FALTA VER ERROR AL FINALIZAR LA SESION *********
            // **** Cambiar lo siguiente, ya q devuelve Status 500 cuando carne no existe
            if (carnet == null || carnet.equals("")) {
                StringBuffer results = new StringBuffer("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>"
                        + "<asignatura>");
                results.append("<mensaje>");
                results.append("Su sesion ha finalizado");
                results.append("</mensaje>");
                results.append("<municipio>");
                results.append("Error para municipio mirar luego");
                results.append("</municipio>");
                results.append("<ok>");
                results.append("sesfin");
                results.append("</ok>");
                results.append("</asignatura>");
                response.setContentType("text/xml");
                response.getWriter().write(results.toString());
            } else {
                String func = request.getParameter("func");
                if (func.equals("solpregrad")) {
                    EstudMisc comgen = new EstudMisc();
                    String id_dpto = request.getParameter("id_dpto");
                    Vector munic = comgen.getMunicipios(id_dpto);
                    StringBuffer results = new StringBuffer("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>"
                            + "<municipios>");
                    for (int i = 0; i < munic.size(); i++) {
                        temp = (Vector) munic.elementAt(i);
                        results.append("<municipio>");
                        results.append(temp.elementAt(1));
                        results.append("</municipio>");
                        results.append("<idmunicipio>");
                        results.append(temp.elementAt(0));
                        results.append("</idmunicipio>");
                    }
                    results.append("</municipios>");
                    response.setContentType("text/xml");
                    response.getWriter().write(results.toString());
                } else if (func.equals("horasigest")) {
                    Estudiante est = (Estudiante) sesion.getAttribute("estClase");
                    String cont = new String((String) sesion.getAttribute("cont"));
                    carnet = (String) sesion.getAttribute("carnet");
                    Operacion op = new Operacion(carnet);
                    StringBuffer results = new StringBuffer("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>"
                            + "<asignatura>");
                    results.append("<mensaje>");
                    int contador = Integer.parseInt(cont);
                    String arreglo[] = new String[500];
                    String cadena = "var", cadena1 = "";
                    for (int i = 0; i < contador; i++) {
                        cadena1 = String.valueOf(i);
                        String variable = (String) cadena.concat(cadena1);
                        arreglo[i] = request.getParameter(variable);
                    }
                    int p1 = 0, m1 = 0;
                    int k = contador / 5;
                    for (int j = 0; j < k; j++) {
                        if (!(arreglo[p1 + 2].equals("0"))) {
                            m1 = m1 + 1;
                        }
                        p1 = p1 + 5;
                    }
                    if (m1 == 0) {
                        mensaje = "USTED NO REALIZO NINGUNA OPERACION";
                    } else {
                        int p = 0, m = 0;
                        String codasig;
                        int c = contador / 5;
                        Solicitud sol[] = new Solicitud[m1];
                        
                        //Acá se validan los requisitos usando el procedimiento almacenado
                        VerificadorRequisitos veri_req=new VerificadorRequisitos();
                        Boolean asignaturas_validas=true;
                        Estudiante estudiante = (Estudiante) sesion.getAttribute("estClase");
                        String asignaturas = "";
                        for (int n = 0; n < c; n++) {
                            if (!(arreglo[p + 2].equals("0"))) {
                                codasig = arreglo[p + 1].toUpperCase();
                                asignaturas_validas=asignaturas_validas&&veri_req.cumpleRequisitos(carnet, estudiante.ConsultarIdAsig(codasig), request.getSession());
                                if(!veri_req.cumpleRequisitos(carnet, estudiante.ConsultarIdAsig(codasig), request.getSession())){
                                    asignaturas += " "+codasig+" ";
                                }
                                sol[m] = new Solicitud("A", codasig, arreglo[p + 2], arreglo[p + 3], arreglo[p + 4]);
                                m = m + 1;
                            }
                            p = p + 5;
                        }
                        String respuesta = "";
                        mensaje = "";
                        Operacion op2 = new Operacion(carnet, sol);
                        
                        
                        //Descomentar en Intermedio
                        asignaturas_validas=true;
                        
                        
                        if (asignaturas_validas&&op2.ejecutarOperacion()) {
                            for (int i = 0; i < m; i++) {
                                respuesta = "";
                                Solicitud soll = op2.getSolicitud(i);
                                if (soll.getRespuesta() == 'S') {
                                    respuesta = respuesta + "Su solicitud fue aceptada\n";
                                    msjok = "ok";
                                } else if (soll.getRespuesta() == 'A') {
                                    respuesta = respuesta + "Asignatura no programada o no permitida para usted\n";
                                } else if ((soll.getRespuesta() == 'B') && (soll.getTipOp().equals("R"))) {
                                    respuesta = respuesta + "La asignatura a retirar no esta inscrita\n";
                                } else if ((soll.getRespuesta() == 'B') && (soll.getTipOp().equals("M"))) {
                                    respuesta = respuesta + "La asignatura a modificar no esta inscrita\n";
                                } else if (soll.getRespuesta() == 'C') {
                                    respuesta = respuesta + "El grupo a retirar no esta inscrito\n";
                                } else if (soll.getRespuesta() == 'D') {
                                    respuesta = respuesta + "No se encontro el laboratorio\n";
                                } else if (soll.getRespuesta() == 'E') {
                                    respuesta = respuesta + "Sistema ocupado por favor intente mas tarde\n";
                                } else if ((soll.getRespuesta() == 'F') && (soll.getTipOp().equals("A"))) {
                                    respuesta = respuesta + "Esta intentando adicionar una materia que ya tiene inscrita\n";
                                } else if ((soll.getRespuesta() == 'F') && (soll.getTipOp().equals("M"))) {
                                    respuesta = respuesta + "Esta intentando modificar a un grupo en el que ya esta inscrito\n";
                                } else if ((soll.getRespuesta() == 'G') && (soll.getTipOp().equals("A"))) {
                                    respuesta = respuesta + "El grupo a adicionar no existe\n";
                                } else if ((soll.getRespuesta() == 'G') && (soll.getTipOp().equals("M"))) {
                                    respuesta = respuesta + "El grupo a modificar no existe\n";
                                } else if (soll.getRespuesta() == 'H') {
                                    respuesta = respuesta + "No se permite la asignatura\n";
                                } else if (soll.getRespuesta() == 'I') {
                                    respuesta = //respuesta + "Sobrepasa la carga de créditos\n";
                                            //respuesta= respuesta + "Sobrepasa la carga, no ha pagado asignaturas o no tiene el requisito de inglés\n";
                                            respuesta = respuesta + "Sobrepasa la carga\n";
                                } else if (soll.getRespuesta() == 'J') {
                                    respuesta = respuesta + "El grupo se cruza con alguno ya inscrito\n";
                                } else if (soll.getRespuesta() == 'K') {
                                    respuesta = respuesta + "No hay cupo\n";
                                } else if (soll.getRespuesta() == 'L') {
                                    respuesta = respuesta + "No coincide grupo teorico con laboratorio o auxiliar\n";
                                } else if (soll.getRespuesta() == 'M') {
                                    respuesta = respuesta + "El grupo de laboratorio o auxiliar no existe\n";
                                } else if (soll.getRespuesta() == 'N') {
                                    respuesta = respuesta + "Esta intentando cambiarse al grupo que ya tiene inscrito\n";
                                } else if (soll.getRespuesta() == 'O') {
                                    respuesta = respuesta + "Aun no ha firmado el acta de matricula\n";
                                } else if (soll.getRespuesta() == 'P') {
                                    respuesta = respuesta + "No tiene el correquisito necesario o no puede inscribir esta materia\n";
                                } else if (soll.getRespuesta() == 'Q') {
                                    respuesta = respuesta + "No se puede retirar un correquisito\n";
                                } else if (soll.getRespuesta() == 'Y') {
                                    respuesta = respuesta + "Cruce o falta de cupo en el laboratorio o la auxiliar\n";
                                } else if (soll.getRespuesta() == 'Z') {
                                    respuesta = respuesta + "Asignatura adicionada. Pendiente aprobacion del decano\n";
                                    msjok = "ok";
                                } else if (soll.getRespuesta() == 'X') {
                                    respuesta = respuesta + "No puede retirar esta asignatura\n";
                                } else if (soll.getRespuesta() == 'W') {
                                    respuesta = respuesta + "Este grupo no corresponde a su periodo de ingreso\n";
                                } else if (soll.getRespuesta() == 'V') {
                                    respuesta = respuesta + "Este grupo no corresponde a su periodo de ingreso\n";
                                }
                                if (soll.getTipOp().equals("M")) {
                                    mensaje = mensaje + " Cambio grupo: ";
                                }
                                if (soll.getTipOp().equals("A")) {
                                    mensaje = mensaje + " Adición materia: ";
                                }
                                if (soll.getTipOp().equals("R")) {
                                    mensaje = mensaje + " Retiro materia: ";
                                }
                                mensaje = mensaje + soll.getCodAsig() + "-" + soll.getNumGrp() + "-" + soll.getNumLab() + "-"
                                        + soll.getNumAux() + "-" + respuesta + "\n";
                            }
                        } else {
                            if(!asignaturas_validas){
                                mensaje = " No cumple los requisitos de la(s) asignatura(s)"+asignaturas;
                            }else{
                                mensaje = " Error en la operacion ";
                            }
                        }
                    }
                    results.append(mensaje);
                    results.append("</mensaje>");
                    results.append("<ok>");
                    results.append(msjok);
                    results.append("</ok>");
                    results.append("</asignatura>");
                    response.setContentType("text/xml");
                    response.getWriter().write(results.toString());
                } else if (func.equals("horasigestins")) {
                    Estudiante est = (Estudiante) sesion.getAttribute("estClase");
                    String cont = new String((String) sesion.getAttribute("cont1"));
                    carnet = (String) sesion.getAttribute("carnet");
                    Operacion op = new Operacion(carnet);
                    StringBuffer results = new StringBuffer("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>"
                            + "<asignatura>");
                    results.append("<mensaje>");
                    int contador = Integer.parseInt(cont);
                    String arreglo[] = new String[500];
                    String cadena = "campo", cadena1 = "";
                    for (int i = 0; i < contador; i++) {
                        cadena1 = String.valueOf(i);
                        String variable = (String) cadena.concat(cadena1);
                        arreglo[i] = request.getParameter(variable);
                    }
                    int p1 = 0, m1 = 0;
                    int k = contador / 5;
                    for (int j = 0; j < k; j++) {
                        if ((!(arreglo[p1].equals("N"))) && (!(arreglo[p1 + 2].equals("0")))) {
                            m1 = m1 + 1;
                        }
                        p1 = p1 + 5;
                    }

                    int opera = 0, mm = 0;

                    for (int j = 0; j < k; j++) {
                        String lab = "";
                        if (arreglo[opera].equals("R") && perreg.charAt(5) == 'I') {
                            Vector datos = new Vector();

                            datos = est.Asignatura(arreglo[opera + 1]);
                            lab= arreglo[opera + 3];
                            //REVISAR VALIDAR SI TIENE O NO LABORATORIO cdo el est no ingresa el lab para que se borre automaticamente si estan ligadas 
                            
                          /*  if (arreglo[opera + 2].equals("1")) {
                                lab = "1";
                            } else if (arreglo[opera + 2].equals("2")) {
                                lab = "2";
                            } else if (arreglo[opera + 2].equals("3")) {
                                lab = "3";
                            } else if (arreglo[opera + 2].equals("4")) {
                                lab = "4";
                            } else if (arreglo[opera + 2].equals("5")) {
                                lab = "5";
                            } else if (arreglo[opera + 2].equals("6")) {
                                lab = "6";
                            }*/
                           
                            
                            //lab= arreglo[opera + 3];

                            Vector codigos = new Vector();
                            Vector validapago = new Vector();
                            String asignatura1 = "";
                            String asignatura2 = "";
                            for (int a = 0; a < datos.size(); a++) {
                                codigos = (Vector) datos.elementAt(a);
                                asignatura1 = codigos.elementAt(0).toString();
                                asignatura2 = codigos.elementAt(1).toString();
                            }

                            if (lab.equals("0") && !asignatura2.equals("-1")){
                              Vector laboratorio= est.ConsultagrupoLaborat(asignatura2, perreg);
                              Vector laborat= (Vector) laboratorio.elementAt(0);
                              lab= laborat.elementAt(0).toString();
                              
                            }
                            Vector dato = est.AsignaturaLaborat(asignatura1, arreglo[opera + 2], asignatura2, lab, perreg);
                            Vector grupos = new Vector();
                            String grupo1 = "";
                            String grupo2 = "";

                            for (int a = 0; a < dato.size(); a++) {
                                grupos = (Vector) dato.elementAt(a);
                                grupo1 = grupos.elementAt(0).toString();
                                Vector pagos = est.AsignaturaPago(grupo1, perreg, carnet);
                                validapago = (Vector) pagos.elementAt(0);
                                String pago = validapago.elementAt(2).toString();
                                if (!pago.equals("0")) {
                                    resultado = 3;
                                } else {
                                    //Esto se comentariza por solicitud de Carlos Perez 26/05/2020
                                    //Vector sec = est.SecuenciaPI();
                                    //String secuencia = ((Vector) sec.elementAt(0)).elementAt(0).toString();
                                    //int actualiza = est.ActualizaRetiro(secuencia, carnet, grupo1, perreg);
                                    //int inserta = est.InsertaAuditPI(carnet, grupo1);
                                    //if (inserta > 0) {
                                    //    int actualsec = est.ActSecuenciaPI();
                                    //}
                                    //resultado = 1;
                                }
                            }
                        }

                        mm = mm + 1;
                        opera = opera + 5;

                    }


                    if (m1 == 0) {
                        mensaje = "USTED NO REALIZO NINGUNA OPERACION";
                    } else {
                        int p = 0, m = 0;
                        String codasig;
                        int c = contador / 5;
                        Solicitud sol[] = new Solicitud[m1];
                        for (int n = 0; n < c; n++) {
                            if ((!(arreglo[p].equals("N"))) && (!(arreglo[p + 2].equals("0")))) {
                                codasig = arreglo[p + 1].toUpperCase();
                                sol[m] = new Solicitud(arreglo[p], codasig, arreglo[p + 2], arreglo[p + 3], arreglo[p + 4]);
                                m = m + 1;
                            }
                            p = p + 5;
                        }
                        String respuesta = "";
                        mensaje = "";
                        Operacion op2 = new Operacion(carnet, sol);



                        if (resultado == 0) {
                            if (op2.ejecutarOperacion()) {
                                for (int i = 0; i < m; i++) {
                                    respuesta = "";
                                    Solicitud soll = op2.getSolicitud(i);

                                    if (soll.getRespuesta() == 'S') {
                                        respuesta = respuesta + "Su solicitud fue aceptada\n";
                                        msjok = "ok";
                                    } else if (soll.getRespuesta() == 'A') {
                                        respuesta = respuesta + "Código de asignatura no existente\n";
                                    } else if ((soll.getRespuesta() == 'B') && (soll.getTipOp().equals("R"))) {
                                        respuesta = respuesta + "La asignatura a retirar no esta inscrita\n";
                                    } else if ((soll.getRespuesta() == 'B') && (soll.getTipOp().equals("M"))) {
                                        respuesta = respuesta + "La asignatura a modificar no esta inscrita\n";
                                    } else if (soll.getRespuesta() == 'C') {
                                        respuesta = respuesta + "El grupo a retirar no esta inscrito\n";
                                    } else if (soll.getRespuesta() == 'D') {
                                        respuesta = respuesta + "No se encontro el laboratorio\n";
                                    } else if (soll.getRespuesta() == 'E') {
                                        respuesta = respuesta + "Sistema ocupado por favor intente mas tarde\n";
                                    } else if ((soll.getRespuesta() == 'F') && (soll.getTipOp().equals("A"))) {
                                        respuesta = respuesta + "Esta intentando adicionar una materia que ya tiene inscrita\n";
                                    } else if ((soll.getRespuesta() == 'F') && (soll.getTipOp().equals("M"))) {
                                        respuesta = respuesta + "Esta intentando modificar a un grupo en el que ya esta inscrito\n";
                                    } else if ((soll.getRespuesta() == 'G') && (soll.getTipOp().equals("A"))) {
                                        respuesta = respuesta + "El grupo a adicionar no existe\n";
                                    } else if ((soll.getRespuesta() == 'G') && (soll.getTipOp().equals("M"))) {
                                        respuesta = respuesta + "El grupo a modificar no existe\n";
                                    } else if (soll.getRespuesta() == 'H') {
                                        respuesta = respuesta + "No se permite la asignatura\n";
                                    } else if (soll.getRespuesta() == 'I') //respuesta= respuesta + "Sobrepasa la carga de créditos\n";
                                    //respuesta= respuesta + "Sobrepasa la carga, no ha pagado asignaturas o no tiene el requisito de inglés\n";
                                    {
                                        respuesta = respuesta + "Sobrepasa la carga\n";
                                    } else if (soll.getRespuesta() == 'J') {
                                        respuesta = respuesta + "El grupo se cruza con alguno ya inscrito\n";
                                    } else if (soll.getRespuesta() == 'K') {
                                        respuesta = respuesta + "No hay cupo\n";
                                    } else if (soll.getRespuesta() == 'L') {
                                        respuesta = respuesta + "No coincide grupo teorico con laboratorio o auxiliar\n";
                                    } else if (soll.getRespuesta() == 'M') {
                                        respuesta = respuesta + "El grupo de laboratorio o auxiliar no existe\n";
                                    } else if (soll.getRespuesta() == 'N') {
                                        respuesta = respuesta + "Esta intentando cambiarse al grupo que ya tiene inscrito\n";
                                    } else if (soll.getRespuesta() == 'O') {
                                        respuesta = respuesta + "Aun no ha firmado el acta de matricula\n";
                                    } else if (soll.getRespuesta() == 'P') {
                                        respuesta = respuesta + "No tiene el correquisito necesario o no puede inscribir esta materia\n";
                                    } else if (soll.getRespuesta() == 'Q') {
                                        respuesta = respuesta + "No se puede retirar un correquisito\n";
                                    } else if (soll.getRespuesta() == 'Y') {
                                        respuesta = respuesta + "Cruce o falta de cupo en el laboratorio o la auxiliar\n";
                                    } else if (soll.getRespuesta() == 'Z') {
                                        respuesta = respuesta + "Asignatura adicionada. Pendiente aprobaciin del decano\n";
                                        msjok = "ok";
                                    } else if (soll.getRespuesta() == 'X') {
                                        respuesta = respuesta + "No puede retirar esta asignatura\n";
                                    } else if (soll.getRespuesta() == 'W') {
                                        respuesta = respuesta + "Este grupo no corresponde a su periodo de ingreso\n";
                                    } else if (soll.getRespuesta() == 'V') {
                                        respuesta = respuesta + "Este grupo no corresponde a su periodo de ingreso\n";
                                    } else if (soll.getRespuesta() == '0') {
                                        respuesta = "Problema con el Laboratorio, Retire la asignatura \n y adicionela en el nuevo grupo deseado\n";
                                    }
                                    if (soll.getTipOp().equals("M")) {
                                        mensaje = mensaje + " Cambio grupo: ";
                                    }
                                    if (soll.getTipOp().equals("A")) {
                                        mensaje = mensaje + " Adición materia: ";
                                    }
                                    if (soll.getTipOp().equals("R")) {
                                        mensaje = mensaje + " Retiro materia: ";
                                    }
                                    mensaje = mensaje + soll.getCodAsig() + "-" + soll.getNumGrp() + "-" + soll.getNumLab() + "-"
                                            + soll.getNumAux() + "-" + respuesta + "\n";
                                }
                            }
                        } else if (resultado == 1) {
                            //  if (op2.ejecutarOperacion()) {
                            for (int i = 0; i < m; i++) {
                                respuesta = "";
                                Solicitud soll = op2.getSolicitud(i);

                                if (soll.getRespuesta() == 'S') {
                                    respuesta = respuesta + "Su solicitud fue aceptada\n";
                                    msjok = "ok";
                                } else if (soll.getRespuesta() == 'A') {
                                    respuesta = respuesta + "Código de asignatura no existente\n";
                                } else if ((soll.getRespuesta() == 'B') && (soll.getTipOp().equals("R"))) {
                                    respuesta = respuesta + "La asignatura a retirar no esta inscrita\n";
                                } else if ((soll.getRespuesta() == 'B') && (soll.getTipOp().equals("M"))) {
                                    respuesta = respuesta + "La asignatura a modificar no esta inscrita\n";
                                } else if (soll.getRespuesta() == 'C') {
                                    respuesta = respuesta + "El grupo a retirar no esta inscrito\n";
                                } else if (soll.getRespuesta() == 'D') {
                                    respuesta = respuesta + "No se encontro el laboratorio\n";
                                } else if (soll.getRespuesta() == 'E') {
                                    respuesta = respuesta + "Sistema ocupado por favor intente mas tarde\n";
                                } else if ((soll.getRespuesta() == 'F') && (soll.getTipOp().equals("A"))) {
                                    respuesta = respuesta + "Esta intentando adicionar una materia que ya tiene inscrita\n";
                                } else if ((soll.getRespuesta() == 'F') && (soll.getTipOp().equals("M"))) {
                                    respuesta = respuesta + "Esta intentando modificar a un grupo en el que ya esta inscrito\n";
                                } else if ((soll.getRespuesta() == 'G') && (soll.getTipOp().equals("A"))) {
                                    respuesta = respuesta + "El grupo a adicionar no existe\n";
                                } else if ((soll.getRespuesta() == 'G') && (soll.getTipOp().equals("M"))) {
                                    respuesta = respuesta + "El grupo a modificar no existe\n";
                                } else if (soll.getRespuesta() == 'H') {
                                    respuesta = respuesta + "No se permite la asignatura\n";
                                } else if (soll.getRespuesta() == 'I') //respuesta= respuesta + "Sobrepasa la carga de créditos\n";
                                //respuesta= respuesta + "Sobrepasa la carga, no ha pagado asignaturas o no tiene el requisito de inglés\n";
                                {
                                    respuesta = respuesta + "Sobrepasa la carga\n";
                                } else if (soll.getRespuesta() == 'J') {
                                    respuesta = respuesta + "El grupo se cruza con alguno ya inscrito\n";
                                } else if (soll.getRespuesta() == 'K') {
                                    respuesta = respuesta + "No hay cupo\n";
                                } else if (soll.getRespuesta() == 'L') {
                                    respuesta = respuesta + "No coincide grupo teorico con laboratorio o auxiliar\n";
                                } else if (soll.getRespuesta() == 'M') {
                                    respuesta = respuesta + "El grupo de laboratorio o auxiliar no existe\n";
                                } else if (soll.getRespuesta() == 'N') {
                                    respuesta = respuesta + "Esta intentando cambiarse al grupo que ya tiene inscrito\n";
                                } else if (soll.getRespuesta() == 'O') {
                                    respuesta = respuesta + "Aun no ha firmado el acta de matricula\n";
                                } else if (soll.getRespuesta() == 'P') {
                                    respuesta = respuesta + "No tiene el correquisito necesario o no puede inscribir esta materia\n";
                                } else if (soll.getRespuesta() == 'Q') {
                                    respuesta = respuesta + "No se puede retirar un correquisito\n";
                                } else if (soll.getRespuesta() == 'Y') {
                                    respuesta = respuesta + "Cruce o falta de cupo en el laboratorio o la auxiliar\n";
                                } else if (soll.getRespuesta() == 'Z') {
                                    respuesta = respuesta + "Asignatura adicionada. Pendiente aprobaciin del decano\n";
                                    msjok = "ok";
                                } else if (soll.getRespuesta() == 'X') {
                                    respuesta = respuesta + "No puede retirar esta asignatura\n";
                                } else if (soll.getRespuesta() == 'W') {
                                    respuesta = respuesta + "Este grupo no corresponde a su periodo de ingreso\n";
                                } else if (soll.getRespuesta() == 'V') {
                                    respuesta = respuesta + "Este grupo no corresponde a su periodo de ingreso\n";
                                } else if (soll.getRespuesta() == '0') {
                                    respuesta = "Problema con el Laboratorio, Retire la asignatura \n y adicionela en el nuevo grupo deseado\n";
                                }
                                if (soll.getTipOp().equals("M")) {
                                    mensaje = mensaje + " Cambio grupo: ";
                                }
                                if (soll.getTipOp().equals("A")) {
                                    mensaje = mensaje + " Adición materia: ";
                                }
                                if (soll.getTipOp().equals("R")) {
                                    mensaje = mensaje + " Retiro materia: ";
                                }

                                //  msjok = "ok";
                                mensaje = mensaje + soll.getCodAsig() + "-" + soll.getNumGrp() + "-" + soll.getNumLab() + "-"
                                        + soll.getNumAux() + "-" + respuesta + "\n";
                            }
                            // }
                        } else if (resultado == 3) {
                            //  if (op2.ejecutarOperacion()) {
                            for (int i = 0; i < m; i++) {
                                respuesta = "";
                                Solicitud soll = op2.getSolicitud(i);

                                respuesta = "";
                                respuesta = respuesta + "La orden de pago para esta asignatura ya se encuentra generada, por lo tanto no puede retirarla.\n";
                                msjok = "ok";
                                mensaje = mensaje + soll.getCodAsig() + "-" + soll.getNumGrp() + "-" + soll.getNumLab() + "-"
                                        + soll.getNumAux() + "-" + respuesta + "\n";
                            }

                        } else {

                            mensaje = " Error en la operacion ";
                        }
                    }
                    results.append(mensaje);
                    results.append("</mensaje>");
                    results.append("<ok>");
                    results.append(msjok);
                    results.append("</ok>");
                    results.append("</asignatura>");
                    response.setContentType("text/xml");
                    response.getWriter().write(results.toString());
                }
            }
            //out.println(results.toString());
        }
    }

    /**
     * Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
