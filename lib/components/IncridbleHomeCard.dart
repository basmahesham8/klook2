import 'package:flutter/material.dart';

class IncredibleCard extends StatefulWidget {
  final String img;

  final String city;

  IncredibleCard({this.img, this.city});
  @override
  _IncredibleCardState createState() => _IncredibleCardState();
}

class _IncredibleCardState extends State<IncredibleCard> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.4 / 2,
        child: InkWell(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                      height: 120,
                      child: Image(
                        image: AssetImage(widget.img),
                        width: 175,
                        height: 120,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 110, left: 5),
                      child: Text(
                        widget.city,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),

                /////////////////////////////// price //////////////////////////////
              ],
            ),
          ),
        ));
  }
}
