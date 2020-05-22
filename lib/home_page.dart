import 'package:bechdoapp/login_page.dart';
import 'package:bechdoapp/menuButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'Auth.dart';
import 'package:flutter/src/widgets/media_query.dart';

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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
        elevation: 5.0,
        splashColor: Colors.blueGrey,
      ),
      appBar: AppBar(
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
    final double height = ((MediaQuery.of(context).size.height - 90) / 3) - 24;
    final double width = (MediaQuery.of(context).size.width / 2) - 27;

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
                height: 160,
                width: width,
                child: MenuButton(
                  text: "Mobiles",
                  icon: Icons.smartphone,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                height: height,
                width: 145.0,
                child: MenuButton(
                  text: "Animals",
                  icon: Icons.pets,
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              SizedBox(
                height: 160.0,
                width: 145.0,
                child: MenuButton(
                  text: "Property",
                  icon: Icons.home,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                height: height,
                width: 145.0,
                child: MenuButton(
                  text: "Jobs",
                  icon: Icons.business_center,
                ),
              ),
              SizedBox(
                width: 18.0,
              ),
              SizedBox(
                height: 160.0,
                width: 145.0,
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
