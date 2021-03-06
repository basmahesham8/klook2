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
          ],
        ),
      ),
    );
  }
}
