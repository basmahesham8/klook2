import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String recommended = 'KLOOK in cairo';
  List recommendedCities = [
    'KLOOK in cairo',
    'KLOOK in london',
    'KLOOK in Indonisia'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //////////////// drop down list ///////////////////////////////
            DropdownButton(
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
                    ),
                  );
                },
              ).toList(),
            ),
            //////////// small cards ////////////////////
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                      width: 1.0, color: Color.fromRGBO(155, 155, 155, 0.5)),
                  left: BorderSide(
                      width: 1.0, color: Color.fromRGBO(94, 94, 94, 0.5)),
                  right: BorderSide(
                      width: 1.0, color: Color.fromRGBO(94, 94, 94, 0.5)),
                  bottom: BorderSide(
                      width: 1.0, color: Color.fromRGBO(94, 94, 94, 0.5)),
                ),
              ),
              child: Column(
                children: [
                  ///////////// first row //////////////////////
                  Row(
                    children: [
                      //card experience /////////////////////////////////
                      Card(
                        color: Color.fromRGBO(254, 243, 237, 1),
                        child: InkWell(
                          // navigation of small cards
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            print('Card tapped.');
                          },
                          child: Container(
                            width: 106,
                            height: 90,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: (Column(
                                children: [
                                  Icon(
                                    Icons.card_travel_rounded,
                                    color: Colors.deepOrange,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        'Experiences',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                            ),
                          ),
                        ),
                      ),

                      /////////////////// card transport ////////////////////////
                      Card(
                        color: Color.fromRGBO(230, 239, 255, 1),
                        child: InkWell(
                          // navigation of small cards
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            print('Card tapped.');
                          },
                          child: Container(
                            width: 106,
                            height: 90,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: (Column(
                                children: [
                                  Icon(
                                    Icons.electric_moped_rounded,
                                    color: Colors.blue,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      'Transport',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              )),
                            ),
                          ),
                        ),
                      ),

                      /////////////////////// accomidation cad ///////////////////////
                      Card(
                        color: Color.fromRGBO(233, 248, 241, 1),
                        child: InkWell(
                          // navigation of small cards
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            print('Card tapped.');
                          },
                          child: Container(
                            width: 106,
                            height: 90,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: (Column(
                                children: [
                                  Icon(
                                    Icons.location_city_rounded,
                                    color: Color.fromRGBO(74, 206, 134, 1),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      'Accomoditions',
                                      style: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              )),
                            ),
                          ),
                        ),
                      ),

                      //************** other cards  */
                    ],
                  ),
                  ////////////// second row ///////////////////////
                  Row(
                    children: [
                      // attraction card
                      Card(
                        child: InkWell(
                          // navigation of small cards
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            print('Card tapped.');
                          },
                          child: Container(
                            width: 106,
                            height: 90,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: (Column(
                                children: [
                                  Icon(
                                    Icons.loyalty_outlined,
                                    color: Colors.deepOrangeAccent,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        'Attractions',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                            ),
                          ),
                        ),
                      ),

                      // tours card
                      Card(
                        child: InkWell(
                          // navigation of small cards
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            print('Card tapped.');
                          },
                          child: Container(
                            width: 106,
                            height: 90,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: (Column(
                                children: [
                                  Icon(
                                    Icons.beach_access_rounded,
                                    color: Color.fromRGBO(203, 110, 209, 1),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        'Tours',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                            ),
                          ),
                        ),
                      ),

                      /// food card /////////////////////////
                      Card(
                        child: InkWell(
                          // navigation of small cards
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            print('Card tapped.');
                          },
                          child: Container(
                            width: 106,
                            height: 90,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: (Column(
                                children: [
                                  Icon(
                                    Icons.fastfood_rounded,
                                    color: Colors.deepOrangeAccent,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        'Food & Dining',
                                        style: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  //////////////////// third row ////////////////////////////
                  Row(
                    children: [
                      // car rentals card
                      Card(
                        child: InkWell(
                          // navigation of small cards
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            print('Card tapped.');
                          },
                          child: Container(
                            width: 106,
                            height: 90,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: (Column(
                                children: [
                                  Icon(
                                    Icons.directions_car_rounded,
                                    color: Color.fromRGBO(74, 206, 134, 1),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        'Car Rentals',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                            ),
                          ),
                        ),
                      ),

                      // airport card
                      Card(
                        child: InkWell(
                          // navigation of small cards
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            print('Card tapped.');
                          },
                          child: Container(
                            width: 106,
                            height: 90,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: (Column(
                                children: [
                                  Icon(
                                    Icons.airplanemode_active_rounded,
                                    color: Color.fromRGBO(74, 206, 134, 1),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        'Private Airport',
                                        style: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                            ),
                          ),
                        ),
                      ),

                      /// wifi card /////////////////////////
                      Card(
                        child: InkWell(
                          // navigation of small cards
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            print('Card tapped.');
                          },
                          child: Container(
                            width: 106,
                            height: 90,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: (Column(
                                children: [
                                  Icon(
                                    Icons.rss_feed_rounded,
                                    color: Color.fromRGBO(74, 206, 134, 1),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        'Wifi & SIM ',
                                        style: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ////////////////////////////// recently viewed /////////////////////////////////////////
            Column(
              children: [
                Row(
                  children: [Card()],
                )
              ],
            )

            // top things to do ///////////////////////////////////

            ///////// get inspired////////////////////////////

            // ediscover /////////////////////

            // incrideble distination /////////////////////

            // klook recommended ///////////////////////

            // promo code ///////////////////////////,
          ],
        ),
      ),
    );
  }
}
