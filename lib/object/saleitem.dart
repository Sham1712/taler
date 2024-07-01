

// ignore_for_file: camel_case_types

import 'package:taler/object/party.dart';

const String col_name = 'name';
const String col_qty = 'qty';
const String col_rate = 'rate';
const String col_disper = 'disper';
const String col_cgstper = 'cgstper';
const String col_sgstper = 'sgstper';

class Saleitem{

  int qty;
  String name;
  String? id;
  double rate,disper,cgstper,sgstper;

  Saleitem({
    required this.id,
    required this.name,
    required this.qty,
    required this.rate,
    required this.disper,
    required this.cgstper,
    required this.sgstper,
  });

  factory Saleitem.fromMap(Map<String, dynamic> map) =>  Saleitem(
    id : map[col_id],
    name : map[col_name],
    qty : map[col_qty],
    rate : map[col_rate],
    disper : map[col_disper],
    cgstper : map[col_cgstper],
    sgstper : map[col_sgstper],
   // : map[col_],
  );

  Map<String, dynamic> toMap() {
    return {
      col_id: id,
      col_name: name,
      col_qty: qty,
      col_rate: rate,
      col_disper: disper,
      col_cgstper: cgstper,
      col_sgstper: sgstper,
     // col_: ,
    };
  }

}