import 'package:flutter/material.dart';
import 'package:klook2/components/IncridbleHomeCard.dart';
import 'package:klook2/components/RecommendedHomeCard.dart';
import 'package:klook2/components/RediscoverHomeCard.dart';
//import 'package:klook2/components/categories.dart';
import 'package:klook2/components/recentlyHome.dart';
import 'package:klook2/components/topHomeCard.dart';
import 'package:klook2/components/getInspiredHome.dart';

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
                                  MaterialPageRoute(
                                      builder: (context) => Hotel()),
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
                height: 25,
              ),
              ////////////////////////////// recently viewed /////////////////////////////////////////
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Recently Viewed',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 250,
                    //  width: 175,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        recentlyCard(
                          img: 'images/home/1.webp',
                          title: 'camel and bike tour in Giza Pyramids',
                          city: 'cairo',
                          price: ' 2,195',
                          date: 'tommorow',
                        ),
                        recentlyCard(
                          img: 'images/home/1.webp',
                          title: 'camel and bike tour in Giza Pyramids',
                          city: 'cairo',
                          price: ' 2,195',
                          date: 'tommorow',
                        ),
                        recentlyCard(
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
                      child: Text(
                        'Top Things to Do',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 270,
                    width: 290,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        topCard(
                          img: 'images/home/2.PNG',
                          title: 'JR Pass for Whole Japan (7, 14,or 21 days )',
                          type: 'Public transport . JR Pass',
                          rate: '4.8',
                          total: '13,755',
                          booked: '200K+',
                          price: ' 273.50',
                        ),
                        // recentlyCard(
                        //   img: 'images/home/1.webp',
                        //   title: 'camel and bike tour in Giza Pyramids',
                        //   city: 'cairo',
                        //   price: ' 2,195',
                        //   date: 'tommorow',
                        // ),
                        // recentlyCard(
                        //   img: 'images/home/1.webp',
                        //   title: 'camel and bike tour in Giza Pyramids',
                        //   city: 'cairo',
                        //   price: ' 2,195',
                        //   date: 'tommorow',
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 5),
                    child: Row(
                      children: [
                        MaterialButton(
                          elevation: 150,
                          color: Colors.transparent,
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 140,
                          ),
                          //   highlightElevation: 50,
                          splashColor: Colors.deepOrange,
                          shape:
                              // RoundedRectangleBorder(
                              //   borderRadius: BorderRadius.circular(
                              //     30,
                              //   ),
                              // ),
                              Border.all(
                            // BorderRadius:BorderRadius.circular(30),
                            color: Colors.grey[400],
                            width: 1,
                          ),

                          onPressed: () {
                            print('button tapped.');
                          },
                          highlightColor: Colors.deepOrange,
                          child: Text('View all'),
                          textColor: Colors.grey[600],
                        )
                      ],
                    ),
                  )
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
                      child: Text(
                        'Get inspired',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/home/3.jfif'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 0, top: 10, bottom: 15),
                            child: Text(
                              'Treat yourself to something sweet',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 350,
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
                        Container(
                          height: 250,
                          // width: 175,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              getInspired(
                                img: 'images/home/1.webp',
                                title: 'After Tea Cruise',
                                city: 'London',
                                price: ' 47.05',
                                rate: '4.4',
                                total: '24',
                              ),
                              recentlyCard(
                                img: 'images/home/1.webp',
                                title: 'camel and bike tour in Giza Pyramids',
                                city: 'cairo',
                                price: ' 2,195',
                                date: 'tommorow',
                              ),
                              recentlyCard(
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
                  ),
                ],
              ),

              // rediscover /////////////////////
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Get inspired',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/home/3.jfif'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 0, top: 10, bottom: 15),
                            child: Text(
                              'Rediscover your hometown',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 350,
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
                        Container(
                          height: 250,
                          // width: 175,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              rediscoverCard(
                                img: 'images/home/1.webp',
                                title: 'After Tea Cruise',
                                city: 'London',
                                price: ' 47.05',
                                rate: '4.4',
                                total: '24',
                              ),
                              recentlyCard(
                                img: 'images/home/1.webp',
                                title: 'camel and bike tour in Giza Pyramids',
                                city: 'cairo',
                                price: ' 2,195',
                                date: 'tommorow',
                              ),
                              recentlyCard(
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
                  ),
                ],
              ),

              // incrideble distination /////////////////////
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Incredible destinations',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 270,
                    width: 290,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        IncredibleCard(
                          img: 'images/home/2.PNG',
                          city: 'Singhaphore',
                        ),
                        IncredibleCard(
                          img: 'images/home/2.PNG',
                          city: 'Singhaphore',
                        ),
                        IncredibleCard(
                          img: 'images/home/2.PNG',
                          city: 'Singhaphore',
                        ),
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
                      child: Text(
                        'Klook recommended',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Text(
                      'Incredible experiences whenever you are-chosen by our travel curators',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                      ),
                    ),
                  ),
                  Container(
                    height: 270,
                    width: 290,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        recommendedCard(
                          img: 'images/home/2.PNG',
                          title: 'Windsor Castle Ticket',
                          type: 'Attractions',
                          rate: '5.0',
                          total: '1',
                          booked: '100K+',
                          price: ' 273.50',
                          city: 'London',
                          oldPrice: '32.55',
                        ),
                        recommendedCard(
                          img: 'images/home/2.PNG',
                          title: 'Windsor Castle Ticket',
                          type: 'Attractions',
                          rate: '5.0',
                          total: '1',
                          booked: '100K+',
                          price: ' 273.50',
                          city: 'London',
                          oldPrice: '32.55',
                        ),
                        recommendedCard(
                          img: 'images/home/2.PNG',
                          title: 'Windsor Castle Ticket',
                          type: 'Attractions',
                          rate: '5.0',
                          total: '1',
                          booked: '100K+',
                          price: ' 273.50',
                          city: 'London',
                          oldPrice: '32.55',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              // promo code ///////////////////////////,
              Column(
                children: [
                  Container(
                    height: 170,
                    width: 290,
                    child: Card(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 120,
                            child: Image(
                              image: AssetImage('images/home/1.webp'),
                              width: 290,
                              height: 170,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Text(
                            'Use promo code',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Container(
                            width: 280,
                            child: Text(
                              '\'Mobile 10\' to get US\$1.3 off your first booking',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          MaterialButton(
                            elevation: 150,
                            color: Colors.deepOrange,
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            //   highlightElevation: 50,
                            splashColor: Colors.orange,
                            shape:
                                // RoundedRectangleBorder(
                                //   borderRadius: BorderRadius.circular(
                                //     30,
                                //   ),
                                // ),
                                Border.all(
                              // BorderRadius:BorderRadius.circular(30),
                              color: Colors.orange,
                              width: 1,
                            ),

                            onPressed: () {
                              print('button tapped.');
                            },
                            highlightColor: Colors.orange,
                            child: Text('Redeem'),
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ////////////////////////////////////////
              Column(
                children: [
                  Container(
                    height: 170,
                    width: 290,
                    child: Card(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 120,
                            child: Image(
                              image: AssetImage('images/home/1.webp'),
                              width: 290,
                              height: 170,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Text(
                            'Use promo code',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Container(
                            width: 280,
                            child: Text(
                              '\'Mobile 10\' to get US\$1.3 off your first booking',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          MaterialButton(
                            elevation: 150,
                            color: Colors.deepOrange,
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            //   highlightElevation: 50,
                            splashColor: Colors.orange,
                            shape:
                                // RoundedRectangleBorder(
                                //   borderRadius: BorderRadius.circular(
                                //     30,
                                //   ),
                                // ),
                                Border.all(
                              // BorderRadius:BorderRadius.circular(30),
                              color: Colors.orange,
                              width: 1,
                            ),

                            onPressed: () {
                              print('button tapped.');
                            },
                            highlightColor: Colors.orange,
                            child: Text('Redeem'),
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
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
