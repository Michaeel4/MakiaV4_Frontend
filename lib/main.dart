import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:makia_f/components/signin.dart';

import 'package:makia_f/screens/MainScreen.dart';
import 'package:makia_f/constants.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyCri56Md337jl5OQN9HIiKFTk0dOa8TpnM ",
        appId: "1:889727265283:web:0bc4b76043c6def1d13c36",
        messagingSenderId: "889727265283",
        projectId: "makia-f6a07",
        databaseURL:
            "https://makia-f6a07-default-rtdb.europe-west1.firebasedatabase.app/"),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Makia V4',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: const MainScreen(title: 'hans'),
      routes: <String, WidgetBuilder>{
        '/signin': (BuildContext context) => const LoginPage(title: 'an'),
      },
    );
  }
}
