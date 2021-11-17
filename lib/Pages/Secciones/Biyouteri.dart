import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/Widget/Drawer.dart';

class Biyou extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.blue[900],
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.indigo[800])),
      debugShowCheckedModeBanner: false,
      home: biyu(),
    );
  }
}

// ignore: camel_case_types
class biyu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            "Biyouteri",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      drawer: MainDrawer(),
      body: Stack(
        children: <Widget>[],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
