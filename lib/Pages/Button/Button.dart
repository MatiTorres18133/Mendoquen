import 'package:flutter/material.dart';

import 'package:flutter_application_1/Pages/Secciones/HomePage.dart';

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Main(),
              ));
        },
        child: Text(
          "Login",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
