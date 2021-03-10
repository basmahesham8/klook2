import 'package:flutter/material.dart';
import 'package:klook2/components/cityCard.dart';

class Destination extends StatelessWidget {
  const Destination({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SafeArea(
                        left: false,
                        top: true,
                        bottom: true,
                        right: false,
                        child: Text(
                          'Destination',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )),
                    SafeArea(
                        left: false,
                        top: true,
                        bottom: true,
                        right: false,
                        child: Icon(Icons.shopping_cart_outlined)),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 20,
              ),
              //Experiences:
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      child: Text(
                        'Find your next adventure',
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("Egypt",
                          style: TextStyle(fontSize: 15, color: Colors.white)),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ),
              //Tours:

              Padding(
                padding: const EdgeInsets.only(top: 30, left: 10),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Popular destinations',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    )),
              ),

              Container(
                height: 270,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    popularStays(images: "images/cairo.png", cityName: "Cairo"),
                    popularStays(
                        images: "images/sharm.png",
                        cityName: "Sharm El Sheikh"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget popularStays({images, cityName}) {
  return CityCards(images: images, cityName: cityName);
}
