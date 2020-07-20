import 'package:bechdoapp/Screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import '../Auth.dart';

class OtpScreen extends StatefulWidget {
  final AuthBase auth;

  const OtpScreen({this.auth});
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String phoneNo;
  String smsCode;
  String verificationId;
  TextEditingController errorMsg = TextEditingController();

  Future<void> verifyPhone() async {
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      this.verificationId = verId;
    };

    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      smsCodeDialog(context).then((value) {
        print('Signed In');
      });
    };

    final PhoneVerificationCompleted verifiedSuccess =
        (AuthCredential credential) {
      print('Verified');
    };

    final PhoneVerificationFailed verifiFailed = (AuthException exception) {
      print('${exception.message}');
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: this.phoneNo,
      codeAutoRetrievalTimeout: autoRetrieve,
      codeSent: smsCodeSent,
      timeout: const Duration(seconds: 10),
      verificationCompleted: verifiedSuccess,
      verificationFailed: verifiFailed,
    );
  }

  Future<bool> smsCodeDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Enter the SMS Code Below'),
            content: SizedBox(
              height: 100,
              child: Column(
                children: <Widget>[
                  TextField(
                    onChanged: (value) {
                      this.smsCode = value;
                    },
                  ),
                  // TextField(
                  //   controller: errorMsg,
                  //   readOnly: true,
                  // )
                ],
              ),
            ),
            contentPadding: EdgeInsets.all(10.0),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'Done',
                ),
                onPressed: () {
                  _verifyCode();

                  // FirebaseAuth.instance.currentUser().then((user) {
                  //   if (user != null) {
                  //     Navigator.of(context).pop();
                  //     Navigator.of(context).pushReplacement(
                  //         MaterialPageRoute(builder: (BuildContext context) {
                  //       return HomePage(
                  //         auth: widget.auth,
                  //       );
                  //     }));
                  //     /*Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) => HomePage()));*/
                  //   } else {
                  //     Navigator.of(context).pop();
                  //     signIn();
                  //     /*  Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) => OtpScreen()));*/
                  //   }
                  // });

                  /*  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OtpScreen()));*/
                },
              )
            ],
          );
        });
  }

  _verifyCode() async {
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    try {
      FirebaseAuth _auth = FirebaseAuth.instance;
      final user = await _auth.signInWithCredential(credential);
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    } on PlatformException catch (e) {
      // if (e.code == 'ERROR_INVALID_VERIFICATION_CODE') {
      //   errorMsg.text = "Invalid code, Please try again.";
      // } else {
      //   errorMsg.text = "Error while verifying, Please try again.";
      // }
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        backgroundColorStart: Colors.indigoAccent,
        backgroundColorEnd: Colors.indigo,
        title: Text(
          'LOGIN',
          style: TextStyle(fontSize: 25.0),
        ),
        elevation: 27.0,
      ),
      body: Container(
        padding: EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your Phone Number',
                  hintStyle: TextStyle(
                    fontSize: 20.0,
                  ),
                  /* prefixText: '+92 ',
                    prefixStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    )*/
                ),
                onChanged: (value) {
                  this.phoneNo = value;
                },
              ),
            ),
            SizedBox(
              height: 19,
            ),
            RaisedButton(
              onPressed: verifyPhone,
              child: Text(
                'Verify',
              ),
              textColor: Colors.white,
              elevation: 2.0,
              color: Colors.black,
            )
          ],
        ),
      ),
      // ),
    );
  }
}
