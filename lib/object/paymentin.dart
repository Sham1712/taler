// ignore_for_file: camel_case_types


import 'customer.dart';

const String col_invoiceid = 'invoiceid';
const String col_customerid = 'customerid';
const String col_amount = 'amount';
const String col_date = 'date';
const String col_mode = 'mode';
const String col_bank = 'bank';
const String col_billadjamount = 'billadjamount';
const String col_notes = 'notes';

class PaymentIn{

  double amount, billadjamount;
  DateTime date;
  String invoiceid, customerid, mode, bank, notes;
  String? id;

  PaymentIn({
    this.id,
    required this.invoiceid,
    required this.customerid,
    required this.amount,
    required this.date,
    required this.mode,
    required this.bank,
    required this.billadjamount,
    required this.notes,
  });

  factory PaymentIn.fromMap(Map<String, dynamic> map) =>  PaymentIn(
    id : map[col_id],
    invoiceid : map[col_invoiceid],
    customerid : map[col_customerid],
    amount : map[col_amount],
    date : map[col_date],
    mode : map[col_mode],
    bank : map[col_bank],
    billadjamount : map[col_billadjamount],
    notes : map[col_notes],
   // : map[col_],
  );

  Map<String, dynamic> toMap() {
    return {
      col_id: id,
      col_invoiceid: invoiceid,
      col_customerid: customerid,
      col_amount: amount,
      col_date: date,
      col_mode: mode,
      col_bank: bank,
      col_billadjamount: billadjamount,
      col_notes: notes,
     // col_: ,
    };
  }

}