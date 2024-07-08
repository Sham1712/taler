// ignore_for_file: camel_case_types

import 'package:taler/object/party.dart';

const String col_name = 'name';
const String col_gst = 'gst';
const String col_categname = 'categname';
const String col_stock = 'stock';
const String col_price = 'price';
const String col_hsncode = 'hsncode';
//const String col_ = '';

class Product{

  String? id;
  String name,categname,hsncode;
  int stock,price;
  double gst;


  Product({
    this.id,
    required this.name,
    required this.gst,
    required this.categname,
    required this.stock,
    required this.price,
    required this.hsncode,
  });

  factory Product.fromMap(Map<String, dynamic> map) =>  Product(
    id : map[col_id],
    name : map[col_name],
    gst : map[col_gst],
    categname : map[col_categname],
    stock : map[col_stock],
    price : map[col_price],
    hsncode : map[col_hsncode],
   // : map[col_],
  );

  Map<String, dynamic> toMap() {
    return {
      col_id: id,
      col_name: name,
      col_gst: gst,
      col_categname: categname,
      col_stock: stock,
      col_price: price,
      col_hsncode: hsncode,
     // col_: ,
    };
  }

}