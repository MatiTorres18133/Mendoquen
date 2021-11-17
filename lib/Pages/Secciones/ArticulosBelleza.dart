import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/Secciones/Galeria/Details_Images.dart';
import 'package:flutter_application_1/Pages/Widget/Drawer.dart';
import 'package:flutter_application_1/Pages/Widget/MenuNav.dart';

List<ImageDetails> _images = [
  ImageDetails(
    imagePath: 'images/1.jfif',
    price: '\$1.000',
    title: 'Aros de acero',
    details:
        'This image was taken during a party in New York on new years eve. Quite a colorful shot.',
  ),
  ImageDetails(
    imagePath: 'images/2.jpeg',
    price: '\$10.00',
    title: 'Spring',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
  ImageDetails(
    imagePath: 'images/3.jpg',
    price: '\$30.00',
    title: 'Casual Look',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
  ImageDetails(
    imagePath: 'images/4.jpg',
    price: '\$20.00',
    title: 'New York',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
  ImageDetails(
    imagePath: 'images/5.png',
    price: '\$20.00',
    title: 'New York',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
  ImageDetails(
    imagePath: 'images/6.svg',
    price: '\$20.00',
    title: 'New York',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
  ImageDetails(
    imagePath: 'images/7.png',
    price: '\$20.00',
    title: 'New York',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
];

class ArticulosdeBelleza extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigo[800],
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blue[900],
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: ArtBelleza(),
    );
  }
}

class ArtBelleza extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widthP = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigo[900],
        title: Center(
          child: Text(
            "Articulos De Belleza",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      drawer: MainDrawer(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 40),
            SizedBox(height: 40),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return RawMaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              imagePath: _images[index].imagePath,
                              title: _images[index].title,
                              details: _images[index].details,
                              price: _images[index].price,
                              index: index,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: 'logo$index',
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage(_images[index].imagePath),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: _images.length,
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              child: Container(
                color: Colors.white,
                width: widthP,
                child: Align(
                  child: NavigatorMenu(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageDetails {
  final String imagePath;
  final String price;

  final String title;
  final String details;

  ImageDetails({
    required this.imagePath,
    required this.price,
    required this.title,
    required this.details,
  });
}
