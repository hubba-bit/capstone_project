import 'package:bechdoapp/Auth.dart';
import 'package:flutter/material.dart';
import 'landingPage.dart';
import 'package:bechdoapp/Auth.dart';

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
