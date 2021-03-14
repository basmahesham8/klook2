import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/////////////// cards ////////////////////////////////////
class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ///// first row
          Row(
            children: [
              //card experience /////////////////////////////////
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 5, top: 5, bottom: 5),
                child: Card(
                  color: Color.fromRGBO(254, 243, 237, 1),
                  child: InkWell(
                    // navigation of small cards
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      print('Card tapped.');
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Align(
                          alignment: Alignment.center,
                          child: (Column(
                            children: [
                              Icon(
                                Icons.card_travel_rounded,
                                color: Colors.deepOrange,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 2.0, bottom: 2),
                                  child: Container(
                                    width: 110,
                                    child: Center(
                                      child: Text(
                                        'Experiences',
                                        style: TextStyle(
                                            fontSize: 12.5,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              /////////////////////// accomidation cad ///////////////////////
              Padding(
                padding: const EdgeInsets.only(
                    left: 2.5, right: 2.5, top: 2.5, bottom: 5),
                child: Card(
                  color: Color.fromRGBO(233, 248, 241, 1),
                  child: InkWell(
                    // navigation of small cards
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      print('Card tapped.');
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Icon(
                                Icons.location_city_rounded,
                                color: Color.fromRGBO(74, 206, 134, 1),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 2.0, bottom: 2),
                                  child: Container(
                                    width: 110,
                                    child: Center(
                                      child: Text(
                                        'Accomoditions',
                                        style: TextStyle(
                                            fontSize: 12.5,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              /// wifi ///////////////////////
            ],
          )
        ],
      ),
    );
  }
}
