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
                    size: 20,
                  ),
                  Padding(padding: EdgeInsets.only(right: 8)),
                  Container(
                    width: 200,
                    child: Text(
                      widget.title,
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
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
                        Text(
                          widget.date,
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                        Text(
                          'person X ' + widget.noPerson,
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                        Text(
                          widget.userName,
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                        Text(
                          widget.price,
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: FadeInImage.assetNetwork(
                      width: 100,
                      height: 60,
                      placeholder:
                          'https://firebasestorage.googleapis.com/v0/b/friendlychat-e399d.appspot.com/o/images%2Factivities%2Fundefined?alt=media&token=86d1de75-4b8f-43ae-b4fe-81c235d7e099',
                      image: widget.image,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                  ),
                  SizedBox(
                    width: 150,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey[850], width: 2)),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => SignUp()),
                        // );
                      },
                      // padding: EdgeInsets.only(left:10.0),
                      color: Colors.white,
                      textColor: Colors.grey[850],
                      child:
                          Text("View Voucher", style: TextStyle(fontSize: 17)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
    // );
  }
}
