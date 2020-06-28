import 'package:bechdoapp/Auth.dart';
import 'package:bechdoapp/Screen/otpScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../customRaisedBtn.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class LoginPage extends StatelessWidget {
  /*String phoneNo;
  String smsCode;
  String verificationId;

  Future<void> verifyPhone () async{
    final PhoneCodeAutoRetrievalTimeout autoRetrieve =(String verId){
      this.verificationId = verId;
    };
    final PhoneCodeSent smsCodeSent = (String verId , [int forceCodeResend]){
      this.verificationId = verId;
    };
     final PhoneVerificationCompleted verfiedSuccess = (FirebaseUser user)  {
       print('verified');
     };
     final PhoneVerificationFailed veriFailed = (AuthException exception){
       print( '${exception.message}');
     };
    await FirebaseAuth.instance.verifyPhone(
      codeSent = smsCodeSent,
      phoneNumber : this.phoneNo,
      codeAutoRetrievalTimeout: autoRetrieve,

      timeout= const Duration(seconds: 5),
      verificationCompleted: verfiedSuccess,
      verificationFailed: veriFailed,

    );

  }

  Future<bool> smsCodeDialog (BuildContext context){
    return showDialog(context: context,
    barrierDismissible: false,
    builder: (BuildContext context){
      return AlertDialog (
        title:  Text('enter sms code '),
      );
    });
  }*/
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

  Future<void> _signInWithFacebook() async {
    try {
      await auth.signInWithFacebook();
    } catch (e) {
      print(e.toString());
    }
  }

  /*// ignore: missing_return
  Future<void> _navigateToNextScreen(BuildContext context){
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePagge()));
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        backgroundColorStart: Colors.indigoAccent,
        backgroundColorEnd: Colors.indigo,
        elevation: 20.0,
        /* leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.menu),*/
      ),
      body: _bodyContent(),
      /*Stack(
        children: <Widget>[
          ClipPath(
            child: Container(
              color: Colors.teal.withOpacity(0.8)),

          ),
          Positioned(
            left: 25.0,
            width: 350.0,
            //top:  MediaQuery.of(context).size.height/5,
          ),
           _bodyContent(),

        ],
      ),*/
      backgroundColor: Colors.white,
    );
  }

  Widget _bodyContent() {
    return Container(
      /*padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,

      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xfffbb448), Color(0xfff7892b)])),*/
      padding: EdgeInsets.all(10.0),
      child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 60.0),
            Image.asset(
              'images/download.jpg',
              height: 160.0,
            ),
            SizedBox(
              height: 80.0,
            ),
            SizedBox(
              height: 47.0,
              child: customRaisedBtn(
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
            ),
            SizedBox(
              height: 14.0,
            ),
            SizedBox(
              height: 47.0,
              child: customRaisedBtn(
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
                onPressed: _signInWithFacebook,
                /*_signInWithFacebook*/
                borderRadius: 4.0,
              ),
            ),
            SizedBox(
              height: 12.0,
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
            SizedBox(height: 10.0),
            SizedBox(
              height: 47.0,
              child: customRaisedBtn(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 43.0,
                      height: 90.0,
                      child: Image.asset(
                        'images/email.png',
                      ),
                    ),
                    Text(
                      'Continue Without SignIn ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.5,
                      ),
//                SizedBox(
//                  height: 0.1,
//                ),
                    ),
                    SizedBox(
                      width: 40.0,
                      child: Opacity(
                        opacity: 0.0,
                        child: Image.asset('images/email.png'),
                      ),
                    ),
                  ],
                ),
                color: Colors.grey[200],
                onPressed: _signInAnonymously,
                borderRadius: 6.0,
              ),
            ),
            SizedBox(
              height: 47.0,
              child: customRaisedBtn(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 43.0,
                      height: 90.0,
                      child: Image.asset(
                        'images/mobile.png',
                      ),
                    ),
                    Text(
                      'Continue With Phone',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.5,
                      ),
//                SizedBox(
//                  height: 0.1,
//                ),
                    ),
                    SizedBox(
                      width: 40.0,
                      child: Opacity(
                        opacity: 0.0,
                        child: Image.asset('images/phone.png'),
                      ),
                    ),
                  ],
                ),
                //color: ,
                onPressed:() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePagge()));
                },
                borderRadius: 6.0,
              ),
            ),
          ]),
    );
  }
}
