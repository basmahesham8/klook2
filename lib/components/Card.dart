import 'package:flutter/material.dart';
// import './firstRoute.dart';
// import '../models/subCategoryActivity.dart';

class MCard2 extends StatefulWidget {
  final String city;
  final String title;
  final int id;
  final String section;
  final String image;
  final String booked;
  final String categories;
  final String date;
  final String distance;
  final String oldPrice;
  final String price;
  final String rate;
  final String review;
  // final String   tourDiscount;
  // final String   tourSectionInner;

  MCard2(
      {this.id,
      this.title,
      this.city,
      this.section,
      this.image,
      this.booked,
      this.categories,
      this.date,
      this.oldPrice,
      this.price,
      this.rate,
      this.review,
      this.distance});
  @override
  _MCard2State createState() => _MCard2State();
}

class _MCard2State extends State<MCard2> {
  @override
  Widget build(BuildContext context) {
    // Widget w = widget;

    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Column(children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 120,
                  child: Image(
                    image: AssetImage(widget.image),
                    width: 240,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.room,
                        color: Colors.white,
                      ),
                      Text(
                        widget.city,
                        style: TextStyle(
                          // backgroundColor: Colors.deepOrange,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 85, left: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.deepOrange,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    // padding: EdgeInsets.only(top: 20),
                    height: 32,
                    // color: Colors.deepOrange,
                    child: Container(
                      color: Colors.deepOrange,
                      // height: 250,
                      padding: EdgeInsets.only(top: 6, left: 4, right: 4),
                      child: Text(
                        'Bestseller',
                        style: TextStyle(
                          backgroundColor: Colors.deepOrange,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  Text(
                    // textAlign:textalign.
                    widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Row(children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                        child: Row(children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 3, 0),
                            child: Icon(
                              Icons.star_rate,
                              color: Colors.orange,
                              size: 20.0,
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              // text: '4.8', // default text style

                              children: <TextSpan>[
                                TextSpan(
                                  text: widget.rate,
                                  style: TextStyle(color: Colors.orange),
                                ),
                                // Padding(
                                // padding:  EdgeInsets.fromLTRB(2, 0, 2, 0)),
                                TextSpan(
                                    text:
                                        '(${widget.review} reviews) | ${widget.booked} Booked ',
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                        ])),
                  ]),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 5),
                  child: Row(
                    children: [
                      Text(
                        'EGP' + widget.price,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Icon(
                        Icons.bolt,
                        color: Colors.deepOrange,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, top: 20),
                  child: Text(
                    'Book now for ' + widget.date,
                    style: TextStyle(
                      color: Color.fromRGBO(203, 203, 203, 1),
                      fontSize: 13,
                    ),
                  ),
                )
              ],
            ),
          ]),
          // )
        ));
  }
}
