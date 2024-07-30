// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firedart/firestore/firestore.dart';
import 'package:firedart/firestore/models.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import '../constant/functions.dart';
import '../object/users.dart';

class AuthHelper {
  static FirebaseAuth firebaseauth = FirebaseAuth.instance;

  static User get myuser => FirebaseAuth.instance.currentUser!;

  static DocumentReference get docuser  => Firestore.instance.document('/users/${myuser.uid}');

  Stream<User?> authchanges() => firebaseauth.authStateChanges();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInGoogle() async {
    const clientId =
        '398496650641-ukp9oios96n9ruu3pupqh114pddctq4k.apps.googleusercontent.com';
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
        createUser();
        print(userCredential.user);
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
    _auth.signOut();
  }

  Future<Users?> startup() async{
    return Users.fromMap((await (await docuser).get()).map);
  }

  Future<void> createUser() async {
    User user = myuser;
    Users users = Users(
        uid: user.uid,
        ename: user.displayName!,
        crtime: timenow,
        logins: [timenow],
        email: user.email!,
        url: user.photoURL!,
        name: '',
        address: '',
        gstin: '',
        city: '',
        pincode: '',
        state: '',
        mobileno: '',
    );

    docuser.set(users.toMap());
    return;
  }

  Future<void> updateUser(Users users) async {
    (await docuser).update(users.toMap()).then((h){},onError: (e){
      msg(e.toString());
    });
    return;
  }

  Future<void> addlogins() async {
    if ((myuser) != null) {
      List<String> logins = (await (await docuser).get()).map[col_logins];
      logins.add(timenow.substring(0, 16));
      (await docuser).update({
        col_logins: logins
      });
    } else {
      msg('Finish your login');
    }
  }

// 2023-08-14T14:33:54.796907
// 12345678901234567890
}