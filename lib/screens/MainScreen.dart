import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:makia_f/components/SideMenu.dart';
import 'package:provider/provider.dart';
import 'package:makia_f/responsive.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:makia_f/components/DashBoardScreen.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:makia_f/jwt_token.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _counter = 0;
  final storage = const FlutterSecureStorage();
  User? _user;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  Future<User?> getUser() async {
    var u = FirebaseAuth.instance.currentUser;
    Future.delayed(Duration(seconds: 2), () {
      return FirebaseAuth.instance.currentUser;
    });
  }

  Future getUserData() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user?.uid != "") {
      } else {
        Navigator.pushNamed(context, '/signin');
      }
    }).onDone(() {});
  }

  // This function checks whetever there is a valid JWT token stored or not
  Future<void> isLogged() async {
    var jwt = await storage.read(key: 'jwt');

    if (jwt != null) {
    } else if (jwt == null) {
      Navigator.pushNamed(context, '/signin');
      return;
    }
  }

  Future<void> _signOut() async {
    storage.delete(key: 'jwt');

    var jwt = await storage.read(key: 'jwt');

    if (jwt == null) {
      print("jwt is null");
      Navigator.pushNamed(context, '/signin');
    }
  }

  @override
  initState() {
    super.initState();
    isLogged();
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((timestamp) {
    // });
    // WidgetsBinding.instance.addPostFrameCallback((timestamp) {
    //   getUserData();
    // });
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        drawer: const SideMenu(),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ));
  }
}
