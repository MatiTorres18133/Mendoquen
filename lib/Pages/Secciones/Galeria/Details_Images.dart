import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String imagePath;

  final String title;
  final String price;
  final String details;
  final int index;
  DetailsPage({
    required this.imagePath,
    required this.title,
    required this.price,
    required this.details,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                      image: AssetImage(imagePath), fit: BoxFit.cover)),
            ),
          ),
          Container(
            height: 260,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        price,
                        style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        details,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            // ignore: deprecated_member_use
                            child: FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              padding: EdgeInsets.symmetric(vertical: 15),
                              color: Colors.lightBlueAccent,
                              child: Text(
                                "Atras",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            // ignore: deprecated_member_use
                            child: FlatButton(
                              onPressed: () {},
                              padding: EdgeInsets.symmetric(vertical: 15),
                              color: Colors.lightBlueAccent,
                              child: Text(
                                "Comprar",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
