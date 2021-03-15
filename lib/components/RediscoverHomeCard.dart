import 'package:flutter/material.dart';

class RediscoverCard extends StatefulWidget {
  final String img;
  final String price;
  final String city;
  final String title;
  final String rate;
  final String total;

  RediscoverCard(
      {this.img, this.city, this.rate, this.total, this.title, this.price});
  @override
  _RediscoverCardState createState() => _RediscoverCardState();
}

class _RediscoverCardState extends State<RediscoverCard> {
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
                      child: Image.network(
                        widget.img,
                        width: 175,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 8, left: 5),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [
                    //       Icon(
                    //         Icons.room,
                    //         color: Colors.white,
                    //       ),
                    //       Text(
                    //         widget.city,
                    //         style: TextStyle(
                    //           // backgroundColor: Colors.deepOrange,
                    //           color: Colors.white,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 95, left: 5),
                    //   child: Text(
                    //     'Bestseller',
                    //     style: TextStyle(
                    //       backgroundColor: Colors.deepOrange,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // )
                  ],
                ),
                ////////////////////// city /////////////////////////
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 8),
                  child: Text(
                    widget.city,
                    style: TextStyle(
                      color: Color.fromRGBO(143, 143, 143, 1),
                      fontSize: 13,
                    ),
                  ),
                ),
                //////////////////////////////////// title //////////////////////////
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    widget.title,
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                /////////////////////////////// rate + total ////////////////////////////////////
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.grade_rounded,
                        color: Color.fromRGBO(254, 157, 26, 1),
                        size: 13,
                      ),
                      Text(
                        widget.rate,
                        style: TextStyle(
                          color: Color.fromRGBO(254, 157, 26, 1),
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        '(' + widget.total + ')',
                        style: TextStyle(
                          color: Color.fromRGBO(143, 143, 143, 1),
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),

                /////////////////////////////// price //////////////////////////////
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 5),
                  child: Row(
                    children: [
                      Text(
                        'EGP' + widget.price,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      // Icon(
                      //   Icons.bolt,
                      //   color: Colors.deepOrange,
                      // )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
