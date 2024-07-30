// ignore_for_file: camel_case_types


import 'customer.dart';

const String col_name = 'name';
const String col_number = 'number';
const String col_bankname = 'bankname';
const String col_branchname = 'branchname';
const String col_ifsccode = 'ifsccode';

class Bank{

  int number;
  String name, bankname, branchname, ifsccode;
  String? id;

  Bank({
    required this.id,
    required this.name,
    required this.number,
    required this.bankname,
    required this.branchname,
    required this.ifsccode,
  });

  factory Bank.fromMap(Map<String, dynamic> map) =>  Bank(
    id : map[col_id],
    name : map[col_name],
    number : map[col_number],
    bankname : map[col_bankname],
    branchname : map[col_branchname],
    ifsccode : map[col_ifsccode],
   // : map[col_],
  );

  Map<String, dynamic> toMap() {
    return {
      col_id: id,
      col_name: name,
      col_number: number,
      col_bankname: bankname,
      col_branchname: branchname,
      col_ifsccode: ifsccode,
     // col_: ,
    };
  }

}