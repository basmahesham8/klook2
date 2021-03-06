import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:klook2/components/IncridbleHomeCard.dart';
import 'package:klook2/components/RecommendedHomeCard.dart';
import 'package:klook2/components/RediscoverHomeCard.dart';
import 'package:klook2/components/destinationDetails.dart';
//import 'package:klook2/components/categories.dart';
import 'package:klook2/components/recentlyHome.dart';
import 'package:klook2/components/topHomeCard.dart';
import 'package:klook2/components/getInspiredHome.dart';
import './subCategoryActivities.dart';
import './search.dart';

import 'activitiesCard.dart';
import 'hotel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String search;
  String images;
  String cityName;
  String recommended = 'KLOOK in cairo';
  List recommendedCities = [
    'KLOOK in cairo',
    // 'KLOOK in london',
    // 'KLOOK in Indonisia'
  ];

  int _n = 0;
  void add(value) {
    setState(() {
      _n = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///////////////////// app bar ///////////////////////////////////

              SafeArea(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      ),
                  child: Container(
                    color: Colors.deepOrange,
                    width: 500,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(width: 400, height: 45, child: Search()),
                          // Icon(
                          //   Icons.shopping_cart_outlined,
                          //   color: Colors.white,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 25,
              // ),
              //////////////// drop down list ///////////////////////////////
              Align(
                alignment: Alignment.centerLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.elliptical(10, 20),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 10, bottom: 10),
                        child: DropdownButton(
                          value: recommended,
                          onChanged: (newCity) {
                            setState(() {
                              recommended = newCity;
                            });
                          },
                          items: recommendedCities.map(
                            (city) {
                              return DropdownMenuItem(
                                value: city,
                                child: Text(
                                  city,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //////////// small cards ////////////////////
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(7),
                    bottomRight: Radius.circular(7),
                    topLeft: Radius.circular(7),
                    topRight: Radius.circular(7),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      // color: Colors.white,
                      border: Border(
                        top: BorderSide(
                            width: 1.0,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                        left: BorderSide(
                            width: 1.0,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                        right: BorderSide(
                            width: 1.0,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                        bottom: BorderSide(
                            width: 1.0,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                      ),
                    ),
                    child: Column(
                      children: [
                        ///////////// first row //////////////////////
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //card experience /////////////////////////////////
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 5, top: 5, bottom: 5),
                              child: Card(
                                color: Color.fromRGBO(254, 243, 237, 1),
                                child: InkWell(
                                  // navigation of small cards
                                  splashColor: Colors.blue.withAlpha(30),
                                  onTap: () {
                                    showSubCategory();
                                  },
                                  child: Container(
                                    width: 150,
                                    height: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, bottom: 20),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: (Column(
                                          children: [
                                            Icon(
                                              Icons.card_travel_rounded,
                                              size: 30,
                                              color: Colors.deepOrange,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 2.0, bottom: 2),
                                                child: Container(
                                                  width: 110,
                                                  child: Center(
                                                    child: Text(
                                                      'Experiences',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        )),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            /////////////////// card transport ////////////////////////
                            // Card(
                            //   color: Color.fromRGBO(230, 239, 255, 1),
                            //   child: InkWell(
                            //     // navigation of small cards
                            //     splashColor: Colors.blue.withAlpha(30),
                            //     onTap: () {
                            //       print('Card tapped.');
                            //     },
                            //     child: Container(
                            //       width: 106,
                            //       height: 90,
                            //       child: Padding(
                            //         padding: const EdgeInsets.all(20.0),
                            //         child: (Column(
                            //           children: [
                            //             Icon(
                            //               Icons.electric_moped_rounded,
                            //               color: Colors.blue,
                            //             ),
                            //             Padding(
                            //               padding: const EdgeInsets.all(2.0),
                            //               child: Text(
                            //                 'Transport',
                            //                 style: TextStyle(
                            //                     fontSize: 10,
                            //                     fontWeight: FontWeight.bold),
                            //               ),
                            //             )
                            //           ],
                            //         )),
                            //       ),
                            //     ),
                            //   ),
                            // ),

                            /////////////////////// accomidation cad ///////////////////////
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 2.5, right: 2.5, top: 2.5, bottom: 5),
                              child: Card(
                                color: Color.fromRGBO(233, 248, 241, 1),
                                child: InkWell(
                                  // navigation of small cards
                                  splashColor: Colors.blue.withAlpha(30),
                                  onTap: () {
                                    print('Card tapped.');
                                  },
                                  child: Container(
                                    width: 150,
                                    height: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, bottom: 20),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.location_city_rounded,
                                              size: 30,
                                              color: Color.fromRGBO(
                                                  74, 206, 134, 1),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 2.0, bottom: 2),
                                                // GestureDetector(
                                                //   onTap: () => Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder: (context) => ActivityDetails(id: widget.id)),
                                                //   ),

                                                child: GestureDetector(
                                                  child: Container(
                                                    width: 110,
                                                    child: Center(
                                                      child: Text(
                                                        'Accomodations',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Hotel()),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //       top: 5, bottom: 5, left: 5, right: 5),
                            //   child: Card(
                            //     color: Color.fromRGBO(233, 248, 241, 1),
                            //     child: InkWell(
                            //       // navigation of small cards
                            //       splashColor: Colors.blue.withAlpha(30),
                            //       onTap: () {
                            //         print('Card tapped.');
                            //       },
                            //       child: GestureDetector(
                            //         child: Container(
                            //           width: 110,
                            //           height: 100,
                            //           child: Padding(
                            //             padding: const EdgeInsets.all(20.0),
                            //             child: (Column(
                            //               children: [
                            //                 Icon(
                            //                   Icons.location_city_rounded,
                            //                   color: Color.fromRGBO(
                            //                       74, 206, 134, 1),
                            //                 ),
                            //                 Padding(
                            //                   padding:
                            //                       const EdgeInsets.all(2.0),
                            //                   child: Text(
                            //                     'Accomodation',
                            //                     style: TextStyle(
                            //                         fontSize: 9,
                            //                         fontWeight:
                            //                             FontWeight.bold),
                            //                   ),
                            //                 )
                            //               ],
                            //             )),
                            //           ),
                            //         ),
                            //         onTap: () {
                            //           Navigator.push(
                            //             context,
                            //             MaterialPageRoute(
                            //                 builder: (context) => Hotel()),
                            //           );
                            //         },
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            //////////////////// wifi /////////////////////////////////////////
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //       left: 2.5, right: 10, top: 5, bottom: 5),
                            //   child: Card(
                            //     color: Color.fromRGBO(233, 248, 241, 1),
                            //     child: InkWell(
                            //       //       // navigation of small cards
                            //       splashColor: Colors.blue.withAlpha(30),
                            //       onTap: () {
                            //         print('Card tapped.');
                            //       },
                            //       child: Container(
                            //         width: 100,
                            //         height: 100,
                            //         child: Padding(
                            //           padding: const EdgeInsets.only(
                            //               top: 20, bottom: 20),
                            //           child: Align(
                            //             alignment: Alignment.center,
                            //             child: Column(
                            //               children: [
                            //                 Icon(
                            //                   Icons.rss_feed_rounded,
                            //                   color: Color.fromRGBO(
                            //                       74, 206, 134, 1),
                            //                 ),
                            //                 Padding(
                            //                   padding:
                            //                       const EdgeInsets.all(3.0),
                            //                   child: Padding(
                            //                     padding: const EdgeInsets.only(
                            //                         top: 2.0, bottom: 2),
                            //                     child: Container(
                            //                       width: 110,
                            //                       child: Center(
                            //                         child: Text(
                            //                           'WiFi & SIM',
                            //                           style: TextStyle(
                            //                               fontSize: 11.5,
                            //                               fontWeight:
                            //                                   FontWeight.bold),
                            //                         ),
                            //                       ),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            //****** other cards  */
                          ],
                        ),
                        ////////////// second row ///////////////////////
                        // Row(
                        //   children: [
                        //     // attraction card
                        //     Card(
                        //       child: InkWell(
                        //         // navigation of small cards
                        //         splashColor: Colors.blue.withAlpha(30),
                        //         onTap: () {
                        //           print('Card tapped.');
                        //         },
                        //         child: Container(
                        //           width: 106,
                        //           height: 90,
                        //           child: Padding(
                        //             padding: const EdgeInsets.all(20.0),
                        //             child: (Column(
                        //               children: [
                        //                 Icon(
                        //                   Icons.loyalty_outlined,
                        //                   color: Colors.deepOrangeAccent,
                        //                 ),
                        //                 Padding(
                        //                   padding: const EdgeInsets.all(3.0),
                        //                   child: Padding(
                        //                     padding: const EdgeInsets.all(2.0),
                        //                     child: Text(
                        //                       'Attractions',
                        //                       style: TextStyle(
                        //                           fontSize: 10,
                        //                           fontWeight: FontWeight.bold),
                        //                     ),
                        //                   ),
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //         ),

                        //         // Card(
                        //         //   child: InkWell(
                        //         //     // navigation of small cards
                        //         //     splashColor: Colors.blue.withAlpha(30),
                        //         //     onTap: () {
                        //         //       print('Card tapped.');
                        //         //     },
                        //         //     child: Container(
                        //         //       width: 110,
                        //         //       height: 100,
                        //         //       child: Padding(
                        //         //         padding: const EdgeInsets.all(20.0),
                        //         //         child: (Column(
                        //         //           children: [
                        //         //             Icon(
                        //         //               Icons.rss_feed_rounded,
                        //         //               color:
                        //         //                   Color.fromRGBO(74, 206, 134, 1),
                        //         //             ),
                        //         //             Padding(
                        //         //               padding: const EdgeInsets.all(3.0),
                        //         //               child: Padding(
                        //         //                 padding: const EdgeInsets.all(2.0),
                        //         //                 child: Text(
                        //         //                   'Wifi & SIM ',
                        //         //                   style: TextStyle(
                        //         //                       fontSize: 8,
                        //         //                       fontWeight: FontWeight.bold),
                        //         //                 ),
                        //         //               ),
                        //         //             )
                        //         //           ],
                        //         //         )),
                        //         //       ),
                        //         //     ),
                        //         //   ),
                        //         // ),

                        //         //************** other cards  */
                        //       ],
                        //     ),

                        ////////////// second row ///////////////////////

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     //card experience /////////////////////////////////
                        //     Padding(
                        //       padding: const EdgeInsets.only(
                        //           left: 10, right: 5, top: 5, bottom: 5),
                        //       child: Card(
                        //         //  color: Color.fromRGBO(254, 243, 237, 1),
                        //         child: InkWell(
                        //           // navigation of small cards
                        //           splashColor: Colors.blue.withAlpha(30),
                        //           onTap: () {
                        //             print('Card tapped.');
                        //           },
                        //           child: Container(
                        //             width: 100,
                        //             height: 100,
                        //             child: Padding(
                        //               padding: const EdgeInsets.only(
                        //                   top: 20, bottom: 20),
                        //               child: Align(
                        //                 alignment: Alignment.center,
                        //                 child: (Column(
                        //                   children: [
                        //                     Icon(
                        //                       Icons.loyalty_outlined,
                        //                       color: Colors.deepOrangeAccent,
                        //                     ),
                        //                     Padding(
                        //                       padding:
                        //                           const EdgeInsets.all(3.0),
                        //                       child: Padding(
                        //                         padding: const EdgeInsets.only(
                        //                             top: 2.0, bottom: 2),
                        //                         child: Container(
                        //                           width: 110,
                        //                           child: Center(
                        //                             child: Text(
                        //                               'Attractions',
                        //                               style: TextStyle(
                        //                                   fontSize: 12.5,
                        //                                   fontWeight:
                        //                                       FontWeight.bold),
                        //                             ),
                        //                           ),
                        //                         ),
                        //                       ),
                        //                     )
                        //                   ],
                        //                 )),
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //
                        //     /////////////////// card transport ////////////////////////
                        //     // Card(
                        //     //   color: Color.fromRGBO(230, 239, 255, 1),
                        //     //   child: InkWell(
                        //     //     // navigation of small cards
                        //     //     splashColor: Colors.blue.withAlpha(30),
                        //     //     onTap: () {
                        //     //       print('Card tapped.');
                        //     //     },
                        //     //     child: Container(
                        //     //       width: 106,
                        //     //       height: 90,
                        //     //       child: Padding(
                        //     //         padding: const EdgeInsets.all(20.0),
                        //     //         child: (Column(
                        //     //           children: [
                        //     //             Icon(
                        //     //               Icons.electric_moped_rounded,
                        //     //               color: Colors.blue,
                        //     //             ),
                        //     //             Padding(
                        //     //               padding: const EdgeInsets.all(2.0),
                        //     //               child: Text(
                        //     //                 'Transport',
                        //     //                 style: TextStyle(
                        //     //                     fontSize: 10,
                        //     //                     fontWeight: FontWeight.bold),
                        //     //               ),
                        //     //             )
                        //     //           ],
                        //     //         )),
                        //     //       ),
                        //     //     ),
                        //     //   ),
                        //     // ),
                        //
                        //     /////////////////////// accomidation cad ///////////////////////
                        //     Padding(
                        //       padding: const EdgeInsets.only(
                        //           left: 2.5, right: 2.5, top: 2.5, bottom: 5),
                        //       child: Card(
                        //         // color: Color.fromRGBO(233, 248, 241, 1),
                        //         child: InkWell(
                        //           // navigation of small cards
                        //           splashColor: Colors.blue.withAlpha(30),
                        //           onTap: () {
                        //             print('Card tapped.');
                        //           },
                        //           child: Container(
                        //             width: 100,
                        //             height: 100,
                        //             child: Padding(
                        //               padding: const EdgeInsets.only(
                        //                   top: 20, bottom: 20),
                        //               child: Align(
                        //                 alignment: Alignment.center,
                        //                 child: (Column(
                        //                   children: [
                        //                     Icon(
                        //                       Icons.beach_access_rounded,
                        //                       color: Color.fromRGBO(
                        //                           203, 110, 209, 1),
                        //                     ),
                        //                     Padding(
                        //                       padding:
                        //                           const EdgeInsets.all(3.0),
                        //                       child: Padding(
                        //                         padding: const EdgeInsets.only(
                        //                             top: 2.0, bottom: 2),
                        //                         child: Container(
                        //                           width: 110,
                        //                           child: Center(
                        //                             child: Text(
                        //                               'Tours',
                        //                               style: TextStyle(
                        //                                   fontSize: 12.5,
                        //                                   fontWeight:
                        //                                       FontWeight.bold),
                        //                             ),
                        //                           ),
                        //                         ),
                        //                       ),
                        //                     )
                        //                   ],
                        //                 )),
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //
                        //     // Padding(
                        //     //   padding: const EdgeInsets.only(
                        //     //       top: 5, bottom: 5, left: 5, right: 5),
                        //     //   child: Card(
                        //     //     color: Color.fromRGBO(233, 248, 241, 1),
                        //     //     child: InkWell(
                        //     //       // navigation of small cards
                        //     //       splashColor: Colors.blue.withAlpha(30),
                        //     //       onTap: () {
                        //     //         print('Card tapped.');
                        //     //       },
                        //     //       child: GestureDetector(
                        //     //         child: Container(
                        //     //           width: 110,
                        //     //           height: 100,
                        //     //           child: Padding(
                        //     //             padding: const EdgeInsets.all(20.0),
                        //     //             child: (Column(
                        //     //               children: [
                        //     //                 Icon(
                        //     //                   Icons.location_city_rounded,
                        //     //                   color: Color.fromRGBO(
                        //     //                       74, 206, 134, 1),
                        //     //                 ),
                        //     //                 Padding(
                        //     //                   padding:
                        //     //                       const EdgeInsets.all(2.0),
                        //     //                   child: Text(
                        //     //                     'Accomodation',
                        //     //                     style: TextStyle(
                        //     //                         fontSize: 9,
                        //     //                         fontWeight:
                        //     //                             FontWeight.bold),
                        //     //                   ),
                        //     //                 )
                        //     //               ],
                        //     //             )),
                        //     //           ),
                        //     //         ),
                        //     //         onTap: () {
                        //     //           Navigator.push(
                        //     //             context,
                        //     //             MaterialPageRoute(
                        //     //                 builder: (context) => Hotel()),
                        //     //           );
                        //     //         },
                        //     //       ),
                        //     //     ),
                        //     //   ),
                        //     // ),
                        //     //////////////////// wifi /////////////////////////////////////////
                        //     Padding(
                        //       padding: const EdgeInsets.only(
                        //           left: 2.5, right: 10, top: 5, bottom: 5),
                        //       child: Card(
                        //         //color: Color.fromRGBO(233, 248, 241, 1),
                        //         child: InkWell(
                        //           // navigation of small cards
                        //           splashColor: Colors.blue.withAlpha(30),
                        //           onTap: () {
                        //             print('Card tapped.');
                        //           },
                        //           child: Container(
                        //             width: 100,
                        //             height: 100,
                        //             child: Padding(
                        //               padding: const EdgeInsets.only(
                        //                   top: 20, bottom: 20),
                        //               child: Align(
                        //                 alignment: Alignment.center,
                        //                 child: (Column(
                        //                   children: [
                        //                     Icon(
                        //                       Icons.fastfood_rounded,
                        //                       color: Colors.deepOrangeAccent,
                        //                     ),
                        //                     Padding(
                        //                       padding:
                        //                           const EdgeInsets.all(3.0),
                        //                       child: Padding(
                        //                         padding: const EdgeInsets.only(
                        //                             top: 2.0, bottom: 2),
                        //                         child: Container(
                        //                           width: 110,
                        //                           child: Center(
                        //                             child: Text(
                        //                               'Food & Dining',
                        //                               style: TextStyle(
                        //                                   fontSize: 11.5,
                        //                                   fontWeight:
                        //                                       FontWeight.bold),
                        //                             ),
                        //                           ),
                        //                         ),
                        //                       ),
                        //                     )
                        //                   ],
                        //                 )),
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //
                        //     // Card(
                        //     //   child: InkWell(
                        //     //     // navigation of small cards
                        //     //     splashColor: Colors.blue.withAlpha(30),
                        //     //     onTap: () {
                        //     //       print('Card tapped.');
                        //     //     },
                        //     //     child: Container(
                        //     //       width: 110,
                        //     //       height: 100,
                        //     //       child: Padding(
                        //     //         padding: const EdgeInsets.all(20.0),
                        //     //         child: (Column(
                        //     //           children: [
                        //     //             Icon(
                        //     //               Icons.rss_feed_rounded,
                        //     //               color:
                        //     //                   Color.fromRGBO(74, 206, 134, 1),
                        //     //             ),
                        //     //             Padding(
                        //     //               padding: const EdgeInsets.all(3.0),
                        //     //               child: Padding(
                        //     //                 padding: const EdgeInsets.all(2.0),
                        //     //                 child: Text(
                        //     //                   'Wifi & SIM ',
                        //     //                   style: TextStyle(
                        //     //                       fontSize: 8,
                        //     //                       fontWeight: FontWeight.bold),
                        //     //                 ),
                        //     //               ),
                        //     //             )
                        //     //           ],
                        //     //         )),
                        //     //       ),
                        //     //     ),
                        //     //   ),
                        //     // ),
                        //
                        //     //************** other cards  */
                        //   ],
                        // ),

                        // Row(
                        //   children: [
                        //     // attraction card
                        //     Card(
                        //       child: InkWell(
                        //         // navigation of small cards
                        //         splashColor: Colors.blue.withAlpha(30),
                        //         onTap: () {
                        //           print('Card tapped.');
                        //         },
                        //         child: Container(
                        //           width: 122,
                        //           height: 90,
                        //           child: Padding(
                        //             padding: const EdgeInsets.all(20.0),
                        //             child: (Column(
                        //               children: [
                        //                 Icon(
                        //                   Icons.loyalty_outlined,
                        //                   color: Colors.deepOrangeAccent,
                        //                 ),
                        //                 Padding(
                        //                   padding: const EdgeInsets.all(3.0),
                        //                   child: Padding(
                        //                     padding: const EdgeInsets.all(2.0),
                        //                     child: Text(
                        //                       'Attractions',
                        //                       style: TextStyle(
                        //                           fontSize: 10,
                        //                           fontWeight: FontWeight.bold),
                        //                     ),
                        //                   ),
                        //                 )
                        //               ],
                        //             )),
                        //           ),
                        //         ),
                        //       ),
                        //     ),

                        //     // tours card
                        //     Card(
                        //       child: InkWell(
                        //         // navigation of small cards
                        //         splashColor: Colors.blue.withAlpha(30),
                        //         onTap: () {
                        //           print('Card tapped.');
                        //         },
                        //         child: Container(
                        //           width: 122,
                        //           height: 90,
                        //           child: Padding(
                        //             padding: const EdgeInsets.all(20.0),
                        //             child: (Column(
                        //               children: [
                        //                 Icon(
                        //                   Icons.beach_access_rounded,
                        //                   color:
                        //                       Color.fromRGBO(203, 110, 209, 1),
                        //                 ),
                        //                 Padding(
                        //                   padding: const EdgeInsets.all(3.0),
                        //                   child: Padding(
                        //                     padding: const EdgeInsets.all(2.0),
                        //                     child: Text(
                        //                       'Tours',
                        //                       style: TextStyle(
                        //                           fontSize: 10,
                        //                           fontWeight: FontWeight.bold),
                        //                     ),
                        //                   ),
                        //                 )
                        //               ],
                        //             )),
                        //           ),
                        //         ),
                        //       ),
                        //     ),

                        //     /// food card /////////////////////////
                        //     Card(
                        //       child: InkWell(
                        //         // navigation of small cards
                        //         splashColor: Colors.blue.withAlpha(30),
                        //         onTap: () {
                        //           print('Card tapped.');
                        //         },
                        //         child: Container(
                        //           width: 122,
                        //           height: 90,
                        //           child: Padding(
                        //             padding: const EdgeInsets.all(20.0),
                        //             child: (Column(
                        //               children: [
                        //                 Icon(
                        //                   Icons.fastfood_rounded,
                        //                   color: Colors.deepOrangeAccent,
                        //                 ),
                        //                 Padding(
                        //                   padding: const EdgeInsets.all(3.0),
                        //                   child: Padding(
                        //                     padding: const EdgeInsets.all(2.0),
                        //                     child: Text(
                        //                       'Food & Dining',
                        //                       style: TextStyle(
                        //                           fontSize: 8,
                        //                           fontWeight: FontWeight.bold),
                        //                     ),
                        //                   ),
                        //                 )
                        //               ],
                        //             )),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),

                        //////////////////// third row ////////////////////////////
                        Row(
                          children: [
                            // car rentals card
                            // Card(
                            //   child: InkWell(
                            //     // navigation of small cards
                            //     splashColor: Colors.blue.withAlpha(30),
                            //     onTap: () {
                            //       print('Card tapped.');
                            //     },
                            //     child: Container(
                            //       width: 106,
                            //       height: 90,
                            //       child: Padding(
                            //         padding: const EdgeInsets.all(20.0),
                            //         child: (Column(
                            //           children: [
                            //             Icon(
                            //               Icons.directions_car_rounded,
                            //               color: Color.fromRGBO(74, 206, 134, 1),
                            //             ),
                            //             Padding(
                            //               padding: const EdgeInsets.all(3.0),
                            //               child: Padding(
                            //                 padding: const EdgeInsets.all(2.0),
                            //                 child: Text(
                            //                   'Car Rentals',
                            //                   style: TextStyle(
                            //                       fontSize: 10,
                            //                       fontWeight: FontWeight.bold),
                            //                 ),
                            //               ),
                            //             )
                            //           ],
                            //         )),
                            //       ),
                            //     ),
                            //   ),
                            // ),

                            // airport card
                            // Card(
                            //   child: InkWell(
                            //     // navigation of small cards
                            //     splashColor: Colors.blue.withAlpha(30),
                            //     onTap: () {
                            //       print('Card tapped.');
                            //     },
                            //     child: Container(
                            //       width: 106,
                            //       height: 90,
                            //       child: Padding(
                            //         padding: const EdgeInsets.all(20.0),
                            //         child: (Column(
                            //           children: [
                            //             Icon(
                            //               Icons.airplanemode_active_rounded,
                            //               color: Color.fromRGBO(74, 206, 134, 1),
                            //             ),
                            //             Padding(
                            //               padding: const EdgeInsets.all(3.0),
                            //               child: Padding(
                            //                 padding: const EdgeInsets.all(2.0),
                            //                 child: Text(
                            //                   'Private Airport',
                            //                   style: TextStyle(
                            //                       fontSize: 8,
                            //                       fontWeight: FontWeight.bold),
                            //                 ),
                            //               ),
                            //             )
                            //           ],
                            //         )),
                            //       ),
                            //     ),
                            //   ),
                            // ),

                            /// wifi card /////////////////////////
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ////////////////////////////// recently viewed /////////////////////////////////////////
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 20, bottom: 7),
                      child: Text(
                        'Recently added',
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  //////  future builder //////////////////////////////
                  FutureBuilder<QuerySnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('ToursCollection')
                        .where('Section', isEqualTo: 'Top thing to do')
                        // .where('City', isEqualTo: 'Cairo')
                        .get(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(accentColor: Colors.deepOrange),
                            child: new CircularProgressIndicator(),
                          ),
                        );
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
                                  .map(
                                    (doc) => RecentlyHomeCard(
                                      id: doc.id,
                                      img: doc['Image'],
                                      title: doc['Title'],
                                      city: doc['City'],
                                      price: doc['Price'],
                                      date: doc['Date'],
                                    ),
                                  )
                                  .toList()),
                        ),
                      );
                    },
                  )

                  // FutureBuilder<QuerySnapshot>(
                  //   future: FirebaseFirestore.instance
                  //       .collection('ToursCollection')
                  //       .where('Section', isEqualTo: 'Top thing to do‏‏‏')
                  //       .where('City', isEqualTo: 'Cairo')
                  //       .get(),
                  //   builder: (context, snapshot) {
                  //     if (!snapshot.hasData) {
                  //       return new CircularProgressIndicator();
                  //     }

                  //     final List<DocumentSnapshot> documents =
                  //         snapshot.data.docs;
                  //     return Padding(
                  //       padding: const EdgeInsets.only(
                  //           top: 020, left: 5, bottom: 30),
                  //       child: Container(
                  //         height: 250,
                  //         //  width: 175,
                  //         child: ListView(
                  //             scrollDirection: Axis.horizontal,
                  //             children: documents
                  //                 .map(
                  //                   (card) => RecentlyHomeCard(
                  //                     img: card['Image'],
                  //                     title: card['Title'],
                  //                     city: card['City'],
                  //                     price: card['Price'],
                  //                     date: card['Date'],
                  //                   ),
                  //                 )
                  //                 .toList()),
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
              //   children: <Widget>[

              //     recentlyCard(
              //       img: 'images/home/1.webp',
              //       title: 'camel and bike tour in Giza Pyramids',
              //       city: 'cairo',
              //       price: ' 2,195',
              //       date: 'tommorow',
              //     ),
              //     recentlyCard(
              //       img: 'images/home/1.webp',
              //       title: 'camel and bike tour in Giza Pyramids',
              //       city: 'cairo',
              //       price: ' 2,195',
              //       date: 'tommorow',
              //     ),
              //     recentlyCard(
              //       img: 'images/home/1.webp',
              //       title: 'camel and bike tour in Giza Pyramids',
              //       city: 'cairo',
              //       price: ' 2,195',
              //       date: 'tommorow',
              //     ),
              //   ],

              // Column(
              //   children: [
              //     Row(
              //       children: [
              //         Container(
              //           height: 270,
              //           child: ListView(
              //             scrollDirection: Axis.horizontal,
              //             children: <Widget>[
              //               recentlyCard(
              //                   img: 'images/1.webp',
              //                   title: 'camel and bike tour in Giza Pyramids',
              //                   city: 'cairo',
              //                   price: 'From EGP 2,195',
              //                   date: 'tommorow'),

              //         //       // recentlyCard(
              //         //       //     staysImages: 'images/marriotHotel.jpg',
              //         //       //     rate: '5.0/5',
              //         //       //     name: 'Cairo Marriott',
              //         //       //     price: 'From EGP 1,113',
              //         //       //     stars: '5 Stars'),
              //         //       // recentlyCard(
              //         //       //     staysImages: 'images/sofitelHotel.jpg',
              //         //       //     rate: '5.0/5',
              //         //       //     name: 'Sofitel Cairo Nile',
              //         //       //     price: 'From EGP 1,135',
              //         //       //     stars: '5 Stars'),
              //         //       // recentlyCard(
              //         //       //     staysImages: 'images/fairmontHotel.jpg',
              //         //       //     rate: '5.0/5',
              //         //       //     name: 'Fairmont Nile City',
              //         //       //     price: 'From EGP 1,129',
              //         //       //     stars: '5 Stars'),
              //         //       // recentlyCard(
              //         //       //     staysImages: 'images/royalHotel.jpg',
              //         //       //     rate: '5.0/5',
              //         //       //     name: 'Kempinski Nile',
              //         //       //     price: 'From EGP 1,152',
              //         //       //     stars: '5 Stars'),
              //         //     ],
              //         //   ),
              //         // ),
              //       ],
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 25,
              ),
              // top things to do ///////////////////////////////////
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 10, top: 20, bottom: 7),
                        child: Text(
                          'Top Things to do',
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  FutureBuilder<QuerySnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('ToursCollection')
                        .where('Section', isEqualTo: 'Top thing to do')
                        .where('City', isEqualTo: 'Cairo')
                        .get(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(accentColor: Colors.deepOrange),
                            child: new CircularProgressIndicator(),
                          ),
                        );
                      }

                      final List<DocumentSnapshot> documents =
                          snapshot.data.docs;
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            height: 320,
                            width: 390,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: documents
                                  .map(
                                    (doc) => TopThingsCard(
                                      id: doc.id,
                                      img: doc['Image'],
                                      title: doc['Title'],
                                      type: doc['City'],
                                      rate: doc['Rate'],
                                      total: doc['Review'],
                                      booked: doc['Booked'],
                                      price: doc['Price'],
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      );

                      // Padding(
                      //   padding: const EdgeInsets.all(15),
                      //   child: Container(
                      //     height: 270,
                      //     child: ListView(
                      //         scrollDirection: Axis.horizontal,
                      //         children: documents
                      //             .map(
                      //               (doc) => RecentlyHomeCard(
                      //                 img: doc['Image'],
                      //                 title: doc['Title'],
                      //                 city: doc['City'],
                      //                 price: doc['Price'],
                      //                 date: doc['Date'],
                      //               ),
                      //             )
                      //             .toList()),
                      //   ),
                      // );
                    },
                  )

                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 10, right: 10),
                  //     child: Container(
                  //       height: 320,
                  //       width: 390,
                  //       child: ListView(
                  //         scrollDirection: Axis.horizontal,
                  //         children: <Widget>[
                  //           topCard(
                  //             img: 'images/home/topThings/1.webp',
                  //             title: 'TreeTop Challenge at Tamborine Mountain',
                  //             type: 'Outdoors & sports • Gold Coast',
                  //             rate: '4.8',
                  //             total: '43',
                  //             booked: '900+',
                  //             price: '610',
                  //           ),
                  //           topCard(
                  //             img: 'images/home/topThings/2.webp',
                  //             title:
                  //                 'Dreamworld, WhiteWater World and Skypoint Observation Deck 3-Day Pass ',
                  //             type: 'Attractions • Gold Coast',
                  //             rate: '4.2',
                  //             total: '65',
                  //             booked: '1k+',
                  //             price: '1,451',
                  //           ),
                  //           topCard(
                  //             img: 'images/home/topThings/3.webp',
                  //             title:
                  //                 'Sunrise Hot Air Balloon Ride in Hunter Valley',
                  //             type: 'Tours • Hunter Valley',
                  //             rate: '4.6',
                  //             total: '55',
                  //             booked: '1k+',
                  //             price: '3,401',
                  //           ),
                  //           topCard(
                  //             img: 'images/home/topThings/4.webp',
                  //             title:
                  //                 'Tiny House Discount Voucher in the Hunter Valley',
                  //             type: 'Shopping • Hunter Valley',
                  //             rate: '5.0',
                  //             total: '1',
                  //             booked: '100+',
                  //             price: '2,316',
                  //           ),
                  //           topCard(
                  //             img: 'images/home/topThings/5.webp',
                  //             title:
                  //                 'Kuranda Scenic Railway Heritage Class Admission',
                  //             type: 'Attractions • Cairns',
                  //             rate: '4.6',
                  //             total: '49',
                  //             booked: '1k+',
                  //             price: ' 610',
                  //           ),
                  //           topCard(
                  //             img: 'images/home/topThings/6.webp',
                  //             title: 'SEA LIFE Sydney Aquarium Ticket',
                  //             type: 'Attractions • Sydney',
                  //             rate: '4.5',
                  //             total: '769',
                  //             booked: '10k+',
                  //             price: '468',
                  //           ),
                  //           topCard(
                  //             img: 'images/home/topThings/7.webp',
                  //             title:
                  //                 'Great Barrier Reef Cruise and Scenic Helicopter Flight Tour',
                  //             type: 'Tours • Cairns',
                  //             rate: '4.2',
                  //             total: '33',
                  //             booked: '400+',
                  //             price: '4,331',
                  //           ),
                  //           // recentlyCard(
                  //           //   img: 'images/home/1.webp',
                  //           //   title: 'camel and bike tour in Giza Pyramids',
                  //           //   city: 'cairo',
                  //           //   price: ' 2,195',
                  //           //   date: 'tommorow',
                  //           // ),
                  //           // recentlyCard(
                  //           //   img: 'images/home/1.webp',
                  //           //   title: 'camel and bike tour in Giza Pyramids',
                  //           //   city: 'cairo',
                  //           //   price: ' 2,195',
                  //           //   date: 'tommorow',
                  //           // ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 15, top: 5),
                  //   child: Row(
                  //     children: [
                  //       MaterialButton(
                  //         elevation: 150,
                  //         color: Colors.transparent,
                  //         padding: EdgeInsets.symmetric(
                  //           vertical: 10,
                  //           horizontal: 140,
                  //         ),
                  //         //   highlightElevation: 50,
                  //         splashColor: Colors.deepOrange,
                  //         shape:
                  //             // RoundedRectangleBorder(
                  //             //   borderRadius: BorderRadius.circular(
                  //             //     30,
                  //             //   ),
                  //             // ),
                  //             Border.all(
                  //           // BorderRadius:BorderRadius.circular(30),
                  //           color: Colors.grey[400],
                  //           width: 1,
                  //         ),

                  //         onPressed: () {
                  //           print('button tapped.');
                  //         },
                  //         highlightColor: Colors.deepOrange,
                  //         child: Text('View all'),
                  //         textColor: Colors.grey[600],
                  //       )
                  //     ],
                  //   ),
                  // ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              ///////// get inspired////////////////////////////
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 10, top: 20, bottom: 7),
                        child: Text(
                          'Get inspired',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/home/4.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 020, left: 5, bottom: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, top: 10, bottom: 10),
                              child: Text(
                                'Treat yourself to something sweet',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 360,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, bottom: 10, top: 10),
                                child: Text(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry . Lorem Ipsum has been the standard  dummy text ever since the 1500s,',
                                  style: TextStyle(
                                    color: Colors.white,
                                    //   fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          FutureBuilder<QuerySnapshot>(
                            future: FirebaseFirestore.instance
                                .collection('ToursCollection')
                                .where('Section', isEqualTo: 'Get Inspired')
                                // .where('City', isEqualTo: 'Cairo')
                                .get(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                        accentColor: Colors.deepOrange),
                                    child: new CircularProgressIndicator(),
                                  ),
                                );
                              }

                              final List<DocumentSnapshot> documents =
                                  snapshot.data.docs;
                              return Container(
                                height: 250,
                                // width: 175,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: documents
                                      .map(
                                        (doc) => GetInspiredCard(
                                          id: doc.id,
                                          img: doc['Image'],
                                          title: doc['Title'],
                                          city: doc['City'],
                                          rate: doc['Rate'],
                                          total: doc['Review'],
                                          price: doc['Price'],
                                        ),
                                      )
                                      .toList(),
                                ),
                              );
                            },
                          ),

                          //         Container(
                          //           height: 250,
                          //           // width: 175,
                          //           child: ListView(
                          //             scrollDirection: Axis.horizontal,
                          //             children: <Widget>[
                          //               getInspired(
                          //                 img: 'images/home/1.webp',
                          //                 title: 'After Tea Cruise',
                          //                 city: 'London',
                          //                 price: ' 47.05',
                          //                 rate: '4.4',
                          //                 total: '24',
                          //               ),
                          //               // recentlyCard(
                          //               //   img: 'images/home/1.webp',
                          //               //   title: 'camel and bike tour in Giza Pyramids',
                          //               //   city: 'cairo',
                          //               //   price: ' 2,195',
                          //               //   date: 'tommorow',
                          //               // ),
                          //               // recentlyCard(
                          //               //   img: 'images/home/1.webp',
                          //               //   title: 'camel and bike tour in Giza Pyramids',
                          //               //   city: 'cairo',
                          //               //   price: ' 2,195',
                          //               //   date: 'tommorow',
                          //               // ),
                          //             ],
                          //           ),
                          //         ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 25,
              ),
              // rediscover /////////////////////
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/home/5.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child:
                          // new BackdropFilter(
                          //   filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          //   child:  new Container(),
                          // ),
                          Padding(
                        padding: const EdgeInsets.only(
                            top: 020, left: 5, bottom: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, top: 10, bottom: 10),
                                child: Text(
                                  'Rediscover your hometown',
                                  style: TextStyle(
                                    //color: Color.fromRGBO(31, 37, 47, 1),
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 350,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, top: 10, bottom: 10),
                                  child: Text(
                                    'Explore locally this Autumn and make the most of your hometown.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      //   fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            FutureBuilder<QuerySnapshot>(
                              future: FirebaseFirestore.instance
                                  .collection('ToursCollection')
                                  .where('Section', isEqualTo: 'Near in cairo')
                                  // .where('City', isEqualTo: 'Cairo')
                                  .get(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                          accentColor: Colors.deepOrange),
                                      child: new CircularProgressIndicator(),
                                    ),
                                  );
                                }

                                final List<DocumentSnapshot> documents =
                                    snapshot.data.docs;
                                return Container(
                                  height: 250,
                                  // width: 175,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: documents
                                        .map(
                                          (doc) => RediscoverCard(
                                            id: doc.id,

                                            img: doc['Image'],
                                            title: doc['Title'],
                                            city: doc['City'],
                                            rate: doc['Rate'],
                                            total: doc['Review'],
                                            price: doc['Price'],
                                            // img: 'images/home/1.webp',
                                            //         title: 'After Tea Cruise',
                                            //         city: 'London',
                                            //         price: ' 47.05',
                                            //         rate: '4.4',
                                            //         total: '24',
                                          ),
                                        )
                                        .toList(),
                                  ),
                                );
                              },
                            ),

                            // Container(
                            //   height: 250,
                            //   // width: 175,
                            //   child: ListView(
                            //     scrollDirection: Axis.horizontal,
                            //     children: <Widget>[
                            //       rediscoverCard(
                            //         img: 'images/home/1.webp',
                            //         title: 'After Tea Cruise',
                            //         city: 'London',
                            //         price: ' 47.05',
                            //         rate: '4.4',
                            //         total: '24',
                            //       ),
                            //       // recentlyCard(
                            //       //   img: 'images/home/1.webp',
                            //       //   title:
                            //       //       'camel and bike tour in Giza Pyramids',
                            //       //   city: 'cairo',
                            //       //   price: ' 2,195',
                            //       //   date: 'tommorow',
                            //       // ),
                            //       // recentlyCard(
                            //       //   img: 'images/home/1.webp',
                            //       //   title:
                            //       //       'camel and bike tour in Giza Pyramids',
                            //       //   city: 'cairo',
                            //       //   price: ' 2,195',
                            //       //   date: 'tommorow',
                            //       // ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // incrideble distination /////////////////////
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 10, top: 20, bottom: 7),
                        child: Text(
                          'Incredible destinations',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // FutureBuilder<QuerySnapshot>(
                  //   future: FirebaseFirestore.instance
                  //       .collection('Cities')
                  //       // .where('Section', isEqualTo: 'Near in cairo')
                  //       // .where('City', isEqualTo: 'Cairo')
                  //       .get(),
                  //   builder: (context, snapshot) {
                  //     if (!snapshot.hasData) {
                  //       return new CircularProgressIndicator();
                  //     }

                  //     final List<DocumentSnapshot> documents =
                  //         snapshot.data.docs;
                  //     return GestureDetector(
                  //       child: Container(
                  //         height: 275,
                  //         width: 390,
                  //         child: ListView(
                  //           scrollDirection: Axis.horizontal,
                  //           children: documents
                  //               .map(
                  //                 (doc) => IncredibleCard(
                  //                   img: doc['Image'],
                  //                   city: doc['City1'],
                  //                 ),
                  //               )
                  //               .toList(),
                  //         ),
                  //       ),
                  //       onTap: () {
                  //         Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => DestinationDetails(
                  //                   img: images, text: cityName)),
                  //         );
                  //       },
                  //     );
                  //   },
                  // ),

                  Container(
                    height: 290,
                    width: 390,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        IncredibleCard(
                          img: 'images/cairo.png',
                          city: 'Cairo',
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: IncredibleCard(
                            img: 'images/sharm.png',
                            city: 'Sharm El Sheikh',
                          ),
                        ),
                        // IncredibleCard(
                        //   img: 'images/home/Incridible/3.webp',
                        //   city: 'Singapore',
                        // ),
                        // IncredibleCard(
                        //   img: 'images/home/Incridible/4.webp',
                        //   city: 'Hong Kong',
                        // ),
                        // IncredibleCard(
                        //   img: 'images/home/Incridible/5.webp',
                        //   city: 'Taipei',
                        // ),
                        // IncredibleCard(
                        //   img: 'images/home/Incridible/6.webp',
                        //   city: 'Bangkok',
                        // ),
                        // IncredibleCard(
                        //   img: 'images/home/Incridible/7.webp',
                        //   city: 'Taichung',
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              // klook recommended ///////////////////////
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 10, top: 20, bottom: 7),
                        child: Text(
                          'Klook recommended',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 360,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, bottom: 10, top: 10),
                        child: Text(
                          'Incredible experiences whenever you are-chosen by our travel curators',
                          style: TextStyle(
                            color: Colors.grey,
                            //   fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),

                  FutureBuilder<QuerySnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('ToursCollection')
                        .where('Section', isEqualTo: 'Klook Recommended')
                        // .where('City', isEqualTo: 'Cairo')
                        .get(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(accentColor: Colors.deepOrange),
                            child: new CircularProgressIndicator(),
                          ),
                        );
                      }

                      final List<DocumentSnapshot> documents =
                          snapshot.data.docs;
                      return Container(
                        height: 320,
                        width: 390,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: documents
                              .map(
                                (doc) => RecommendedCard(
                                  id: doc.id,
                                  img: doc['Image'],
                                  city: doc['City'],
                                  title: doc['Title'],
                                  type: doc['Type'],
                                  rate: doc['Rate'],
                                  total: doc['Review'],
                                  booked: doc['Booked'],
                                  price: doc['Price'],
                                  oldPrice: doc['OldPrice'],
                                ),
                              )
                              .toList(),
                        ),
                      );
                    },
                  ),

                  // Container(
                  //   height: 320,
                  //   width: 390,
                  //   child: ListView(
                  //     scrollDirection: Axis.horizontal,
                  //     children: <Widget>[
                  //       recommendedCard(
                  //         img: 'images/home/2.PNG',
                  //         title: 'Windsor Castle Ticket',
                  //         type: 'Attractions',
                  //         rate: '5.0',
                  //         total: '1',
                  //         booked: '100K+',
                  //         price: ' 273.50',
                  //         city: 'London',
                  //         oldPrice: '32.55',
                  //       ),
                  //       recommendedCard(
                  //         img: 'images/home/2.PNG',
                  //         title: 'Windsor Castle Ticket',
                  //         type: 'Attractions',
                  //         rate: '5.0',
                  //         total: '1',
                  //         booked: '100K+',
                  //         price: ' 273.50',
                  //         city: 'London',
                  //         oldPrice: '32.55',
                  //       ),
                  //       recommendedCard(
                  //         img: 'images/home/2.PNG',
                  //         title: 'Windsor Castle Ticket',
                  //         type: 'Attractions',
                  //         rate: '5.0',
                  //         total: '1',
                  //         booked: '100K+',
                  //         price: ' 273.50',
                  //         city: 'London',
                  //         oldPrice: '32.55',
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              // promo code ///////////////////////////,
              // Column(
              //   children: [
              //     Container(
              //       height: 170,
              //       width: 290,
              //       child: Card(
              //         child: Stack(
              //           children: <Widget>[
              //             Container(
              //               height: 120,
              //               child: Image(
              //                 image: AssetImage('images/home/1.webp'),
              //                 width: 290,
              //                 height: 170,
              //                 fit: BoxFit.fitWidth,
              //               ),
              //             ),
              //             Text(
              //               'Use promo code',
              //               style: TextStyle(
              //                 color: Colors.white,
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: 15,
              //               ),
              //             ),
              //             Container(
              //               width: 280,
              //               child: Text(
              //                 '\'Mobile 10\' to get EGP\$1.3 off your first booking',
              //                 style: TextStyle(
              //                   color: Colors.white,
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 15,
              //                 ),
              //               ),
              //             ),
              //             MaterialButton(
              //               elevation: 150,
              //               color: Colors.deepOrange,
              //               padding: EdgeInsets.symmetric(
              //                 vertical: 10,
              //                 horizontal: 10,
              //               ),
              //               //   highlightElevation: 50,
              //               splashColor: Colors.orange,
              //               shape:
              //                   // RoundedRectangleBorder(
              //                   //   borderRadius: BorderRadius.circular(
              //                   //     30,
              //                   //   ),
              //                   // ),
              //                   Border.all(
              //                 // BorderRadius:BorderRadius.circular(30),
              //                 color: Colors.orange,
              //                 width: 1,
              //               ),

              //               onPressed: () {
              //                 print('button tapped.');
              //               },
              //               highlightColor: Colors.orange,
              //               child: Text('Redeem'),
              //               textColor: Colors.white,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // ////////////////////////////////////////
              // Column(
              //   children: [
              //     Container(
              //       height: 170,
              //       width: 290,
              //       child: Card(
              //         child: Stack(
              //           children: <Widget>[
              //             Container(
              //               height: 120,
              //               child: Image(
              //                 image: AssetImage('images/home/1.webp'),
              //                 width: 290,
              //                 height: 170,
              //                 fit: BoxFit.fitWidth,
              //               ),
              //             ),
              //             Text(
              //               'Use promo code',
              //               style: TextStyle(
              //                 color: Colors.white,
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: 15,
              //               ),
              //             ),
              //             Container(
              //               width: 280,
              //               child: Text(
              //                 '\'Mobile 10\' to get EGP\$1.3 off your first booking',
              //                 style: TextStyle(
              //                   color: Colors.white,
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 15,
              //                 ),
              //               ),
              //             ),
              //             MaterialButton(
              //               elevation: 150,
              //               color: Colors.deepOrange,
              //               padding: EdgeInsets.symmetric(
              //                 vertical: 10,
              //                 horizontal: 10,
              //               ),
              //               //   highlightElevation: 50,
              //               splashColor: Colors.orange,
              //               shape:
              //                   // RoundedRectangleBorder(
              //                   //   borderRadius: BorderRadius.circular(
              //                   //     30,
              //                   //   ),
              //                   // ),
              //                   Border.all(
              //                 // BorderRadius:BorderRadius.circular(30),
              //                 color: Colors.orange,
              //                 width: 1,
              //               ),

              //               onPressed: () {
              //                 print('button tapped.');
              //               },
              //               highlightColor: Colors.orange,
              //               child: Text('Redeem'),
              //               textColor: Colors.white,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void showSubCategory() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance
                  .collection('SubCategories')
                  .where('Name', isNotEqualTo: 'Experiences')
                  .get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("Loading");
                }
                final List<DocumentSnapshot> documents = snapshot.data.docs;
                return ListView(
                    children: documents
                        .map((doc) => Column(children: [
                              // SizedBox (height: 20,),
                              Card(
                                margin: const EdgeInsets.all(10),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SubCategoryActivities(
                                                  subCategoryName:
                                                      doc['Name'])),
                                    );
                                  },
                                  title: Row(children: [
                                    Expanded(
                                        child: Container(
                                          child: Image.network(doc['Image']),
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 7, 0),
                                        ),
                                        flex: 1),
                                    Expanded(child: Text(doc['Name']), flex: 8),

                                    Expanded(
                                        child: Icon(Icons.keyboard_arrow_right),
                                        flex: 1),

                                    // Icon(Icons.keyboard_arrow_right),
                                  ]),
                                ),
                              )
                            ]))
                        .toList());
              });
        });
  }
}

Widget recentlyCard({img, title, city, price, date}) {
  return RecentlyHomeCard(
    img: img,
    title: title,
    city: city,
    price: price,
    date: date,
  );
}

Widget topCard({img, title, type, price, rate, total, booked}) {
  return TopThingsCard(
    img: img,
    title: title,
    type: type,
    price: price,
    rate: rate,
    total: total,
    booked: booked,
  );
}

Widget getInspired({img, title, type, price, rate, total, city}) {
  return GetInspiredCard(
    img: img,
    title: title,
    city: city,
    price: price,
    rate: rate,
    total: total,
  );
}

Widget rediscoverCard({img, title, type, price, rate, total, city}) {
  return RediscoverCard(
    img: img,
    title: title,
    city: city,
    price: price,
    rate: rate,
    total: total,
  );
}

Widget incredibleCard({img, city}) {
  return IncredibleCard(
    img: img,
    city: city,
  );
}

Widget recommendedCard(
    {img, title, type, price, rate, total, booked, city, oldPrice}) {
  return RecommendedCard(
    img: img,
    title: title,
    type: type,
    price: price,
    rate: rate,
    total: total,
    booked: booked,
    city: city,
    oldPrice: oldPrice,
  );
}
