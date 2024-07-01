

// ignore_for_file: camel_case_types

import 'package:taler/object/party.dart';

import 'bank.dart';

const String col_name = 'name';
const String col_size = 'size';
const String col_gst = 'gst';
const String col_itemgname = 'itemgname';
const String col_openingstock = 'openingstock';
const String col_sellingprie = 'sellingprie';
const String col_hsncode = 'hsncode';
const String col_ = '';

class Item{

  String? id;
  String name,itemgname,hsncode;
  int size,openingstock,sellingprie;
  double gst;


  Item({
    this.id,
    required this.name,
    required this.size,
    required this.gst,
    required this.itemgname,
    required this.openingstock,
    required this.sellingprie,
    required this.hsncode,
  });

  factory Item.fromMap(Map<String, dynamic> map) =>  Item(
    id : map[col_id],
    name : map[col_name],
    size : map[col_size],
    gst : map[col_gst],
    itemgname : map[col_itemgname],
    openingstock : map[col_openingstock],
    sellingprie : map[col_sellingprie],
    hsncode : map[col_hsncode],
   // : map[col_],
  );

  Map<String, dynamic> toMap() {
    return {
      col_id: id,
      col_name: name,
      col_size: size,
      col_gst: gst,
      col_itemgname: itemgname,
      col_openingstock: openingstock,
      col_sellingprie: sellingprie,
      col_hsncode: hsncode,
     // col_: ,
    };
  }

}