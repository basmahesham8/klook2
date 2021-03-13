import 'package:flutter/material.dart';
import 'package:klook2/components/destinationDetails.dart';

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
      child: GestureDetector(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    height: 150,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage(widget.images)),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100, left: 15),
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
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DestinationDetails(
                    img: widget.images, text: widget.cityName)),
          );
        },
      ),
    );
  }
}
