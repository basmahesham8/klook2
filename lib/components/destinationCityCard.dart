import 'package:flutter/material.dart';
import 'package:klook2/components/destinationDetails.dart';

class DestinationCityCard extends StatefulWidget {
  final String images;
  final String cityName;
  final String distance;

  DestinationCityCard({this.images, this.cityName, this.distance});
  @override
  _DestinationCityCardState createState() => _DestinationCityCardState();
}

class _DestinationCityCardState extends State<DestinationCityCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
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
                    padding: const EdgeInsets.only(top: 5, left: 3),
                    child: Text(
                      widget.distance,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
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
