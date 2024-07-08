
// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import '../constant/functions.dart';
import '../object/users.dart';

class AuthHelper{

  static FirebaseAuth firebaseauth = FirebaseAuth.instance;

  static User? get myuser => FirebaseAuth.instance.currentUser;

  static DocumentReference get docuser => FirebaseFirestore.instance.doc('/Users/${myuser!.uid}');

  Stream<User?> authchanges() => firebaseauth.authStateChanges();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInGoogle() async {
    const clientId = '398496650641-ukp9oios96n9ruu3pupqh114pddctq4k.apps.googleusercontent.com';
    const scopes = ['email', 'profile', 'openid'];
    const redirectUri = 'http://localhost';

    final authUrl =
        'https://accounts.google.com/o/oauth2/auth?client_id=$clientId&redirect_uri=$redirectUri&response_type=code&scope=${scopes.join(' ')}';
    final responseUrl = await _launchUrl(authUrl);

    if (responseUrl != null) {
      final Uri responseUri = Uri.parse(responseUrl);
      final code = responseUri.queryParameters['code'];

      const tokenUrl = 'https://oauth2.googleapis.com/token';
      final response = await http.post(
        Uri.parse(tokenUrl),
        body: {
          'code': code,
          'client_id': clientId,
          'client_secret': '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',
          'redirect_uri': redirectUri,
          'grant_type': 'authorization_code',
        },
      );

      if (response.statusCode == 200) {
        final tokenData = json.decode(response.body);
        final accessToken = tokenData['access_token'];
        final idToken = tokenData['id_token'];

        final credential = GoogleAuthProvider.credential(
          accessToken: accessToken,
          idToken: idToken,
        );
        final userCredential = await _auth.signInWithCredential(credential);
        //createUser();
        return userCredential.user;
      }
    }
    return null;
  }

  Future<String?> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url, webOnlyWindowName: '_self');
      final completer = Completer<String?>();
      HttpServer.bind('localhost', 80).then((server) {
        server.listen((HttpRequest request) async {
          final responseUrl = request.uri.toString();
          request.response
            ..statusCode = 200
            ..headers.contentType = ContentType.html
            ..write('You can close this window now.');
          await request.response.close();
          await server.close();
          completer.complete(responseUrl);
        });
      });
      return completer.future;
    }
    return null;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
  Future<User?> signInAnonymously() async {
    UserCredential userCredential = await firebaseauth.signInAnonymously();
    return userCredential.user;
  }

  Stream<Users?> startup() {
    addlogins();
    return docuser.snapshots().map((data) => data.data()==null ? null : Users.fromMap(data.data() as Map<String,dynamic>));
  }

  Future<void> createUser(Users users) async {
    docuser.get().then((value) {
      if (value.exists) {
        return;
      } else {
        docuser.set(users.toMap());
      }
    });
    return;
  }

  Future<void> addlogins() async {
    if (myuser != null) {
      docuser.update({
        col_logins: FieldValue.arrayUnion([timenow.substring(0,16)])
      });
    } else {
      msg('Finish your login');
    }
  }

// 2023-08-14T14:33:54.796907
// 12345678901234567890
}