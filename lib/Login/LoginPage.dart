import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/Secciones/HomePage.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'LoginOption.dart';
import 'Logotipo.dart';
import 'Pie.dart';
import 'RegisterPage.dart';

class LoginPage extends StatefulWidget {
  static String id = "LoginPage";

  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController email = new TextEditingController();
  final TextEditingController password = new TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff642DD5),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Center(
            child: Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: 50.0,
                ),
                children: [
                  SizedBox(
                    height: 80.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Logotipo(),
                    ],
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  _textFielUser(),
                  SizedBox(
                    height: 25.0,
                  ),
                  _textFielPassword(),
                  _recuperarPassword(context),
                  SizedBox(
                    height: 30.0,
                  ),
                  _iniciarSesionButton(context),
                  SizedBox(
                    height: 15.0,
                  ),
                  _continuarFormaButton(context),
                  SizedBox(
                    height: 50.0,
                  ),
                  _registrarse(context),
                  SizedBox(
                    height: 55.0,
                  ),
                  pie_de_pagina(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFielUser() {
    return textFieldGeneral(
      labelText: 'E-mail',
      keyboarType: TextInputType.emailAddress,
      controller: email,
      validator: (value) {
        if (value!.isEmpty) {
          return ('Este campo de texto es obligatorio');
        }

        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ('Por favor, ingrese un email valido');
        }
        return null;
      },
      onSaved: (value) {
        email.text = value!;
      },
    );
  }

  Widget _textFielPassword() {
    return textFieldGeneral(
      labelText: 'Contraseña',
      controller: password,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{8,}$');
        if (value!.isEmpty) {
          return ("Este campo de texto es obligatorio");
        }
        if (!regex.hasMatch(value)) {
          return ("Contraseña invalida, minimo 8 caracteres");
        }
      },
      onSaved: (value) {
        password.text = value!;
      },
      obcureText: true,
    );
  }

  Widget _recuperarPassword(context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CupertinoButton(
          onPressed: () {},
          child: Text(
            '¿Olvidaste tu contraseña?',
            style: TextStyle(
              color: Color(0xffffffff),
              fontWeight: FontWeight.normal,
              fontSize: 15.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _iniciarSesionButton(context) {
    return buttonGeneral(
      text: 'Iniciar sesión',
      onPressed: () {
        logIn(email.text, password.text);
      },
      BGcolor: (0xff0DDF9F),
      borderColor: (0xff0DDF9F),
    );
  }

  Widget _continuarFormaButton(context) {
    return buttonGeneral(
      text: 'Continuar de otra forma',
      onPressed: () {
        Route route = MaterialPageRoute(builder: (__) => LoginPageOptions());
        Navigator.push(context, route);
      },
      BGcolor: (0xffffffff),
      borderColor: (0xff0DDF9F),
      fontColor: (0xff716D6D),
    );
  }

  Widget _registrarse(context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoButton(
          onPressed: () {
            Route route = MaterialPageRoute(builder: (__) => RegisterPage());
            Navigator.push(context, route);
          },
          child: Text(
            '¿No tienes una cuenta? Resgístrate',
            style: TextStyle(
              color: Color(0xffffffff),
              fontWeight: FontWeight.normal,
              fontSize: 15.0,
            ),
          ),
        ),
      ],
    );
  }

  void logIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: 'Inicio sesión exitosamente'),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Main()))
              })
          .catchError((e) {
        throw Fluttertoast.showToast(msg: e!.message);
      });
    }
    ;
  }
}

class textFieldGeneral extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final validator;
  final onSaved;
  final bool obcureText;
  final TextInputType keyboarType;

  const textFieldGeneral({
    this.labelText = '',
    required this.controller,
    @required this.validator,
    @required this.onSaved,
    this.obcureText = false,
    this.keyboarType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onSaved: onSaved,
      keyboardType: keyboarType,
      obscureText: obcureText,
      cursorColor: Color(0xff0DDF9F),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Color(0xffffffff),
        ),
        floatingLabelStyle: TextStyle(
          color: Color(0xffffffff),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(
            color: Color(0xff0DDF9F),
            width: 3.0,
            style: BorderStyle.solid,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(
            color: Color(0xff0DDF9F),
            width: 3.0,
            style: BorderStyle.solid,
          ),
        ),
      ),
      style: TextStyle(
        color: Color(0xffffffff),
        fontSize: 15.0,
      ),
    );
  }
}

class buttonGeneral extends StatelessWidget {
  final String text;
  final onPressed;
  final BGcolor;
  final borderColor;
  final fontColor;
  final FontWeight fontGrosor;
  const buttonGeneral({
    this.text = '',
    this.onPressed = '',
    this.BGcolor,
    this.borderColor,
    this.fontColor = (0xffffffff),
    this.fontGrosor = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Color(fontColor),
          fontWeight: fontGrosor,
        ),
      ),
      style: TextButton.styleFrom(
        fixedSize: Size(200.0, 40.0),
        backgroundColor: Color(BGcolor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          side: BorderSide(
            color: Color(borderColor),
            width: 3.0,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
