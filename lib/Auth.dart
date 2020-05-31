import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  // Future<User> adPost();
/*
  Future<User> signInWithFacebook();
*/
  Future signOut();
}

class Auth implements AuthBase {
  final _fireBaseAuth = FirebaseAuth.instance;

  @override
  Stream<User> get onAuthStateChanged {
    return _fireBaseAuth.onAuthStateChanged.map(_userFromFireBase);
  }

  @override
  Future signOut() async {
    return await _fireBaseAuth.signOut();
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

  /* @override
  Future<User> signInWithFacebook() async{
    final facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(['public_profile'],);
if(result.accessToken != null){
  final authResult = await _fireBaseAuth.signInWithCredential(FacebookAuthProvider.getCredential(accessToken: result.accessToken.token,));
return _userFromFireBase(authResult.user);
}
 else{
   throw PlatformException(
     code: 'ERROR_ABORTED_BY_USER',

   ) ;
}
  }*/
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
        message: 'you Abortedthe sign in ',
      );
    }
  }

  @override
  Future<User> currentUser() {
    // TODO: implement currentUser
    return null;
  }
}