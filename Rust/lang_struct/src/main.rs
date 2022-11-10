
struct TRecord { s_fld1: String
               , s_fld2: String
               , n_fld3: i32
               } 



fn main()                                    {
   
   let stc_record  = TRecord              {   
          s_fld1 : String::from("Field 1"),
          s_fld2 : String::from("Field 2"),
          n_fld3 : 123                    }  ;
 
   println!("sFld1 [{}]", stc_record.s_fld1) ;
   println!("sFld2 [{}]", stc_record.s_fld2) ;
   println!("nFld3 [{}]", stc_record.n_fld3) ;
 
}
