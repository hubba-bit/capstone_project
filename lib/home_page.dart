import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'Auth.dart';
import 'customRaisedBtn.dart';

class HomePage extends StatelessWidget {
  HomePage({@required this.auth});
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




      padding: EdgeInsets.all(25.0),
      child: Column(


        children: <Widget>[
         SizedBox(
            height: 14.0,
          ),

          Row(children: <Widget>[
            SizedBox(
              width: 150.0,
              height: 150.0,

              child: customRaisedBtn(


                child: Row(
mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
         MaterialButton(
                                           onPressed: () {},
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Icon(
                        Icons.directions_car,
                        size: 24,
                      ),

                      padding: EdgeInsets.all(16),
                      shape: CircleBorder(),

                    ),
                   /*  Center(
                      child: Text(
                        "Hello World",

                      ),
                    ),*/

/*Opacity(
                      opacity: 0.0,
                      child: Image.asset('images/google-logo.png'),
                    ),*/
/*
SizedBox(
  width: 6.0,
  height:1.0,
),
Stack(children: <Widget>[
  Align(
    alignment: Alignment(-0.90,0.5),
    child: Text('Vehicles'),
  ),
],)
*/
                  ],
                ),

                color: Colors.white,
                onPressed: () {},
                borderRadius: 20.0,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            SizedBox(
              width: 150.0,
              height: 150.0,
              child: customRaisedBtn(
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.blue,
                      textColor: Colors.white,

                      child: Icon(
                        Icons.home,

                        size: 24,
                      ),

                      padding: EdgeInsets.all(16),
                      shape: CircleBorder(),
                    ),

                    Text(
                      '',
                      style: TextStyle(
                        //                    color: Colors.black,
                        fontSize: 16.5,
                      ),
                    ),
                    /* Opacity(
                      opacity: 0.0,
                      child: Image.asset('images/google-logo.png'),
                    ),*/
                  ],
                ),
                color: Colors.white,
                onPressed: () {},
                borderRadius: 20.0,
              ),
            ),
          ]),
          SizedBox(
            height: 15.0,
          ),
          Row(
            children: <Widget>[

              SizedBox(
                width: 150.0,
                height: 150.0,
                child: customRaisedBtn(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      MaterialButton(
                        onPressed: () {},
                        color: Colors.blue,
                        textColor: Colors.white,

                        child: Icon(
                          Icons.pets,

                          size: 24,
                        ),

                        padding: EdgeInsets.all(16),
                        shape: CircleBorder(),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                          //                    color: Colors.black,
                          fontSize: 16.5,
                        ),
                      ),
                      /*Opacity(
                        opacity: 0.0,
                        child: Image.asset('images/google-logo.png'),
                      ),*/
                    ],
                  ),
                  color: Colors.white,
                  onPressed: () {},
                  borderRadius: 20.0,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              SizedBox(
                width: 150.0,
                height: 150.0,
                child: customRaisedBtn(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[
                      MaterialButton(
                        onPressed: () {},
                        color: Colors.blue,
                        textColor: Colors.white,

                        child: Icon(
                          Icons.smartphone,

                          size: 24,
                        ),

                        padding: EdgeInsets.all(16),
                        shape: CircleBorder(),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                          //                    color: Colors.black,
                          fontSize: 16.5,
                        ),
                      ),
                      /*  Opacity(
                opacity: 0.0,
                child: Image.asset('images/google-logo.png'),
              ),*/
                    ],
                  ),
                  color: Colors.white,
                  onPressed: () {},
                  borderRadius: 20.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 150.0,
                height: 150.0,
                child: customRaisedBtn(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[
                      MaterialButton(
                        onPressed: () {},
                        color: Colors.blue,
                        textColor: Colors.white,

                        child: Icon(
                          Icons.business_center,

                          size: 24,
                        ),

                        padding: EdgeInsets.all(16),
                        shape: CircleBorder(),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                          //                    color: Colors.black,
                          fontSize: 16.5,
                        ),
                      ),
                     /* Opacity(
                        opacity: 0.0,
                        child: Image.asset('images/google-logo.png'),
                      ),*/
                    ],
                  ),
                  color: Colors.white,
                  onPressed: () {},
                  borderRadius: 20.0,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              SizedBox(
                width: 150.0,
                height: 150.0,
                child: customRaisedBtn(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[
                      MaterialButton(
                        onPressed: () {},
                        color: Colors.blue,
                        textColor: Colors.white,

                        child: Icon(
                          Icons.hotel,

                          size: 24,
                        ),

                        padding: EdgeInsets.all(16),
                        shape: CircleBorder(),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                          //                    color: Colors.black,
                          fontSize: 16.5,
                        ),
                      ),
                      /*  Opacity(
                opacity: 0.0,
                child: Image.asset('images/google-logo.png'),
              ),*/
                    ],
                  ),
                  color: Colors.white,
                  onPressed: () {},
                  borderRadius: 20.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
