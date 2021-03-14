import 'package:flutter/material.dart';
import 'package:klook2/components/destinationDetails.dart';

class DestinationCityCard extends StatefulWidget {
  final String images;
  final String cityName;
  final String distance;
  final String distanceKm;
  final String distance1;

  DestinationCityCard(
      {this.images,
      this.cityName,
      this.distance,
      this.distanceKm,
      this.distance1});
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
                    width: 200,
                    height: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(widget.images),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(17.0)),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 20, left: 10),
                      child: Text.rich(
                        TextSpan(
                          text: widget.distance + '\n',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                          // default text style
                          children: <TextSpan>[
                            TextSpan(
                                text: widget.distanceKm,
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic)),
                            TextSpan(
                                text: widget.distance1,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 200, left: 10),
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
