import 'package:bechdoapp/Screen/login_page.dart';
import 'package:bechdoapp/Screen/platformAlertDialog.dart';
import 'package:bechdoapp/menuButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import '../Auth.dart';

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

  Future<bool> deleteDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure you want to Log out'),
            actions: <Widget>[
              FlatButton(
                child: Text('Yes'),
                onPressed: () async {
                  await _signOut();
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        backgroundColorStart: Colors.indigo[400],
        backgroundColorEnd: Colors.indigo,
        elevation: 30.0,
        /* leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.menu),
        ),
*/
        title: Text(
          'CATEGORIES',
          style: TextStyle(
            fontSize: 23.0,
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
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              deleteDialog(context);
            },
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
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.grey[400], Colors.white30, Colors.grey[600]],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      padding: EdgeInsets.all(19),
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

/*Future navigateToSubPage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
}*/
