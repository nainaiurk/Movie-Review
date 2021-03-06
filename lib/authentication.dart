import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future signInWithGoogle() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  try{
    if(kIsWeb){
      GoogleAuthProvider authProvider = GoogleAuthProvider();
      final UserCredential userCredential = await auth.signInWithPopup(authProvider);
      user =  userCredential.user;
    }
    else{
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final UserCredential userCredential = await auth.signInWithCredential(credential);
      user = userCredential.user;
    }
    return user;
  }
  on FirebaseException catch(e){
    return e.message;
  }
}

Future signOut() async {
    final GoogleSignIn googleUser = GoogleSignIn();
    try{
      await googleUser.signOut();
      return null;
    }
    on FirebaseException catch(e){
      return e.message;
    }
  }