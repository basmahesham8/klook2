import 'package:flutter/material.dart';

class RecommendedCard extends StatefulWidget {
  final String img;
  final String price;
  final String type;
  final String title;
  final String rate;
  final String total;
  final String booked;
  final String oldPrice;
  final String city;
  RecommendedCard({
    this.img,
    this.booked,
    this.rate,
    this.total,
    this.type,
    this.title,
    this.price,
    this.oldPrice,
    this.city,
  });
  @override
  _RecommendedCardState createState() => _RecommendedCardState();
}

class _RecommendedCardState extends State<RecommendedCard> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2 / 2,
        child: InkWell(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///////////////////// image ////////////////////////////////
                Stack(
                  children: <Widget>[
                    Container(
                      height: 140,
                      child: Image.network(
                        widget.img,
                        width: 320,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 3, left: 5),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [
                    //       Text(
                    //         widget.type,
                    //         style: TextStyle(
                    //           color: Color.fromRGBO(143, 143, 143, 1),
                    //           fontSize: 10,
                    //         ),
                    //       )
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
                Padding(
                  padding: const EdgeInsets.only(top: 3, left: 5),
                  child: Text(
                    widget.type,
                    style: TextStyle(
                      color: Color.fromRGBO(143, 143, 143, 1),
                      fontSize: 13,
                    ),
                  ),
                ),
                //////////////// title ///////////////////////////////
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    widget.title,
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),

                //////////////////////////////// rate + total +booked //////////////////

                Padding(
                  padding: const EdgeInsets.only(top: 2, left: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.grade_rounded,
                        color: Color.fromRGBO(254, 157, 26, 1),
                        size: 15,
                      ),
                      Text(
                        widget.rate,
                        style: TextStyle(
                          color: Color.fromRGBO(254, 157, 26, 1),
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          '(' + widget.total + ').' + widget.booked + 'Booked',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(213, 213, 213, 1),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                ///////////////////////// Bestseller + instant confirmation ///////////////

                Padding(
                  padding: const EdgeInsets.only(top: 2, left: 5),
                  child: Row(
                    children: [
                      Text(
                        'Bestseller',
                        style: TextStyle(
                          backgroundColor: Color.fromRGBO(209, 255, 238, 1),
                          color: Color.fromRGBO(109, 193, 163, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Instant Confirmation',
                          style: TextStyle(
                            backgroundColor: Color.fromRGBO(239, 239, 239, 1),
                            color: Color.fromRGBO(172, 172, 172, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
/////////////////////////////// price ////////////////////////////////

                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 5, bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        'From  ',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        'EGP ' + widget.price,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

// import 'package:flutter/material.dart';

// class RecommendedCard extends StatefulWidget {
//   final String img;
//   final String price;
//   final String type;
//   final String title;
//   final String rate;
//   final String total;
//   final String booked;
//   final String oldPrice;
//   final String city;

//   RecommendedCard({
//     this.img,
//     this.booked,
//     this.rate,
//     this.total,
//     this.type,
//     this.title,
//     this.price,
//     this.oldPrice,
//     this.city,
//   });
//   @override
//   _RecommendedCardState createState() => _RecommendedCardState();
// }

// class _RecommendedCardState extends State<RecommendedCard> {
//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//         aspectRatio: 3 / 2,
//         child: InkWell(
//           child: Card(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ///////////////////// image ////////////////////////////////
//                 Stack(
//                   children: <Widget>[
//                     Container(
//                       height: 140,
//                       child: Image(
//                         image: AssetImage(widget.img),
//                         width: 290,
//                         height: 60,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     // Padding(
//                     //   padding: const EdgeInsets.only(top: 3, left: 5),
//                     //   child: Row(
//                     //     mainAxisAlignment: MainAxisAlignment.start,
//                     //     children: [
//                     //       Text(
//                     //         widget.type,
//                     //         style: TextStyle(
//                     //           color: Color.fromRGBO(143, 143, 143, 1),
//                     //           fontSize: 10,
//                     //         ),
//                     //       )
//                     //     ],
//                     //   ),
//                     // ),
//                     // Padding(
//                     //   padding: const EdgeInsets.only(top: 95, left: 5),
//                     //   child: Text(
//                     //     'Bestseller',
//                     //     style: TextStyle(
//                     //       backgroundColor: Colors.deepOrange,
//                     //       color: Colors.white,
//                     //     ),
//                     //   ),
//                     // )
//                   ],
//                 ),
//                 ///////////////////// type + city ///////////////
//                 Padding(
//                   padding: const EdgeInsets.only(top: 3, left: 5),
//                   child: Text(
//                     widget.type + '.' + widget.city,
//                     style: TextStyle(
//                       color: Color.fromRGBO(143, 143, 143, 1),
//                       fontSize: 10,
//                     ),
//                   ),
//                 ),
//                 //////////////// title ///////////////////////////////
//                 Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: Text(
//                     widget.title,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14,
//                     ),
//                   ),
//                 ),

//                 //////////////////////////////// rate + total +booked //////////////////

//                 Padding(
//                   padding: const EdgeInsets.only(top: 2, left: 5),
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.grade_rounded,
//                         color: Color.fromRGBO(254, 157, 26, 1),
//                         size: 13,
//                       ),
//                       Text(
//                         widget.rate,
//                         style: TextStyle(
//                           color: Color.fromRGBO(254, 157, 26, 1),
//                           fontSize: 13,
//                         ),
//                       ),
//                       Text(
//                         '(' + widget.total + ').' + widget.booked + 'Booked',
//                         style: TextStyle(
//                           fontSize: 13,
//                           color: Color.fromRGBO(213, 213, 213, 1),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),

//                 ///////////////////////// Bestseller + instant confirmation ///////////////

//                 Padding(
//                   padding: const EdgeInsets.only(top: 2, left: 5),
//                   child: Row(
//                     children: [
//                       Text(
//                         'Bestseller',
//                         style: TextStyle(
//                           backgroundColor: Color.fromRGBO(209, 255, 238, 1),
//                           color: Color.fromRGBO(109, 193, 163, 1),
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14,
//                         ),
//                       ),
//                       Text(
//                         'Instant Confirmation',
//                         style: TextStyle(
//                           backgroundColor: Color.fromRGBO(239, 239, 239, 1),
//                           color: Color.fromRGBO(172, 172, 172, 1),
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
// /////////////////////////////// price ////////////////////////////////

//                 Padding(
//                   padding: const EdgeInsets.only(top: 20, left: 5),
//                   child: Column(
//                     children: [
//                       Text(
//                         'EGP\$ ' + widget.oldPrice,
//                         style: TextStyle(
//                           color: Color.fromRGBO(143, 143, 143, 1),
//                           fontSize: 10,
//                           decoration: TextDecoration.lineThrough,
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             'From',
//                             style: TextStyle(fontSize: 12),
//                           ),
//                           Text(
//                             'EGP\$ ' + widget.price,
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 15,
//                             ),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
