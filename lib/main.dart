import 'package:bechdoapp/Auth.dart';
import 'package:bechdoapp/home_page.dart';
import 'package:bechdoapp/login_page.dart';
import 'package:flutter/material.dart';
import 'landingPage.dart';

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
      home: HomePage(
        auth: Auth(),

      ),
    );
  }
}
