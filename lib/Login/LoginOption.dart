import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';

import 'LoginPage.dart';

var login = new LoginPage();
final google = GoogleSignIn();

class LoginPageOptions extends StatelessWidget {
  static String id = "LoginPageOptions";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff642DD5),
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 50.0,
          ),
          children: [
            SizedBox(
              height: 80.0,
            ),
            //login.Logotipo(),
            SizedBox(
              height: 175.0,
            ),
            _inicio_sesion_facebok(context),
            SizedBox(
              height: 20.0,
            ),
            _inicio_sesion_google(context),
            SizedBox(
              height: 260.0,
            ),
            //login.pie_de_pagina(),
          ],
        ),
      ),
    ));
  }

  Widget _inicio_sesion_facebok(context) {
    return buttonGeneral(
      text: 'Continuar con Facebook',
      onPressed: () {},
      BGcolor: (0xff0DDF9F),
      borderColor: (0xff0DDF9F),
    );
  }

  Widget _inicio_sesion_google(context) {
    return buttonGeneral(
      text: 'Continuar con Google',
      onPressed: () {},
      BGcolor: (0xff0DDF9F),
      borderColor: (0xff0DDF9F),
    );
  }
}
