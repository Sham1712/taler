// ignore_for_file: constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firedart/firestore/firestore.dart';
import 'package:firedart/firestore/models.dart';

import '../object/product.dart';
import '../object/party.dart';
import 'authHelper.dart';

class BillHelper {


  Firestore store = Firestore.instance;
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
    return await colpat.document(party.id).set(party.toMap());
  }

  Future<void> updateparty(Party party) async {
    return await colpat.document(party.id).update(party.toMap());
  }


  Future<void> deleteparty(Party party) async {
    return await colpat.document(party.id).delete();
  }

  Stream<List<Party>> getparties() {
    final snapshots = colpat.orderBy(col_id,descending: true).get().asStream();
    return snapshots.map(
      (snapshot) => snapshot.map(
        (snapshot) {
          return Party.fromMap(snapshot.map);
        },
      ).toList()
    ).asBroadcastStream();
  }

  Future<void> addproduct(Product product) async {
    product.id = DateTime.now().toIso8601String();
    return await colpat.document(product.id!).set(product.toMap());
  }

  Future<void> updateproduct(Party product) async {
    return await colpat.document(product.id).update(product.toMap());
  }

  Future<void> deleteproduct(Party product) async {
    return await colpat.document(product.id).delete();
  }

  Stream<List<Party>> getproducts() {
    final snapshots = colpat.orderBy(col_id,descending: true).get().asStream();
    return snapshots.map(
      (snapshot) => snapshot.map(
        (snapshot) {
          return Party.fromMap(snapshot.map);
        },
      ).toList()
    ).asBroadcastStream();
  }

  Future<void> add(Party party) async {
    party.id = DateTime.now().toIso8601String();
    return await colpat.document(party.id).set(party.toMap());
  }

  Future<void> update(Party party) async {
    return await colpat.document(party.id).update(party.toMap());
  }

  Future<void> delete(Party party) async {
    return await colpat.document(party.id).delete();
  }

  Stream<List<Party>> getlist() {
    final snapshots = colpat.orderBy(col_id,descending: true).get().asStream();
    return snapshots.map(
      (snapshot) => snapshot.map(
        (snapshot) {
          return Party.fromMap(snapshot.map);
        },
      ).toList()
    ).asBroadcastStream();
  }

}