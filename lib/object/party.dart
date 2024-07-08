

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

class Party{

  String id,name,gstin,address,city,state,mobileno;
  bool type;
  int pincode, openbal;

  Party({
    required this.id,
    required this.name,
    required this.gstin,
    required this.address,
    required this.city,
    required this.pincode,
    required this.state,
    required this.mobileno,
    required this.openbal,
    required this.type,
  });

  factory Party.fromMap(Map<String, dynamic> map) =>  Party(
    id : map[col_id],
    name : map[col_name],
    gstin : map[col_gstin],
    address : map[col_address],
    city : map[col_city],
    pincode : map[col_pincode],
    state : map[col_state],
    mobileno : map[col_mobileno],
    openbal : map[col_openbal],
    type : map[col_type],
   // : map[col_],
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
      col_mobileno: mobileno,
      col_openbal: openbal,
      col_type: type,
     // col_: ,
    };
  }

}