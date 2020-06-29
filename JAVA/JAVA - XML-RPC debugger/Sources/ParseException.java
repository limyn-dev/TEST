/*
 * ParseException.java
 *
 * Created on 25 August 2005, 10:19
 *
 */

//package XmlRpcDebugger;

/**
 *
 * @author Meredydd
 */
public class ParseException extends Exception {
    
    int where;
    String err;
            
    /** Creates a new instance of ParseException */
    public ParseException(String s, int w) {
        super("<br><font color=red>"+s+" at "+w+"</font>");
        where=w;
        err=s;
    }
    
    public int getWhere() { return where; }
}
