/*
 * Main.java
 *
 * Created on 24 August 2005, 16:13
 *
 */
import org.apache.xmlrpc.client.*;
import java.util.*;
import java.io.*;

//package XmlRpcDebugger;

/**
 *
 * @author Meredydd
 */
public class Main {
    
    /** Creates a new instance of Main */
    public Main() {
    }

    
    
    public static Properties properties;
    
    public static void init()
    {
        properties=new Properties();
        properties.put("xmlrpc.url", "http://betty.userland.com/RPC2");
        properties.put("xmlrpc.prefix", "[]");
        properties.put("xmlrpc.suffix", "[]");
        try
        {
            FileInputStream inp=new FileInputStream("xmlrpc.properties");
            properties.load(inp);
            inp.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void save()
    {
        try
        {
            FileOutputStream out=new FileOutputStream("xmlrpc.properties");
            properties.store(out, "## XML-RPC debugger properties\r\n## (auto-generated)");
            out.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    static String call;
    static int cpos;
    static String token;
    static char terminator;
    static Map vars=new HashMap();
    static String var;
    
    public static Object parseAndExecute(String _call)
    {
        call=_call;
        cpos=0;
        
        try
        {
            return parseNext(false);
        } catch(Exception e) {
            return e;
        }
    }

    private static Object parseNext(boolean allowEmpty) throws Exception
    {
        String varsave=var;
        var=null;
        Object rv=parseCoreObject(allowEmpty);
        System.out.println("Parsed core object "+rv+", terminator='"+terminator+"'");
        if(call.length()>cpos)
            System.out.println("Next char: '"+call.charAt(cpos)+"'");
        
        while(terminator=='[' || terminator=='X' && call.length()>cpos && call.charAt(cpos)=='[')
        {
            if(terminator!='[')
                cpos++;
            
            Object index=parseNext(false);
            if(rv instanceof Vector)
            {
                if(!(index instanceof Integer))
                    pe("Expecting integer index for array");
                rv=((Vector)rv).get(((Integer)index).intValue());
                
            } else if(rv instanceof Hashtable) {
                if(!(index instanceof String))
                    pe("Expecting string index for struct");
                rv=((Hashtable)rv).get(index);
                
                if(rv==null)
                    pe("Struct member \""+index+"\" not found");
            } else {
                System.out.println("Bad ref: "+rv.getClass());
                pe("Only arrays and hashtables can have indices");
            }
            
            if(terminator!=']')
            {
                if(call.length()<=cpos || call.charAt(cpos)!=']')
                    pe("Expecting ']'");
                cpos++;
            }
            terminator='X';
        }
        
        if(var!=null && rv!=null)
            vars.put(var, rv);
        
        var=varsave;
        return rv;
    }
    
    private static Object parseCoreObject(boolean allowEmpty) throws Exception
    {
        char c=readToken();
        
        if(c=='=')
        {
            var=token;
            System.out.println("Assigning result to '"+var+"'");
            c=readToken();
        }

        if(c=='"')
            return token;
        
        if(c=='[' && token.length()==0)
            return parseArray(']');

        if(c=='{')
        {
            if(token.length()!=0)
                pe("Garbage before map");
            else
                return parseMap();
        }
        
        if(token.length()==0)
        {
            if(allowEmpty)
                return null;
            else
                pe("Expected identifier");
        }
        
        try {
            return new Integer(Integer.parseInt(token));
        } catch(NumberFormatException e) {}
        
        if(c!='.')
        {
            if(token.charAt(0)=='$')
                return vars.get(token.substring(1));
            else if(token.equals("true"))
                return new Boolean(true);
            else if(token.equals("false"))
                return new Boolean(false);
            else
                pe("Expected '.'");
        }
        
        String object=parseVarString(token);
        c=readToken();
        if(c!='(')
            pe("Expected '('");
        String method=parseVarString(token);
        
        System.out.println("Marshalling call to "+object+"."+method);
        
        Vector args=parseArray(')');
        
        System.out.println("Calling: "+object+"."+method+args);
        
        Object rv=doRPC(object+"."+method, args);
        
        return rv;
    }

    private static Vector parseArray(char end) throws Exception
    {
        Vector retval=new Vector();
        
        while(true)
        {
            Object r=parseNext(retval.isEmpty());
            if(r==null)
            {
                if(terminator==end)
                {
                    terminator='X';
                    return retval;
                } else {
                    pe("Expected data or '"+end+"'");
                }
            }
            
            retval.add(r);
            
            token="";
            
            if(terminator!=',' && terminator!=end)
                readToken();
            
            int oldcpos=cpos;
            if(terminator!=',' && terminator!=end || token.length()!=0)
                pe("Expected ',' or '"+end+"'", oldcpos);
            
            if(terminator==end)
            {
                terminator='X';
                return retval;
            }
        }
    }
    
    private static Hashtable parseMap() throws Exception
    {
        throw new Exception("I'm a lazy sod - passing structs is not yet supported!");
    }
    
    
    private static String parseVarString(String s) throws ParseException
    {
        Object r=parseVar(s);
        if(!(r instanceof String))
            pe("Variable '"+s.substring(1)+"' must be a string to be used here");
        
        return (String)r;
    }
    
    private static Object parseVar(String s)
    {
        if(s.length()>0 && s.charAt(0)=='$')
            return vars.get(s.substring(1));
        return s;
    }
    
    private static char readToken()
    {
        token="";
        terminator='\0';
        StringBuffer tok=new StringBuffer();
        
        for(; cpos<call.length() && call.charAt(cpos)==' '; cpos++);
        if(cpos==call.length())
            return '\0';
        
        if(call.charAt(cpos)=='"')
        {
            cpos++;
            for(; cpos<call.length() && call.charAt(cpos)!='"'; cpos++)
                tok.append(call.charAt(cpos));
            if(cpos==call.length())
                return '\0';

            token=tok.toString();
            terminator='"';
            cpos++;
            return '"';
        }
        
        for(; cpos<call.length(); cpos++)
        {
            char c=call.charAt(cpos);
            
            if(c==' ')
                continue;
            
            if(c==',' || c=='(' || c==')' || c=='.' || c=='='
                    || c=='[' || c==']' || c=='{' || c=='}')
            {
                token=tok.toString();
                terminator=c;
                cpos++;
                return c;
            }
            
            tok.append(c);
        }
        
        terminator='\0';
        token=tok.toString();
        return '\0';
    }

    private static void pe(String s) throws ParseException
    { throw new ParseException(s, cpos); }

    private static void pe(String s, int pos) throws ParseException
    { throw new ParseException(s, pos); }
    
    private static Object doRPC(String method, Object[] params)
    {
        try
        {
            return doRPC(method, new Vector(Arrays.asList(params)));
        } catch(Exception e) {
            return e.toString();
        }
    }
    
    private static boolean prefixNesting=false;
    
    private static Object doRPC(String method, Vector v) throws Exception
    {
        String url=properties.getProperty("xmlrpc.url");
        System.out.println("init client on "+url);
        XmlRpcClient client=new org.apache.xmlrpc.client.XmlRpcClient(url);
        String part="Eek!";
        String call_temp;
        int cpos_temp;
        if(!prefixNesting)
        {
            prefixNesting=true;
            call_temp=call;
            cpos_temp=cpos;
            try
            {
                String prefix=properties.getProperty("xmlrpc.prefix");
                String suffix=properties.getProperty("xmlrpc.suffix");

                if(prefix!=null)
                {
                    part="Prefix";
                    call=prefix;
                    cpos=0;
                    Object parsed=parseNext(true);
                    if(parsed==null)
                    {} // ignore
                    else if(parsed instanceof Vector) {
                        v.addAll(0, (Vector)parsed);
                    } else {
                        v.add(0, parsed);
                    }
                }
                
                if(suffix!=null)
                {
                    part="Suffix";
                    call=suffix;
                    cpos=0;
                    Object parsed=parseNext(true);
                    if(parsed==null)
                    {} // ignore
                    else if(parsed instanceof Vector) {
                        v.addAll((Vector)parsed);
                    } else {
                        v.add(parsed);
                    }
                }

            } catch(ParseException e) {
                throw new ParseException(part+" parsing failed: "+e.getMessage(), 0);
            } finally {
                prefixNesting=false;
                call=call_temp;
                cpos=cpos_temp;
            }
        }
        System.out.println("Finally calling "+method+v);
        return client.execute(method, v);
    }
}
