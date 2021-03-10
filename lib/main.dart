import 'package:flutter/material.dart';
import 'package:klook2/components/bookings.dart';
// import 'package:klook2/components/destination.dart';
import 'package:klook2/components/hotel.dart';
import 'package:klook2/components/login.dart';
import 'package:klook2/components/home.dart';
import 'package:klook2/components/tourCard.dart';
// import 'package:klook2/components/categories.dart';
import 'package:firebase_core/firebase_core.dart';

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
  // static TextStyle optionStyle =
  // TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.red);
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    // MCard(),
    // Destination(),
    MCard(
        id: 5,
        title: 'j',
        city: 'j',
        section: 'k',
        image: 'images/cairo.png',
        booked: 'm',
        categories: 'bnm',
        date: 'bvg',
        oldPrice: 'bv',
        price: 'nb',
        rate: 'bgh',
        review: 'bv',
        distance: 'kjh'),
    Hotel(),
    Booking(),
    LoginPage(),

    // Text(
    //   'Index 0: Home',
    //   style: optionStyle,
    // ),

    // Text(
    //   'Index 1: Description',
    //   style: optionStyle,
    // ),
    // Text(
    //   'Index 2: Categories',
    //   style: optionStyle,
    // ),
    // Text(
    //   'Index 3: Bookings',
    //   style: optionStyle,
    // ),
    // // Text(
    // //   'Index 4: Account ',
    // //   style: optionStyle,
    // // ),
  ];

  void _onItemTapped(int index) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => LoginPage('jbv')),
    // );
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
            // backgroundColor: Colors.deepOrange,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.article_outlined,
              // color: Colors.white,
            ),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
