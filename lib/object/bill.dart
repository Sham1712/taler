
import 'billproduct.dart';

const String col_customerid = 'customerid';
const String col_reference = 'reference';
const String col_despatchthrough = 'despatchthrough';
const String col_date = 'date';
const String col_iswithgst = 'iswithgst';
const String col_additionalcharges = 'additionalcharges';
const String col_chargesdecription = 'chargesdecription';
const String col_extradiscount = 'extradiscount';

class Bill {

  double extradiscount, additionalcharges;
  bool iswithgst;
  DateTime date;
  String customerid;
  String? id, reference, despatchthrough, chargesdecription; //use ? for nullable datatype

  Bill({
    this.id, //if this field is can be null
    required this.customerid, //if this field is required
    required this.reference,
    required this.despatchthrough,
    required this.date,
    required this.iswithgst,
    required this.additionalcharges,
    required this.chargesdecription,
    required this.extradiscount,
  });

  factory Bill.fromMap(Map<String, dynamic> map) =>  Bill(
    id : map[col_id],
    customerid : map[col_customerid],
    reference : map[col_reference],
    despatchthrough : map[col_despatchthrough],
    date : map[col_customerid],
    iswithgst : map[col_iswithgst],
    additionalcharges : map[col_additionalcharges],
    chargesdecription : map[col_chargesdecription],
    extradiscount : map[col_extradiscount],
  );

  Map<String, dynamic> toMap() {
    return {
      col_id: id,
      col_customerid: customerid,
      col_reference: reference,
      col_despatchthrough: despatchthrough,
      col_date: date,
      col_iswithgst: iswithgst,
      col_additionalcharges: additionalcharges,
      col_chargesdecription: chargesdecription,
      col_extradiscount: extradiscount,
    };
  }

}