import 'package:flutter/material.dart';

class _myListView extends StatefulWidget {
  @override
  __myListViewState createState() => __myListViewState();
}

class __myListViewState extends State<_myListView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: <Widget>[
        ListTile(
        leading: CircleAvatar(
        backgroundImage: AssetImage('assets/sun.jpg'),
    ),
    title: Text('Sun'),
          subtitle: Text('millions miles away'),
    ),
    ListTile(
    leading: CircleAvatar(
    backgroundImage: AssetImage('assets/moon.jpg'),
    ),
    title: Text('Moon'),
    ),
    ListTile(
    leading: CircleAvatar(
    backgroundImage: AssetImage('assets/planet.jpg'),
    ),
    title: Text('Star'),
    ),
    ],
    );
  }
}
