import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_review/screens/splashScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
   await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCXRBNDeGUWTgy0U8YZySWoc0xDCW-U8xM",
        authDomain: "movie-review-4db8e.firebaseapp.com",
        projectId: "movie-review-4db8e",
        storageBucket: "movie-review-4db8e.appspot.com",
        messagingSenderId: "68910580433",
        appId: "1:68910580433:web:7176777e676f7a4321fbf0",
        measurementId: "G-WXPM9MW703"
      )
    ).whenComplete(() => runApp(const MyApp()));
  }
  else {
    await Firebase.initializeApp();
    runApp(const MyApp());
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        appBarTheme: const AppBarTheme(
          color: Colors.black87
        ),
        primaryTextTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white)
        )
      ),
      home: const SplashScreen(),
    );
  }
}

