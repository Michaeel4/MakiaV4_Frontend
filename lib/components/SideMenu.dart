import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:makia_f/jwt_token.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _signOut() async {
      storage.delete(key: 'jwt');

      var jwt = await storage.read(key: 'jwt');

      if (jwt == null) {
        print("jwt is null");
        Navigator.pushNamed(context, '/signin');
      }
      // await FirebaseAuth.instance
      //     .signOut()
      //     .then((value) => Navigator.pushNamed(context, '/signin'));
    }

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Container(
                  child: Text("Makia V3"),
                  alignment: Alignment.center,
                  height: 10)
              //Image.asset("assets/images/logo.png"),
              ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "../../assets/icons/menu_dashbord.svg",
            press: () {},
          ),
          DrawerListTile(
              title: "Settings",
              svgSrc: "assets/icons/menu_setting",
              press: () {}),
          DrawerListTile(
              title: "Sign Out",
              svgSrc: "assets/icons/menu_setting",
              press: () {
                _signOut();
              })
          // DrawerListTile(
          //   title: "Documents",
          //   svgSrc: "assets/icons/menu_doc.svg",
          //   press: () {},
          // ),
          // DrawerListTile(
          //   title: "Notification",
          //   svgSrc: "assets/icons/menu_notification.svg",
          //   press: () {},
          // ),
          // DrawerListTile(
          //   title: "Profile",
          //   svgSrc: "assets/icons/menu_profile.svg",
          //   press: () {},
          // ),
          // DrawerListTile(
          //   title: "Settings",
          //   svgSrc: "assets/icons/menu_setting.svg",
          //   press: () {},
          // ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      // leading: SvgPicture.asset(
      //   svgSrc,
      //   color: Colors.white54,
      //   height: 16,
      // ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
