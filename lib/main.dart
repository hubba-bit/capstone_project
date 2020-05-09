import 'package:flutter/material.dart';
import 'login_page.dart';
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
        accentColor: Colors.green,

      ),
      home: LoginPage(),
    );
  }
}
