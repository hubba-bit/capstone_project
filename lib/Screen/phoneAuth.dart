/*
import 'otpScreen.dart';
import 'package:flutter/material.dart';

class PhoneLogin extends StatefulWidget {
  PhoneLogin({Key key}) : super(key: key);

  @override
  _PhoneLoginState createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final TextEditingController _phoneNumberController = TextEditingController();

  bool isValid = false;

  Future<Null> validate(StateSetter updateState) async {
    print("in validate : ${_phoneNumberController.text.length}");
    if (_phoneNumberController.text.length == 10) {
      updateState(() {
        isValid = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: EdgeInsets.only(left: 8.0, top: 30),
      alignment: Alignment.center,
      child: new RaisedButton(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
        color: Colors.green,
        onPressed: () => {},
        child: new Container(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                child: new FlatButton(
                  onPressed: () {
                    print("pressed");
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext bc) {
                          print("VALID CC: $isValid");

                          return StatefulBuilder(builder:
                              (BuildContext context, StateSetter state) {
                            return Container(
                              padding: EdgeInsets.all(16),
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'LOGIN',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    'Login/Create Account quickly to manage orders',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 0),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: _phoneNumberController,
                                      autofocus: true,
                                      onChanged: (text) {
                                        validate(state);
                                      },
                                      decoration: InputDecoration(
                                        labelText: "10 digit mobile number",
                                        prefix: Container(
                                          padding: EdgeInsets.all(4.0),
                                          child: Text(
                                            "+91",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      autovalidate: true,
                                      autocorrect: false,
                                      maxLengthEnforced: true,
                                      validator: (value) {
                                        return !isValid
                                            ? 'Please provide a valid 10 digit phone number'
                                            : null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    child: Center(
                                      child: SizedBox(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.85,
                                        child: RaisedButton(
                                          color: !isValid
                                              ? Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.5)
                                              : Theme.of(context).primaryColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(0.0)),
                                          child: Text(
                                            !isValid
                                                ? "ENTER PHONE NUMBER"
                                                : "CONTINUE",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onPressed: () {
                                            if (isValid) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        OTPScreen(
                                                          mobileNumber:
                                                          _phoneNumberController
                                                              .text,
                                                        ),
                                                  ));
                                            } else {
                                              validate(state);
                                            }
                                          },
                                          padding: EdgeInsets.all(16.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                        });
                  },
                  padding: EdgeInsets.only(
                    top: 20.0,
                    bottom: 20.0,
                  ),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Phone",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}







*/
/*









import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneAuth extends StatefulWidget {
  @override
  _PhoneAuthState createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
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
        print('Signed in');
      });
    };
    final PhoneVerificationCompleted verifiedSuccess =
        (AuthCredential authResult) {
      print('verified');
    };
    final PhoneVerificationFailed verficationFailed =
        (AuthException exception) {
      print('${exception.message}');
    };
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: this.phoneNo,
      verificationCompleted: verifiedSuccess,
      verificationFailed: verficationFailed,
      codeSent: smsCodeSent,
      codeAutoRetrievalTimeout: autoRetrieve,
      timeout: const Duration(seconds: 5),
    );
  }

  Future<bool> smsCodeDialog(BuildContext context) {
    return showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Enter sms Cocde'),
            content: TextField(
              onChanged: (value) {
                this.smsCode = value;
              },
            ),
            contentPadding: EdgeInsets.all(10.0),
            actions: <Widget>[
              FlatButton(
                child: Text('Done'),
                onPressed: () {
                  FirebaseAuth.instance.currentUser().then((user) {
                    if (user != null) {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacementNamed('/HomePage');
                    }
                    else {
                      Navigator.of(context).pop();
                      signIn();
                    }
                  });
                },
              )
            ],
          );
        });
  }
 signIn(){
    FirebaseAuth.instance.signInWithPhoneNumber(
      verificationId : verificationId,
      smsCode :smsCode
    ).then((user){
      Navigator.of(context).pushReplacementNamed('/HomePage');

    });
    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(),


      )

              )
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                onPressed: verifyPhone(phoneNo),
                child: Text('Verify'),
                textColor: Colors.white,
                elevation: 7.0,
                color: Colors.blue,
              )


*/
