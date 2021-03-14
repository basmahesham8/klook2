import 'package:flutter/material.dart';
// import 'package:klook2/components/BookedCard.dart';
// import 'package:klook2/components/BookedCard.dart';
// import 'package:klook2/components/bookeingDB.dart';
import 'package:klook2/components/bookings.dart';
import 'package:klook2/components/categories.dart';
import 'package:klook2/components/subCategoryActivities.dart';

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
import 'package:klook2/components/loading.dart';
import 'package:klook2/components/circularLoading.dart';




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
      title: 'Klook',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'klook'),
      
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
    SubCategoryActivities()
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

