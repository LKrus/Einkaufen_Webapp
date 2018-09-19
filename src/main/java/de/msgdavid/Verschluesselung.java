package de.msgdavid;

import org.apache.log4j.Logger;
import sun.security.provider.MD5;

import java.security.MessageDigest;

public class Verschluesselung {
    private final static Logger log = Logger.getLogger(Verschluesselung.class);
    public static String verschluesseln(String passwort) throws Exception {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(passwort.getBytes());

        byte byteData[] = md.digest();

        StringBuffer hexString = new StringBuffer();
        for (int i=0;i<byteData.length;i++) {
            String hex=Integer.toHexString(0xff & byteData[i]);
            if(hex.length()==1) hexString.append('0');
            hexString.append(hex);
        }

        log.info("verschlüsseltes passwort: "+ hexString.toString());

        return hexString.toString();
    }
}
