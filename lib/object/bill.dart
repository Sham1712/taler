
//const String col_id = 'id';
//const String col_id = '';

import 'customer.dart';

class Objname {

  //int ;
  //String ;
  String? id; //use ? for nullable datatype

  Objname({
    this.id, //if this field is can be null
    //required this., //if this field is required
    //required this.,
  });

  factory Objname.fromMap(Map<String, dynamic> map) =>  Objname(
    id : map[col_id],
    // : map[col_],
  );

  Map<String, dynamic> toMap() {
    return {
      col_id: id,
      //col_: ,
    };
  }

}