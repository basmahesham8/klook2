import 'package:flutter/material.dart';

class ActivityCard extends StatefulWidget {
  final String image;
  final String title;
  final String booked;
  final String date;
  final String price;
  // final String number;
  ActivityCard({this.image, this.title, this.booked, this.date, this.price});
  @override
  _ActivityCardState createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5 / 2,
      child: Padding(
        padding: const EdgeInsets.only(right: 4),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Stack(
                // alignment: Alignment.centerLeft,
                children: <Widget>[
                  Container(
                      height: 120,
                      child: Image.network(
                        widget.image,
                        height: 100,
                        width: 330,
                        fit: BoxFit.fitWidth,
                      )),
                  // Align(
                  //   alignment: Alignment.topLeft,
                  //   child: Card(
                  //       color: Colors.deepOrange,
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(5),
                  //         child: Text(
                  //           widget.number,
                  //           style: TextStyle(
                  //               fontSize: 15,
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.bold,
                  //               backgroundColor: Colors.deepOrange),
                  //         ),
                  //       )),
                  // ),
                ],
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Padding(
                  padding: const EdgeInsets.only(left: 8, top: 6),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ))),
              Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.booked,
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              // SizedBox(
              //   height: 0,
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 8),
                child: Row(
                  children: [
                    // child: Align(
                    //   alignment: Alignment.topLeft,
                    Text(
                      "From EGP",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.price,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.bolt,
                      color: Colors.deepOrange,
                    ),
                    Padding(padding: const EdgeInsets.only(left: 17)),
                    Text(
                      "Book now for",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    Text(
                      widget.date,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
