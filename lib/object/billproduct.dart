const String col_id = 'id';
const String col_category = 'category';
const String col_productid = 'productid';
const String col_quantity = 'quantity';
const String col_price = 'price';
const String col_dicountpercent = 'dicountpercent';
const String col_extranotes = 'extranotes';

class Billproduct {

  double quantity, price, dicountpercent;
  String category, productid;
  String? id, extranotes;

  Billproduct({
    this.id,
    required this.category,
    required this.productid,
    required this.quantity,
    required this.price,
    required this.dicountpercent,
    required this.extranotes,
  });

  factory Billproduct.fromMap(Map<String, dynamic> map) =>  Billproduct(
    id : map[col_id],
    category: map[col_category],
    productid: map[col_productid],
    quantity: map[col_quantity],
    price: map[col_price],
    dicountpercent: map[col_dicountpercent],
    extranotes: map[col_extranotes],
  );

  Map<String, dynamic> toMap() {
    return {
      col_id: id,
      col_category: category,
      col_productid: productid,
      col_quantity: quantity,
      col_price: price,
      col_dicountpercent: dicountpercent,
      col_extranotes: extranotes,
    };
  }

}