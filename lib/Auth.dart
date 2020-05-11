import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';






class User {

  final String uid;

  User({@required this.uid});

}



abstract class AuthBase{
  Stream<User> get onAuthStateChanged;
  Future<User> currentUser();
  Future<User> signInAnonymously();
  Future<User> signInWithGoogle();
  Future<void> signOut();
}
class Auth implements AuthBase {
  final _fireBaseAuth = FirebaseAuth.instance;

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


  Future<User> CurrentUser() async {
    final returnedUser = await _fireBaseAuth.currentUser();
    return _userFromFireBase(returnedUser);
  }

  @override
  Future<User> signInAnonymously() async {
    final authResult = await _fireBaseAuth.signInAnonymously();
    return _userFromFireBase(authResult.user);
  }
  @override
  Future<User> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount
          .authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        final authResult = await _fireBaseAuth.signInWithCredential(
          GoogleAuthProvider.getCredential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken),

        );
        return _userFromFireBase(authResult.user);
      }
      else {
        throw PlatformException(
          code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
          message: 'Missing google auth Token ',
        );
      }
    }
    else
    {
      throw PlatformException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'you Abortedthe sign in ',
      );
    }
  }
  @override

  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await  _fireBaseAuth.signOut();
  }

  @override
  Future<User> currentUser() {
    // TODO: implement currentUser
    return null;
  }













}


