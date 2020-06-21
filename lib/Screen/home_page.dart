import 'package:bechdoapp/Screen/login_page.dart';
import 'package:bechdoapp/menuButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../Auth.dart';
import 'adsPost.dart';

class HomePage extends StatelessWidget {
  final AuthBase auth;

  final context;
  HomePage({
    @required this.auth,
    this.context,
  });
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

      floatingActionButton: Container(
        height: 65.0,
        width: 65.0,
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AdsPost()));
          },
          elevation: 5.0,
          splashColor: Colors.grey,
        ),

      ),
     
      appBar: AppBar(
        elevation: 10.0,
        /* leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.menu),
        ),
*/
        title: Text(
          'Categories',
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
      body: _homePageContent(context),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _homePageContent(BuildContext context) {
    final height = ((MediaQuery.of(context).size.height - 90) / 3) - 24;
    final double width = (MediaQuery.of(context).size.width / 2) - 28;

    return Container(
      padding: EdgeInsets.all(18),
      child: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                height: height,
                width: width,
                child: MenuButton(
                  text: "Vehicles",
                  icon: Icons.directions_car,
                ),
              ),
              SizedBox(
                width: 18.0,
              ),
              SizedBox(
                height: height,
                width: width,
                child: MenuButton(
                  text: "Mobiles",
                  icon: Icons.smartphone,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 18.0,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                height: height,
                width: width,
                child: MenuButton(
                  text: "Animals",
                  icon: Icons.pets,
                ),
              ),
              SizedBox(
                width: 18.0,
              ),
              SizedBox(
                height: height,
                width: width,
                child: MenuButton(
                  text: "Property",
                  icon: Icons.home,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 18.0,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                height: height,
                width: width,
                child: MenuButton(
                  text: "Jobs",
                  icon: Icons.business_center,
                ),
              ),
              SizedBox(
                width: 18.0,
              ),
              SizedBox(
                height: height,
                width: width,
                child: MenuButton(
                  text: "Electronics",
                  icon: Icons.laptop_chromebook,
                ),
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
