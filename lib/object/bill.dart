
import 'dart:convert';

import 'billproduct.dart';
import 'customer.dart';

const String col_customerid = 'customerid';
const String col_reference = 'reference';
const String col_despatchthrough = 'despatchthrough';
const String col_date = 'date';
const String col_total = 'total_amount';
const String col_iswithgst = 'iswithgst';
const String col_additionalcharges = 'additionalcharges';
const String col_chargesdecription = 'chargesdecription';
const String col_extradiscount = 'extradiscount';
const String col_products = 'products';


class Bill {

  double extradiscount, additionalcharges,total;
  bool iswithgst;
  DateTime date;
  String customerid;
  String? id, reference, despatchthrough, chargesdecription;
  List<Billproduct> products;

  Bill({
    this.id,
    required this.customerid,
    required this.reference,
    required this.despatchthrough,
    required this.total,
    required this.date,
    required this.iswithgst,
    required this.additionalcharges,
    required this.chargesdecription,
    required this.extradiscount,
    required this.products,
  });

  factory Bill.fromMap(Map<String, dynamic> map) =>  Bill(
    id : map[col_id],
    customerid : map[col_customerid],
    reference : map[col_reference],
    despatchthrough : map[col_despatchthrough],
      total : map[col_total],
    date : map[col_customerid],
    iswithgst : map[col_iswithgst],
    additionalcharges : map[col_additionalcharges],
    chargesdecription : map[col_chargesdecription],
    extradiscount : map[col_extradiscount],
    products: List.castFrom(map[col_products]).map((pro)=> Billproduct.fromMap(jsonDecode(pro))).toList()
  );

  Map<String, dynamic> toMap() {
    List<String> pros = [];
    products.forEach((product){
      pros.add(product.toMap());
    });
    return {
      col_id: id,
      col_customerid: customerid,
      col_reference: reference,
      col_despatchthrough: despatchthrough,
      col_total: total,
      col_date: date,
      col_iswithgst: iswithgst,
      col_additionalcharges: additionalcharges,
      col_chargesdecription: chargesdecription,
      col_extradiscount: extradiscount,
      col_products: pros,
    };
  }

}