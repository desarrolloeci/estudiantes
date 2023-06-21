/*
 * BaseDatos.java
 *
 * Created on 7 de julio de 2006, 11:44 AM
 */

package eci.baseDatos;

import java.io.*;
import java.util.Vector;
import java.sql.*;
import java.net.*;
import eci.rechum.EqTipo;
import eci.rechum.Tipo;
import eci.servlets.dependencias.Dependencia ;
import eci.servlets.documentos.Documento ;
import estudiantes.configuracion.configECI;

/** Esta clase es utilizada como la clase principal dentro del paquete. De
 * esta clase herendan todas la mayoría de las otras clases incluidas en
 * el paquete. Esta clase establece los métodos básicos a ser utiizados en
 * una conexión en la base de datos, tales como el de establecer la conexión,
 * establecer el usuario, la clave, etc ...
 */
public class BaseDatos {

     /** Numero de registros leidos, insertados, etc, bien sea en una consulta
     * una insercion, un update u otro tipo de operación para la cual pueda
     * se útil el conteo de registros.
     */
    protected 	int           numRegs;
    
    /** Indica si se encuenta una conexión activa a la base de datos */
    protected 	boolean       conectado;

    /** El usuario que se conecta a la base de datos */
    protected 	String        usuario;

    /** La clave del usuario mencionado anteriormente para conectarse con la base
        de datos */
    protected 	String        clave;

    /** Dirección url para la fuente de los datos. Para este caso específico la
        fuente utiliza el driver odbc cuyo nombre es ecisis. Si no existe una
        fuente odbc con este nombre, la conexión a la base de datos no funcionara
        o si este se configura de forma equivocada, lo mismo sucederá */
    
    configECI conf = new configECI();
        
      protected 	String dbUrl = "jdbc:jtds:sqlserver://"+conf.getIPBd()+"/APOLO";
       
 //  protected 	String         dbUrl = "jdbc:jtds:sqlserver://10.1.1.55/APOLO";
    /**
    	Este atributo es el encargado de mantener la información de la 
    	conexión que se establece con la base de datos. Una misma conexión
    	puede ser usada por varias instancias de un applet para obtener
    	información o actualizar la base de datos. En el caso del
    	applet que maneja las hojas de vida, el servidor rmi establece
    	una conexión al levantarse que se mantiene vigente durante todo
    	el tiempo, y por medio de la cual todos los applets hacen sus
    	consultas y actualizaciones.
    */
    protected	Connection    conexion = null;
    
    /**
    	El nombre del driver de conexión, que se encuentra dentro
    	de un paquete suministrado por el fabricante. El nombre
    	del paquete es Sprinta2000.jar y si es instalado como
    	una extensión del JRE, se debe encontrar en el directorio
    	ext de el servidor, dentro de la jerarquía de directorios
    	en la que se encuentra la máquina virtual.
    */
   // private String      driver = "com.internetcds.jdbc.tds.Driver" ;
     private String      driver = "net.sourceforge.jtds.jdbc.Driver" ;
    /**
    	En este atributo de clase se almacenan todos los mensajes
    	cuando se ejecutan acciones sobre la base de datos. Es importante
    	tener en cuenta que sólo el último mensaje está disponible,
    	porque con cada nueva acción, el mensaje es actualizado.
    */
    protected 	String        mensaje;
    
    /** Crea una instancia del objeto base de datos para ser usada por otros
     * objetos. Coloca el numero de registros en -1 y no hay conexion aun :
     * conectado = false
     */
    public BaseDatos () {
        numRegs = -1;
        conectado = false;
    }
    
    /** Establece el usuario con el que se desea trabajar al realizar la conexion
     * a la base de datos, esto se hace normalmente antes de utilizar el método
     * conectar de esta misma clase.
     * @param usuarioExt Es el usuario externo que se quiere establecer para
     * este objeto. El usuario externo es un parámetro de
     * entrada y es establecido al objeto BaseDatos. Con
     * este usuario se realizarán las conexiones posteriores
     * a menos que se cambie el usuario explícitamente.
     */
    public void setUsuario (String usuarioExt) {
        usuario = new String(usuarioExt);
    }

    /** Establece la clave con la que se desea trabajar al realizar la conexión
     * a la base de datos, esto se hace normalmente antes de utilizar el método
     * conectar de esta misma clase. La clave está ligada al usuario utilizado.
     * @param claveExt Este parámetro es de entrada y establece la clave
     * con la que se van a realizar las conexiones para un
     * usuario también establecido mediante el método
     * setUsuario de esta misma clase o en el método
     * constructor.
     */
    public void setClave (String claveExt) {
        clave = new String(claveExt);
    }
    
    /** Establece una conexión para la base de datos utilizando el usuario y
     * la clave dadas por el programador que es usuario de esta clase. Para
     * establecer el usuario se utiliza el método setUsuario y para establecer
     * la clave se utiliza el método setClave.
     * @return Cuando la conexión es establecida este método retorna
     * el valor <B><I>true</I></B>. De lo contrario retorna
     * <B><I>false</I></B>.
     */
    public boolean conectar () {
        try {
            Class.forName(driver);
            conexion = DriverManager.getConnection(dbUrl, usuario, clave);
            conectado = true;
            return true;
        } catch (ClassNotFoundException e) {
            mensaje = new String ("No encontro el driver - " + e.getMessage());
            System.out.println("No encontro el driver - " + e.getMessage());
            return false;
        } catch (Exception e) {
            mensaje = new String (e.getMessage());
            System.out.println(mensaje);
            return false;
        }
    }

    /** Establece una conexión con la base de datos utilizando el usuario y
     * la clave dadas por el programador que es usuario de esta clase en los
     * parámetros del método.
     * @param usuarioExt Define el usuario con el cual se realizará la conexión
     * a la base de datos.
     * @param claveExt Define la clave para el usuario, por medio de la cual
     * se intentará realizar la conexión con la base de datos.
     * Si el usuario y la clave no coinciden con la
     * información existente en la base de datos, la realización
     * de la conexión fallará.
     * @return Si la conexión con la base de datos se puede establecer
     * este método retorna <B><I>true</I></B>, de lo contrario
     * retorna el valor<B><I>false</I></B>.
     */
    public boolean conectar (String usuarioExt, String claveExt) {
        try {
            Class.forName(driver);
            conexion = DriverManager.getConnection(dbUrl, usuarioExt, claveExt);
            conectado = true;
            return conectado;
        } catch (Exception e) {
            mensaje = new String ("No encontro el driver - " + e.getMessage());
            System.out.println("No encontro el driver - " + e.getMessage());
            return false;
        }
    }

	/** Este método sirve para obtener el mensaje apropiado, de acuerdo
     * con la última acción que se haya realizado sobre la base
     * de datos.
     * @return El valor retornado coincide con el mensaje dejado
     * por la última operación que se haya realizado sobre
     * la base de datos, este mensaje puede ser de error
     * o de éxito.
     */
    public String getMensaje() {
        return mensaje;
    }

    /** Termina la conexión con la base de datos si esta se encontraba activa.
     * Si algún error llegase a ocurrir mediante el método getMensaje se
     * podrá obtener información.
     * @return Este método retorna <B><I>true</I></B> en caso de que
     * la desconexión con la base de datos se haya llevado
     * a cabo de forma correcta. De lo contrario se retorna
     * <B><I>false</I></B>
     *
     */
    public boolean desconectar() {
        try {
            conexion.close();
            conectado = false;
            return true;
        } catch (Exception e) {
            mensaje = new String(e.getMessage());
            return false;
        }
    }

    /** Obtiene el número de registros que fueron seleccionados en
     * una consulta, o bien el número de registros que se actualizaron.
     * Al igual que el mensaje, este número es sobreescrito con cada
     * operación que se realiza.
     * @return Retorna el número de registros afectados por la última
     * operación que se haya realizado sobre la base de datos.
     */ 
    public int getNumRegs() {
        return numRegs;
    }

	/** Establece una conexión a la base de datos, utilizando una conexión
     * hecha anteriormente por otro objeto. Si la conexion es inválida,
     * se pueden producir errores al ejecutar los llamados de los métodos
     * que utilicen esta conexión.
     * @param c El parámetro que se pasa es de entrada y debe contener
     * una conexión válida realizada anteriormente por medio
     * de los métodos <B><I>conectar</I></B> de esta misma
     * clase.
     */
	public void setConexion (Connection c)
	{
		conexion = c;
		conectado = true;
	}

	/** Teniendo establecida una conexión por medio de los métodos apropiados
         * existentes en esta clase, se puede obtener esta conexión con el objeto
         * de utilizarla con otros métodos u otros objetos.
         * @return Retorna la conexión que posee este objeto.
         */
	public Connection getConexion ()
	{
		return conexion;
	}

	/** Este método retorna el usuario con el que se ha intentado
         * conectar a la base de datos, bien sea que esta conexión haya
         * sido exitosa o no. El atributo de clase es establecido
         * mediante el método constructor de esta clase que recibe como
         * parámetros el usuario y la clave, o mediante el método
         * setUsuario.
         * @return Se retorna el usuario que ha sido establecido para este
         * objeto y que se encuentra vigente.
         */
	public String getUsuario ()
	{
		return usuario;
	}

	/** Este método retorna la clave con la que se ha intentado
         * conectar a la base de datos, bien sea que esta conexión haya
         * sido exitosa o no. El atributo de clase es establecido
         * mediante el método constructor de esta clase que recibe como
         * parámetros el usuario y la clave, o mediante el método
         * setClave.
         * @return Se retorna la clave que ha sido establecida para este
         * objeto y que se encuentra vigente.
         */
	public String getClave ()
	{
		return clave;
	}

    public boolean conectarODBC(String nomODBC) {
        dbUrl = new String("jdbc:odbc:" + nomODBC);
        driver = new String("sun.jdbc.odbc.JdbcOdbcDriver") ;
        try {
            Class.forName(driver);
            conexion = DriverManager.getConnection(dbUrl, usuario, clave);
            conectado = true;
            return true;
        } catch (ClassNotFoundException e) {
            mensaje = new String ("No se encontro el driver - " + e.getMessage());
            System.out.println("No se encontro el driver - " + e.getMessage());
            return false;
        } catch (Exception e) {
            mensaje = new String (e.getMessage());
            System.out.println(mensaje);
            return false;
        }
    }
    
    public boolean conectarODBC(String usuExt, String claveExt) {
        dbUrl = new String("jdbc:odbc:osiris");
        driver = new String("sun.jdbc.odbc.JdbcOdbcDriver") ;
        try {
            Class.forName(driver);
            conexion = DriverManager.getConnection(dbUrl, usuExt, claveExt);
            conectado = true;
            return true;
        } catch (ClassNotFoundException e) {
            mensaje = new String ("No se encontro el driver - " + e.getMessage());
            System.out.println("No se encontro el driver - " + e.getMessage());
            return false;
        } catch (Exception e) {
            mensaje = new String (e.getMessage());
            return false;
        }
    }    

//=== Finciones de Julián García
  public boolean conectarBD () {
    try {
      Class.forName(driver);
      conexion = DriverManager.getConnection(dbUrl, "", "");
      conectado = true;
      return true;
    } catch (ClassNotFoundException e) {
      mensaje = new String ("No encontro el driver" + e.getMessage());
      return false;
    } catch (Exception e) {
      mensaje = new String (e.getMessage());
      return false;
    }
  }

  public boolean conectarBD (String usuarioExt, String claveExt) {
    try {
      Class.forName(driver);
      conexion = DriverManager.getConnection(dbUrl, usuarioExt, claveExt);
      conectado = true;
      return true;
    } catch (Exception e) {
      mensaje = new String (e.getMessage());
      return false;
    }
  }

  public String getMensajeBD() {
    return mensaje;
  }

  public boolean desconectarBD() {
    try {
      conexion.close();
      conectado = false;
      return true;
    } catch (Exception e) {
      mensaje = new String(e.getMessage());
      return false;
    }
  }

  public Vector consultarDependencias() {

    ResultSet resConsDep;
    Vector lisDep = new Vector() ;
    PreparedStatement sentenciaConsulta;
 
    Dependencia dep;

    if (!conectado) {
      mensaje = new String ("No hay conexion con la base de datos");
      return lisDep ;
    }

    try {
      sentenciaConsulta =
      conexion.prepareStatement ("select * from rechum.cen_ests where tipo = 'C' " +
					 "order by nombre " ) ;
	
 	  resConsDep = sentenciaConsulta.executeQuery();
      try {
        while (resConsDep.next()) {

		  dep = new Dependencia(resConsDep.getInt(1),	resConsDep.getString(2),
				  resConsDep.getString(3), resConsDep.getString(5),
				  resConsDep.getString(6),	resConsDep.getString(7), resConsDep.getString(8));
		  lisDep.addElement(dep) ;
        }
        resConsDep.close() ;
 	    sentenciaConsulta.close();
      } catch (SQLException e) { 
      mensaje = new String("La sentencia preparada no se ha podido cerrar correctamente");
      }  
    } catch (Exception e) {
      mensaje = e.getMessage();
    }

    return lisDep;
  }

  public Vector consultarDetalles(String nombre) {

    ResultSet resConsDet;
    Vector lisDet = new Vector() ;
    PreparedStatement sentenciaConsulta;
 
    String nomDetalle;

    if (!conectado) {
      mensaje = new String ("No hay conexion con la base de datos");
      return lisDet ;
    }

    try {
      sentenciaConsulta =
      conexion.prepareStatement ("select nomdet from apolo.detentidad where noment = ? " +
					 " and uso in ('c', 't') order by nomdet " ) ;
	  sentenciaConsulta.setString(1, nombre) ;
	  	
 	  resConsDet = sentenciaConsulta.executeQuery();
      try {
        while (resConsDet.next()) {

		  nomDetalle = new String(resConsDet.getString(1) );
		  lisDet.addElement(nomDetalle) ;
        }
        resConsDet.close() ;
 	    sentenciaConsulta.close();
      } catch (SQLException e) { 
      mensaje = new String("La sentencia preparada no se ha podido cerrar correctamente");
      }  
    } catch (Exception e) {
      mensaje = e.getMessage();
    }

    return lisDet;
  }
  
  public Vector consultarDocumentos(Vector lisId) {

    ResultSet resConsDoc;
    String consulta ;
    int	cont ;
    Vector lisDoc = new Vector() ;
    PreparedStatement sentenciaConsulta;
//    PrintWriter out = new PrintWriter(new FileOutputStream("c:\\jakarta-tomcat\\webapps\\root\\salida.txt")) ;
 
    Documento doc;
    
    if (!conectado) {
      mensaje = new String ("No hay conexion con la base de datos");
      return lisDoc ;
    }

    try {     
      consulta = new String("select nom_doc, nombres + ' ' + apellidos, camino, titulo, resumen, nombre, apolo.documentos.fec_cre, fec_ult " + 
         "FROM rechum.cen_ests, apolo.documentos, rechum.empleados " + 
         "WHERE ( rechum.cen_ests.codigo = rechum.empleados.cod_cen_est ) and " + 
         "      ( apolo.documentos.id_resp = rechum.empleados.num_id ) and " +
         "      ( codigo in ( "); 
         
	  for (cont = 0; cont < lisId.size(); cont++) 
		consulta = consulta + lisId.elementAt(cont).toString() + ", ";
	  consulta = consulta + "-1))" ;

      sentenciaConsulta = conexion.prepareStatement(consulta) ;	
//	  sentenciaConsulta.setInt(1, idDep) ;
 	  resConsDoc = sentenciaConsulta.executeQuery();

      try {
        while (resConsDoc.next()) {
		  doc = new Documento(resConsDoc.getString(1), resConsDoc.getString(2),
		  					  resConsDoc.getString(3), resConsDoc.getString(4),	
		  					  resConsDoc.getString(5),resConsDoc.getString(6),
		  					  resConsDoc.getDate(7), resConsDoc.getDate(8)) ; 
		  lisDoc.addElement(doc) ;
        }
        resConsDoc.close() ;
 	    sentenciaConsulta.close();
      } catch (SQLException e) { 
      	mensaje = new String("La sentencia preparada no se ha podido cerrar correctamente " + e.getMessage());
//e.printStackTrace(out);
//      	out.close() ;
      }  
    } catch (Exception e) {
      mensaje = e.getMessage();
    }

    return lisDoc;
  }

/*  public Vector consultarEmpleados(Vector lisId) {

    ResultSet resConsEmp;
    String consulta, valor ;
    java.sql.Date fecha = new java.sql.Date(1) ;
    String nd = new String("No disponible") ;
    int	cont ;
    Vector lisEmp = new Vector() ;
    Vector liscam = new Vector() ;
    PreparedStatement sentenciaConsulta;
    Empleado emp;
    
    if (!conectado) {
      mensaje = new String ("No hay conexion con la base de datos");
      return lisEmp ;
    }

    try {     
      consulta = new String("select num_id, nombres, apellidos, est_civ, sexo, fec_nac, " + 
      	 "nalidad, ciu_nac, pai_nac, tel_res, dir_res, ciu_res, pai_res, fax, apa_aer, e_mail, nombre " +
         "FROM rechum.empleados, rechum.cen_ests " + 
         "WHERE cod_cen_est = codigo and codigo in ( "); 
         
	  for (cont = 0; cont < lisId.size(); cont++) 
		consulta = consulta + lisId.elementAt(cont).toString() + ", ";
	  consulta = consulta + "-1)" ;
	  consulta = consulta + " ORDER BY nombre, apellidos, nombres" ;

      sentenciaConsulta = conexion.prepareStatement(consulta) ;	
 	  resConsEmp = sentenciaConsulta.executeQuery();

      try {
        while (resConsEmp.next()) {
          liscam.clear() ;	
		  for (cont = 1; cont < 18; cont++) {
		  	if (cont == 6) {
		  		fecha = resConsEmp.getDate(cont) ;
		  		liscam.addElement(nd) ;
		  	}
		  	else {
		  		valor = resConsEmp.getString(cont) ;
		  		if (resConsEmp.wasNull())
		  			liscam.addElement(nd) ;		  		
		  		else
		  			liscam.addElement(valor) ;		  		
		  	}
		  }
		  emp = new Empleado((String) liscam.elementAt(0), (String) liscam.elementAt(1),
		  					 (String) liscam.elementAt(2), (String) liscam.elementAt(3),
		  					 (String) liscam.elementAt(4), fecha,
		  					 (String) liscam.elementAt(6), (String) liscam.elementAt(7),
		  					 (String) liscam.elementAt(8), (String) liscam.elementAt(9),
		  					 (String) liscam.elementAt(10), (String) liscam.elementAt(11),
		  					 (String) liscam.elementAt(12), (String) liscam.elementAt(13),
		  					 (String) liscam.elementAt(14), (String) liscam.elementAt(15),
		  					 (String) liscam.elementAt(16)) ;		 
		  lisEmp.addElement(emp) ;
        }
        resConsEmp.close() ;
 	    sentenciaConsulta.close();
      } catch (SQLException e) { 
      	mensaje = new String("La sentencia preparada no se ha podido cerrar correctamente " + e.getMessage());
      }  
    } catch (Exception e) {
      mensaje = "Otro: " + e.getMessage();
    }
    return lisEmp;
  }  */

  public Vector consultarProcesos(String Id) {

    ResultSet resConsPrc;
    String consulta ;
    int	cont ;
    Vector lisPrc = new Vector() ;
    PreparedStatement sentenciaConsulta;
 
    String prc;
    
    if (!conectado) {
      mensaje = new String ("No hay conexion con la base de datos");
      return lisPrc ;
    }

    try {     
      consulta = new String("select nomprc " + 
         "FROM apolo.procweb, apolo.procusers " + 
         "WHERE ( apolo.procweb.idprc = apolo.procusers.idprc ) and " + 
         "      ( apolo.procusers.iduser = ?)" ) ;
         
      sentenciaConsulta = conexion.prepareStatement(consulta) ;	
	  sentenciaConsulta.setString(1, Id) ;
 	  resConsPrc = sentenciaConsulta.executeQuery();

      try {
        while (resConsPrc.next()) {
		  prc = new String(resConsPrc.getString(1)) ; 
		  lisPrc.addElement(prc) ;
        }
        resConsPrc.close() ;
 	    sentenciaConsulta.close();
      } catch (SQLException e) { 
      	mensaje = new String("La sentencia preparada no se ha podido cerrar correctamente " + e.getMessage());
      }  
    } catch (Exception e) {
      mensaje = e.getMessage();
    }
    return lisPrc;
  }

  public Vector consultarAsignaturasProf(String Id) {
    ResultSet resCons;
    String consulta ;
    int	cont ;
    String valor, nd = new String("No disponible") ;
    Vector lista = new Vector() ;
    BdGeneral obj ;
    PreparedStatement sentenciaConsulta;
     
    if (!conectado) {
      mensaje = new String ("No hay conexion con la base de datos");
      return lista ;
    }
    try {     
      consulta = new String("select nombre, area, fecha, convert(varchar(3), num_vec), des " + 
         			"FROM rechum.asignaturas " + 
         			"WHERE num_id =  ?" ) ;    
      sentenciaConsulta = conexion.prepareStatement(consulta) ;	
	  sentenciaConsulta.setString(1, Id) ;
 	  resCons = sentenciaConsulta.executeQuery();

      try {
        while (resCons.next()) {
		  obj = new BdGeneral("Asignaturas de los profesores") ; 
		  for (cont = 1; cont < 6; cont++) {
	  		valor = resCons.getString(cont) ;
		  	if (resCons.wasNull())
		  		obj.addElement(nd) ;		  		
		  	else
		  		obj.addElement(valor) ;		  		
		  }
		  lista.addElement(obj) ;
        }
        resCons.close() ;
 	    sentenciaConsulta.close();
      } catch (SQLException e) { 
      	mensaje = new String("La sentencia preparada no se ha podido cerrar correctamente " + e.getMessage());
      }  
    } catch (Exception e) {
      mensaje = e.getMessage();
    }
    return lista;
  }

  public Vector consultar(String consulta, int nroCampos) {
    ResultSet resCons;
    int	cont ;
    String valor, nd = new String("No disponible") ;
    Vector lista = new Vector() ;
    BdGeneral obj ;
    PreparedStatement sentenciaConsulta;
     
    if (!conectado) {
      mensaje = new String ("No hay conexion con la base de datos");
      return lista ;
    }
    try {     
      sentenciaConsulta = conexion.prepareStatement(consulta) ;	
      resCons = sentenciaConsulta.executeQuery();
      try {
        while (resCons.next()) {
          obj = new BdGeneral("xx") ; 
          for (cont = 1; cont <= nroCampos; cont++) {
                valor = resCons.getString(cont) ;
                if (resCons.wasNull())
                        obj.addElement(nd) ;		  		
                else
                        obj.addElement(valor) ;		  		
          }
          lista.addElement(obj) ;
        }
        resCons.close() ;
 	    sentenciaConsulta.close();
      } catch (SQLException e) { 
      	mensaje = new String("La sentencia preparada no se ha podido cerrar correctamente " + e.getMessage());
      }  
    } catch (Exception e) {
      mensaje = e.getMessage();
    }
    return lista;
  }

  public int actualizar(String consulta) {
    int resCons;
    BdGeneral obj ;
    PreparedStatement sentenciaConsulta;
     
    if (!conectado) {
      mensaje = new String ("No hay conexion con la base de datos");
      return 0 ;
    }
    try {     
      sentenciaConsulta = conexion.prepareStatement(consulta) ;	
      resCons = sentenciaConsulta.executeUpdate();
      sentenciaConsulta.close();
    } catch (Exception e) {
      mensaje = e.getMessage();
      return 0 ;
    }
    return resCons ;
  }
  
  public Vector consultarDocumentos(String Id) {
    ResultSet resConsDoc;
    String consulta ;
    Vector lisDoc = new Vector() ;
    PreparedStatement sentenciaConsulta;
    Documento doc;
    
    if (!conectado) {
      mensaje = new String ("No hay conexion con la base de datos");
      return lisDoc ;
    }

    try {     
      consulta = new String("select nom_doc, nombres + ' ' + apellidos, camino, titulo, resumen, nombre, apolo.documentos.fec_cre, fec_ult " + 
         "FROM rechum.cen_ests, apolo.documentos, rechum.empleados " + 
         "WHERE rechum.cen_ests.codigo = rechum.empleados.cod_cen_est and " + 
         "      apolo.documentos.id_resp = rechum.empleados.num_id and " +
         "      id_doc = " + Id ); 
         
      sentenciaConsulta = conexion.prepareStatement(consulta) ;	
 	  resConsDoc = sentenciaConsulta.executeQuery();

      try {
        while (resConsDoc.next()) {
		  doc = new Documento(resConsDoc.getString(1), resConsDoc.getString(2),
		  					  resConsDoc.getString(3), resConsDoc.getString(4),	
		  					  resConsDoc.getString(5),resConsDoc.getString(6),
		  					  resConsDoc.getDate(7), resConsDoc.getDate(8)) ; 
		  lisDoc.addElement(doc) ;
        }
        resConsDoc.close() ;
 	    sentenciaConsulta.close();
      } catch (SQLException e) { 
      	mensaje = new String("La sentencia preparada no se ha podido cerrar correctamente " + e.getMessage());
      }  
    } catch (Exception e) {
      mensaje = e.getMessage();
    }

    return lisDoc;
  }

  public int consultarPermiso(String prc, String op, String usuario) {
    ResultSet respuesta;
    String consulta;
    PreparedStatement sentenciaConsulta;
    int  cant = 0;
   
    if (!conectado) {
      mensaje = new String ("No hay conexion con la base de datos");
      return 0;
    }

    try {     
      consulta = new String("select count(*) " + 
         "FROM apolo.procusers, apolo.prcweb, rechum.empleados " + 
         "WHERE apolo.procusers.idprc = apolo.prcweb.idprc and usrname = '" + usuario + "' and " +
         " rechum.empleados.num_id = iduser and " +
         "      nomprc like '%" + prc + "' and " +
         " ( per0 = 1 or per1 = " + op + " or per2 = " + op + " or per3 = " + op + 
         "   or per4 = " + op + " or per5 = " + op + ") "  ); 
         
      sentenciaConsulta = conexion.prepareStatement(consulta) ;	
 	  respuesta = sentenciaConsulta.executeQuery();

      try {
      	respuesta.next() ;
        cant = respuesta.getInt(1) ; 
        respuesta.close() ;
 	    sentenciaConsulta.close();
      } catch (SQLException e) { 
      	mensaje = new String("La sentencia preparada no se ha podido cerrar correctamente " + e.getMessage());
    	} 
    }catch (Exception e) {
	      mensaje = e.getMessage();
    }
    return cant;
  }

  public String consultarPermisoNV(String prc, String op, String usuario) {
    ResultSet respuesta;
    String consulta;
    PreparedStatement sentenciaConsulta;
    String desc = new String() ;
    
    if (!conectado) {
      mensaje = new String ("No hay conexion con la base de datos");
      return desc;
    }

    try {     
      consulta = new String("select decr " + 
         "FROM apolo.permusu, apolo.prcweb, rechum.empleados, apolo.paramprc " + 
         "WHERE apolo.permusu.idprc = apolo.prcweb.idprc and usrname = '" + usuario + "' and " +
         " apolo.paramprc.idprc = apolo.prcweb.idprc and " +
	 " apolo.permusu.npar = apolo.paramprc.npar and " +
         " rechum.empleados.num_id = apolo.permusu.numid and " +
         " nomprc like '%" + prc + "' and apolo.permusu.npar = " + op  ); 
         
      sentenciaConsulta = conexion.prepareStatement(consulta) ;	
 	  respuesta = sentenciaConsulta.executeQuery();

      try {
      	respuesta.next() ;
        if (respuesta.wasNull())
            desc = new String("") ;
        else
            desc = respuesta.getString(1) ; 
        respuesta.close() ;
 	    sentenciaConsulta.close();
      } catch (SQLException e) { 
      	mensaje = new String("La sentencia preparada no se ha podido cerrar correctamente " + e.getMessage());
    	} 
    }catch (Exception e) {
	      mensaje = e.getMessage();
    }
    return desc;
  }

  public boolean consultarPermisoDet(String prc, String op, String usuario) {
    ResultSet respuesta;
    String consulta;
    PreparedStatement sentenciaConsulta;
    boolean desc = false ;
    int contador ;
    
    if (!conectado) {
      mensaje = new String ("No hay conexion con la base de datos");
      return desc;
    }

    try {     
      consulta = new String("select count(*) " + 
         "FROM apolo.permusu, apolo.prcweb, rechum.empleados, apolo.paramprc " + 
         "WHERE apolo.permusu.idprc = apolo.prcweb.idprc and usrname = '" + usuario + "' and " +
         " apolo.paramprc.idprc = apolo.prcweb.idprc and " +
	 " apolo.permusu.npar = apolo.paramprc.npar and " +
         " rechum.empleados.num_id = apolo.permusu.numid and " +
         " nomprc like '%" + prc + "' and decr = '" + op + "'"  ); 
         
      sentenciaConsulta = conexion.prepareStatement(consulta) ;	
 	  respuesta = sentenciaConsulta.executeQuery();
      try {
      	respuesta.next() ;
        contador = respuesta.getInt(1) ;
        if (contador > 0)
            desc = true ; 
        respuesta.close() ;
 	    sentenciaConsulta.close();
      } catch (SQLException e) { 
      	mensaje = new String("La sentencia preparada no se ha podido cerrar correctamente " + e.getMessage());
    	} 
    }catch (Exception e) {
	      mensaje = e.getMessage();
    }
    return desc;
  }
  
  
  public Vector consultarForma(String consulta, Vector descCampos, int uso) {
    ResultSet resCons;
    int	cont ;
    Tipo    tupla ;
    EqTipo  lisval ; 
    String valor, nd = new String("No disponible") ;
    BdGeneral obj ;
    PreparedStatement sentenciaConsulta;
     
    obj = new BdGeneral("xx") ; 
    if (!conectado) {
      mensaje = new String ("No hay conexion con la base de datos");
      return obj ;
    }
    if ( uso == 1 ) {
        try {     
          sentenciaConsulta = conexion.prepareStatement(consulta) ;	
          resCons = sentenciaConsulta.executeQuery();
          try {
            if (resCons.next()) {
              for (cont = 0; cont < descCampos.size(); cont++) {
                valor = resCons.getString(cont + 1) ;
                obj.addElement(valor) ;	    
              }
            }
            resCons.close() ;
                sentenciaConsulta.close();
          } catch (SQLException e) { 
            mensaje = new String("La sentencia preparada no se ha podido cerrar correctamente " + e.getMessage());
            return obj ;
          }  
        } catch (Exception e) {
          mensaje = e.getMessage();
          return obj ;
        }
        if (obj.size() <= 0) 
            return obj ;
    }
    else {
        for (cont = 0; cont < descCampos.size(); cont++) 
            obj.addElement("") ;
    }
    for (cont = 0; cont < descCampos.size(); cont++) {
        consulta = (String) descCampos.elementAt(cont) ;
        lisval = new EqTipo();
        if ( !consulta.equals("")) 
            try {     
              sentenciaConsulta = conexion.prepareStatement(consulta) ;	
              resCons = sentenciaConsulta.executeQuery();
              try {
                  while (resCons.next()) { 
                      tupla = new Tipo()   ;
                      tupla.setCodigo(resCons.getString(1)) ;
                      tupla.setNombre(resCons.getString(2)) ;
                      if (tupla.getCodigo().equals(obj.elementAt(cont)))
                          tupla.setCodigo("|" + tupla.getCodigo());
                      lisval.adicionarTipo(tupla) ;
                    }
                    resCons.close() ;
                    sentenciaConsulta.close();
                    obj.setElementAt(lisval, cont) ;
              } catch (SQLException e) { 
                mensaje = new String("La sentencia preparada no se ha podido cerrar correctamente " + e.getMessage());
              }  
            } catch (Exception e) {
              mensaje = e.getMessage();
            }
    }
    return obj;
  }

    public String sigSecuencia(String entidad) {
    ResultSet resCons;
    BdGeneral obj ;
    PreparedStatement sentenciaConsulta;
    String consulta, secuencia = new String("")  ;
     
    if (!conectado) {
      mensaje = new String ("No hay conexion con la base de datos");
      return "-1" ;
    }
    try {     
      consulta = new String ("select convert(varchar(5), sig_sec) from apolo.invent.secuencias where nombre = '" + entidad + "' ") ;
      sentenciaConsulta = conexion.prepareStatement(consulta) ;	
      resCons = sentenciaConsulta.executeQuery();
      try {
        while (resCons.next()) 
	    secuencia = resCons.getString(1) ;
        resCons.close() ;
 	sentenciaConsulta.close();
      } catch (SQLException e) { 
      	mensaje = new String("La sentencia preparada no se ha podido cerrar correctamente " + e.getMessage());
        return "-1" ;
      }  
    } catch (Exception e) {
      mensaje = e.getMessage();
      return "-1" ;
    }
    consulta = new String("update apolo.invent.secuencias set sig_sec = sig_sec + 1 where nombre = '" + entidad + "' ") ; 
    try {     
      sentenciaConsulta = conexion.prepareStatement(consulta) ;	
      sentenciaConsulta.executeUpdate();
      sentenciaConsulta.close();
    } catch (Exception e) {
      mensaje = e.getMessage();
      return "-1" ;
    }
    return secuencia ;
  }

  public Vector consultarBase(String consulta, int nroCampos, Vector lista) {
    ResultSet resCons;
    int	cont, i ;
    String valor, nd = new String("No disponible") ;
    Vector obj ;
    PreparedStatement sentenciaConsulta;
     
    if (!conectado) {
      mensaje = new String ("No hay conexion con la base de datos");
      return lista ;
    }
    try {     
      sentenciaConsulta = conexion.prepareStatement(consulta) ;	
      resCons = sentenciaConsulta.executeQuery();
      try {
        for(i = 0; resCons.next(); i++) {
          obj = (Vector) lista.elementAt(i) ; 
          for (cont = 1; cont <= nroCampos; cont++) {
            valor = resCons.getString(cont) ;
            if (resCons.wasNull())
                obj.addElement(nd) ;		  		
            else
                obj.addElement(valor) ;		  		
          }
          lista.setElementAt(obj, i) ;
        }
        resCons.close() ;
 	    sentenciaConsulta.close();
      } catch (SQLException e) { 
      	mensaje = new String("La sentencia preparada no se ha podido cerrar correctamente " + e.getMessage());
      }  
    } catch (Exception e) {
      mensaje = e.getMessage();
    }
    return lista;
  }
  
  public void cambiarFechaAct(String numId) {
        PreparedStatement sentenciaUpdate;
        
        try {
            sentenciaUpdate = conexion.prepareStatement("update apolo.rechum.empleados set fec_act = getdate() where num_id = ?");
            sentenciaUpdate.setString(1, numId);
            sentenciaUpdate.executeUpdate();
            sentenciaUpdate.close();
        } catch (SQLException e) {
            mensaje = e.getMessage();	
        }      
  }  
}

