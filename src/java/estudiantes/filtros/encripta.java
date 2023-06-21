/*
 * encripta.java
 *
 * Created on 17 de agosto de 2007, 02:43 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package estudiantes.filtros;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
/**
 *
 * @author alexgz
 */
public class encripta {
    private String encCad;
    private Key clave;
    /** Creates a new instance of encripta */
    public encripta() {
    }
    
    public encripta(int inickey) {
        try {
            KeyGenerator keyGen;
            keyGen = KeyGenerator.getInstance("DES");
            keyGen.init(56);
            this.clave = keyGen.generateKey();
        }catch (NoSuchAlgorithmException ex) {
            ex.printStackTrace();
        }   
    }
    
    public String encriptar(String cadena) {
        /*try {
            byte[] cadenaByte= cadena.getBytes("UTF8");
            Cipher cifrar;
            cifrar = Cipher.getInstance("DES");
            cifrar.init(Cipher.ENCRYPT_MODE, this.clave);
            byte[] enc = cifrar.doFinal(cadenaByte);
            return new sun.misc.BASE64Encoder().encode(enc);
        } catch (javax.crypto.BadPaddingException e) {
        } catch (IllegalBlockSizeException e) {
        } catch (UnsupportedEncodingException e) {
        } catch (java.io.IOException e) {
        }catch (NoSuchAlgorithmException ex) {
            ex.printStackTrace();
        } catch (NoSuchPaddingException ex) {
            ex.printStackTrace();
        } catch (InvalidKeyException ex) {
                ex.printStackTrace();
            }*/
        return null;
    }
    public String desencriptar(String str, Key claveret) {
        /*try {
// ------------ Obtenemos los Bytes del String encriptado
            byte[] dec = new sun.misc.BASE64Decoder().decodeBuffer(str);
            Cipher descifrar;
            descifrar = Cipher.getInstance("DES");
            descifrar.init(Cipher.DECRYPT_MODE, claveret);
            byte[] cadenaByte= descifrar.doFinal(dec);
// ------------- Volvemos a pasarlo a forma de cadena.
            return new String(cadenaByte, "UTF8");
        } catch (javax.crypto.BadPaddingException e) {
        } catch (IllegalBlockSizeException e) {
        } catch (UnsupportedEncodingException e) {
        } catch (java.io.IOException e) {
        } catch (NoSuchAlgorithmException ex) {
            ex.printStackTrace();
        } catch (NoSuchPaddingException ex) {
            ex.printStackTrace();
        } catch (InvalidKeyException ex) {
            ex.printStackTrace();
        }*/
        return null;
    }
    
    public Key getLlave(){
        return clave;
    }
}
