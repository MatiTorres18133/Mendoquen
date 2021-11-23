import 'package:flutter/material.dart';

class Logotipo extends StatelessWidget {
  const Logotipo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "POINT STUDY",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
