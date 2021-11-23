import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login/Model/UserModel.dart';
import 'package:flutter_application_1/Pages/Introduccion/onBoarding.dart';

import '../Widget/Cards.dart';
import '../Widget/Drawer.dart';
import '../Widget/MenuNav.dart';
import '../Widget/SplashScreen.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  User? user = FirebaseAuth.instance.currentUser;
  userModel loggedInUser = userModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("usuarios")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = userModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final _init = Firebase.initializeApp();
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigo[900],
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blue[900],
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "Splash",
      routes: {
        "Splash": (_) => SplashScreen(),
      },
      home: OnBoarding(),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widthP = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40),
          ),
        ),
        elevation: 5,
        backgroundColor: Colors.indigo[900],
        title: Center(
          child: Text(
            "Mendoquen",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      drawer: MainDrawer(),
      body: Stack(
        children: <Widget>[
          GridView.count(
            childAspectRatio: 4 / 3,
            crossAxisCount: 2,
            children: <Widget>[
              CardMarro(),
              CardBelleza(),
              CardBijouterie(),
              CardElectronica(),
              CardHomeDeco(),
              CardRegaleria(),
              CardTextil(),
              CardViaje(),
            ],
          ),
          Positioned(
            bottom: 30,
            child: Container(
              width: widthP,
              child: Align(
                child: NavigatorMenu(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
