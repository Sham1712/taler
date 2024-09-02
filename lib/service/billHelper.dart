// ignore_for_file: constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firedart/firestore/firestore.dart';
import 'package:firedart/firestore/models.dart';
import 'package:taler/object/paymentin.dart';
import 'package:taler/object/vendor.dart';

import '../object/bill.dart';
import '../object/product.dart';
import '../object/customer.dart';
import 'authHelper.dart';

class BillHelper {

  Firestore store = Firestore.instance;
  User? user = AuthHelper.myuser;

  CollectionReference get colcus =>
      store.collection('/users/${user!.uid}/customer');

  CollectionReference get colpro =>
      store.collection('/users/${user!.uid}/product');

  CollectionReference get colbnk =>
      store.collection('/users/${user!.uid}/bank');

  CollectionReference get colbil =>
      store.collection('/users/${user!.uid}/bill');

  CollectionReference get colven =>
      store.collection('/users/${user!.uid}/vendor');

  CollectionReference get colpay =>
      store.collection('/users/${user!.uid}/payment');


  Future<void> addcustomer(Customer customer) async {
    customer.id = DateTime.now().toIso8601String();
    return await colcus.document(customer.id!).set(customer.toMap());
  }

  Future<void> updatecustomer(Customer customer) async {
    return await colcus.document(customer.id!).update(customer.toMap());
  }


  Future<void> deletecustomer(Customer customer) async {
    return await colcus.document(customer.id!).delete();
  }

  Stream<List<Customer>> getcustomers() {
    final snapshots = colcus.orderBy(col_id,descending: true).get().asStream();
    return snapshots.map(
      (snapshot) => snapshot.map(
        (snapshot) {
          return Customer.fromMap(snapshot.map);
        },
      ).toList()
    ).asBroadcastStream();
  }

  Future<void> addproduct(Product product) async {
    product.id = DateTime.now().toIso8601String();
    return await colpro.document(product.id!).set(product.toMap());
  }

  Future<void> updateproduct(Product product) async {
    return await colpro.document(product.id!).update(product.toMap());
  }

  Future<void> deleteproduct(Product product) async {
    return await colpro.document(product.id!).delete();
  }

  Stream<List<Product>> getproducts() {
    final snapshots = colpro.orderBy(col_id,descending: true).get().asStream();
    return snapshots.map(
      (snapshot) => snapshot.map(
        (snapshot) {
          return Product.fromMap(snapshot.map);
        },
      ).toList()
    ).asBroadcastStream();
  }

  Future<void> addbill(Bill bill) async {
    bill.id = DateTime.now().toIso8601String();
    return await colbil.document(bill.id!).set(bill.toMap());
  }

  Future<void> updatebill(Bill bill) async {
    return await colbil.document(bill.id!).update(bill.toMap());
  }

  Future<void> deletebill(Bill bill) async {
    return await colbil.document(bill.id!).delete();
  }

  Stream<List<Bill>> getbills() {
    final snapshots = colbil.orderBy(col_id,descending: true).get().asStream();
    return snapshots.map(
      (snapshot) => snapshot.map(
        (snapshot) {
          return Bill.fromMap(snapshot.map);
        },
      ).toList()
    ).asBroadcastStream();
  }

  Future<void> addvendor(Vendor vendor) async {
    vendor.id = DateTime.now().toIso8601String();
    return await colven.document(vendor.id!).set(vendor.toMap());
  }

  Future<void> updatevendor(Vendor vendor) async {
    return await colven.document(vendor.id!).update(vendor.toMap());
  }

  Future<void> deletevendor(Vendor vendor) async {
    return await colven.document(vendor.id!).delete();
  }

  Stream<List<Vendor>> getvendors() {
    final snapshots = colven.orderBy(col_id,descending: true).get().asStream();
    return snapshots.map(
      (snapshot) => snapshot.map(
        (snapshot) {
          return Vendor.fromMap(snapshot.map);
        },
      ).toList()
    ).asBroadcastStream();
  }

  Future<void> addpayment(Payment payment) async {
    payment.id = DateTime.now().toIso8601String();
    return await colpay.document(payment.id!).set(payment.toMap());
  }

  Future<void> updatepayment(Payment payment) async {
    return await colpay.document(payment.id!).update(payment.toMap());
  }

  Future<void> deletepayment(Payment payment) async {
    return await colpay.document(payment.id!).delete();
  }

  Stream<List<Payment>> getpayments() {
    final snapshots = colpay.orderBy(col_id,descending: true).get().asStream();
    return snapshots.map(
      (snapshot) => snapshot.map(
        (snapshot) {
          return Payment.fromMap(snapshot.map);
        },
      ).toList()
    ).asBroadcastStream();
  }

  /*Future<void> add(Customer customer) async {
    customer.id = DateTime.now().toIso8601String();
    return await colpat.document(customer.id!).set(customer.toMap());
  }

  Future<void> update(Customer customer) async {
    return await colpat.document(customer.id!).update(customer.toMap());
  }

  Future<void> delete(Customer customer) async {
    return await colpat.document(customer.id!).delete();
  }

  Stream<List<Customer>> getlist() {
    final snapshots = colpat.orderBy(col_id,descending: true).get().asStream();
    return snapshots.map(
      (snapshot) => snapshot.map(
        (snapshot) {
          return Customer.fromMap(snapshot.map);
        },
      ).toList()
    ).asBroadcastStream();
  }

   */

}