package ObjTst;

import java.util.*  ;

public class C_Objs extends C_Obj implements Collection
  {

  private C_Clt clt = new C_Clt[1] ;

  public C_Objs() {}

  public void     clear      ()             {}  // Removes all of the elements from this collection (optional operation).
  public int      hashCode   ()             {}  // Returns the hash code value for this collection.
  public boolean  isEmpty    ()             {}  // Returns true if this collection contains no elements.
  public Iterator iterator   ()             {}  // Returns an iterator over the elements in this collection.
  public int      size       ()             {}  // Returns the number of elements in this collection.
  public Object[] toArray    ()             {}  // Returns an array containing all of the elements in this collection.

  public boolean  add        (Object o)     {}  // Ensures that this collection contains the specified element (optional operation).
  public boolean  contains   (Object o)     {}  // Returns true if this collection contains the specified element.
  public boolean  equals     (Object o)     {}  // Compares the specified object with this collection for equality. 
  public boolean  remove     (Object o)     {}  // Removes a single instance of the specified element from this collection, if it is present (optional operation).

  public boolean  addAll     (Collection c) {}  // Adds all of the elements in the specified collection to this collection (optional operation).
  public boolean  containsAll(Collection c) {}  // Returns true if this collection contains all of the elements in the specified collection.
  public boolean  removeAll  (Collection c) {}  // Removes all this collection's elements that are also contained in the specified collection (optional operation).
  public boolean  retainAll  (Collection c) {}  // Retains only the elements in this collection that are contained in the specified collection (optional operation).

  public Object[] toArray    (Object[] a)   {}  // Returns an array containing all of the elements in this collection whose runtime type is that of the specified array. 

  }
