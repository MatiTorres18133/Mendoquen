import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/Introduccion/onBoarding.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 4),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OnBoarding(),
        ),
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: FractionallySizedBox(
                  widthFactor: .6,
                  child: Image.asset(
                    "assets/descocadas.png",
                    height: 400,
                  ),
                ),
              ),
              CircularProgressIndicator(
                color: Colors.red,
              ),
              SizedBox(
                height: 10,
              ),
            ]),
      ),
    );
  }
}
