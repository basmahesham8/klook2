import 'package:flutter/material.dart';
// import './firstRoute.dart';
// import '../models/subCategoryActivity.dart';

class MCard extends StatefulWidget {
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
  final double imageheight;
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
      this.distance,
      this.imageheight});
  @override
  _MCardState createState() => _MCardState();
}

class _MCardState extends State<MCard> {
  @override
  Widget build(BuildContext context) {
    // Widget w = widget;

    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: 240,
          child: Card(
            //   child:
            // Padding(
            // padding: const EdgeInsets.all(16.0),
            child: Column(children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 120,
                    child: FadeInImage.assetNetwork(
                      width: 240,
                      height: 60,
                      placeholder:
                          'https://firebasestorage.googleapis.com/v0/b/friendlychat-e399d.appspot.com/o/images%2Factivities%2Fundefined?alt=media&token=86d1de75-4b8f-43ae-b4fe-81c235d7e099',
                      image: widget.image,
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
              Container(
                //  margin: const EdgeInsets.fromLTRB(0 , 0 ,50 ,0),
                child: SizedBox(
                  width: 200,
                  child: Text(
                    widget.title,
                    overflow: TextOverflow.ellipsis,
                    // maxLines: 3,
                    // softWrap: true,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // Padding(
              //     padding: const EdgeInsets.all(5.0),
              // child:
              Row(children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 15, left: 5),
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
                                text:
                                    '(${widget.review} reviews) | ${widget.booked} Booked ',
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
                    onPressed: () {},
                    child: SizedBox(
                      width: 80,
                      child: Text(
                        'Book now for ${widget.date}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.lightBlue[400], fontSize: 12),
                      ),
                    ),
                    // onPressed(): {},
                  )
                ]),
              ),
            ]),
            // )
          ),
        ));
  }
}
