import 'package:bechdoapp/Auth.dart';
import 'package:bechdoapp/Screen/home_page.dart';
import 'package:bechdoapp/Screen/login_page.dart';
import 'package:flutter/material.dart';
import 'Screen/landingPage.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'olx',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        backgroundColor: Colors.black54,

      ),
      home: LandingPage(
        auth: Auth(),

      ),
    );
  }
}
