package estudiantes.baseDatos;

import java.io.*;
import java.util.Vector;
import java.sql.*;
import java.net.*;
//import intraeci.configuracion.configECI;

/** Esta clase es utilizada como la clase principal dentro del paquete. De
 * esta clase herendan todas la mayoría de las otras clases incluidas en
 * el paquete. Esta clase establece los métodos básicos a ser utiizados en
 * una conexión en la base de datos, tales como el de establecer la conexión,
 * establecer el usuario, la clave, etc ...
 */
public class BaseDatospru {

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
        
    protected 	String dbUrl = "jdbc:jtds:sqlserver://10.1.1.40/REGISTRO";
    //protected 	String dbUrl = "jdbc:jtds:sqlserver://10.1.3.128/REGISTRO";
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
    //private String      driver = "com.internetcds.jdbc.tds.Driver" ;
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
    public BaseDatospru () {
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
            mensaje = e.getMessage();
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
  
   public Vector consultar(String consulta, int nroCampos) {
    ResultSet resCons;
    int	cont ;
    String valor, nd = new String("No disponible") ;
    Vector lista = new Vector() ;
    //Vector BdGeneral = new Vector() ;
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
        Vector  obj = new Vector() ; 
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
      	mensaje = new String("La sentencia preparada no se ha podido cerrar correctamente " + 
    e.getMessage());
      }  
    } catch (Exception e) {
      mensaje = e.getMessage();
    }
    return lista;
  }
  
    public String consultarborrar(String consulta, int nroCampos) {
    ResultSet resCons;
    int	cont ;
    String valor, nd = new String("No disponible") ;
    Vector lista = new Vector() ;
    //Vector BdGeneral = new Vector() ;
    PreparedStatement sentenciaConsulta;
     
    if (!conectado) {
      mensaje = new String ("No hay conexion con la base de datos");
      return mensaje;
    }
    try {     
      sentenciaConsulta = conexion.prepareStatement(consulta) ;	
      resCons = sentenciaConsulta.executeQuery();
      try {
        while (resCons.next()) {
        Vector  obj = new Vector() ; 
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
      	mensaje = new String("La sentencia preparada no se ha podido cerrar correctamente " + 
        e.getMessage());
      }  
    } catch (Exception e) {
      mensaje = new String("error " + e.getMessage());
    }
    return mensaje;
  } 
  
  public int actualizar(String consulta) {
     int resCons;
     //BdGeneral obj ;
     PreparedStatement sentenciaConsulta;

     if (!conectado) {
       mensaje = new String ("No hay conexion con la base de datos");
       return 10 ;
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

    public String sigSecuencia(String entidad) {
    ResultSet resCons;
    PreparedStatement sentenciaConsulta;
    String consulta, secuencia = new String("")  ;
     
    if (!conectado) {
      mensaje = new String ("No hay conexion con la base de datos");
      return "-1" ;
    }
    try {     
      consulta = new String ("select convert(varchar(10), sig_sec) from registro.secuencias where nombre = '" + entidad + "' ") ;
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
    consulta = new String("update registro.secuencias set sig_sec = sig_sec + incr where nombre = '" + entidad + "' ") ; 
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
  
}