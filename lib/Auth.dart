 import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class User {


  final String uid;

  User({@required this.uid});
}

abstract class AuthBase {
  Stream<User> get onAuthStateChanged;

  Future<User> currentUser();

  Future<User> signInAnonymously();

  Future<User> signInWithGoogle();

  Future<User> signInWithFacebook();

//  Future<void> verifyPhone();
  Future<void> signOut();
}
  // Future<User> adPost();
/*
  Future<User> signInWithFacebook();
*/


class Auth implements AuthBase {
  final _fireBaseAuth = FirebaseAuth.instance;
  /*String phoneNo;
  String smsCode;
  String verificationId;
*/

  @override
  Stream<User> get onAuthStateChanged {
    return _fireBaseAuth.onAuthStateChanged.map(_userFromFireBase);
  }


  User _userFromFireBase(FirebaseUser user) {
    if (user == null) {
      return null;
    }
    return User(uid: user.uid);
  }

  @override
  Future<User> CurrentUser() async {
    final returnedUser = await _fireBaseAuth.currentUser();
    return _userFromFireBase(returnedUser);
  }

  // @override
  // Future<User> adPost() async {
  //   Firestore.instance
  //       .collection('books')
  //       .document()
  //       .setData({'title': 'title', 'author': 'author'});

  @override
  Future<User> signInAnonymously() async {
    final authResult = await _fireBaseAuth.signInAnonymously();
    return _userFromFireBase(authResult.user);
  }

   @override
  // ignore: missing_return
  Future<User> signInWithFacebook() async{
    final facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(
      ['public_profile'],
    );
if(result.accessToken != null){
  final authResult = await _fireBaseAuth.signInWithCredential(FacebookAuthProvider.getCredential(accessToken: result.accessToken.token,));
return _userFromFireBase(authResult.user);
}
 else{

}
  }
  @override
  Future<User> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        final authResult = await _fireBaseAuth.signInWithCredential(
          GoogleAuthProvider.getCredential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken),
        );
        return _userFromFireBase(authResult.user);
      } else {
        throw PlatformException(
          code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
          message: 'Missing google auth Token ',
        );
      }
    } else {
      throw PlatformException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'you Aborted the sign in ',
      );
    }
  }
@override
  /*Future<void> verifyPhone() async {

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
*/

  @override
  Future<void> signOut () async{
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    final facebookLogin = FacebookLogin();
    await facebookLogin.logOut();
    await _fireBaseAuth.signOut();
  }

  @override
  Future<User> currentUser() {
    // TODO: implement currentUser
    throw UnimplementedError();
  }
  }
