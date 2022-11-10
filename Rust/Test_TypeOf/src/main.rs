use std::any::type_name;

struct TStruct   {
   fld_b : bool   ,
   fld_i : i32    ,   
   fld_c : char   ,      
   fld_s : String ,  
}
      
fn type_of<T>(_: T) -> &'static str {
    type_name::<T>()
}

fn main() {
   let b  = true                                ;
   let i  = 21                                  ;
   let f  = 2.5                                 ;
   let c  = 'a'                                 ;
   let s  = "abc"                               ;
   let x  = TStruct                             {  
               fld_b : true                  ,
               fld_i : 123                   ,   
               fld_c : 'a'                   ,      
               fld_s : String::from("abc")   , };     
   //---------------------------------------------
   println!("type of [{}] {}", i , type_of(i) ) ;
   println!("type of [{}] {}", f , type_of(f) ) ;
   println!("type of [{}] {}", c , type_of(c) ) ;
   println!("type of [{}] {}", s , type_of(s) ) ;
   println!("type of TStruct {}" , type_of(x) ) ;
   //---------------------------------------------
}