import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String phoneNo;
  String smsCode;
  String verificationId;





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
            content: TextField(
              onChanged: (value) {
                this.smsCode = value;
              },
            ),
            contentPadding: EdgeInsets.all(10.0),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'Done',
                ),
                onPressed: () {
                   FirebaseAuth.instance.currentUser().then((user) {
                    if (user != null) {
                      Navigator.of(context).pop();

                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return HomePage();

                      }

                      )
                      );
                      /*Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));*/
                    } else {
                      Navigator.of(context).pop();
                      signIn();
                    }
                  });

                /*  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OtpScreen()));*/
                },
              )
            ],
          );
        });
  }

  signIn() async {
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user =
        await _auth.signInWithCredential(credential).then((user) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return OtpScreen();
      }));

    }).catchError((e) {
      print(e);
    });
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
