import 'package:flutter/material.dart';

import 'package:flutter_application_1/Login/LoginPage.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'buton.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'BIENVENIDOS A MEDNDOQUEN APP',
              body: 'Siempre al servicio del cliente',
              image: SvgPicture.asset('assets/images/Login.svg'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Explora todo nuestro catalogo',
              body:
                  'Si deseas adquirir algunos de nuestros articulos, solo haz click en agregar al carrito',
              image: SvgPicture.asset("assets/images/Explore.svg"),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Interfaz intutitiva',
              body:
                  'Facil funcionamiento, adaptable para todos nuestros clientes',
              image: SvgPicture.asset("assets/images/Login.svg"),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'COMENZEMOS',
              body: 'Gracias por elegirnos!',
              footer: ButtonWidget(
                text: 'Comenzar',
                onClicked: () => goToHome(context),
              ),
              image: SvgPicture.asset("assets/images/Login.svg"),
              decoration: getPageDecoration(),
            ),
          ],
          done: Text('Read', style: TextStyle(fontWeight: FontWeight.w600)),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: Text('Skip'),
          onSkip: () => goToHome(context),
          next: Icon(Icons.arrow_forward),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => print('Page $index selected'),
          globalBackgroundColor: Theme.of(context).primaryColor,
          skipFlex: 0,
          nextFlex: 0,
          // isProgressTap: false,
          // isProgress: false,
          // showNextButton: false,
          // freeze: true,
          // animationDuration: 1000,
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LoginPage()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Color(0xFFBDBDBD),
        //activeColor: Colors.orange,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
        descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
