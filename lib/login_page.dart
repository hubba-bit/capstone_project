import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'customRaisedBtn.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginPage extends StatelessWidget {
  Future<void> _signInAnonymously() async {
    try {
      final authResult = await FirebaseAuth.instance.signInAnonymously();
    }
    catch (e) {
      print(e.toString());
    }
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.menu),
        ),        elevation: 10.0,
      ),

      body: _bodyContent(

      ),
      backgroundColor: Colors.blueAccent[50],

    );

  }


  Widget _bodyContent(
      ) {
    return Container(
      padding: EdgeInsets.all(10.0),

      child: Column(


        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[

      Image.asset('images/olx.jpg',  height: 105.0,
          ),
SizedBox(height: 45.0,),

//          Text(
//            'olx',
//            textAlign: TextAlign.center,
//            style: TextStyle(
//              fontSize: 80.0,
//              fontWeight: FontWeight.bold,
//              fontFamily: ('Roboto,Arial,Helvetica,sans-serif'),
//              color: Colors.blueAccent[700],
//            ),
//          ),
//          Text(
//            'PAKISTAN',
//            textAlign: TextAlign.center,
//            style: TextStyle(
//              fontSize: 20.0,
//              fontWeight: FontWeight.bold,
//              fontFamily: ('Raleway'),
//              color: Colors.blueAccent[700],
//            ),
//          ),
          SizedBox(
            height: 10.0,
          ),
          customRaisedBtn(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset('images/google-logo.png'),
                Text(
                  'Continue With Google',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
                Opacity(
                  opacity: 0.0,
                  child: Image.asset('images/google-logo.png'),
                ),
              ],
            ),
            color: Colors.blueAccent[700],
            onPressed: () {},
            borderRadius: 5.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          customRaisedBtn(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset('images/facebook-logo.png'),
//                SizedBox(
//                  height: 0.1,
//                ),
                Text(
                  'Continue With Facebook',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
                Opacity(
                  opacity: 0.0,
                  child: Image.asset(
                    'images/facebook-logo.png',
                  ),
                ),
              ],
            ),
            color: Colors.blueAccent[700],
            onPressed: () {},
            borderRadius: 4.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          customRaisedBtn(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Continue With Phone',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
               /* Opacity(
                  opacity: 0.0,
                  child: Image.asset('images/create-a-logo-png.png'),
                ),*/
              ],
            ),
            color: Colors.blueAccent[700],
            onPressed: () {},
            borderRadius: 4.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'OR',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.blueAccent[700],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          customRaisedBtn(
            child: Row(
crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('images/create-a-logo-png.png',
                ),
                Text(
                  'Create your Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
//                SizedBox(
//                  height: 0.1,
//                ),
                ),
                /*Opacity(
                  opacity: 1.0,
                  child: Image.asset('images/create-a-logo-png.png'),
                ),*/
              ],
            ),
            color: Colors.blueAccent[700],
            onPressed: _signInAnonymously,
            borderRadius: 6.0,
          ),
          SizedBox(
            height: 55.0,
          ),
          Text(
            'If you continue , you are accepting',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black,
              fontFamily: ('Raleway'),

            ),
          ),
          Text(
            'OLX Terms and Condition and Privacy Policy',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black,
              fontFamily: ('Raleway'),
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }

}
