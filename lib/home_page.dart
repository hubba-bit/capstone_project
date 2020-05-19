import 'package:bechdoapp/login_page.dart';
import 'package:bechdoapp/menuButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'Auth.dart';

class HomePage extends StatelessWidget {
  final context;
  HomePage({
    @required this.auth,
    this.context,
  });
  final AuthBase auth;
  Future<void> _signOut() async {
    try {
      auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /* leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.menu),
        ),
*/
        title: Text(
          'All Categories',
          style: TextStyle(
            fontSize: 22.0,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          /* IconButton(onPressed: (){},
            icon: Icon(Icons.search),
          ),*/
          FlatButton(
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            onPressed: _signOut,
          )
        ],
      ),
      body: _homePageContent(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _homePageContent() {
    return Container(
      /*decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),*/
      padding: EdgeInsets.all(25.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 9.0,
          ),
          Row(
            children: <Widget>[
              MenuButton(
                text: "Vehicles",
                icon: Icons.directions_car,
              ),
              SizedBox(
                width: 12.0,
              ),
              MenuButton(
                text: "Mobiles",
                icon: Icons.smartphone,
              ),
            ],
          ),
          SizedBox(
            height: 18.0,
          ),
          Row(
            children: <Widget>[
              MenuButton(
                text: "Animals",
                icon: Icons.pets,
              ),
              SizedBox(
                width: 12.0,
              ),
              MenuButton(
                text: "Property",
                icon: Icons.home,
              ),
            ],
          ),
          SizedBox(
            height: 18.0,
          ),
          Row(
            children: <Widget>[
              MenuButton(
                text: "Jobs",
                icon: Icons.business_center,
              ),
              SizedBox(
                width: 12.0,
              ),
              MenuButton(
                text: "Electronics",
                icon: Icons.laptop_chromebook,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future navigateToSubPage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
}
