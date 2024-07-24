import 'dart:isolate';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taler/screen/company.dart';
import 'package:taler/screen/home.dart';
import 'package:taler/screen/login.dart';
import 'package:taler/service/authHelper.dart';
import '../constant/functions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constant/color.dart';
import 'firebase_options.dart';
import 'object/users.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Firestore.initialize('taler-shop');
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1000, 500),
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: cr_pri,
              appBarTheme:
                  AppBarTheme(backgroundColor: Theme.of(context).primaryColor),
              textTheme: null,
            ),
            initialRoute: '/',
            routes: {
              '/splash': (context) => const Spalsh(),
              '/': (context) => GetUser(),
              '/login': (context) => const Login(),
              '/company': (context) => const Company(),
              //'/': (context) => (),
            },
          );
        });
  }
}

class GetUser extends StatelessWidget {
  GetUser({Key? key}) : super(key: key);
  AuthHelper authHelper = AuthHelper();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authHelper.authchanges(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          if (snapshot.hasData) {
            //return const Home();
            return FutureBuilder<Users?>(
              future: authHelper.startup(),
              builder: (context, AsyncSnapshot<Users?> snapshot) {
                return const Home();
                if (!snapshot.hasError) {
                  if (snapshot.connectionState != ConnectionState.active) {
                    if (snapshot.data == null) {
                      return const Home();
                    } else {
                      return const Company();
                    }
                  }
                  return const Loading();
                } else {
                  return Errored(error: '${snapshot.error}1');
                }
              },
            );
          } else {
            return const Login();
          }
        }
        if (snapshot.hasError) {
          return Errored(error: '${snapshot.error}2');
        }
        return const Spalsh();
      },
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: cr_pri.withOpacity(0.7),
          child:
              LoadingAnimationWidget.halfTriangleDot(color: cr_wht, size: 50),
        ),
      ),
    );
  }
}

class Errored extends StatelessWidget {
  Errored({Key? key, required this.error}) : super(key: key);
  String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: cr_pri.withOpacity(0.7),
        child: Center(
          child: Text(
            'error :$error',
            style: TextStyle(color: Colors.redAccent.withOpacity(0.5)),
          ),
        ),
      ),
    );
  }
}

class Inform extends StatelessWidget {
  Inform({Key? key, required this.info}) : super(key: key);
  String info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: cr_pri.withOpacity(0.7),
        child: Center(
          child: Text(
            info,
            style: TextStyle(color: Colors.amber.withOpacity(0.5)),
          ),
        ),
      ),
    );
  }
}

class _SpalshState extends State<Spalsh> {
  @override
  void initState() {
    super.initState();
    mainscreen();
  }

  void mainscreen() async {
    Future.delayed(const Duration(seconds: 4), () async {
      routename(context, '/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              ShaderMask(
                blendMode: BlendMode.srcATop,
                shaderCallback: (boulds) => const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [],
                ).createShader(boulds),
                child: const Icon(
                  CupertinoIcons.heart,
                  size: 100,
                ),
              ),
              hspace(20),
              Text(
                '',
                style: GoogleFonts.dancingScript(
                  fontSize: 30,
                  letterSpacing: 5,
                  fontWeight: FontWeight.w900,
                  color: CupertinoColors.white,
                ),
              ),
              const Spacer(),
              const LinearProgressIndicator(
                minHeight: 10,
                backgroundColor: CupertinoColors.white,
                color: Colors.lightGreen,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Route nextpage(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: animation.drive(
              Tween(begin: const Offset(0.0, 1.0), end: Offset.zero)
                  .chain(CurveTween(curve: Curves.ease))),
          child: child,
        );
      },
    );
  }
}

class Spalsh extends StatefulWidget {
  const Spalsh({Key? key}) : super(key: key);

  @override
  _SpalshState createState() => _SpalshState();
}
