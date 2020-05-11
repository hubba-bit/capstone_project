import 'package:bechdoapp/home_page.dart';
import 'package:bechdoapp/login_page.dart';
import 'package:flutter/material.dart';

import 'Auth.dart';

class LandingPage extends StatelessWidget {
  final AuthBase auth;

  const LandingPage({Key key, this.auth}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: auth.onAuthStateChanged,
      builder: (context, snapshots) {
        if (snapshots.connectionState == ConnectionState.active) {
          User user = snapshots.data;
          if (user == null) {
            return LoginPage(
              auth: auth,
            );
          }
          else {
            return HomePage(
              auth: auth,
            );
          }
        }
        else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}