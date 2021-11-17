import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/Widget/Drawer.dart';

import 'HomePage.dart';

class Configuracion extends StatelessWidget {
  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.indigo[800],
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.indigo[800])),
      home: Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(),
        body: SafeArea(
          child: Column(
            children: [Button1()],
          ),
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

class Button1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Center(
      child: Text("Opcion 1"),
    ));
  }
}
