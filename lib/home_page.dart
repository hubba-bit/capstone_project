

import 'package:bechdoapp/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'Auth.dart';
import 'customRaisedBtn.dart';

class HomePage extends StatelessWidget {
  final context;
  HomePage({@required this.auth, this.context,});
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
              customRaisedBtn(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        onPressed:(){

                        },

                        color: Colors.blue,
                        padding: EdgeInsets.all(10.0),
                        shape: CircleBorder(),
                        child: Column(
                          // Rep
                          // lace with a Row for horizontal icon + text
                          children: <Widget>[
                            Icon(
                              Icons.directions_car,
                              size: 33.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Vehicles',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
                onPressed: () {
                  navigateToSubPage(context);

                },
                borderRadius: 20.0,
              ),
              SizedBox(
                width: 12.0,
              ),
              customRaisedBtn(
               
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () => {},
                        color: Colors.blue,
                        padding: EdgeInsets.all(10.0),
                        shape: CircleBorder(),
                        child: Column(
                          // Rep
                          // lace with a Row for horizontal icon + text
                          children: <Widget>[
                            Icon(
                              Icons.smartphone,
                              size: 33.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Mobiles',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
                onPressed: () {},
                borderRadius: 20.0,
              ),
            ],
          ),
          SizedBox(
            height: 18.0,
          ),
          Row(
            children: <Widget>[
              customRaisedBtn(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () => {},
                        color: Colors.blue,
                        padding: EdgeInsets.all(10.0),
                        shape: CircleBorder(),
                        child: Column(
                          // Rep
                          // lace with a Row for horizontal icon + text
                          children: <Widget>[
                            Icon(
                              Icons.pets,
                              size: 33.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Animals',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
                onPressed: () {},
                borderRadius: 20.0,
              ),
              SizedBox(
                width: 12.0,
              ),
              customRaisedBtn(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () => {},
                        color: Colors.blue,
                        padding: EdgeInsets.all(10.0),
                        shape: CircleBorder(),
                        child: Column(
                          // Rep
                          // lace with a Row for horizontal icon + text
                          children: <Widget>[
                            Icon(
                              Icons.home,
                              size: 33.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Property',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
                onPressed: () {},
                borderRadius: 20.0,
              ),
            ],
          ),
          SizedBox(
            height: 18.0,
          ),
          Row(
            children: <Widget>[
              customRaisedBtn(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () => {},
                        color: Colors.blue,
                        padding: EdgeInsets.all(10.0),
                        shape: CircleBorder(),
                        child: Column(
                          // Rep
                          // lace with a Row for horizontal icon + text
                          children: <Widget>[
                            Icon(
                              Icons.business_center,
                              size: 33.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Jobs',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
                onPressed: () {},
                borderRadius: 20.0,
              ),
              SizedBox(
                width: 12.0,
              ),
              customRaisedBtn(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () => {},
                        color: Colors.blue,
                        padding: EdgeInsets.all(10.0),
                        shape: CircleBorder(),
                        child: Column(
                          // Rep
                          // lace with a Row for horizontal icon + text
                          children: <Widget>[
                            Icon(
                              Icons.laptop_chromebook,
                              size: 33.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Electronics',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
                onPressed: () {},
                borderRadius: 20.0,
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