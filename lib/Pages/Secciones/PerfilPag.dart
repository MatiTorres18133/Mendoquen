import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/Widget/Drawer.dart';

import 'HomePage.dart';

class Perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.blue[900],
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.indigo[800])),
      home: Scaffold(
        drawer: MainDrawer(),
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
              "Perfil",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(<Widget>[]),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          highlightElevation: 0,
          child: Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Main()));
          },
        ),
      ),
    );
  }
}
