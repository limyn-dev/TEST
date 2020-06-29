/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package installcert;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.security.KeyStore;
import java.security.MessageDigest;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLException;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.TrustManagerFactory;
import javax.net.ssl.X509TrustManager;

/**
 *
 * @author user1
 */
public class InstallCert {
    public static void main(String[] args) throws Exception {
	String              host                ;
	int                 port                ;          
	char[]              passphrase          ;
        String              sMsg                ;
        File                file                ;
        InputStream         in                  ;
        KeyStore            ks                  ;
        SSLContext          context             ;
        TrustManagerFactory tmf                 ;
        X509TrustManager    defaultTrustManager ;
        SavingTrustManager  tm                  ;
        SSLSocketFactory    factory             ;
        SSLSocket           socket              ;
        BufferedReader      reader              ;
        MessageDigest       sha1                ;
	MessageDigest       md5                 ; 
        X509Certificate     cert                ; 
        OutputStream        out                 ; 
	int                 k                   ;        
        String              alias               ;        
        String              line                ;        
        //                                                                          -----------------------------------
	if ((args.length == 1) || (args.length == 2)) {                             // Getcommand line arguments
	    String[] c = args[0].split(":");                                        //
	    host = c[0];                                                            //
	    port = (c.length == 1) ? 443 : Integer.parseInt(c[1]);                  //
	    String p = (args.length == 1) ? "changeit" : args[1] ;                  //
	    passphrase = p.toCharArray()                         ;                  //
	} else {                                                                    //
            sMsg = "Usage: java InstallCert <host>[:port] [passphrase]" ;           //
	    System.out.println(sMsg)                                    ;           //
	    return                                                      ;           //
	}                                                                           //
        //                                                                          -----------------------------------
	file = new File("jssecacerts");
	if (file.isFile() == false) {
	    char   SEP  = File.separatorChar ;
            String sFle                      ;
            File   dir                       ;
            
            sFle = System.getProperty("java.home") ;
            sFle += SEP + "lib"                    ;
            sFle += SEP + "security"               ;
	    dir  = new File(sFle)                  ;
	    file = new File(dir, "jssecacerts")    ;
	    if (file.isFile() == false) {
		file = new File(dir, "cacerts");
	    }
	}
        //                                                                          -----------------------------------        
	System.out.println("Loading KeyStore " + file + "...");        
        in = new FileInputStream(file);
	ks = KeyStore.getInstance(KeyStore.getDefaultType());
	ks.load(in, passphrase);
	in.close();
	context = SSLContext.getInstance("TLS");
	tmf = TrustManagerFactory.getInstance(TrustManagerFactory.getDefaultAlgorithm());
	tmf.init(ks);
	defaultTrustManager = (X509TrustManager)tmf.getTrustManagers()[0];
	tm = new SavingTrustManager(defaultTrustManager);
	context.init(null, new TrustManager[] {tm}, null);
	factory = context.getSocketFactory();
        //                                                                          -----------------------------------        	
        System.out.println("Opening connection to " + host + ":" + port + "...");
	socket = (SSLSocket)factory.createSocket(host, port);
	socket.setSoTimeout(10000);
	try {
	    System.out.println("Starting SSL handshake...");
	    socket.startHandshake();
	    socket.close();
	    System.out.println();
	    System.out.println("No errors, certificate is already trusted");
	} catch (SSLException e) {
	    System.out.println();
	    e.printStackTrace(System.out);
	}
	X509Certificate[] chain = tm.chain;
	if (chain == null) {
	    System.out.println("Could not obtain server certificate chain");
	    return;
	}
	reader = new BufferedReader(new InputStreamReader(System.in));
	System.out.println();
	System.out.println("Server sent " + chain.length + " certificate(s):");
	System.out.println();
	sha1 = MessageDigest.getInstance("SHA1");
	md5 = MessageDigest.getInstance("MD5");
	for (int i = 0; i < chain.length; i++) {
	    cert = chain[i];
            sMsg = " " + (i + 1) + " Subject " + cert.getSubjectDN() ;
	    System.out.println(sMsg) ;
	    System.out.println("   Issuer  " + cert.getIssuerDN());
	    sha1.update(cert.getEncoded());
	    System.out.println("   sha1    " + toHexString(sha1.digest()));
	    md5.update(cert.getEncoded());
	    System.out.println("   md5     " + toHexString(md5.digest()));
	    System.out.println();
	}
        //                                                                          -----------------------------------        	
        sMsg = "Enter certificate to add to trusted keystore or 'q' to quit: [1]" ;
	System.out.println(sMsg);
	line = reader.readLine().trim();
	try {
	    k = (line.length() == 0) ? 0 : Integer.parseInt(line) - 1;
	} catch (NumberFormatException e) {
	    System.out.println("KeyStore not changed");
	    return;
	}
        //                                                                          -----------------------------------        	
	cert = chain[k];
	alias = host + "-" + (k + 1);
	ks.setCertificateEntry(alias, cert);
	out = new FileOutputStream("jssecacerts");
	ks.store(out, passphrase);
	out.close();
        sMsg = "Added certificate to keystore 'jssecacerts'" ;
	sMsg +=	" using alias '" + alias + "'"               ;
	System.out.println()                                 ;
	System.out.println(cert)                             ;
	System.out.println()                                 ;
	System.out.println(sMsg)                             ;
    }
    private static final char[] HEXDIGITS = "0123456789abcdef".toCharArray();
    private static String toHexString(byte[] bytes) {
	StringBuilder sb = new StringBuilder(bytes.length * 3);
	for (int b : bytes) {
	    b &= 0xff;
	    sb.append(HEXDIGITS[b >> 4]);
	    sb.append(HEXDIGITS[b & 15]);
	    sb.append(' ');
	}
	return sb.toString();
    }
    private static class SavingTrustManager implements X509TrustManager {

	private final X509TrustManager tm;
	private X509Certificate[] chain;

	SavingTrustManager(X509TrustManager tm) {
	    this.tm = tm;
	}

	public X509Certificate[] getAcceptedIssuers() {
	    throw new UnsupportedOperationException();
	}

	public void checkClientTrusted(X509Certificate[] chain, String authType)
		throws CertificateException {
	    throw new UnsupportedOperationException();
	}

	public void checkServerTrusted(X509Certificate[] chain, String authType)
		throws CertificateException {
	    this.chain = chain;
	    tm.checkServerTrusted(chain, authType);
	}
    }
}
