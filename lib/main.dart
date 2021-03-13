import 'package:flutter/material.dart';
// import 'package:klook2/components/BookedCard.dart';
// import 'package:klook2/components/BookedCard.dart';
// import 'package:klook2/components/bookeingDB.dart';
import 'package:klook2/components/bookings.dart';
import 'package:klook2/components/categories.dart';
// import 'package:klook2/components/home.dart';
import './components/subCategoryActivities.dart';
import 'package:firebase_core/firebase_core.dart';
import './components/test.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import './components/carousel.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

// import 'package:klook2/components/database.dart';
import 'package:klook2/components/destination.dart';
// import 'package:klook2/components/destination.dart';
// import 'package:klook2/components/hotel.dart';
import 'package:klook2/components/login.dart';
import 'package:klook2/components/home.dart';

// import 'package:klook2/components/test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(title: 'klook'),
      // home: SubCategoryActivities(),
      home: TestHome(),
      // home: OfflineTest(),

      //   home : FutureBuilder(
      //   // Initialize FlutterFire:
      //   future: _initialization,
      //   builder: (context, snapshot) {
      //     // Check for errors
      //     if (snapshot.hasError) {
      //       // return SomethingWentWrong();
      //       print('error');
      //     }

      //     // Once complete, show your application
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       // return SubCategoryActivities();
      //       // return  MyHomePage(title: 'klook');
      //     }

      //     // Otherwise, show something whilst waiting for initialization to complete
      //     // return Loading();
      //     print ('louding');
      //   },
      // )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    // MCard(),
    Destination(),
    //AddUser('fullName', 'company', 'djd'),
    Categories(),
    Booking(),
    LoginPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on_rounded,
            ),
            label: 'Destination',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets_rounded),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.article_outlined,
            ),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrange,
        onTap: _onItemTapped,
      ),
    );
  }
}

class OfflineTest extends StatefulWidget {
  @override
  _OfflineTestState createState() => _OfflineTestState();
}

class _OfflineTestState extends State<OfflineTest> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  String title;
  String city;
  String section;
  String image;
  String booked;
  String categories;
  String date;
  String distance;
  String oldPrice;
  String price;
  String rate;
  String review;

  final _nbItems = 6;
  final _itemHeight = 200.0;
  final _itemPositionsListener = ItemPositionsListener.create();
  final ItemScrollController itemScrollController = ItemScrollController();

  var sectionsName = ["Package options", "reviews"];
  int _topItem = 0;

  @override
  void initState() {
    super.initState();
    _itemPositionsListener.itemPositions.addListener(() {
      final positions = _itemPositionsListener.itemPositions.value;
      setState(() {
        _topItem = positions.isNotEmpty ? positions.first.index : null;
      });
    });

    itemScrollController.scrollTo(
        index: 150,
        duration: Duration(seconds: 2),
        curve: Curves.easeInOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Row(children: [
              Expanded(child: SizedBox(width: 10), flex: 8),
              Expanded(child: Icon(Icons.favorite_border), flex: 2)
            ]),
            leading: Icon(Icons.arrow_back),
            backgroundColor: Colors.white,
            pinned: this._pinned,
            snap: this._snap,
            floating: this._floating,
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              // title: Row(
              //   // mainAxisAlignment: MainAxisAlignment.end,
              //   children: List.generate(
              //     sectionsName.length,
              //     (index) => Padding(
              //       padding: const EdgeInsets.all(2.0),
              //       child: Container(
              //         padding: EdgeInsets.all(4.0),

              //         child: Text(
              //           /////// edit
              //           sectionsName[index],
              //           style: TextStyle(
              //             fontSize: 12,
              //             fontWeight: _topItem == index
              //                 ? FontWeight.bold
              //                 : FontWeight.normal,
              //             color: _topItem == index
              //                 ? Colors.deepOrange
              //                 : Colors.black,
              //             //  decoration: _topItem == index ? TextDecoration.underline :TextDecoration.none ,
              //           ),
              //         ),
              //         //////
              //       ),
              //     ),
              //   ),
              // ),
              background: Carousel(),
            ),
          ),
          SliverToBoxAdapter(
            // child: Expanded(
            //   child: ScrollablePositionedList.builder(
            //     itemCount: sectionsName.length,
            //     itemBuilder: (context, index) => SizedBox(
            //       height: _itemHeight,
            //       child: Card(
            //         child: Text('Item $index'),
            //       ),
            //     ),
            //     itemPositionsListener: _itemPositionsListener,
            //     itemScrollController: itemScrollController,
            //   ),
            // ),
            child: Center(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0)),
                    color: Colors.white,
                    // boxShadow: [
                    //   BoxShadow(color: Colors.green, spreadRadius: 3),
                    // ],
                  ),
                  height: 2000,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          "title",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                          child: Row(children: [
                            Icon(
                              Icons.star_rate,
                              color: Colors.orange[300],
                              size: 14.0,
                            ),
                            Text.rich(
                              TextSpan(
                                // text: '4.8', // default text style

                                children: <TextSpan>[
                                  TextSpan(
                                    text: "4.5 ",
                                    style: TextStyle(color: Colors.orange[300]),
                                  ),
                                  TextSpan(
                                      text: ' (11 reviews) ',
                                      style:
                                          TextStyle(color: Colors.blue[300])),
                                ],
                              ),
                            ),
                            Text(
                              ' | ',
                              style: TextStyle(
                                  color: Colors.grey[200], fontSize: 20),
                            ),
                            Icon(
                              Icons.supervisor_account,
                              color: Colors.grey[300],
                              size: 20.0,
                            ),
                            Text(
                              ' 400k+ Booked ',
                              style: TextStyle(
                                  color: Colors.grey[350], fontSize: 14),
                            ),
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Divider(
                            height: 1.0,
                            thickness: 1.0,
                            indent: 20.0,
                            endIndent: 20.0,
                          ),
                        ),
                        Row(children: [
                          Transform.rotate(
                            angle: 90 * pi / 180,
                            child: IconButton(
                              icon: Icon(
                                Icons.maximize,
                                color: Colors.deepOrange,
                                size: 20.0,
                              ),
                              onPressed: null,
                            ),
                          ),
                          Text('Package options',
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ]),
                        Column(children: [
                          Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                              child: Row(children: [
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 7, 0),
                                    child: Icon(
                                      Icons.alarm,
                                      color: Colors.black54,
                                      size: 20.0,
                                    )),
                                Text(
                                  'Book now for 11',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 14),
                                )
                              ])),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                              child: Row(children: [
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 7, 0),
                                    child: Icon(
                                      Icons.bolt,
                                      color: Colors.deepOrange,
                                      size: 20.0,
                                    )),
                                Text(
                                  'Instance confirmation',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 14),
                                )
                              ])),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                              child: Row(children: [
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 7, 0),
                                    child: Icon(
                                      Icons.remove_circle_outline,
                                      color: Colors.black54,
                                      size: 20.0,
                                    )),
                                Text(
                                  'No cancellation',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 14),
                                )
                              ])),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                              child: Row(children: [
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 7, 0),
                                    child: Icon(
                                      Icons.print,
                                      color: Colors.black54,
                                      size: 20.0,
                                    )),
                                Text(
                                  'Show mobile or printed voucher',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 14),
                                )
                              ])),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                              child: Row(children: [
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 7, 0),
                                    child: Icon(
                                      Icons.calendar_today,
                                      color: Colors.black54,
                                      size: 20.0,
                                    )),
                                Text(
                                  'Open date ticket',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 14),
                                )
                              ])),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                              child: Row(children: [
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 7, 0),
                                    child: Icon(
                                      Icons.supervisor_account,
                                      color: Colors.black54,
                                      size: 20.0,
                                    )),
                                Text(
                                  'Skip the ticket line & enter with voucher',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 14),
                                )
                              ])),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                              child: Row(children: [
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 7, 0),
                                    child: Icon(
                                      Icons.access_time,
                                      color: Colors.black54,
                                      size: 20.0,
                                    )),
                                Text(
                                  '1 day(s) Duration',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 14),
                                )
                              ])),
                        ]),
                        Divider(
                          height: 1.0,
                          thickness: 1.0,
                          indent: 20.0,
                          endIndent: 20.0,
                        ),
                        Row(children: [
                          Transform.rotate(
                            angle: 90 * pi / 180,
                            child: IconButton(
                              icon: Icon(
                                Icons.maximize,
                                color: Colors.deepOrange,
                                size: 20.0,
                              ),
                              onPressed: null,
                            ),
                          ),
                          Text('Reviews',
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ])
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: null,
        child: Container(
            height: 70.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: Row(children: [
                Expanded(
                    child: Text.rich(
                      TextSpan(
                        // text: '4.8', // default text style

                        children: <TextSpan>[
                          TextSpan(
                            text: 'us\$ 11 ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange),
                          ),
                          TextSpan(
                              text: ' us\$  15 ',
                              style: TextStyle(
                                  color: Colors.grey[400],
                                  decoration: TextDecoration.lineThrough)),
                        ],
                      ),
                    ),
                    flex: 6),
                Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // if (_formKey.currentState.validate()) {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => PostDetails(id : 3)),
                        //   );
                        // }
                      },
                      child: Text('Book now',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrange,
                      ),
                    ),
                    flex: 4),
              ]),
            )),
      ),
    );
  }
}
