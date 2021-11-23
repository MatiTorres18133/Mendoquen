import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login/LoginPage.dart';
import 'package:flutter_application_1/Login/Model/UserModel.dart';
import 'package:flutter_application_1/Pages/Secciones/HomePage.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Logotipo.dart';
import 'Pie.dart';

class RegisterPage extends StatefulWidget {
  static String id = 'RegisterPage';

  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

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
                Logotipo(),
                SizedBox(
                  height: 50.0,
                ),
                _textFieldNombre(),
                SizedBox(
                  height: 15.0,
                ),
                _textFieldApellido(),
                SizedBox(
                  height: 15.0,
                ),
                _textFieldEmail(),
                SizedBox(
                  height: 15.0,
                ),
                _textFieldPassword(),
                SizedBox(
                  height: 15.0,
                ),
                _textFieldConfirmPassword(),
                SizedBox(
                  height: 60.0,
                ),
                _registarmeButton(context),
                SizedBox(
                  height: 65.0,
                ),
                pie_de_pagina(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFieldNombre() {
    return textFieldGeneral(
      labelText: 'Nombre',
      keyboarType: TextInputType.name,
      controller: name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Este campo de texto es obligatorio");
        }
        if (!regex.hasMatch(value)) {
          return ("Ingrese un nombre, minimo 3 caracteres)");
        }
        return null;
      },
      onSaved: (value) {
        name.text = value!;
      },
    );
  }

  Widget _textFieldApellido() {
    return textFieldGeneral(
      labelText: 'Apellido',
      keyboarType: TextInputType.name,
      controller: lastName,
      validator: (value) {
        if (value!.isEmpty) {
          return ('Este campo de texto es obligatorio');
        }
        return null;
      },
      onSaved: (value) {
        lastName.text = value!;
      },
    );
  }

  Widget _textFieldEmail() {
    return textFieldGeneral(
      labelText: 'Dirección E-mail',
      controller: email,
      keyboarType: TextInputType.emailAddress,
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

  Widget _textFieldPassword() {
    return textFieldGeneral(
      labelText: 'Contraseña',
      controller: password,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{8,}$');
        if (value!.isEmpty) {
          return ("Este campo de texto es obligatorio");
        }
        if (!regex.hasMatch(value)) {
          return ("Ingrese una contraseña valida, minimo 8 caracteres)");
        }
      },
      onSaved: (value) {
        password.text = value!;
      },
      obcureText: true,
    );
  }

  Widget _textFieldConfirmPassword() {
    return textFieldGeneral(
      labelText: 'Confirmar contraseña',
      controller: confirmPassword,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Este campo de texto es obligatorio");
        }
        if (confirmPassword.text != password.text) {
          return 'Las contraseñas no coinciden';
        }
        return null;
      },
      onSaved: (value) {
        confirmPassword.text = value!;
      },
      obcureText: true,
    );
  }

  Widget _registarmeButton(context) {
    return buttonGeneral(
      text: 'Registrarme',
      onPressed: () {
        register(email.text, password.text);
      },
      fontGrosor: FontWeight.normal,
      BGcolor: (0xff0DDF9F),
      borderColor: (0xff0DDF9F),
    );
  }

  void register(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                postDetailsToFirestore(),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore _firebase = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    userModel usermodel = userModel();

    usermodel.email = user!.email;
    usermodel.name = name.text;
    usermodel.lastname = lastName.text;
    usermodel.password = password.text;

    await _firebase.collection("usuarios").doc(user.uid).set(usermodel.toMap());
    Fluttertoast.showToast(msg: "Se ha regístrado con exito");

    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => Main()), (route) => false);
  }
}
