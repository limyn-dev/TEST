use std::any::type_name;

fn main() {
   let v = vec!['A','B','C','D']           ;
   let l = v.len()                         ;
   println!("Type of v [{}]"  , type_of(v));      
   println!("Len of v  [{}]"  , l         );      

   let i = v.iter()                        ;         
   println!("Iter of v [{:?}]", i         );         
   
//   for e in i                             {
//      println!("v [{}]", e);              }
   
}
fn type_of<T>(_: T) -> &'static str {
    type_name::<T>()
}