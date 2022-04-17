// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie_review/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool data = false ;
  bool _isVisible = false;

  @override
  _SplashScreenState(){
    Timer(Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: Duration(milliseconds:3000),
          pageBuilder: (_, __, ___) => WelcomeScreen()
        )
      );
    });
    Timer(Duration(milliseconds: 1000), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.black54,
                // Colors.black38,
                // Colors.white
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            
            )
          ),
        child: Center(
          child: AnimatedOpacity(
            opacity: _isVisible ? 1 : 0, 
            duration: Duration(milliseconds: 2000),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Hero(
                  tag: 'logo',
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    height: 100,
                    color: Colors.transparent,
                    child: const Image(
                      image: AssetImage('assets/images/logo.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Hero(
                  tag: 'title',
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      'Movie Review',
                      style: TextStyle(
                        fontSize: 40, 
                        fontWeight: FontWeight.bold,color: Colors.white
                    ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}