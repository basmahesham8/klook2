import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookedCard extends StatefulWidget {
  @required
  final String title;
  final String date;
  final String noPerson;
  final String userName;
  final String price;
  final String image;

  BookedCard(
      {this.title,
      this.date,
      this.noPerson,
      this.userName,
      this.price,
      this.image});

  @override
  _BookedCardState createState() => _BookedCardState();
}

class _BookedCardState extends State<BookedCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Container(
        height: 240,
        child: Card(
          color: Colors.white,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(10)),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 20)),
                  Icon(
                    Icons.bus_alert,
                    color: Colors.deepOrange,
                    size: 25,
                  ),
                  Padding(padding: EdgeInsets.only(right: 8)),
                  Container(
                    width: 200,
                    child: Text(
                      widget.title,
                      maxLines: 2,
                      // softWrap: s,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            widget.date,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[600]),
                          ),
                        ),
                        Text(
                          'person X ' + widget.noPerson,
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[600]),
                        ),
                        Text(
                          widget.userName,
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[600]),
                        ),
                        Text(
                          widget.price,
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Image.network(
                      widget.image,
                      width: 100,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    width: 150,
                    height: 80,
                  )
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              // Row(
              //   children: [
              //     SizedBox(
              //       width: 80,
              //     ),
              //     SizedBox(
              //       width: 150,
              //       child: MaterialButton(
              //         shape: RoundedRectangleBorder(
              //             side: BorderSide(color: Colors.grey[850], width: 2)),
              //         onPressed: () {
              //           // Navigator.push(
              //           //   context,
              //           //   MaterialPageRoute(builder: (context) => SignUp()),
              //           // );
              //         },
              //         // padding: EdgeInsets.only(left:10.0),
              //         color: Colors.white,
              //         textColor: Colors.grey[850],
              //         child:
              //             Text("View Voucher", style: TextStyle(fontSize: 17)),
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
    // );
  }
}
