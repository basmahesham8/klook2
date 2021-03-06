import 'package:flutter/material.dart';
import 'package:klook2/components/destinationDetails.dart';

class IncredibleCard extends StatefulWidget {
  final String img;

  final String city;

  IncredibleCard({this.img, this.city});
  @override
  _IncredibleCardState createState() => _IncredibleCardState();
}

class _IncredibleCardState extends State<IncredibleCard> {
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
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(7),
                  bottomLeft: Radius.circular(7),
                  bottomRight: Radius.circular(7),
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 282,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.img),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 210, left: 10),
                      child: Text(
                        widget.city,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),

              /////////////////////////////// price //////////////////////////////
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DestinationDetails(img: widget.img, text: widget.city)),
          );
        },
      ),
    );
  }
}
