import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/Widget/Drawer.dart';
import 'package:flutter_application_1/Pages/Widget/MenuNav.dart';

class Electronica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.indigo[800],
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.blue[900],
          )),
      debugShowCheckedModeBanner: false,
      home: ElectronicaPage(),
    );
  }
}

class ElectronicaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widthP = MediaQuery.of(context).size.width;
    return Scaffold(
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
            "Electronica",
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
