import 'package:flutter/material.dart';

class CityCards extends StatefulWidget {
  final String images;
  final String cityName;
  CityCards({this.images, this.cityName});
  @override
  _CityCardsState createState() => _CityCardsState();
}

class _CityCardsState extends State<CityCards> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            Stack(
              children: <Widget>[
                Container(
                    height: 120,
                    child: Image(
                      image: AssetImage(widget.images),
                      height: 100,
                      width: 200,
                      fit: BoxFit.fitWidth,
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 80, left: 20),
                  child: Text(
                    widget.cityName,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
