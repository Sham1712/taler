

// ignore_for_file: camel_case_types

const String col_id = 'id';
const String col_name = 'name';
const String col_gstin = 'gstin';
const String col_address = 'address';
const String col_city = 'city';
const String col_pincode = 'pincode';
const String col_state = 'state';
const String col_mobileno = 'mobileno';
const String col_openbal = 'openbal';
const String col_type = 'type';
const String col_isgst = 'isgst';
const String col_email = 'email';

class Customer{

  String? id;
  String name,gstin,address,city,state,phone,email;
  bool type, isgst;
  int pincode;
  double openbal;

  Customer({
    this.id,
    required this.name,
    required this.gstin,
    required this.address,
    required this.city,
    required this.pincode,
    required this.state,
    required this.phone,
    required this.openbal,
    required this.type,
    required this.isgst,
    required this.email,
  });

  @override
  String toString() {
    return name;
  }

  factory Customer.fromMap(Map<String, dynamic> map) =>  Customer(
    id : map[col_id],
    name : map[col_name],
    gstin : map[col_gstin],
    address : map[col_address],
    city : map[col_city],
    pincode : map[col_pincode],
    state : map[col_state],
    phone : map[col_mobileno],
    openbal : map[col_openbal],
    type : map[col_type],
    isgst : map[col_isgst],
    email : map[col_email],
  );

  Map<String, dynamic> toMap() {
    return {
      col_id: id,
      col_name: name,
      col_gstin: gstin,
      col_address: address,
      col_city: city,
      col_pincode: pincode,
      col_state: state,
      col_mobileno: phone,
      col_openbal: openbal,
      col_type: type,
      col_isgst: isgst,
      col_email: email,
    };
  }

}