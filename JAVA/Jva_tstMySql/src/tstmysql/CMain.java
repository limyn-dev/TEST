package tstmysql;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2000
 * Company:
 * @author
 * @version 1.0
 */

public class CMain
   {

   public CMain(){ }

   public static void main(String[] args)
      {
      CDtb dtb = new CDtb() ;
      dtb.SetName("test") ;
      dtb.SetUser("root") ;
      dtb.Open("root") ;
      dtb.Execute("SELECT * FROM personnes") ;
      dtb.Close() ;
      }
   }