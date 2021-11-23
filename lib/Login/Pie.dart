import 'package:flutter/material.dart';

// ignore: camel_case_types
class pie_de_pagina extends StatelessWidget {
  const pie_de_pagina({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        'Copyright © Gonzalo Parra',
        style: TextStyle(
          color: Color(0xffffffff),
          fontSize: 12.0,
          fontWeight: FontWeight.w100,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
