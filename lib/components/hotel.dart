import 'package:flutter/material.dart';
import 'package:klook2/components/hotel.dart';
import 'package:klook2/components/StaysCard.dart';

// void main(){
//   runApp(Categories());
// }
class Hotel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: <Widget>[
                    Image(image: AssetImage('images/mountain.jpg')),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Hotels & more',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding:
                          new EdgeInsets.only(top: 100, left: 15, right: 5),
                      child: Text(
                        'Save on amazing places to stay and explore unique experiences.',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 15),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Popular Stays',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  height: 270,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      popularStays(
                          staysImages: 'images/fourSeasonHotel.jpg',
                          rate: '4.5/5',
                          name: 'Four Seasons Cairo',
                          price: 'From EGP 2,195',
                          stars: '5 Stars'),
                      popularStays(
                          staysImages: 'images/marriotHotel.jpg',
                          rate: '5.0/5',
                          name: 'Cairo Marriott',
                          price: 'From EGP 1,113',
                          stars: '5 Stars'),
                      popularStays(
                          staysImages: 'images/sofitelHotel.jpg',
                          rate: '5.0/5',
                          name: 'Sofitel Cairo Nile',
                          price: 'From EGP 1,135',
                          stars: '5 Stars'),
                      popularStays(
                          staysImages: 'images/fairmontHotel.jpg',
                          rate: '5.0/5',
                          name: 'Fairmont Nile City',
                          price: 'From EGP 1,129',
                          stars: '5 Stars'),
                      popularStays(
                          staysImages: 'images/royalHotel.jpg',
                          rate: '5.0/5',
                          name: 'Kempinski Nile',
                          price: 'From EGP 1,152',
                          stars: '5 Stars'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                color: Color.fromRGBO(134, 132, 130, 1),
                height: 500,
                // width: MediaQuery.of(context).size.width,
                width: 500,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Text(
                          'Hotel Vouchers',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, left: 20),
                        child: Text(
                          'Get money off your getaway with klook-exclusive vouchers',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget popularStays({staysImages, rate, name, price, stars}) {
  return StaysCard(
    staysImages: staysImages,
    rate: rate,
    name: name,
    price: price,
    stars: stars,
  );
}
