import 'package:admin/controllers/MenuController.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/side_menu.dart';
import './landing.dart';

import 'components/signup.dart';
import 'components/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var signed_in = false;
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        signed_in = true;

        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Landing()));

        // Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (context) => HomeScreen()));

        print(user.uid);
      } else {
        signed_in = false;
      }
    });
    print(signed_in);

    // return Scaffold(
    //   key: context.read<MenuController>().scaffoldKey,
    //   drawer: SideMenu(),
    //   body: SafeArea(
    //     child: Row(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         // We want this side menu only for large screen
    //         if (Responsive.isDesktop(context))
    //           Expanded(
    //             // default flex = 1
    //             // and it takes 1/6 part of the screen
    //             child: SideMenu(),
    //           ),
    //         Expanded(
    //           // It takes 5/6 part of the screen
    //           flex: 5,
    //           child: DashboardScreen(),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            // if (Responsive.isDesktop(context))
            //   Expanded(
            //     // default flex = 1
            //     // and it takes 1/6 part of the screen
            //     child: SideMenu(),
            //   ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: LoginPage(title: "hans"),
            ),
          ],
        ),
      ),
    );
  }
}
