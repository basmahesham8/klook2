import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:klook2/components/activitiesCard.dart';
import 'package:klook2/components/destinationCityCard.dart';
import 'package:klook2/components/tourCard.dart';

class DestinationDetails extends StatefulWidget {
  String img, text;
  DestinationDetails({this.img, this.text});
  @override
  _DestinationDetailsState createState() => _DestinationDetailsState();
}

class _DestinationDetailsState extends State<DestinationDetails> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back,
              color: Colors.grey,
              size: 30,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.grey,
                    size: 30,
                  ),
                  onPressed: () {}),
            ),
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                      height: 605,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.img),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: new BackdropFilter(
                        filter: new ImageFilter.blur(sigmaX: 2.0, sigmaY: 1.5),
                        child: new Container(
                          decoration: new BoxDecoration(
                              color: Colors.white.withOpacity(0.1)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(widget.text,
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),

                    //categories
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 400, left: 10, right: 10),
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.local_activity,
                                        color: Colors.deepOrange,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Attractions',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.emoji_nature,
                                        color: Colors.green,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: 80,
                                        child: Text(
                                          'Outdoors & sports',
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.self_improvement,
                                        color: Colors.lightBlueAccent,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: 90,
                                        child: Text(
                                          'Relaxation & beauty',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.border_color,
                                        color: Colors.blueAccent,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: 90,
                                        child: Text(
                                          'Culture & workshops',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.wine_bar,
                                        color: Colors.pink,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: 80,
                                        child: Center(
                                          child: Text(
                                            'Fun & nightlife',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.beach_access_outlined,
                                        color: Colors.purple,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: 80,
                                        child: Text(
                                          'Tours',
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                widget.text == "Cairo"
                    ? Padding(
                        padding: const EdgeInsets.only(top: 30, left: 15),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Popular activities',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 30, left: 15)),
                widget.text == "Cairo"
                    ? FutureBuilder<QuerySnapshot>(
                        future: FirebaseFirestore.instance
                            .collection('ToursCollection')
                            .where('Section', isEqualTo: 'BestSeller')
                            .where('City', isEqualTo: 'Cairo')
                            .get(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return new CircularProgressIndicator();
                          }

                          final List<DocumentSnapshot> documents =
                              snapshot.data.docs;
                          return Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              height: 270,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: documents
                                      .map((doc) => ActivityCard(
                                            title: doc['Title'],
                                            image: doc['Image'],
                                            booked: doc['Booked'],
                                            date: doc['Date'],
                                            price: doc['Price'],
                                          ))
                                      .toList()),
                            ),
                          );
                        })
                    : SizedBox(
                        height: 30,
                      ),
                Container(
                  // width: MediaQuery.of(context).size.width,

                  child: Column(
                    children: [
                      widget.text == "Cairo"
                          ? Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 20),
                                child: Text(
                                  'Recently added',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          : Padding(padding: const EdgeInsets.all(0)),
                      widget.text == "Cairo"
                          ? FutureBuilder<QuerySnapshot>(
                              future: FirebaseFirestore.instance
                                  .collection('ToursCollection')
                                  .where('Section',
                                      isEqualTo: 'Klook Recommended')
                                  .get(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return new CircularProgressIndicator();
                                }

                                final List<DocumentSnapshot> documents =
                                    snapshot.data.docs;
                                return Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Container(
                                    height: 270,
                                    child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: documents
                                            .map((doc) => ActivityCard(
                                                  title: doc['Title'],
                                                  image: doc['Image'],
                                                  booked: doc['Booked'],
                                                  date: doc['Date'],
                                                  price: doc['Price'],
                                                ))
                                            .toList()),
                                  ),
                                );
                              })
                          : Padding(padding: const EdgeInsets.all(0))
                    ],
                  ),
                ),
                Container(
                  // width: MediaQuery.of(context).size.width,

                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          child: Text(
                            'Nearby destinations',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      widget.text == "Cairo"
                          ? Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Container(
                                height: 300,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    nearbyDest(
                                        images: "images/sharm.png",
                                        distance: "Distance of ",
                                        distanceKm: "353 ",
                                        distance1: "Km",
                                        cityName: "Sharm El Sheikh"),
                                  ],
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Container(
                                height: 300,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    nearbyDest(
                                        images: "images/cairo.png",
                                        distance: "Distance of",
                                        distanceKm: "332 ",
                                        distance1: "Km",
                                        cityName: "Cairo"),
                                  ],
                                ),
                              ),
                            )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget nearbyDest({images, distance, distanceKm, distance1, cityName}) {
  return DestinationCityCard(
      images: images,
      distance: distance,
      distanceKm: distanceKm,
      distance1: distance1,
      cityName: cityName);
}
