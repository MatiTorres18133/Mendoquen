import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/Secciones/ArticulosBelleza.dart';

import 'package:flutter_application_1/Pages/Secciones/Biyouteri.dart';
import 'package:flutter_application_1/Pages/Secciones/Electronica.dart';
import 'package:flutter_application_1/Pages/Secciones/Home_Deco.dart';
import 'package:flutter_application_1/Pages/Secciones/Marroquineria.dart';
import 'package:flutter_application_1/Pages/Secciones/Regaleria.dart';
import 'package:flutter_application_1/Pages/Secciones/Textil.dart';
import 'package:flutter_application_1/Pages/Secciones/Viajes.dart';

class CardMarro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(20),
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Marroquineria(),
              ),
            );
          },
          child: Stack(children: [
            Center(
              child: CircleAvatar(
                child: Center(
                  child: Icon(CupertinoIcons.bag_fill),
                ),
              ),
            ),
            Container(
              child: Center(child: Text("hola")),
            )
          ]),
        ),
      ),
    );
  }
}

class CardTextil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Textil(),
              ));
        },
        child: Stack(children: [
          Center(
            child: CircleAvatar(
              child: Center(
                child: Image.asset("assets/Tshirt"),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class CardBelleza extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => ArtBelleza(),
              ));
        },
        child: Stack(children: [
          Center(
            child: CircleAvatar(
              child: Center(
                child: Image.asset("assets/Tshirt"),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class CardBijouterie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => Biyou(),
            ),
          );
        },
        child: Stack(children: [
          Center(
            child: CircleAvatar(
              child: Center(
                child: Icon(CupertinoIcons.suit_diamond_fill),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class CardRegaleria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Regaleria(),
              ));
        },
        child: Stack(children: [
          Center(
            child: CircleAvatar(
              child: Center(
                child: Icon(CupertinoIcons.gift),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class CardElectronica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Electronica(),
              ));
        },
        child: Stack(
          children: [
            Center(
              child: CircleAvatar(
                child: Center(child: Icon(CupertinoIcons.game_controller)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardHomeDeco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => HomeDeco(),
              ));
        },
        child: Stack(children: [
          Center(
            child: CircleAvatar(
              child: Center(
                child: Icon(CupertinoIcons.home),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class CardViaje extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Viajes(),
              ));
        },
        child: Stack(children: [
          Center(
            child: CircleAvatar(
              child: Center(
                child: Icon(CupertinoIcons.airplane),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
