fn main() {
   
   let a: [i32;5] = [1,2,3,4,5] ;
   
   println!("Size of a [{}]", a.len() );
   
   println!("a {:?}"        , a       );
   
   println!("a[0] = {}"     , a[0]    );
   println!("a[1] = {}"     , a[1]    );
   println!("a[2] = {}"     , a[2]    );
   println!("a[3] = {}"     , a[3]    );
   println!("a[4] = {}"     , a[4]    );
   
   for i in a.iter()                   {
      println!("iter :[{}]"   ,i      );
   }
   
   for e in a                          {
      println!("Element :[{}]" ,e     );
   }
   
   
}

