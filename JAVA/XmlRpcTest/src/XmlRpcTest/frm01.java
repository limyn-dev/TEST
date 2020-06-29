/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package XmlRpcTest;

//import java.net.URL;
//import org.apache.commons.lang.StringUtils;
//import org.apache.xmlrpc.XmlRpcException;
//import org.apache.xmlrpc.client.XmlRpcClient;
//import org.apache.xmlrpc.client.XmlRpcClientConfigImpl;
import com.debortoliwines.openerp.api.*;
/*
 * 
 * ********************************************************************************************************************
 * 
 */
public class frm01 extends javax.swing.JFrame {
    //
    // ********** STATIC **********************************************************************************************
    //
    public static void main(String args[]) {
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } 
        catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(frm01.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } 
        catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(frm01.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } 
        catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(frm01.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } 
        catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(frm01.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //                                                                          -----------------------------------
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() { new frm01().setVisible(true); }
        });
        //                                                                          -----------------------------------        
    }
    //
    // ********** INTERFACE *******************************************************************************************
    //
    public frm01() {
        initComponents();
    }
    //
    // ********** MEMBERS *********************************************************************************************
    //
    private com.debortoliwines.openerp.api.Session mySes = null ;
    //
    // ********** PRIVATE *********************************************************************************************
    //
    @SuppressWarnings("unchecked")
    private void Lg(String sText)   {
        String sMsg ;
        //                                                                          -----------------------------------
        sMsg = this.txt01.getText() ;                                               //
        sMsg += sText + "\n"        ;                                               //
        this.txt01.setText(sMsg)    ;                                               //
        //                                                                          -----------------------------------        
    }
    private void Le(Exception e)    {
        Lg("ERROR! " + e.getMessage()) ;
    }
    private int  Connect()          {
        String                         sPro = "https"       ;                       //
        String                         sSrv = "open-net.ch" ;                       //
        int                            nPrt = 11871         ;                       //
        String                         sDtb = "empart"      ;                       //
        String                         sUsr = "yvesd"       ;                       //
        String                         sPsw = "=bbwkee91"   ;                       //
        OpenERPXmlRpcProxy.RPCProtocol oPro                 ;                       //
        //                                                                          -----------------------------------
        System.setProperty("javax.net.ssl.keyStore", "jssecacerts");  
        System.setProperty("javax.net.ssl.keyStorePassword", "");  

        Lg("Create session object")  ;                                              // Create session
        oPro =OpenERPXmlRpcProxy.RPCProtocol.RPC_HTTPS ;                            //
        try { mySes = new Session(oPro, sSrv, nPrt, sDtb, sUsr, sPsw) ; }           //
        catch (Exception e) { Le(e);  return -1;                        }           //
        //                                                                          -----------------------------------
        Lg("Start session")  ;                                                      // Start session
        try                 { mySes.startSession(); }                               //
        catch (Exception e) { Le(e); return -2;     }                               //
        //                                                                          -----------------------------------
        return 0 ;                                                                  //
    }
    //
    // ********** AUTO ************************************************************************************************
    //    
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jTabbedPane1 = new javax.swing.JTabbedPane();
        jScrollPane1 = new javax.swing.JScrollPane();
        txt01 = new javax.swing.JTextPane();
        btn01 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jTabbedPane1.setName("jtp01"); // NOI18N

        jScrollPane1.setViewportView(txt01);

        jTabbedPane1.addTab("tab1", jScrollPane1);

        btn01.setText("jButton1");
        btn01.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn01ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(btn01)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jTabbedPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 714, Short.MAX_VALUE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jTabbedPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 600, Short.MAX_VALUE)
                .addContainerGap())
            .addGroup(layout.createSequentialGroup()
                .addGap(31, 31, 31)
                .addComponent(btn01)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents
    private void btn01ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn01ActionPerformed
        this.Connect() ;
    }//GEN-LAST:event_btn01ActionPerformed
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btn01;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTabbedPane jTabbedPane1;
    private javax.swing.JTextPane txt01;
    // End of variables declaration//GEN-END:variables

    
}
