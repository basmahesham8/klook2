import 'package:flutter/material.dart';

class VoucherCard extends StatefulWidget {
  final String staysImages;
  final String city;
  final String title;
  final String price;
  final String validity;
  final String priceBefore;

  VoucherCard(
      {this.staysImages,
      this.city,
      this.title,
      this.price,
      this.validity,
      this.priceBefore});
  @override
  _StaysCardState createState() => _StaysCardState();
}

class _StaysCardState extends State<VoucherCard> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.9 / 2,
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
                      height: 190,
                      child: Image.network(
                        widget.staysImages,
                        height: 100,
                        width: 390,
                        fit: BoxFit.fitWidth,
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.city,
                    style: TextStyle(
                        color: Color.fromRGBO(120, 80, 41, 1),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 6, right: 6),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 6),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.validity,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: ' EGP ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                              decorationThickness: 2),
                        ),
                        TextSpan(
                          text: widget.priceBefore,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                              decorationThickness: 2),
                        ),
                      ],
                    ),
                  ),
                  // child: Text(widget.priceBefore, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey, decoration: TextDecoration.lineThrough,decorationThickness: 2),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text.rich(
                    TextSpan(
                      text: 'From',
                      style: TextStyle(fontSize: 18), // default text style
                      children: <TextSpan>[
                        TextSpan(
                            text: ' EGP ',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: widget.price,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
