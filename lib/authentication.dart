import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<User?> signInWithGoogle() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
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