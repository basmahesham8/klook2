import 'package:flutter/material.dart';
// import './firstRoute.dart';
import '../models/subCategoryActivity.dart';
import './activityDetails.dart';


class MCard extends StatefulWidget {
  final String city;
  final String title;
  final String id;
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

  MCard(
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
  _MCardState createState() => _MCardState();
}

class _MCardState extends State<MCard> {
  @override
  Widget build(BuildContext context) {
  

    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          //   child:
          // Padding(
          // padding: const EdgeInsets.all(16.0),
          child: Column(children: <Widget>[
            Stack(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(children: <Widget>[
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ActivityDetails(id : widget.id)),
                    ),

                    child: Container(
                      // alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width - 50.0,
                      // width : 260,
                      foregroundDecoration: new BoxDecoration(
                          color: Color.fromRGBO(155, 85, 250, 0.0)),
                      height: 240.0,
                      child: FadeInImage.assetNetwork(
                        placeholder: 'images/1.png',
                        image: widget.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ]),
              ),
              Column(
                children: <Widget>[
                 
                  Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Row(
                          // alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.room,
                              color: Colors.white,
                              size: 24.0,
                              semanticLabel:
                                  'Text to announce in accessibility modes',
                            ),
                            Text(
                              widget.city,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ])),
                  SizedBox(height: 120),
                  // Padding(
                  // padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  // child :
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 170, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        // if (_formKey.currentState.validate()) {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => PostDetails(id : 3)),
                        //   );
                        // }
                      },
                      child: Text(widget.section , style : TextStyle (color : Colors.white)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrange,
                       
                        
                      ),
                    ),
                  )

                  // ),
                ],
              ),
            ]),
            Container(
              //  margin: const EdgeInsets.fromLTRB(0 , 0 ,50 ,0),
              child: Text(
                widget.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            // Padding(
            //     padding: const EdgeInsets.all(5.0),
            // child:
            Row(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                  child: Row(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(7.0),
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
                          TextSpan(
                              text: '(${widget.review} reviews) | ${widget.booked} Booked ',
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ])),
            ]),
            Container(
              margin: const EdgeInsets.all(12.0),
              child: Row(children: <Widget>[
                Row(children: <Widget>[
                   Text.rich(
                    TextSpan(
                      // text: '4.8', // default text style

                      children: <TextSpan>[
                        TextSpan(
                          text: 'From',
                        ),
                        TextSpan(
                            text: ' us\$ ${widget.price} ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Icon(
                      Icons.bolt,
                      color: Colors.deepOrange,
                      size: 18.0,
                    ),
                  ),
                ]),
                SizedBox(
                  width: 20,
                ),
                TextButton(
                  // onPressed: ,
                  child: Text(
                    'Book now for ${widget.date}',
                    style:
                        TextStyle(color: Colors.lightBlue[400], fontSize: 12),
                  ),
                  // onPressed: ,
                )
              ]),
            ),
          ]),
          // )
        ));
  }
}
