import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/Pages/Secciones/HomePage.dart';
import 'package:flutter_application_1/Pages/Secciones/PerfilPag.dart';
import 'package:flutter_application_1/Pages/Secciones/configPag.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.indigo[900],
            child: Center(
              child: Column(
                children: <Widget>[
                  CircleAvatar(),
                  Text("sasdasd"),
                  Text("asdasd")
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.home),
            title: Text(
              "Inicio",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Main(),
                ),
              );
            },
          ),
          ListTile(
              leading: Icon(CupertinoIcons.person),
              title: Text(
                "Perfil",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Perfil()));
              }),
          ListTile(
            leading: Icon(CupertinoIcons.settings),
            title: Text(
              "Configuracion",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Configuracion()));
            },
          ),
          ListTile(
            leading: Icon(CupertinoIcons.back),
            title: Text("Cerrar Sesion",
                style: TextStyle(
                  fontSize: 18,
                )),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
