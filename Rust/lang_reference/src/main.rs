
struct TRecord {  fld_i32 : i32
               ,  fld_str : String
               }

fn main        (                          )                                         {
   //                                                                               -----------------------------------
   let mut n  = 123                                                              ;  //
   let mut s  = String::from("abc")                                              ;  //
   let mut r  = TRecord                                                       {     //
      fld_i32 : 456                                                           ,     //
      fld_str : String::from("qmno")                                          }  ;  //
   //                                                                               -----------------------------------
   println!("-----------------------------------------------------------------") ;  //
   println!("main      : Initials values:"                                     ) ;  //
   echo_i32("Value of n", &n)                                                    ;  //
   echo_str("Value of s", &s)                                                    ;  //
   echo_rec("Value of r", &r)                                                    ;  //
   //                                                                               -----------------------------------
   println!("----------------------------------------------------------------")  ;  //
   println!("main      : Update values"                                       )  ;  //
   update_i32(&mut n)                                                            ;  //
   update_str(&mut s)                                                            ;  //
   update_rec(&mut r)                                                            ;  //
   //                                                                               -----------------------------------
   println!("----------------------------------------------------------------")  ;  //
   println!("main      : After update:"                                       )  ;  //
   echo_i32("Value of n", &n)                                                    ;  //
   echo_str("Value of s", &s)                                                    ;  //
   echo_rec("Value of r", &r)                                                    ;  //
   //                                                                               -----------------------------------
}
fn echo_i32    (label:&str, value:&i32    )                                         {
   //
   println!("echo_i32  : {} [{}]",label, value)                                  ;
}
fn update_i32  (value:&mut i32            )                                         {
   *value = 789                                                                  ;
}
fn echo_str    (label:&str, value:&String )                                         {
   println!("echo_str  : {} [{}]", label, value)                                 ;
}
fn update_str  (value:&mut String         )                                         {
   *value = String::from("xyz")                                                  ;
}
fn echo_rec    (label:&str, value:&TRecord)                                         {
   println!("echo_rec  : {}:           ", label          )                       ;
   println!("echo_rec  :   fld_i32 [{}]", value.fld_i32  )                       ;
   println!("echo_rec  :   fld_str [{}]", value.fld_str  )                       ;
}
fn update_rec  (value:&mut TRecord        )                                         {
   value.fld_i32 = value.fld_i32+1                                               ;
   value.fld_str = String::from("New String")                                    ;
}