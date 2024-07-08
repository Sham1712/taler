
const String col_invoiceNum = 'invoiceNum';
const String col_partyid = 'partyid';
const String col_billDate = 'billDate';
const String col_saleType = 'saleType';
const String col_description = 'description';
const String col_totalQuantity = 'totalQuantity';
const String col_referenceBy = 'referenceBy';
const String col_totalAmount = 'totalAmount';

class Bill {

  int totalAmount,totalQuantity;
  String partyid,billDate,saleType,description,referenceBy;
  String? invoiceNum;

  Bill({
    required this.invoiceNum,
    required this.partyid,
    required this.billDate,
    required this.saleType,
    required this.description,
    required this.totalQuantity,
    required this.referenceBy,
    required this.totalAmount,
  });

  factory Bill.fromMap(Map<String, dynamic> map) =>  Bill(
    invoiceNum : map[col_invoiceNum],
    partyid : map[col_partyid],
    billDate : map[col_billDate],
    saleType : map[col_saleType],
    description : map[col_description],
    totalQuantity : map[col_totalQuantity],
    referenceBy : map[col_referenceBy],
    totalAmount : map[col_totalAmount],
   // : map[col_],
  );

  Map<String, dynamic> toMap() {
    return {
      col_invoiceNum: invoiceNum,
      col_partyid: partyid,
      col_billDate: billDate,
      col_saleType: saleType,
      col_description: description,
      col_totalQuantity: totalQuantity,
      col_referenceBy: referenceBy,
      col_totalAmount: totalAmount,
     // col_: ,
    };
  }

}