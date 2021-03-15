import 'package:flutter/material.dart';

class RecentlyHomeCard extends StatefulWidget {
  final String img;
  final String price;
  final String city;
  final String title;
  final String date;

  RecentlyHomeCard({
    this.img,
    this.city,
    this.date,
    this.title,
    this.price,
  });
  @override
  _RecentlyHomeCardState createState() => _RecentlyHomeCardState();
}

class _RecentlyHomeCardState extends State<RecentlyHomeCard> {
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
                        // image: AssetImage(widget.img),
                        width: 175,
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
                      padding: const EdgeInsets.only(top: 95, left: 5),
                      child: Text(
                        'Bestseller',
                        style: TextStyle(
                          backgroundColor: Colors.deepOrange,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 40,
                    child: Text(
                      widget.title,
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
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
                  padding: const EdgeInsets.only(left: 5, top: 5),
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
          ),
        )
        // Padding(
        //   padding: const EdgeInsets.only(right: 4),
        //   child: Card(
        //     clipBehavior: Clip.antiAlias,
        //     child: Column(
        //       children: [
        //         Stack(
        //           // alignment: Alignment.centerLeft,
        //           children: <Widget>[
        //             Container(
        //                 height: 120,
        //                 child: Image(
        //                   image: AssetImage(widget.img),
        //                   height: 100,
        //                   width: 200,
        //                   fit: BoxFit.fitWidth,
        //                 )),
        //             Padding(
        //               padding: new EdgeInsets.only(top: 80, left: 15, right: 5),
        //               child: Card(
        //                   child: Padding(
        //                 padding: const EdgeInsets.all(3),
        //                 child: Text(
        //                   widget.city,
        //                   style: TextStyle(
        //                       fontSize: 15,
        //                       color: Colors.deepOrange,
        //                       fontWeight: FontWeight.bold,
        //                       backgroundColor: Colors.white),
        //                 ),
        //               )),
        //             ),
        //           ],
        //         ),
        //         SizedBox(
        //           height: 10,
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.only(left: 8),
        //           child: Align(
        //             alignment: Alignment.topLeft,
        //             child: Text(
        //               widget.price,
        //               style: TextStyle(color: Color.fromRGBO(120, 80, 41, 1)),
        //             ),
        //           ),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.only(left: 8, top: 6),
        //           child: Align(
        //               alignment: Alignment.topLeft,
        //               child: Text(
        //                 widget.title,
        //                 style:
        //                     TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        //               )),
        //         ),
        //         SizedBox(
        //           height: 50,
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.only(left: 8),
        //           child: Align(
        //             alignment: Alignment.topLeft,
        //             child: Text(
        //               widget.price,
        //               style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        //             ),
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        );
  }
}
