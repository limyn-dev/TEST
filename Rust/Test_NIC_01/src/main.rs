use std::any::type_name_of_val;
use network_interface::NetworkInterface;
use network_interface::NetworkInterfaceConfig;

fn print_type_of<T>(_: &T) {
    println!("{}", std::any::type_name::<T>())
}

fn main() {
    let oNil = NetworkInterface::show().unwrap();
    let sTpe = std::any::type_name::<T>()
    println!("{}", type_name_of_val(oNil));
//    for i in .iter() {
//        println!("{}", type_name_of_val(&itf.name));
//        println!("name     {:?} {}", itf.name, &itf.name );
//        println!("addr 4   {:?}", itf.addr.V4  );
//        println!("addr 6   {:?}", itf.addr.V6  );
 //       println!("mac_addr {:?}", itf.mac_addr );
    //}
}