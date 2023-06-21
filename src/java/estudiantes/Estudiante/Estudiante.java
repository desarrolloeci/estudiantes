/*
 * Estudiante.java
 *
 * Created on 12 de marzo de 2003, 03:53 PM
 */
package estudiantes.Estudiante;

import estudiantes.baseDatos.BdActas;
import java.io.*;
import java.util.Vector;
import estudiantes.baseDatos.BdEstudiante;
import estudiantes.baseDatos.BdAsignatura;
import estudiantes.configuracion.configECI;

/**
 *
 * @author administrator
 * @version
 *
 */
public class Estudiante {

    protected String idEst, carnet; /* Nombre del estudiante */

    protected String docest, tipdoc; /* Documento de identificacion */

    protected String ciudad; /* Ciudad de correspondencia */

    protected String lugexp;
    protected String dpto;
    protected String per_ing;
    protected String idplan, max;
    protected String id_prog;
    protected String passosiris;
    protected String Notasactborrar;
    protected String nomciudad, nomciudadexp;
    protected Vector infoPadres = new Vector();
    protected Vector infoEstudiante = new Vector();
    protected Vector infoHorario = new Vector();
    protected Vector infofechas = new Vector();
    protected Vector infoHorarioPos = new Vector();
    protected Vector PromedioPos = new Vector();
    protected Vector HorarioPos = new Vector();
    protected Vector infoAdmisiones = new Vector();
    protected Vector infoPeriodos = new Vector(), MaxPeriodoPos = new Vector(), infoDatosEst = new Vector(), infoInsc;
    protected Vector Notasant, contesto, GraduadosPos, DespasignaturasCan, Despcorreq, Notasact, secu, Numsol, Tutor,Carnet,Horarioex, Plan, Planpos, Despidasig, NomAsig, Otrosprerreq, eventoslinea, Despprerreqdp, OtrosprerreqQui, OtrosprerreqC, OtrosprerreqB, OtrosprerreqQ, OtrosprerreqF, OtrosprerreqE, Despidasigpos, Despasig, Despasigpos, DespasigposVE, Despprerreq, DespOtrosprerreq, DespCorreq, DespBiblia, DespBibliapost, DespRegistro, DespInfAsi, DoblePlan, credi, credicursar,Despasignaturas, infoCancel, infoCreditos, lisplanes, detalleplan, contenido, cursos, deptos, eventos, Verieventos, lineas, VerieventosUGE, VeriCupos, DespidasigposCoh, tarjeton;
    protected String lugresp, ciutrap, lugresm, ciutram, secuencia, estado, iden, semestre;
    protected int maxcred = 24;
    protected String errses; //Manejo intentos fallidos de sesion

    /**
     * Creates new Recurso
     */
    /**
     * Constructor
     */
    public Estudiante() {
        idEst = new String();
        carnet = new String();
        docest = new String();
        tipdoc = new String();
        ciudad = new String();
        lugexp = new String();
        nomciudad = new String();
        nomciudadexp = new String();
        lugresp = new String();
        ciutrap = new String();
        lugresm = new String();
        ciutram = new String();
        secuencia = new String();
        estado = new String();
        passosiris = new String();
        max= new String();

    }

    /**
     * Constructor que inicializa el Estudiante con identificador id_est
     *
     * @param id_est Identificador del Estudiante
     */
    public Estudiante(String idEst, PrintWriter out) {
        //int valor;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.passosiris = cfgEci.getPasswdBdReg();
        Vector vtmp = new Vector();
        Vector infoEstudiante = bdEst.ConsultaEstReint(idEst);
        //Vector infoHorario = bdEst.ConsultaHorario(cfgEci.getPeriodoActual(), idEst) ;
        Vector infoSecuencia = bdEst.SecuenciaReint();
        //Vector infoAdmisiones = bdEst.ConsultaAdmitido(idEst);
        Vector infoPeriodos = bdEst.ConsultaPeriodos(idEst);
        Vector maxPeriodoPos = bdEst.MaxPeriodoPos(idEst);
        Vector audit = bdEst.infoAudit(idEst);
        if (infoSecuencia.size() > 0) {
            secuencia = (String) ((Vector) infoSecuencia.elementAt(0)).elementAt(0);
        }
        this.infoEstudiante = infoEstudiante;
        this.docest = docest;
        this.infoHorario = infoHorario;
        //this.infoAdmisiones = infoAdmisiones;
        this.infoPeriodos = infoPeriodos;
        this.MaxPeriodoPos = maxPeriodoPos;
        this.idEst = idEst;
        this.errses = "-1";
        if (infoEstudiante.size() > 0) {
            this.carnet = (String) ((Vector) infoEstudiante.elementAt(0)).elementAt(0);
            this.docest = (String) ((Vector) infoEstudiante.elementAt(0)).elementAt(3);
            this.tipdoc = (String) ((Vector) infoEstudiante.elementAt(0)).elementAt(2);
            this.ciudad = (String) ((Vector) infoEstudiante.elementAt(0)).elementAt(5);
            this.lugexp = (String) ((Vector) infoEstudiante.elementAt(0)).elementAt(8);
            this.estado = (String) ((Vector) infoEstudiante.elementAt(0)).elementAt(15);
            this.dpto = (String) ((Vector) infoEstudiante.elementAt(0)).elementAt(7);
            this.idplan = (String) ((Vector) infoEstudiante.elementAt(0)).elementAt(25);
            this.per_ing = (String) ((Vector) infoEstudiante.elementAt(0)).elementAt(33);
            this.semestre = (String) ((Vector) infoEstudiante.elementAt(0)).elementAt(20);
            this.id_prog = (String) ((Vector) infoEstudiante.elementAt(0)).elementAt(35);
            this.max = (String) ((Vector) infoEstudiante.elementAt(0)).elementAt(37);

            vtmp.addElement((String) ((Vector) infoEstudiante.elementAt(0)).elementAt(1));
            vtmp.addElement((String) ((Vector) infoEstudiante.elementAt(0)).elementAt(27));
            vtmp.addElement((String) ((Vector) infoEstudiante.elementAt(0)).elementAt(28));
            vtmp.addElement((String) ((Vector) infoEstudiante.elementAt(0)).elementAt(20));
            vtmp.addElement((String) ((Vector) infoEstudiante.elementAt(0)).elementAt(29));
            vtmp.addElement((String) ((Vector) infoEstudiante.elementAt(0)).elementAt(25));
            vtmp.addElement((String) ((Vector) infoEstudiante.elementAt(0)).elementAt(36));
            this.infoDatosEst.addElement(vtmp);
            if (audit.size() > 0) {
                this.errses = ((Vector) audit.elementAt(0)).elementAt(0).toString();
            } else {
                int aud = bdEst.insAudit(idEst);
                this.errses = "0";
            }

        }

        bdEst.desconectar();
        if (bdEst.getMensaje() != null) {
            out.println("<font color='#FFFFFF'>" + bdEst.getMensaje() + "<br></font>");
        }
    }

    public Vector getNotasAnt(String carnet, String peracad) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.Notasant = bdEst.despNotas(carnet, peracad);
        bdEst.desconectar();

        return this.Notasant;
    }

    public Vector ConsultaTutor(String carnet, String periodoact) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.Tutor = bdEst.ConsultaTutor(carnet, periodoact);
        bdEst.desconectar();
        return this.Tutor;
    }
    
    
    public Vector ConsultaCarne(String mail) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.ConsultaCarne(mail);
        bdEst.desconectar();
        return lispreins;
    }
    
    public Vector ProfesorEncuesta( String idg, String per, String ngrp){
         Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.ProfesorEncuesta(idg, per, ngrp);
        bdEst.desconectar();
        return lispreins;
    }
    
     public Vector Promedio(String carnet) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.Promedio(carnet);
        bdEst.desconectar();
        return lispreins;
    }
   
   

    public Vector getNotasAct(String carnet, String peracad) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.Notasact = bdEst.despNotasAct(carnet, peracad);
        bdEst.desconectar();
        return this.Notasact;
    }

    /*public String getNotasActborrar( String carnet, String peracad) {
     BdEstudiante bdEst = new BdEstudiante() ;
     configECI cfgEci = new configECI();
     bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
     this.Notasactborrar = bdEst.despNotasActborrar(carnet, cfgEci.getPeriodoActual()) ;
     bdEst.desconectar() ;
     return this.Notasactborrar;
     }*/
    public Vector getHorarioEx(String carnet, String peracad, PrintWriter out) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.Horarioex = bdEst.HorarioExamen(carnet, peracad);
        bdEst.desconectar();
        return this.Horarioex;
    }

    public Vector getDetallePlan(String carnet, PrintWriter out) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.Plan = bdEst.despDetallePlan(carnet, out);
        bdEst.desconectar();
        return this.Plan;
    }

    public Vector getCreditos(String carnet, String idplan, PrintWriter out) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.credi = bdEst.despCreditos(carnet, idplan, out);
        bdEst.desconectar();
        return this.credi;

    }
    
    public Vector Creditosacursar(String carnet, String idplan) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.credicursar = bdEst.Creditosacursar(carnet, idplan);
        bdEst.desconectar();
        return this.credicursar;

    }
    
    
    

    public Vector getDoblePlan(PrintWriter out, String carnet) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.DoblePlan = bdEst.despDoblePlan(out, carnet);
        bdEst.desconectar();
        return this.DoblePlan;
    }

    public Vector getdespidasig(String carnet, String ident, int par) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.Despidasig = bdEst.despidasig(carnet, ident, par);
        bdEst.desconectar();
        return this.Despidasig;
    }

    public Vector getdespasig(PrintWriter out, String carnet, String ident) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.Despasig = bdEst.despasig(out, carnet, ident);
        bdEst.desconectar();
        return this.Despasig;
    }

    public Vector getdespInfAsi(PrintWriter out, String carnet, String ident) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.DespInfAsi = bdEst.despInfAsi(out, carnet, ident);
        bdEst.desconectar();
        return this.DespInfAsi;
    }

    public Vector getdesppre(PrintWriter out, String carnet, String ident) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.Despprerreq = bdEst.despPrerreq(out, carnet, ident);
        bdEst.desconectar();
        return this.Despprerreq;
    }

    public Vector getdesppreDP(PrintWriter out, String carnet, String ident) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.Despprerreqdp = bdEst.despPrerreqDP(out, carnet, ident);
        bdEst.desconectar();
        return this.Despprerreqdp;
    }

    public Vector getOtrosdesppre(PrintWriter out, String carnet) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.DespOtrosprerreq = bdEst.despOtrosPrerreq(out, carnet);
        bdEst.desconectar();
        return this.DespOtrosprerreq;
    }

    public Vector OtrosPrerreq(PrintWriter out, String carnet) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.Otrosprerreq = bdEst.OtrosPrerreq(out, carnet);
        bdEst.desconectar();
        return this.Otrosprerreq;

    }

    public Vector OtrosPrerreqF(PrintWriter out, String carnet) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.OtrosprerreqF = bdEst.OtrosPrerreqF(out, carnet);
        bdEst.desconectar();
        return this.OtrosprerreqF;

    }

    public Vector OtrosPrerreqE(PrintWriter out, String carnet) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.OtrosprerreqE = bdEst.OtrosPrerreqE(out, carnet);
        bdEst.desconectar();
        return this.OtrosprerreqE;

    }

    public Vector OtrosPrerreqQui(PrintWriter out, String carnet) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.OtrosprerreqQui = bdEst.OtrosPrerreqQui(out, carnet);
        bdEst.desconectar();
        return this.OtrosprerreqQui;

    }

    public Vector OtrosPrerreqQ(PrintWriter out, String carnet) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.OtrosprerreqQ = bdEst.OtrosPrerreqQ(out, carnet);
        bdEst.desconectar();
        return this.OtrosprerreqQ;

    }

    public Vector OtrosPrerreqB(PrintWriter out, String carnet) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.OtrosprerreqB = bdEst.OtrosPrerreqB(out, carnet);
        bdEst.desconectar();
        return this.OtrosprerreqB;

    }

    public Vector OtrosPrerreqC(PrintWriter out, String carnet) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.OtrosprerreqC = bdEst.OtrosPrerreqC(out, carnet);
        bdEst.desconectar();
        return this.OtrosprerreqC;

    }

    public Vector NombreAsig(PrintWriter out, String ident) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.NomAsig = bdEst.NombreAsig(out, ident);
        bdEst.desconectar();
        return this.NomAsig;
    }
    
    public Vector VeriPreinsExcepciones(String id_plan, String id_asig) {

        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        Vector ans= bdEst.VeriPreinsExcepciones(id_plan, id_asig);
        bdEst.desconectar();
        return ans;
    }
    
    public Vector getPlanEstud(String id_est) {

        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        Vector ans= bdEst.getPlanEstud(id_est);
        bdEst.desconectar();
        return ans;
    }
    
    public Vector VeriTransicion(String id_est) {

        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        Vector ans= bdEst.VeriTransicion(id_est);
        bdEst.desconectar();
        return ans;
    }
    
    public Vector EstIngresoDespuesTransicion(String id_est) {

        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        Vector ans= bdEst.EstIngresoDespuesTransicion(id_est);
        bdEst.desconectar();
        return ans;
    }
    
    public Vector getNotaAsig(String id_est, String id_asig) {

        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        Vector ans= bdEst.getNotaAsig(id_est, id_asig);
        bdEst.desconectar();
        return ans;
    }
    
    public Vector VeriPreinsProgramada(String id_plan, String id_asig) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.credicursar = bdEst.VeriPreinsProgramada(id_plan, id_asig);
        bdEst.desconectar();
        return this.credicursar;

    }
    
    public Vector VeriPreinsNoProgramada(String id_plan, String id_asig) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.credicursar = bdEst.VeriPreinsNoProgramada(id_plan, id_asig);
        bdEst.desconectar();
        return this.credicursar;

    }
    
    public Vector EquivAsigMonitores(PrintWriter out, String idasig, String peracad, String tip_equiv) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.NomAsig = bdEst.EquivAsigMonitores(out, idasig, peracad, tip_equiv);
        bdEst.desconectar();
        return this.NomAsig;
    }

    public Vector getdespcorreq(PrintWriter out, String carnet, String ident, String idplan) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.DespCorreq = bdEst.despCorreq(out, carnet, ident, idplan);
        bdEst.desconectar();
        return this.DespCorreq;
    }

    public Vector getBiblia(PrintWriter out, String carnet, String ident) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.DespBiblia = bdEst.despBiblia(out, carnet, ident);
        bdEst.desconectar();
        return this.DespBiblia;
    }

    public Vector getRegistro(PrintWriter out, String carnet, String ident) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.DespRegistro = bdEst.despRegistro(out, carnet, ident);
        bdEst.desconectar();
        return this.DespRegistro;
    }

    public Vector getInfoHorario() {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.infoHorario = bdEst.ConsultaHorario(cfgEci.getPeriodoHor(), this.idEst);
        bdEst.desconectar();
        return this.infoHorario;
    }
    
    public Vector getInfoHorarioPer(String periodo) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.infoHorario = bdEst.ConsultaHorario(periodo, this.idEst);
        bdEst.desconectar();
        return this.infoHorario;
    }

    public Vector getFechas() {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.infofechas = bdEst.Fechas();
        bdEst.desconectar();
        return this.infofechas;
    }

    public Vector getInfoHorarioPos(String per) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.infoHorarioPos = bdEst.ConsultaHorarioPos(per, this.idEst);
        bdEst.desconectar();
        return this.infoHorarioPos;
    }

    public Vector PromedioPos(String carnet) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.PromedioPos = bdEst.PromedioPos(this.idEst);
        bdEst.desconectar();
        return this.PromedioPos;
    }

    public Vector getHorarioPosgrado(String per) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.HorarioPos = bdEst.HorarioPosgrado(per, this.idEst);
        bdEst.desconectar();
        return this.HorarioPos;
    }

    public Vector getCalendarioPosgrado(String per, String codasig) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.HorarioPos = bdEst.CalendarioPosgrado(per, codasig);
        bdEst.desconectar();
        return this.HorarioPos;
    }

    public void setInfoHorario(Vector infoHorario) {
        this.infoHorario = infoHorario;
    }

    public Vector getPreinscripcion(String carnet) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.getPreinscripcion(carnet);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector getModificaPreins(String carnet) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.getModificaPreins(carnet);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector Icetex(String carnet, String periodo) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.Icetex(carnet, periodo);
        bdEst.desconectar();
        return lispreins;
    }
    
    
    public Vector CancelaVeces(String carnet, String id_asig){
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.CancelaVeces(carnet, id_asig);
        bdEst.desconectar();
        return lispreins;
    }
    
    public Vector MatriculasVeces(String carnet) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.MatriculasVeces(carnet);
        bdEst.desconectar();
        return lispreins;
   
    }
    
    public Vector MatriculasSinPI(String carnet) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.MatriculasSinPI(carnet);
        bdEst.desconectar();
        return lispreins;
   
    }
    
    public Vector CuantasCancela(String carnet, String peracad) {
         Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.CuantasCancela(carnet, peracad);
        bdEst.desconectar();
        return lispreins;
        
    }

    public Vector Valor_Matricula(String carnet, String periodo) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.Valor_Matricula(carnet, periodo);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector Renovar_Icetex(String carnet, String periodo) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.Renovar_Icetex(carnet, periodo);
        bdEst.desconectar();
        return lispreins;
    }

    public int Actualizar_Icetex(String carnet, String periodo, String tipo) {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.Actualizar_Icetex(carnet, periodo, tipo);
        bdEst.desconectar();
        return ret;
    }

    public Vector getAdicionaPreinsc(String carnet) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.getAdicionaPreinsc(carnet);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector BuscarAsig(String per, String carnet, String entrada) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.BuscarAsig(per, carnet, entrada);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector Buscarprim(String per, String carnet, String entrada) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.Buscarprim(per, carnet, entrada);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector BuscarPlan(String carnet, String idAsig) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.BuscarPlan(carnet, idAsig);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector BuscarLab(String idAsig) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.BuscarLab(idAsig);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector Idprog(String carnet) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.Idprog(carnet);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector Noplanestud(String idAsig, String idprog) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.Noplanestud(idAsig, idprog);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector VerBiblia(String carnet, String id1, String id2, String id3, String id4, String id5) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.VerBiblia(carnet, id1, id2, id3, id4, id5);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector Requisitos(String carnet, String idAsig) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.Requisitos(carnet, idAsig);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector VeriPreins(String carnet, String idAsig) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.VeriPreins(carnet, idAsig);
        bdEst.desconectar();
        return lispreins;
    }

    public int BorrarVeriPreins(String carnet, String idAsig) {
        int resp = -1;
        Vector lispreins = new Vector(), tmp = new Vector();
        String val = new String("");
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        resp = bdEst.BorrarVeriPreins(idAsig, carnet);
        bdEst.desconectar();
        return resp;
    }
    
    public String ConsultarIdAsig(String cod_asig) {
        String ans = "";
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ans = bdEst.ConsultarIdAsig(cod_asig);
        bdEst.desconectar();
        return ans;
    }

    public Vector ReqEspeciales(String carnet, String idReq, String idReq2) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.ReqEspeciales(carnet, idReq, idReq2);
        bdEst.desconectar();
        return lispreins;
    }

    public int BibliaDef(String carnet) {
        Vector lispreins = new Vector(), tmp = new Vector();
        String val = new String("");
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.BibliaDef(carnet);
        bdEst.desconectar();
        tmp = (Vector) lispreins.elementAt(0);
        val = (String) tmp.elementAt(0);
        return Integer.parseInt(val);
    }

    public int ReqIngles(String carnet, String iding) {
        Vector lispreins = new Vector(), tmp = new Vector();
        String val = new String("");
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.ReqIngles(carnet, iding);
        bdEst.desconectar();
        tmp = (Vector) lispreins.elementAt(0);
        val = (String) tmp.elementAt(0);
        return Integer.parseInt(val);
    }

    public Vector getCreditos(String carnet) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.getCreditos(carnet);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector getCreditosDef(String carnet) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.getCreditosDef(carnet);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector getPeriodoAc(String carnet) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.getPeriodoAc(carnet);
        bdEst.desconectar();
        return lispreins;
    }

//========================Monitorias====================================================
    
     public Vector getMonitorias(String carnet) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.getMonitorias(carnet);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector getAsigmonitorias(String per) {
        Vector lisasig = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lisasig = bdEst.getAsigmonitorias(per);
        bdEst.desconectar();
        return lisasig;
    }
    
    public Vector getAsigA(String carnet, String idasig, String val) {
        Vector lisasig = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lisasig = bdEst.getAsigA(carnet, idasig, val);
        bdEst.desconectar();
        return lisasig;
    }

     public Vector getAmonest(String carnet) {
        Vector lisasig = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lisasig = bdEst.getAmonest(carnet);
        bdEst.desconectar();
        return lisasig;
    }

 public Vector getUltPer(String carnet) {
        Vector lisasig = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lisasig = bdEst.getUltPer(carnet);
        bdEst.desconectar();
        return lisasig;
    }

//========================================================================================

    public Vector getNroasigmon(String carnet, String per) {
        Vector lisasig = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lisasig = bdEst.getNroasigmon(carnet, per);
        bdEst.desconectar();
        return lisasig;
    }

    public Vector getPerBiblia(String carnet) {
        Vector lisasig = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lisasig = bdEst.getPbiblia(carnet);
        bdEst.desconectar();
        return lisasig;
    }

    public Vector getPerdidas(String carnet, String per) {
        Vector lisasig = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lisasig = bdEst.getNperdidas(carnet, per);
        bdEst.desconectar();
        return lisasig;
    }
    
    
    public Vector PlanVigente(String prog) {
        Vector lisasig = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lisasig = bdEst.PlanVigente(prog);
        bdEst.desconectar();
        return lisasig;
    }
    
    public Vector NroPlan(String idplan) {
        Vector lisasig = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lisasig = bdEst.NroPlan(idplan);
        bdEst.desconectar();
        return lisasig;
    }
    
    public Vector Nivel(String prog, String idasig) {
        Vector lisasig = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lisasig = bdEst.Nivel(prog, idasig);
        bdEst.desconectar();
        return lisasig;
    }

    public Vector getAsigInsc(String carnet, String per) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.getAsigmonsol(carnet, per);
        bdEst.desconectar();
        return lispreins;
    }

//FIN MONITORIAS
    public Vector Datos(String carnet) {
        Vector lispreins = new Vector();

        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.Datos(carnet);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector icfes(String carnet) {
        Vector lispreins = new Vector();

        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.icfes(carnet);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector getPreintermedio(String carnet) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.getPreintermedio(carnet);
        bdEst.desconectar();
        return lispreins;
    }

    public int borrarAsigPreintermedio(String carnet, String idAsig) {
        int resp = -1;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        resp = bdEst.borrarAsigPreintermedio(carnet, idAsig);
        bdEst.desconectar();
        return resp;
    }

    public int inscAsigPreintermedio(String carnet, String idAsig) {
        Vector lispreins = new Vector();
        String sec = new String("");
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        sec = bdEst.sigSecuencia("PREIN_INT");
        ret = bdEst.inscAsigPreintermedio(carnet, idAsig, sec);
        bdEst.desconectar();
        return ret;
    }

    public int setMatricula(String carnet, String peracad, String idord) {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.insMatricula(carnet, peracad, idord);
        bdEst.desconectar();
        return ret;
    }

    public int CreditosExtras(String carnet, String per, String cred, String justif) {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.CreditosExtras(carnet, per, cred, justif);
        bdEst.desconectar();
        return ret;
    }

    public int autoevaluacion(String id, String restas, String programa, String ident, String justif1, String justif2, String justif3, String justif4, String justif5, String justif6, String justif7, String justif8, String justif9, String justif10) {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdApolo(), cfgEci.getPasswdBdApolo());
        ret = bdEst.autoevaluacion(id, restas, programa, ident, justif1, justif2, justif3, justif4, justif5, justif6, justif7, justif8, justif9, justif10);
        bdEst.desconectar();
        return ret;
    }

    public int Actualpreins(String idAsig, String carnet) {
        int ret = 0;

        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.Actualpreins(idAsig, carnet);
        bdEst.desconectar();
        return ret;
    }

    public int ActualFecha(String carnet) {
        int ret = 0;

        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.ActualFecha(carnet);
        bdEst.desconectar();
        return ret;
    }

    public int ProcedimientoAlumno(String carnet, String idAsig, String val) {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        //bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.ProcedimientoAlumno(carnet, idAsig, val);
        bdEst.desconectar();
        return ret;
    }

    public int ReservaGimnasio(int resec, String idsal, String tipo, String estado, String per, String idest, String descr) {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.ReservaGimnasio(resec, idsal, tipo, estado, per, idest, descr);
        bdEst.desconectar();
        return ret;

    }

    public Vector ControlaGimnasio(String per) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.ControlaGimnasio(per);
        bdEst.desconectar();
        return lispreins;

    }
    
    public Boolean bloqueadoGimnasio(String idEst, String per_acad){
        BdEstudiante bdEst=new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        Boolean ans=bdEst.bloqueadoGimnasio(idEst, per_acad);
        bdEst.desconectar();
        return ans;
    }
    
    public Boolean desbloqueadoServicioGimnasio(String per_acad){
        BdEstudiante bdEst=new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        Boolean ans=bdEst.desbloqueadoServicioGimnasio(per_acad);
        bdEst.desconectar();
        return ans;
    }

    public Vector ControlaInscritoGimnasio(String per, String carnet) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.ControlaInscritoGimnasio(per, carnet);
        bdEst.desconectar();
        return lispreins;

    }
    
    
     public Vector ConsultaPrograma(String idEst) {
         Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.ConsultaPrograma(idEst);
        bdEst.desconectar();
        return lispreins;

    }

    public int Borrarpreins(String idAsig, String carnet) {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.Borrarpreins(idAsig, carnet);
        bdEst.desconectar();
        return ret;
    }

    public Vector SecuenciaPreinscrip() {
        Vector ret = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.SecuenciaPreinscrip();
        bdEst.desconectar();
        return ret;
    }

    public int Insertapreins(String idasig, String carnet) {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.Insertapreins(idasig, carnet);
        bdEst.desconectar();
        return ret;
    }

    public int Insertaestadis(String año, String mes, String carnet) {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.Insertaestadis(año, mes, carnet);
        bdEst.desconectar();
        return ret;
    }

    public int InsertaPreinsprim(String carnet, String sec, String idasig, String per) {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.InsertaPreinsprim(carnet, sec, idasig, per);
        bdEst.desconectar();
        return ret;
    }

    public int ActSecuencia() {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.ActSecuencia();
        bdEst.desconectar();
        return ret;
    }

    public int ActSecuenciaReservas() {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.ActSecuenciaReservas();
        bdEst.desconectar();
        return ret;
    }

    public Vector prcPreinsc(Vector vasigs, Vector vpris) {
        Vector lisresp = new Vector();
        Vector resAs = new Vector(), asig = new Vector();
        int i, na = vasigs.size(), totcred, cras = 0;
        BdAsignatura bdAsig = new BdAsignatura();
        BdEstudiante bdEst = new BdEstudiante();
        String adic;

        configECI cfgEci = new configECI();
        // Obtenemos la información de las asignaturas solicitadas
        bdAsig.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        for (i = 0; i < na; i++) {
            resAs = bdAsig.ConsultaAsig((String) vasigs.elementAt(i));
            if (resAs.size() > 0) {
                asig = (Vector) resAs.elementAt(0);
                asig.addElement((String) vpris.elementAt(i));
            } else {
                asig = new Vector();
                asig.addElement("-1");
                asig.addElement((String) vasigs.elementAt(i));
                asig.addElement("0");
                asig.addElement((String) vpris.elementAt(i));
            }
            lisresp.addElement(asig);
        }
        bdAsig.desconectar();

        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        bdEst.borrarPreinscripcion(this.idEst);
        totcred = 0;
        for (i = 0; i < na; i++) {
            asig = (Vector) lisresp.elementAt(i);
            if (!((String) asig.elementAt(0)).equals("-1")) {
                cras = (Integer.valueOf((String) asig.elementAt(2))).intValue();
                adic = (String) asig.elementAt(3);
                if (totcred + cras <= maxcred && !adic.equals("A")) {
                    bdEst.insPreinscripcion(this.idEst, asig);
                    totcred = totcred + cras;
                } else if (adic.equals("A")) {
                    bdEst.insPreinscripcion(this.idEst, asig);

                } else {
                    asig.setElementAt("-2", 0);
                    lisresp.setElementAt(asig, i);
                }
            }
        }
        bdEst.desconectar();
        return lisresp;
    }
    //monitorias

    public Vector prcMonitorias(String as1, String as2, String as3, String nro, String per) {
        Vector lisresp = new Vector();
        String asig;
        String arreglo[] = new String[150];
        int i;
        //  BdAsignatura bdAsig = new BdAsignatura() ;
        BdEstudiante bdEst = new BdEstudiante();

        configECI cfgEci = new configECI();
        // Obtenemos la información de las asignaturas solicitadas
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        arreglo[0] = as1;
        arreglo[1] = as2;
        arreglo[2] = as3;
        for (i = 0; i < 3; i++) {
            asig = arreglo[i];
            if (!asig.equals("0")) {
                bdEst.insMonitorias(this.idEst, asig, nro, per);
            }
            // lisresp.setElementAt(as1, i) ;
        }
        bdEst.desconectar();
        return lisresp;
    }

    public Vector prcEliMonitorias(String val) {
        Vector lisresp = new Vector();
        //  BdAsignatura bdAsig = new BdAsignatura() ;
        BdEstudiante bdEst = new BdEstudiante();

        configECI cfgEci = new configECI();

        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        bdEst.elimMonitorias(this.idEst, val);
        bdEst.desconectar();
        return lisresp;
    }

    //Fin monitorias
    public Vector getasignaturas(PrintWriter out, String carnet) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.Despasignaturas = bdEst.despAsignaturas(out, carnet, cfgEci.getPeriodoActual());
        bdEst.desconectar();
        return this.Despasignaturas;
    }

    public Vector getasignaturasCan(PrintWriter out, String carnet) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.DespasignaturasCan = bdEst.despAsignaturasCan(out, carnet, cfgEci.getPeriodoActual());
        bdEst.desconectar();
        return this.DespasignaturasCan;
    }
    
     public Vector CuentaAsignaturasCan(String carnet, String peracad) {
       BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.DespasignaturasCan = bdEst.CuentaAsignaturasCan(carnet, cfgEci.getPeriodoActual());
        bdEst.desconectar();
        return this.DespasignaturasCan;
    }
    

    public Vector getCorreqcancela(String idcor, String id_plan) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.Despcorreq = bdEst.Correqcancela(idcor, id_plan);
        bdEst.desconectar();
        return this.Despcorreq;
    }

    public Vector getInfoCancel(PrintWriter out, String carnet) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.infoCancel = bdEst.consultCancel(out, carnet);
        bdEst.desconectar();
        return this.infoCancel;
    }

    public Vector ConsultacredistosE(String per, String carnet) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.infoCreditos = bdEst.ConsultacreditosE(per, carnet);
        bdEst.desconectar();
        return this.infoCreditos;

    }

    public Vector getExamIngles() {
        int cant;
        Vector datos = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        datos = bdEst.getExaIngles(idEst);
        bdEst.desconectar();
        return datos;
    }

    public Vector getDatosEst(String carnet) {
        /*BdEstudiante bdEst = new BdEstudiante() ;
         configECI cfgEci = new configECI();
         bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
         this.infoDatosEst = bdEst.datosEst(carnet) ;
         bdEst.desconectar() ;    */

        return this.infoDatosEst;
    }

    public Vector getOrdenes(String carnet, String periodo) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        Vector infoorden = bdEst.getOrdenes(carnet, periodo);
        bdEst.desconectar();
        return infoorden;

    }

    public Vector getReintegro(String carnet, String periodo) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        Vector reintegro = bdEst.getReintegro(carnet, periodo);
        bdEst.desconectar();
        return reintegro;
    }

    public Vector getSeguimiento(String carnet, String periodo) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        Vector seg = bdEst.getSeguimiento(carnet, periodo);
        bdEst.desconectar();
        return seg;
    }

    public Vector restafechas(String fec) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        Vector fechas = bdEst.restafechas(fec);
        bdEst.desconectar();
        return fechas;
    }

    public Vector horaBD() {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        Vector hora = bdEst.horaBD();
        bdEst.desconectar();
        return hora;
    }

    public Vector FechaBD() {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        Vector fecha = bdEst.FechaBD();
        bdEst.desconectar();
        return fecha;
    }

    public Vector getEdad(String carnet) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        Vector infoorden = bdEst.getEdad(carnet);
        bdEst.desconectar();
        return infoorden;
    }

    public Vector getListaPlanes(PrintWriter out, String idprog) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.lisplanes = bdEst.LisPlan(out, idprog);
        // out.println(lisplanes);
        bdEst.desconectar();

        return this.lisplanes;
    }

    public Vector getDetallePlanes(PrintWriter out, String idplan) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.detalleplan = bdEst.despDetallePlan(out, idplan);
        // out.println(lisplanes);
        bdEst.desconectar();

        return this.detalleplan;
    }
    
    

    public Vector getContenido(PrintWriter out, String idasig) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.contenido = bdEst.despContenido(out, idasig);
        // out.println(contenido);
        bdEst.desconectar();
        return this.contenido;
    }

    public Vector getInfoInsc(String carnet) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.infoInsc = bdEst.infoInscrip(carnet);
        bdEst.desconectar();
        return this.infoInsc;
    }

    public int Encuestado(String carnet, String id) {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.Encuestado(carnet, id);
        bdEst.desconectar();
        return ret;
    }

    public int Encuestado2(String carnet, String id) {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.Encuestado2(carnet, id);
        bdEst.desconectar();
        return ret;
    }

    public Vector Contesto(String docest, String idenc) {
        Vector rec = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdApolo(), cfgEci.getPasswdBdApolo());
        rec = bdEst.Contesto(docest, idenc);
        bdEst.desconectar();
        return rec;
    }

//NUEVO DISEÑO
    public Vector DatosEncuestas(String carnet) {
        Vector rec = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        rec = bdEst.DatosEncuestas(carnet);
        bdEst.desconectar();
        return rec;
    }

    public Vector ContestoFactor(String carnet, String idenc) {

        Vector rec = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        rec = bdEst.ContestoFactor(carnet, idenc);
        bdEst.desconectar();
        return rec;

    }

    public Vector MáximoFactor(String carnet, String idenc) {
        Vector rec = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        rec = bdEst.MáximoFactor(carnet, idenc);
        bdEst.desconectar();
        return rec;

    }

    public Vector PreguntasEnc(String idenc) {
        Vector rec = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        rec = bdEst.PreguntasEnc(idenc);
        bdEst.desconectar();
        return rec;
    }

    public Vector PreguntasEncFactor(String idenc, int idfactor) {
        Vector rec = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        rec = bdEst.PreguntasEncFactor(idenc, idfactor);
        bdEst.desconectar();
        return rec;
    }

    public Vector FactoresEnc(String idenc) {
        Vector rec = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        rec = bdEst.FactoresEnc(idenc);
        bdEst.desconectar();
        return rec;
    }

    public Vector Factores(int idfactor) {
        Vector rec = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        rec = bdEst.Factores(idfactor);
        bdEst.desconectar();
        return rec;


    }

    public Vector Validar(java.lang.String id, java.lang.String idpreg, java.lang.String ident) {
        Vector rec = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        rec = bdEst.Validar(id, idpreg, ident);
        bdEst.desconectar();
        return rec;


    }
    
    public int AutoevaluacionNvo(java.lang.String ident, java.lang.String id, java.lang.String idfactor, java.lang.String idpreg, java.lang.String restas, java.lang.String comentario) {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.AutoevaluacionNvo(ident, id, idfactor, idpreg, restas, comentario);
        bdEst.desconectar();
        return ret;

    }
    
     public int AutoevaluacionNvoPosgrados(java.lang.String ident, java.lang.String id, java.lang.String idfactor, java.lang.String idpreg, java.lang.String restas, String grupo, String per) {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.AutoevaluacionNvoPosgrados(ident, id, idfactor, idpreg, restas, grupo, per);
        bdEst.desconectar();
        return ret;

    }
     
         
     public int PosgradosComentarios( java.lang.String ident, java.lang.String id, java.lang.String idfactor, java.lang.String idpreg, java.lang.String restas, java.lang.String comentario, String aspecto, String grupo, String per) {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.PosgradosComentarios(ident, id, idfactor, idpreg, restas, comentario, aspecto,grupo, per);
        bdEst.desconectar();
        return ret;

    }

    //
    public Vector ContestoEncuestaFac(String idest, String factor) {
        Vector rec = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        rec = bdEst.ContestoEncuestaFac(idest, factor);
        bdEst.desconectar();
        return rec;

    }

    public String getIdEst() {
        return this.carnet;
    }

    public String getCarnet() {
        return this.carnet;
    }

    public String getDocest() {
        return this.docest;
    }

    public String getTipdoc() {
        return this.tipdoc;
    }

    public String getDpto() {
        return this.dpto;
    }

    public Vector getInfoEstudiante() {
        return this.infoEstudiante;
    }

    public String getCiudad() {
        return this.ciudad;
    }

    public String getLugexp() {
        return this.lugexp;
    }

    public String getNomciudad() {
        return this.nomciudad;
    }

    public String getNomciudadexp() {
        return this.nomciudadexp;
    }

    public String getLugresp() {
        return this.lugresp;
    }

    public String getCiutrap() {
        return this.lugresp;
    }

    public String getLugresm() {
        return this.lugresm;
    }

    public String getCiutram() {
        return this.lugresm;
    }

    public Vector getInfoPadres() {
        return this.infoPadres;
    }

    public Vector getInfoAdmisiones() {
        return this.infoAdmisiones;
    }

    public Vector getInfoPeriodos() {
        return this.infoPeriodos;
    }

    public Vector getMaxPeriodoPos() {
        return this.MaxPeriodoPos;
    }

    public String getSecuencia() {
        return this.secuencia;
    }

    public String getEstado() {
        return this.estado;
    }
    
    public String getMax() {
        return this.max;
    }

    public String getSemestre() {
        return this.semestre;
    }

    public String getPerIng() {
        return this.per_ing;
    }

    public String getidplan() {
        return this.idplan;
    }

    public String getPassOsiris() {
        return this.passosiris;
    }

    /*
     *Grupos set
     */
    public void setCarnet(String carnet) {
        this.carnet = carnet;
    }

    public void setIdEst(String idEst) {
        this.idEst = idEst;
    }

    public void setDocest(String docest) {
        this.docest = docest;

    }

    public void setTipdoc(String tipdoc) {
        this.docest = tipdoc;

    }

    public void setInfoEstudiante(Vector infoEstudiante) {
        this.infoEstudiante = infoEstudiante;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public void setLugexp(String lugexp) {
        this.lugexp = lugexp;
    }

    public void setNomciudad(String nomciudad) {
        this.nomciudad = nomciudad;
    }

    public void setNomciudadexp(String nomciudadexp) {
        this.nomciudadexp = nomciudadexp;
    }

    public void setLugresp(String lugresp) {
        this.lugresp = lugresp;
    }

    public void setCiutrap(String ciutrap) {
        this.ciutrap = ciutrap;
    }

    public void setLugresm(String lugresm) {
        this.lugresm = lugresm;
    }

    public void setCiutram(String ciutram) {
        this.ciutram = ciutram;
    }

    public void setInfoPadres(Vector infoPadres) {
        this.infoPadres = infoPadres;
    }

    public void setInfoAdmidsiones(Vector infoAdmisiones) {
        this.infoAdmisiones = infoAdmisiones;
    }

    public void setInfoPeriodos(Vector infoPeriodos) {
        this.infoPeriodos = infoPeriodos;
    }

    public void setSecuencia(String secuencia) {
        this.secuencia = secuencia;
    }

    public long CanceleAsig(String carnet, String codAsig, String razon) {
        long resp;

        BdActas bdEst = new BdActas();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        resp = bdEst.inserteCanc(carnet, codAsig, razon);
        bdEst.desconectar();
        return resp;
    }

    public String CanceleAsige(String carnet, String codAsig, String razon) {
        String resp;

        BdActas bdEst = new BdActas();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        resp = bdEst.inserteCance(carnet, codAsig, razon);
        bdEst.desconectar();
        return resp;
    }

    public String Secuencia() {
        String resp;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        resp = bdEst.getSecuencia();
        bdEst.desconectar();
        return resp;
    }

    public Vector getSecuenciaColiseo() {
        String resp;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.secu = bdEst.getSecuenciaColiseo();
        bdEst.desconectar();
        return secu;
    }

    public Vector InscritoEventos(String peracad, String carnet) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.cursos = bdEst.EventosInscritos(peracad, carnet);
        bdEst.desconectar();
        return this.cursos;
    }

    public Vector departamentos(String peracad) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.deptos = bdEst.departamentos(peracad);
        bdEst.desconectar();
        return this.deptos;
    }

    public Vector Lineas(String id_dpto) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.lineas = bdEst.Lineas(id_dpto);
        bdEst.desconectar();
        return this.lineas;
    }

    public Vector Eventosdpto(String peracad, String dpto) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.eventos = bdEst.Eventosdpto(peracad, dpto);
        bdEst.desconectar();
        return this.eventos;
    }

    public Vector EventosdptoLinea(String peracad, String dpto, String linea) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.eventoslinea = bdEst.EventosdptoLinea(peracad, dpto, linea);
        bdEst.desconectar();
        return this.eventoslinea;
    }

    public Vector VerificaEventos(String id, String doc) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.Verieventos = bdEst.VerificaEventos(id, idEst);
        bdEst.desconectar();
        return this.Verieventos;
    }

    public Vector VerificaEventosUGE(String doc,  String id_curso) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.VerieventosUGE = bdEst.VerificaEventosUGE(idEst,  id_curso);
        bdEst.desconectar();
        return this.VerieventosUGE;
    }

    public Vector CuposEventos(String ident) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.VeriCupos = bdEst.CuposEventos(ident);
        bdEst.desconectar();
        return this.VeriCupos;
    }

    public int InscribeEvento(java.lang.String idevento, java.lang.String doc, java.lang.String nombres, java.lang.String vinculo, java.lang.String identifica) {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.InscribeEvento(idevento, carnet, nombres, vinculo, identifica);
        bdEst.desconectar();
        return ret;
    }

    public int PracticaUge(java.lang.String idevento, java.lang.String documento, java.lang.String nombres, java.lang.String vinculo, java.lang.String programa, java.lang.String semestre, java.lang.String carnet) {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.PraticaUge(idevento, documento, nombres, vinculo, programa, semestre, carnet);
        bdEst.desconectar();
        return ret;
    }

    public int EliminaCurso(java.lang.String idevento, java.lang.String doc) {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.EliminaCurso(idevento, doc);
        bdEst.desconectar();
        return ret;
    }

    public String getErrSes() {
        return this.errses;
    }

    public void setErrSes(String idEst, int errses) {
        int ret;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.setAudit(idEst, errses);
        bdEst.desconectar();
    }

    public void setIpSes(String idEst, String ip) {
        int ret;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.setAuditIP(idEst, ip);
        bdEst.desconectar();
    }

    public Vector getDetallePlanPos(String carnet, PrintWriter out) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.Planpos = bdEst.despDetallePlanPos(carnet, out);
        bdEst.desconectar();
        return this.Planpos;
    }

    public Vector getMaximoSemPos(String carnet, PrintWriter out) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.Plan = bdEst.despMaximoSemPos(carnet, out);
        bdEst.desconectar();
        return this.Plan;
    }

    public Vector getCreditosPos(String carnet, String idplan, PrintWriter out, int nota) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.credi = bdEst.despCreditosPos(carnet, idplan, out, nota);
        bdEst.desconectar();
        return this.credi;

    }

    public Vector getdespidasigpos(PrintWriter out, String carnet, String ident, int par, int nota) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.Despidasigpos = bdEst.despidasigpos(out, carnet, ident, par, nota);
        bdEst.desconectar();
        return this.Despidasigpos;
    }

    public Vector getdespidasigposCoh(PrintWriter out, String carnet) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.DespidasigposCoh = bdEst.despidasigposCoh(out, carnet);
        bdEst.desconectar();
        return this.DespidasigposCoh;
    }

    public Vector getdespasigpos(PrintWriter out, String carnet, String ident) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.Despasigpos = bdEst.despasigpos(out, carnet, ident);
        bdEst.desconectar();
        return this.Despasigpos;
    }

    public Vector getdespasigposVE(PrintWriter out, String carnet, String ident) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.DespasigposVE = bdEst.despasigposVE(out, carnet, ident);
        bdEst.desconectar();

        return this.DespasigposVE;

    }

    public Vector getBibliapost(PrintWriter out, String carnet, String ident) {
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        this.DespBibliapost = bdEst.despBibliapost(out, carnet, ident);
        bdEst.desconectar();
        return this.DespBibliapost;
    }

    public Vector getParProg(String iddpto) {
        Vector parprg;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        parprg = bdEst.despParProg(iddpto);
        bdEst.desconectar();
        return (Vector) parprg.elementAt(0);
    }

    public Vector getExIngEgre(String idest) {
        Vector parprg;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        parprg = bdEst.despExIngEgre(idest);
        bdEst.desconectar();
        return parprg;
    }

    public Vector getParGraduado(String carnet) {
        Vector paregr;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        paregr = bdEst.despParGraduado(carnet);
        bdEst.desconectar();
        return paregr;
    }

    public Vector ConsultaPadres(String carnet) {
        Vector paregr;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        paregr = bdEst.ConsultaPadres(carnet);
        bdEst.desconectar();
        return paregr;
    }

    public Vector getProfesiones() {
        Vector profs;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        profs = bdEst.getProfesiones();
        bdEst.desconectar();
        return profs;
    }

    public int getConsGrad() {
        Vector ret;
        int paregr = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.despConsGrad();
        if (ret.size() > 0) {
            ret = (Vector) ret.elementAt(0);
            paregr = Integer.parseInt(ret.elementAt(0).toString());
        }
        bdEst.desconectar();
        return paregr;
    }

    public void setParGrad(String idEst, String numInv, String asis) {
        int ret;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.setParGrad(idEst, numInv, asis);
        bdEst.desconectar();
    }

    public void inscripicfes(String idEst, String carnet, String celular) {
        int ret;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.inscripicfes(idEst, carnet, celular);
        bdEst.desconectar();
    }

    public void setUpParGrad(String idEst, String asis) {
        int ret;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.setUpParGrad(idEst, asis);
        bdEst.desconectar();
    }

    //**** 29 oct 2007 Trámite de grado
    public Vector getParTramGrad(String limpar) {
        Vector ret;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.despParTramGrad(limpar);
        bdEst.desconectar();
        return ret;
    }

    public int setSolPreGrad(String nombres, String ape1, String ape2, String celular,
            String email_otro, String doc_est, String tip_doc, String nro_libr,
            String nro_distr, String fec_exp, String ultdir, String ulttel, String lug_exp,
            String ciu_corr, String IdEst) {
        int ret;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.setSolPreGrad(nombres, ape1, ape2, celular, email_otro, doc_est, tip_doc, nro_libr,
                nro_distr, fec_exp, ultdir, ulttel, lug_exp, ciu_corr, IdEst);
        bdEst.desconectar();
        return ret;
    }

    public Vector getSolPreGrad(String idEst) {
        Vector ret, resp = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.getSolPreGrad(idEst);
        bdEst.desconectar();
        ret = (Vector) ret.elementAt(0);
        for (int i = 0; i < ret.size(); i++) {
            if (ret.elementAt(i).equals("No disponible")) {
                resp.addElement("");
            } else {
                resp.addElement(ret.elementAt(i));
            }
        }
        return resp;
    }

    //************** Solicitud de Readmisión *************************
    public Vector getSolRead(String idEst) {
        Vector ret, resp = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.getSolRead(idEst);
        bdEst.desconectar();
        if (ret.size() > 0) {
            ret = (Vector) ret.elementAt(0);
        }
        return ret;
    }

    public Vector getValidaSolRead(String idEst, String perant) {
        Vector ret, resp = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.getValidaSolRead(idEst, perant);
        bdEst.desconectar();
        if (ret.size() > 0) {
            ret = (Vector) ret.elementAt(0);
        }
        return ret;
    }

    public void setSolRead(String idEst) {
        int ret;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.setSolRead(idEst);
        bdEst.desconectar();
    }

    //************* Horarios AJAX *******************************
    public Vector getHorarioAsigEst(String codAsig, String numgr) {
        Vector ret, resp = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.getHorarioAsigEst(codAsig, numgr);
        bdEst.desconectar();
        return ret;
    }

    //************ Formato Periodo intermedio ********************
    public Vector getInfoPerInter(String idEst) {
        Vector ret, resp = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.getInfoPerInter(idEst);
        bdEst.desconectar();
        return ret;
    }

    public Vector getVerifPerInter(String idEst) {
        Vector ret = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.getVerifPerInter(idEst);
        bdEst.desconectar();
        return ret;
    }

    //********************** Inglés *************************
    public String getReqIngles(String idEst, String tip_anot) {
        Vector ret = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.getReqIngles(idEst, tip_anot);
        bdEst.desconectar();
        if (ret.size() > 0) {
            return ((Vector) ret.elementAt(0)).elementAt(0).toString();
        } else {
            return "";
        }
    }

    /**
     * Información de correo electrónico
     *
     * @param idest
     * @return
     */
    public Vector infoCorreo(String idEst) {
        Vector ret = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.infoCorreo(idEst);
        bdEst.desconectar();
        return ret;
    }

    public Vector GraduadosPos(String cedula) {
        Vector rec = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        rec = bdEst.GraduadosPos(cedula);
        bdEst.desconectar();
        return rec;
    }

//====PROCESO POSGRADOS=====
    public String getIdprog() {
        return this.id_prog;
    }

    public Vector getAsigPos(String idplan, String per, String carnet) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.getAsigPos(idplan, per, carnet);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector getAdicionaBiblia(String per, String carnet) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.getAsigBib(per, carnet);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector VerifAsig(String idAsig, String carnet, String per) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.VerifAsig(idAsig, carnet, per);
        bdEst.desconectar();
        return lispreins;
    }

    public int ActualInsPos(String idAsig, String carnet, String per, String grp, String ngrp, String ban) {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.Actualinscpos(idAsig, carnet, per, grp, ngrp, ban);
        bdEst.desconectar();
        return ret;
    }

    public int Autentica(String carnet) {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.Autentica(carnet);
        bdEst.desconectar();
        return ret;
    }

    public Vector InfAsig(String idAsig, String idplan, String per, String prog, String idgrp) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.InfAsig(idAsig, idplan, per, prog, idgrp);
        bdEst.desconectar();
        return lispreins;
    }

    public int InsertInsPos(String idasig, String carnet, String ngrp, String per, String peso, String grp, String ban) {
        int ret = 0;
        String sec = new String("");
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        sec = bdEst.sigSecuencia("BIBLIAPOST");
        ret = bdEst.InsertInscPos(sec, idasig, carnet, ngrp, per, peso, grp, ban);
        bdEst.desconectar();
        return ret;
    }

    public int BorraInsPos(String idAsig, String carnet, String per) {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.Borrainscpos(idAsig, carnet, per);
        bdEst.desconectar();
        return ret;
    }

    public Vector BuscarAsigPos(String per, String entrada) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.BuscarAsigPos(per, entrada);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector BuscarAsigPosC(String per, String entrada) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.BuscarAsigPosC(per, entrada);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector InfAsigNoPlan(String idAsig, String per) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.InfAsigNoPlan(idAsig, per);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector AsigAdPos(String per) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.AsigAdPos(per);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector getInfActa(String per, String carnet) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.getInfActa(per, carnet);
        bdEst.desconectar();
        return lispreins;
    }

    public int ActualActaPos(String per, String firma, String carnet) {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.Actualactpos(per, firma, carnet);
        bdEst.desconectar();
        return ret;
    }

    public int InsertActaPos(String per, String carnet) {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.InserActaPos(carnet, per);
        bdEst.desconectar();
        return ret;
    }

    public Vector getInfPerA(String idprg) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.getInfPer(idprg);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector BuscarAsigAPos(String per, String entrada, String idest, String idplan) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.BuscarAsigAPos(per, entrada, idest, idplan);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector VerifCupo(String idgrp, String per) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.VerifCup(idgrp, per);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector FirmaActa(String idest, String per) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.FirmaActa(idest, per);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector VerifCupoPreg(String idgrp, String per) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.VerifCupPreg(idgrp, per);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector PreinscripcionDefinitiva(String ident, String idest) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.PreinscripcionDefinitiva(ident, idest);

        bdEst.desconectar();
        return lispreins;
    }

    public int Log_Audit(String idAsig, String carnet, String per, String grp, String ngrp, String tipo) {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.InsertLog(idAsig, carnet, per, grp, ngrp, tipo);
        bdEst.desconectar();
        return ret;
    }

    public Vector Ingles(String idest) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.Ingles(idest);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector InglesVer(String idest) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.InglesVer(idest);
        bdEst.desconectar();
        return lispreins;
    }

     public Vector InglesVerNivel(String idest) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.InglesVerNivel(idest);
        bdEst.desconectar();
        return lispreins;
    }
    public Vector desptarjeton(String idEst) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.desptarjeton(idEst);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector Candidatos(String tipo) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.Candidatos(tipo);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector ConsultaVoto(String idEst) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.ConsultaVoto(idEst);
        bdEst.desconectar();
        return lispreins;
    }

    public int ActualizaRetiro(String sec, String idEst, String grupo, String per) {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.ActualizaRetiro(sec, idEst, grupo, per);
        bdEst.desconectar();
        return ret;
    }

    public Vector SecuenciaPI() {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.SecuenciaPI();
        bdEst.desconectar();
        return lispreins;
    }

    public int ActSecuenciaPI() {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.ActSecuenciaPI();
        bdEst.desconectar();
        return ret;
    }

    public int InsertaAuditPI(String idest, String idgrupo) {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.InsertaAuditPI(idest, idgrupo);
        bdEst.desconectar();
        return ret;
    }

    public Vector Asignatura(String codasig) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.Asignatura(codasig);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector AsignaturasPI(String idest, String per) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.AsignaturasPI(idest, per);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector AsignaturaPago(String idgrupo, String per, String idest) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.AsignaturaPago(idgrupo, per, idest);
        bdEst.desconectar();
        return lispreins;

    }

    public Vector AsignaturaLaborat(String idasig, String num_grupo, String idasig1, String num_grupo1, String per) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.AsignaturaLaborat(idasig, num_grupo, idasig1, num_grupo1, per);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector ConsultagrupoLaborat(String idasig, String per)  {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.ConsultagrupoLaborat(idasig, per);
        bdEst.desconectar();
        return lispreins;
    }
    
            
    
    public int ActualizaVotos(String campo, String idEst) {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.ActualizaVotos(campo, idEst);
        bdEst.desconectar();
        return ret;
    }

    public int InserVoto(String idcrp, String nro) {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.InserVoto(idcrp, nro);
        bdEst.desconectar();
        return ret;
    }

    public Vector AsignaEncuestaA(String idEst) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.AsignaEncuestaA(idEst);
        bdEst.desconectar();
        return lispreins;
    }

    public Vector ContestaEncuestaA(String idEst) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.ContestaEncuestaA(idEst);
        bdEst.desconectar();
        return lispreins;
    }
    
      public Vector Representantes(String idprog) {
        Vector lispreins = new Vector();
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        lispreins = bdEst.Representantes(idprog);
        bdEst.desconectar();
        return lispreins;
    }
      
       public int CanalComunica(String idest, String comunica, String propuesta, String contacta, String per) {
        int ret = 0;
        BdEstudiante bdEst = new BdEstudiante();
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.CanalComunica(idest, comunica, propuesta, contacta, per);
        bdEst.desconectar();
        return ret;
    }
       
        public Vector ConsulCambioCorreo(String doc_est){
            Vector cambCorreo = new Vector();
            BdEstudiante bdEst = new BdEstudiante();
            configECI cfgEci = new configECI();
            bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
            cambCorreo = bdEst.ConsulCambioCorreo(doc_est);
            bdEst.desconectar();
            return cambCorreo;
        }
        
        public Boolean PersisteToken(String token, String carne){
            Boolean ans = false;
            BdEstudiante bdEst = new BdEstudiante();
            configECI cfgEci = new configECI();
            bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
            ans = bdEst.PersisteToken(token, carne);
            bdEst.desconectar();
            return ans;
        }
        
        public Boolean ConvocadoSaberPro(String carne, String cedula, String email){
            Boolean ans = false;
            BdEstudiante bdEst = new BdEstudiante();
            configECI cfgEci = new configECI();
            bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
            ans = bdEst.ConvocadoSaberPro(carne, cedula, email);
            bdEst.desconectar();
            return ans;
        }
        
        public Vector ProfesorPorIDEvento(String id_evento){
            Vector ans = new Vector();
            BdEstudiante bdEst = new BdEstudiante();
            configECI cfgEci = new configECI();
            bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
            ans = bdEst.ProfesorPorIDEvento(id_evento);
            bdEst.desconectar();
            return ans;
        }

//==========================
}
