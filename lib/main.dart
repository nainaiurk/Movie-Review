import 'package:flutter/material.dart';
import 'package:movie_review/screens/splashScreen.dart';
import 'package:movie_review/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
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

