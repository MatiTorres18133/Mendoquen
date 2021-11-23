import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login/LoginPage.dart';

var login = new LoginPage();

class PasswordPage extends StatefulWidget {
  static String id = "PasswordPage";

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  // ignore: unused_field
  final _auth = FirebaseAuth.instance;

  // ignore: unused_field
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

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
                  Text(
                    'RECUPERAR CONTRASEÑA',
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  textFielNewPassword(),
                  SizedBox(
                    height: 25.0,
                  ),
                  textFielConfirmPassword(),
                  SizedBox(
                    height: 25.0,
                  ),
                  confirmarPasswordButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textFielNewPassword() {
    return textFieldGeneral(
      labelText: 'Nueva contraseña',
      obcureText: true,
      controller: newPassword,
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
        newPassword.text = value!;
      },
    );
  }

  Widget textFielConfirmPassword() {
    return textFieldGeneral(
      labelText: 'Confirme la nueva contraseña',
      obcureText: true,
      controller: confirmPassword,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Este campo de texto es obligatorio");
        }
        if (confirmPassword.text != newPassword.text) {
          return 'Las contraseñas no coinciden';
        }
        return null;
      },
      onSaved: (value) {
        confirmPassword.text = value!;
      },
    );
  }

  Widget confirmarPasswordButton() {
    return buttonGeneral(
      text: 'Confirmar',
      onPressed: () {},
      BGcolor: (0xff0DDF9F),
      borderColor: (0xff0DDF9F),
      fontGrosor: FontWeight.normal,
    );
  }
}
