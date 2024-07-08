// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../object/product.dart';
import '../object/party.dart';
import 'authHelper.dart';

class BillHelper {

  FirebaseFirestore store = FirebaseFirestore.instance;
  User? user = AuthHelper.myuser;

  CollectionReference get colpat =>
      store.collection('/users/${user!.uid}/party/');

  CollectionReference get colitm =>
      store.collection('/users/${user!.uid}/product/');

  CollectionReference get colbnk =>
      store.collection('/users/${user!.uid}/bank/');

  CollectionReference get colbil =>
      store.collection('/users/${user!.uid}/bill/');

  CollectionReference get colsit =>
      store.collection('/users/${user!.uid}/saleitem/');

  Future<void> addparty(Party party) async {
    party.id = DateTime.now().toIso8601String();
    return await colpat.doc(party.id).set(party.toMap());
  }

  Future<void> updateparty(Party party) async {
    return await colpat.doc(party.id).update(party.toMap());
  }


  Future<void> deleteparty(Party party) async {
    return await colpat.doc(party.id).delete();
  }

  Stream<List<Party>> getparties() {
    final snapshots = colpat.orderBy(col_id,descending: true).snapshots();
    return snapshots.map(
      (snapshot) => snapshot.docs.map(
        (snapshot) {
          final data = snapshot.data();
          return Party.fromMap(data as Map<String, dynamic>);
        },
      ).toList()
    ).asBroadcastStream();
  }

  Future<void> addproduct(Product product) async {
    product.id = DateTime.now().toIso8601String();
    return await colpat.doc(product.id).set(product.toMap());
  }

  Future<void> updateproduct(Party product) async {
    return await colpat.doc(product.id).update(product.toMap());
  }

  Future<void> deleteproduct(Party product) async {
    return await colpat.doc(product.id).delete();
  }

  Stream<List<Party>> getproducts() {
    final snapshots = colpat.orderBy(col_id,descending: true).snapshots();
    return snapshots.map(
      (snapshot) => snapshot.docs.map(
        (snapshot) {
          final data = snapshot.data();
          return Party.fromMap(data as Map<String, dynamic>);
        },
      ).toList()
    ).asBroadcastStream();
  }

  Future<void> add(Party party) async {
    party.id = DateTime.now().toIso8601String();
    return await colpat.doc(party.id).set(party.toMap());
  }

  Future<void> update(Party party) async {
    return await colpat.doc(party.id).update(party.toMap());
  }

  Future<void> delete(Party party) async {
    return await colpat.doc(party.id).delete();
  }

  Stream<List<Party>> getlist() {
    final snapshots = colpat.orderBy(col_id,descending: true).snapshots();
    return snapshots.map(
      (snapshot) => snapshot.docs.map(
        (snapshot) {
          final data = snapshot.data();
          return Party.fromMap(data as Map<String, dynamic>);
        },
      ).toList()
    ).asBroadcastStream();
  }

}