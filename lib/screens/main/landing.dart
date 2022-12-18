import 'package:admin/controllers/MenuController.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/side_menu.dart';

import 'components/signup.dart';
import 'components/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';

// class LandingPage extends StatefulWidget {
//   const LandingPage({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   State<LandingPage> createState() => _LandingPageState();
// }

class LandingPageState extends StatelessWidget {
  const LandingPageState({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
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
        ),
      ),
    );
  }
}
