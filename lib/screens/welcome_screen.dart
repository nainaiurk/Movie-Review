import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_review/authentication.dart';
import 'package:movie_review/screens/moviesList.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({ Key? key }) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    var maxHeight = MediaQuery.of(context).size.height;
    var maxWidth = MediaQuery.of(context).size.width;
    bool isSignedIn = false;
    return Scaffold(
      body: Center(
        child: isSignedIn == true? const CircularProgressIndicator():
        Container(
          height: maxHeight,
          width: maxWidth,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'logo',
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: maxHeight*0.2,
                  color: Colors.transparent,
                  child: const Image(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const Hero(
                  tag: 'title',
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      'Movie Review',
                      style: TextStyle(
                        fontSize: 35, 
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              SizedBox(height: maxHeight*0.1),
              Padding(
                padding: const EdgeInsets.only(left: 60,right: 60,bottom: 60),
                child: MaterialButton(
                  onPressed: () async {
                    User? user = await signInWithGoogle();
                    setState(() {
                      isSignedIn == true;
                    });
                    if (user != null){
                      Navigator.push(
                        context, 
                        PageRouteBuilder(
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          transitionDuration: const Duration(milliseconds:1000),
                          pageBuilder: (_, __, ___) =>const  MoviesList()
                        )
                      );
                    }
                  },
                  color: Colors.white,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white,
                        foregroundImage: AssetImage('assets/images/Google.png'),
                      ),
                      Text(
                        'Sign In with Google',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60,right: 60),
                child: MaterialButton(
                  color: Colors.white,
                  height: 50,
                  onPressed: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.facebookF,
                        size: 30,
                        color: Colors.blue,
                      ),
                      Text(
                        'Sign In with Facebook',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        
      ),
    );
  }
}