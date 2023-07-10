import 'package:flutter/material.dart';
import 'dart:async';
import 'signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SignUpPage(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Center(
                child: Image.asset('assets/images/Logo.png',
                    height: 300)
                    ),
                       SizedBox(
                        height: 50,
                        child: Text(
                          'AGRO APP',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontFamily: 'Montserrat',
                            color: Colors.lightGreen
                          ),
                        ),
                      )
//
          ],
        ),
      ),
    );
  }
}



