import 'package:flutter/material.dart';

import 'activityDetailsHotel.dart';

class StaysCard extends StatefulWidget {
  final String staysImages;
  final String rate;
  final String stars;
  final String name;
  final String price;
  final String id;

  StaysCard(
      {this.staysImages,
      this.rate,
      this.stars,
      this.name,
      this.price,
      this.id});
  @override
  _StaysCardState createState() => _StaysCardState();
}

class _StaysCardState extends State<StaysCard> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.4 / 2,
      child: Padding(
        padding: const EdgeInsets.only(right: 4),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ActivityDetailsHotel(id: widget.id)),
                ),
                child: Stack(
                  // alignment: Alignment.centerLeft,
                  children: <Widget>[
                    Container(
                      height: 120,
                      child: Image.network(
                        widget.staysImages,
                        height: 100,
                        width: 200,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Padding(
                      padding: new EdgeInsets.only(top: 80, left: 15, right: 5),
                      child: Card(
                          child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Text(
                          widget.rate,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.white),
                        ),
                      )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.stars,
                    style: TextStyle(color: Color.fromRGBO(120, 80, 41, 1)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 6),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text.rich(
                    TextSpan(
                      text: 'From', // default text style
                      children: <TextSpan>[
                        TextSpan(
                            text: ' EGP ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: widget.price,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
