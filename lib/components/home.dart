import 'package:flutter/material.dart';
import 'package:klook2/components/categories.dart';
import 'package:klook2/components/recentlyHome.dart';
import 'package:klook2/components/topHomeCard.dart';

import 'hotel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String search;
  String recommended = 'KLOOK in cairo';
  List recommendedCities = [
    'KLOOK in cairo',
    'KLOOK in london',
    'KLOOK in Indonisia'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///////////////////// app bar ///////////////////////////////////

              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                child: Container(
                  color: Colors.deepOrange,
                  width: 390,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 310,
                          height: 45,
                          child: TextField(
                            cursorColor: Colors.orange[900],
                            // obscureText: true,
                            decoration: InputDecoration(
                              fillColor: Colors.grey,
                              icon: Icon(Icons.search_rounded),
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(30.0),
                                ),
                              ),
                              hintText: 'Search by destination or Activity ',
                            ),
                          ),
                        ),
                        Icon(Icons.shopping_cart_outlined),
                      ],
                    ),
                  ),
                ),
              ),

              //////////////// drop down list ///////////////////////////////
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.elliptical(10, 20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ],
                ),
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
                            child: GestureDetector(
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
                                          'Accomodation',
                                          style: TextStyle(
                                              fontSize: 9,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  )),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Hotel()),
                                );
                              },
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
              SizedBox(
                height: 10,
              ),
              ////////////////////////////// recently viewed /////////////////////////////////////////
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 250,
                        width: 175,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            RecentlyCard(
                              img: 'images/home/1.webp',
                              title: 'camel and bike tour in Giza Pyramids',
                              city: 'cairo',
                              price: ' 2,195',
                              date: 'tommorow',
                            ),
                            RecentlyCard(
                              img: 'images/home/1.webp',
                              title: 'camel and bike tour in Giza Pyramids',
                              city: 'cairo',
                              price: ' 2,195',
                              date: 'tommorow',
                            ),
                            RecentlyCard(
                              img: 'images/home/1.webp',
                              title: 'camel and bike tour in Giza Pyramids',
                              city: 'cairo',
                              price: ' 2,195',
                              date: 'tommorow',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // Column(
              //   children: [
              //     Row(
              //       children: [
              //         Container(
              //           height: 270,
              //           child: ListView(
              //             scrollDirection: Axis.horizontal,
              //             children: <Widget>[
              //               RecentlyCard(
              //                   img: 'images/1.webp',
              //                   title: 'camel and bike tour in Giza Pyramids',
              //                   city: 'cairo',
              //                   price: 'From EGP 2,195',
              //                   date: 'tommorow'),

              //         //       // RecentlyCard(
              //         //       //     staysImages: 'images/marriotHotel.jpg',
              //         //       //     rate: '5.0/5',
              //         //       //     name: 'Cairo Marriott',
              //         //       //     price: 'From EGP 1,113',
              //         //       //     stars: '5 Stars'),
              //         //       // RecentlyCard(
              //         //       //     staysImages: 'images/sofitelHotel.jpg',
              //         //       //     rate: '5.0/5',
              //         //       //     name: 'Sofitel Cairo Nile',
              //         //       //     price: 'From EGP 1,135',
              //         //       //     stars: '5 Stars'),
              //         //       // RecentlyCard(
              //         //       //     staysImages: 'images/fairmontHotel.jpg',
              //         //       //     rate: '5.0/5',
              //         //       //     name: 'Fairmont Nile City',
              //         //       //     price: 'From EGP 1,129',
              //         //       //     stars: '5 Stars'),
              //         //       // RecentlyCard(
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
                height: 15,
              ),
              // top things to do ///////////////////////////////////
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 270,
                        width: 290,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            TopCard(
                              img: 'images/home/2.PNG',
                              title:
                                  'JR Pass for Whole Japan (7, 14,or 21 days )',
                              type: 'Public transport . JR Pass',
                              rate: '4.8',
                              total: '13,755',
                              booked: '200K+',
                              price: ' 273.50',
                            ),
                            // RecentlyCard(
                            //   img: 'images/home/1.webp',
                            //   title: 'camel and bike tour in Giza Pyramids',
                            //   city: 'cairo',
                            //   price: ' 2,195',
                            //   date: 'tommorow',
                            // ),
                            // RecentlyCard(
                            //   img: 'images/home/1.webp',
                            //   title: 'camel and bike tour in Giza Pyramids',
                            //   city: 'cairo',
                            //   price: ' 2,195',
                            //   date: 'tommorow',
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      FlatButton(
                        onPressed: null,
                        child: Text('View all'),
                      )
                    ],
                  )
                ],
              ),

              ///////// get inspired////////////////////////////

              // ediscover /////////////////////

              // incrideble distination /////////////////////

              // klook recommended ///////////////////////

              // promo code ///////////////////////////,
            ],
          ),
        ),
      ),
    );
  }
}

Widget RecentlyCard({img, title, city, price, date}) {
  return RecentlyHomeCard(
    img: img,
    title: title,
    city: city,
    price: price,
    date: date,
  );
}

Widget TopCard({img, title, type, price, rate, total, booked}) {
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
