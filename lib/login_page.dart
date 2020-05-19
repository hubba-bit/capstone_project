import 'package:bechdoapp/Auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'customRaisedBtn.dart';

class LoginPage extends StatelessWidget {
  LoginPage({@required this.auth});
  final AuthBase auth;

  Future<void> _signInAnonymously() async {
    try {
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        /* leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.menu),*/
        title: Text(''),
      ),
      body: _bodyContent(),
      backgroundColor: Colors.blueAccent[50],
    );
  }

  Widget _bodyContent() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset(
            'images/olx.jpg',
            height: 105.0,
          ),
          SizedBox(
            height: 45.0,
          ),


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
                    color: Colors.black,
                    fontSize: 16.5,
                  ),
                ),
                Opacity(
                  opacity: 0.0,
                  child: Image.asset('images/google-logo.png'),
                ),
              ],
            ),
            color: Colors.white,
            onPressed: _signInWithGoogle,
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
                    fontSize: 16.5,
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

          Text(
            'OR',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          customRaisedBtn(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                /* Opacity(child: Image.asset('images/create-a-logo-png.png',

                ),
                opacity: 0.0,),
*/
                Text(
                  'Continue Without SignIn ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.5,
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
            color: Colors.grey[500],
            onPressed: _signInAnonymously,
            borderRadius: 6.0,
          ),
          SizedBox(
            height: 35.0,
          ),

        ],
      ),
    );
  }
}
