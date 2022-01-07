package jeudelavie;

public class JeuDeLaVie {

   public final static int LARGEUR = 100;
   public final static int HAUTEUR = 100;
   public final static int TAILLE_POINT_EN_PIXELS = 5;
   public final static int FPS = 1;

   public static void        main(String[] args)                                    {
      /*-------------------------------------------------------------------------*/
      /*-------------------------------------------------------------------------*/
      go();   // Cette méthode est dans la zone de code cachée, il ne faut rien toucher !!!
   }
   public static boolean[][] creerPlateauDuJeuDeLaVie(int largeur, int hauteur)     {
      /*-------------------------------------------------------------------------*/
      /*-------------------------------------------------------------------------*/
      boolean[][] plateau = new boolean[largeur][hauteur];
      return plateau;
   }
   public static boolean[][] remplirPlateauDuJeuDeLaVie(boolean[][] plateau)        {
      /*----------------------------------------------------------------------------*/
      /*----------------------------------------------------------------------------*/
      //                                                                            -----------------------------------
      for (int i = 0; i < plateau.length; i++) {                                    // Parcourt des colonnes
         for (int j = 0; j < plateau[i].length; j++) {                              // Parcourt des lignes
            plateau[i][j] = false ;                                                 //    Initialisation de la cellule faux
            int n = (int)(Math.random() * 1000) ;                                   //    Nomre aléatoire entre 0 et 1000
            if (n > 100) {plateau[i][j] = true ;}                                   //    Si > 890, cellule est true
         }                                                                          //
      }                                                                             //
      //                                                                            -----------------------------------
      return plateau;                                                               // Retourne le plateau
   }
   public static int         calculNbreDeVoisins(boolean[][] plateau, int x, int y) {
      /* ----------------------------------------------------------------------------
              GAUCHE              DROITE
            |---------+---------+---------|
      HAUT  |(x-1;y+1)| (x;y+1) |(x+1;y+1)|
            |---------+---------+---------|
            | (x-1;y) |  (x;y)  | (x+1;y) |
            +---------+---------+---------|
      BAS   |(x-1;y-1)| (x;y-1) |(x+1;y-1)|
            +---------+---------+---------|
      ----------------------------------------------------------------------------- */
      //                                                                            -----------------------------------
      //System.out.println("calculNbreDeVoisins");                                    //
      // Calcul des index des cellules voisines                                     >----------------------------------
      int xM = plateau.length - 1      ;                                            // x max
      int yM = plateau[0].length - 1   ;                                            // y max
      int xD = x + 1 ;                                                              // X de la colonne de droite.
      int xG = x - 1 ;                                                              // X de la colonne de gauche.
      int yH = y + 1 ;                                                              // Y de la ligne du dessus (haut).      
      int yB = x - 1 ;                                                              // Y de la ligne du dessous (bas).      
      // Détection de la limite du plateau                                          >-----------------------------------
      if (xD > xM) { xD = 0   ; }                                                   // Si après la fin du plateau, retour à la première colonne.
      if (xG < 0)  { xG = xM  ; }                                                   // Si avant la première colonne, retour à la dérnière colonne.
      if (yH > yM) { yH = 0   ; }                                                   // Si après la dérnière ligne, retour à la première ligne.
      if (yB < 0)  { yB = yM  ; }                                                   // Si avant la première ligne (y<0) retour à la dérnière ligne.
      // Calcul des valeur des cellules voisines                                    >----------------------------------      
      int SommeVoisins = 0 ;                                                        //
      if (plateau[xG][yH]) { SommeVoisins++ ; }                                     // Valeur de la cellule gauche/haut
      if (plateau[xG][y] ) { SommeVoisins++ ; }                                     // Valeur de la cellule gauche            
      if (plateau[xG][yB]) { SommeVoisins++ ; }                                     // Valeur de la cellule gauche/bas
      if (plateau[x][yH] ) { SommeVoisins++ ; }                                     // Valeur de la cellule haut
      if (plateau[x][yB] ) { SommeVoisins++ ; }                                     // Valeur de la cellule bas
      if (plateau[xD][yH]) { SommeVoisins++ ; }                                     // Valeur de la cellule droite/haut
      if (plateau[xD][y] ) { SommeVoisins++ ; }                                     // Valeur de la cellule droite
      if (plateau[xD][yB]) { SommeVoisins++ ; }                                     // Valeur de la cellule droite/bas
      // Echo                                                                       >----------------------------------            
      //System.out.println("["+plateau[xG][yH]+"]["+plateau[x][yH]+"]["+plateau[xD][yH]+"]") ;
      //System.out.println("["+plateau[xG][y] +"]["+plateau[x][y] +"]["+plateau[xD][y] +"]") ;
      //System.out.println("["+plateau[xG][yB]+"]["+plateau[x][yB]+"]["+plateau[xD][yB]+"]") ;
      //System.out.println("SommeVoisins["+x+"]["+y+"]=["+SommeVoisins+"]") ;
      //                                                                            -----------------------------------      
      return SommeVoisins;                                                          // retourne la somme des voisines
   }
   public static boolean[][] calculerProchainEtat(boolean[][] plateau)              {
      /* ----------------------------------------------------------------------------
      ----------------------------------------------------------------------------- */
      //                                                                            -----------------------------------
      System.out.println("calculerProchainEtat");                                   //
      //                                                                            ----------------------------------
      for (int x=0; x < plateau.length; x++) {                                      // Parcourt colonnes
         for (int y=0; y < plateau[x].length; y++) {                                // Parcourt lignes
            int nbv = calculNbreDeVoisins(plateau, x, y) ;                          //
            if (plateau[x][y]) {                                                    //
               if (nbv < 2 || nbv > 3) { plateau[x][y] = false ; }                  //
            }                                                                       //
            else {                                                                  //
               if (nbv == 3) { plateau[x][y] = true ; }                             //
            }                                                                       //
         }                                                                          // 
      }                                                                             //
      //                                                                            ----------------------------------      
      return plateau ;                                                              // retourne le plateau     
   }

// <editor-fold defaultstate="collapsed" desc="NE RIEN TOUCHER AU CODE CACHÉ ICI !!! ok">                          
   public static void go() {
      // Définir le look&feel visuel des fenêtres Swing
      javax.swing.JFrame.setDefaultLookAndFeelDecorated(true);

      // Créer une instance du jeu et le démarrer
      JeuDeLaVie jeuDeLaVie = new JeuDeLaVie();
      jeuDeLaVie.start();
   }
   public void start() {
      // On crée une tâche qui va créer une fenêtre (notre LifeFrame) et le rendre visible à l'écran
      // Ce LifeFrame contient le jPanel modifié qui affichera l'évolution du "jeu de la vie"
      java.awt.EventQueue.invokeLater(new Runnable() {
         @Override
         public void run() {
            new LifeFrame().setVisible(true);
         }
      });
   }
   public class LifePanel extends javax.swing.JPanel {

      // Le contenu des cellules du jeu
      private boolean[][] etat;

      public LifePanel() {
         // Création des cellules du jeu de la vie
         this.etat = creerPlateauDuJeuDeLaVie(LARGEUR, HAUTEUR);
         remplirPlateauDuJeuDeLaVie(this.etat);
         
         java.awt.Dimension dimensions = new java.awt.Dimension(LARGEUR * TAILLE_POINT_EN_PIXELS, HAUTEUR * TAILLE_POINT_EN_PIXELS);
         setPreferredSize(dimensions);
         setMinimumSize(dimensions);
         setMaximumSize(dimensions);
         setBackground(java.awt.Color.BLACK); // L'ensemble du fond est noir

         // Créer un timer qui se chargera de calculer le prochain état et de l'afficher à la fréquence demandée
         // Si FPS = 2 c'est-à-dire 2x par seconde => 1000/2 = 500ms d'attente entre deux affichages
         javax.swing.Timer animation = new javax.swing.Timer(FPS * 1000, new java.awt.event.ActionListener() {
            @Override
            public void actionPerformed(java.awt.event.ActionEvent e) {
               // Cycle du jeu de la vie
               etat = calculerProchainEtat(etat);
               // Redessiner le contenu
               repaint();
            }
            });

         // Ajouter un écouteur pour les clicks dans la fenêtre pour arrêter/démarrer l'animation
         addMouseListener(new java.awt.event.MouseAdapter() {
            @Override
            public void mousePressed(java.awt.event.MouseEvent e) {
               if (animation.isRunning()) {
                  animation.stop();
               } else {
                  animation.start();
               }
            }

            @Override
            public void mouseReleased(java.awt.event.MouseEvent e) {
            }
            });

         // Par défaut l'animation est dans l'état démarrée
         animation.start();
      }

      @Override
      public void paintComponent(java.awt.Graphics g) {

         // On demande au parent de se redessiner 
         super.paintComponent(g);
         // Cellule par cellule, les dessiner selon leur états
         for (int i = 0; i < this.etat.length; i++) {
            for (int j = 0; j < etat[0].length; j++) {
               g.setColor(etat[i][j] ? java.awt.Color.GREEN : java.awt.Color.DARK_GRAY);
               g.fillRect(j * TAILLE_POINT_EN_PIXELS, i * TAILLE_POINT_EN_PIXELS, TAILLE_POINT_EN_PIXELS - 1, TAILLE_POINT_EN_PIXELS - 1);
           }
         }
      }
   }
   public class LifeFrame extends javax.swing.JFrame {
      /**
        * Creates new form NewJFrame
        */
      public LifeFrame() {
         jLifePanel = new LifePanel();

         setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
         setTitle("Jeu de la vie - Module 403 - Paul Friedli 2017/2018");

         setResizable(false);
         setLayout(new java.awt.BorderLayout());
         add(jLifePanel, java.awt.BorderLayout.CENTER);
         pack();
         setLocationRelativeTo(null);  //Screen center
         setVisible(true);
      }
      private LifePanel jLifePanel;
   }
}

// </editor-fold>             

