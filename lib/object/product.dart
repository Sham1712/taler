// ignore_for_file: camel_case_types

import 'customer.dart';

const String col_name = 'name';
const String col_gst = 'gst';
const String col_categname = 'categname';
const String col_stock = 'stock';
const String col_wholeprice = 'wholeprice';
const String col_hsncode = 'hsncode';
const String col_retailprice = 'retailprice';
const String col_quantitymeasure = 'quantitymeasure';

class Product{

  String? id;
  String name,categname,hsncode,quantitymeasure;
  int stock,wholeprice, retailprice;
  double gst;


  Product({
    this.id,
    required this.name,
    required this.gst,
    required this.categname,
    required this.stock,
    required this.wholeprice,
    required this.hsncode,
    required this.retailprice,
    required this.quantitymeasure,
  });

  factory Product.fromMap(Map<String, dynamic> map) =>  Product(
    id : map[col_id],
    name : map[col_name],
    gst : map[col_gst],
    categname : map[col_categname],
    stock : map[col_stock],
    wholeprice : map[col_wholeprice],
    hsncode : map[col_hsncode],
    retailprice : map[col_retailprice],
    quantitymeasure : map[col_quantitymeasure],
  );

  Map<String, dynamic> toMap() {
    return {
      col_id: id,
      col_name: name,
      col_gst: gst,
      col_categname: categname,
      col_stock: stock,
      col_wholeprice: wholeprice,
      col_hsncode: hsncode,
      col_retailprice: retailprice,
      col_quantitymeasure: quantitymeasure,
    };
  }

}