import 'package:bechdoapp/Auth.dart';
import 'package:bechdoapp/Screen/detailAdScreen.dart';
import 'package:bechdoapp/Screen/home_page.dart';
import 'package:bechdoapp/Screen/listView.dart';
import 'package:bechdoapp/Screen/login_page.dart';
import 'package:bechdoapp/imageUpload.dart';
import 'package:flutter/material.dart';
import 'Screen/adsPost.dart';
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
      home:HomePage(
      auth: Auth(),

      ),
    );
  }
}
