import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:klook2/components/StaysCard.dart';
import 'HotelVoucherCard.dart';

class Hotel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Hotels & more',
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back,
              color: Colors.grey,
              size: 30,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Color.fromRGBO(245, 243, 243, 1),
        body: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance
                .collection('Hotel-')
                .where('section', isEqualTo: 'popularStays')
                .get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text("Loading");
              }

              final List<DocumentSnapshot> documents = snapshot.data.docs;

              return SingleChildScrollView(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: <Widget>[
                          Image(image: AssetImage('images/mountain.jpg')),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              'Hotels & more',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: new EdgeInsets.only(
                                top: 100, left: 15, right: 5),
                            child: Text(
                              'Save on amazing places to stay and explore unique experiences.',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 15),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Popular Stays',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        height: 270,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: documents
                                .map((doc) => StaysCard(
                                          staysImages: doc['staysImages'],
                                          rate: doc['rate'],
                                          stars: doc['stars'],
                                          name: doc['name'],
                                          price: doc['price'],
                                        )
                                    // Card(
                                    //       child: ListTile(
                                    //         title: Text(doc['City']),
                                    //         subtitle: Text(doc['Title']),
                                    //       ),
                                    //     )
                                    )
                                .toList()),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      color: Color.fromRGBO(134, 132, 130, 1),
                      height: 600,
                      // width: MediaQuery.of(context).size.width,
                      width: 500,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 40, left: 20),
                              child: Text(
                                'Hotel Vouchers',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, left: 20),
                              child: Text(
                                'Get money off your getaway with klook-exclusive vouchers',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          FutureBuilder<QuerySnapshot>(
                              future: FirebaseFirestore.instance
                                  .collection('Hotel-')
                                  .where('section', isEqualTo: 'VoucherCard')
                                  .get(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Text("Loading");
                                }

                                final List<DocumentSnapshot> documents =
                                    snapshot.data.docs;
                                return Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Container(
                                    height: 400,
                                    child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: documents
                                            .map((doc) => VoucherCard(
                                                      id: doc.id,
                                                      staysImages:
                                                          doc['staysImages'],
                                                      city: doc['city'],
                                                      title: doc['title'],
                                                      price: doc['price'],
                                                      validity: doc['validity'],
                                                      priceBefore:
                                                          doc['priceBefore'],
                                                    )
                                                // Card(
                                                //       child: ListTile(
                                                //         title: Text(doc['City']),
                                                //         subtitle: Text(doc['Title']),
                                                //       ),
                                                //     )
                                                )
                                            .toList()),
                                  ),
                                );
                                // );
                              }),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Why Book with Klook?',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                        color: Colors.white,
                        // height: 500,
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, left: 30),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.payments,
                                        color: Colors.deepOrange,
                                        size: 40,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Special Savings',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              width: 230,
                                              child: Text(
                                                "Get great prices and find a deal that's right for you.",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              height: 2,
                              thickness: 1,
                              indent: 20,
                              endIndent: 20,
                            ),
                            Container(
                              height: 100,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, left: 30),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.headset,
                                        color: Colors.deepOrange,
                                        size: 40,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              '24/7 Customer Support',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              width: 230,
                                              child: Text(
                                                "We're always here when you need us.",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              height: 2,
                              thickness: 1,
                              indent: 20,
                              endIndent: 20,
                            ),
                            Container(
                              height: 100,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, left: 30),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.verified,
                                        color: Colors.deepOrange,
                                        size: 40,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'One-stop Travel Platform',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              width: 230,
                                              child: Text(
                                                "Our Services cover range of payment methods.",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'FAQs',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                        color: Colors.white,
                        // height: 500,
                        child: Column(
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 30, left: 15, right: 15),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: ExpansionTile(
                                      title: Text(
                                        'Will I be charged if I cancel my booking?',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      children: [
                                        Container(
                                          color:
                                              Color.fromRGBO(245, 243, 243, 1),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'This depends on the cancellation policy of your booking. \n '
                                              'Cancelling a non-refundable bookings may result in a full charge of the booking. \n'
                                              'Free cancellation means that the booking can be cancelled within a certain period of time. For exaple, some properties allow you to cancel 48 hours before check-in time. \n'
                                              "Beyond the arranged time, any cancellation may be charged a fee. Please see the propety's cancellation policy for more details",
                                              style: TextStyle(
                                                  fontSize: 16, height: 2),
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                            ),
                            Divider(
                              height: 2,
                              thickness: 1,
                              indent: 20,
                              endIndent: 20,
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 30, left: 15, right: 15),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: ExpansionTile(
                                      title: Text(
                                        'How will I know if my booking is confirmed?',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      children: [
                                        Container(
                                          color:
                                              Color.fromRGBO(245, 243, 243, 1),
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "We'll send a confirmation email with your booking details within 30 minutes after you've made the payment. If you can't find the email, try checking your spam/junk folder. \n You can also check 'My bookings' on the Klook app or website.",
                                                style: TextStyle(
                                                    fontSize: 16, height: 2),
                                              )),
                                        )
                                      ],
                                    )),
                              ),
                            ),
                            Divider(
                              height: 2,
                              thickness: 1,
                              indent: 20,
                              endIndent: 20,
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 30, left: 15, right: 15),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: ExpansionTile(
                                      title: Text(
                                        'Where can I find the cancellation policy?',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      children: [
                                        Container(
                                          color:
                                              Color.fromRGBO(245, 243, 243, 1),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "You can find a room's cancellation policy listed as either 'Free cancellation' or 'Non-refundable' near the room rate. To find out more details, go to the booking page. \n If you've already made your booking, you can find the detailed cancellation policy in the confirmation email. \n"
                                              "Please note that cancellation policies vary by property. Please check the property's policies before booking.",
                                              style: TextStyle(
                                                  fontSize: 16, height: 2),
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                            ),
                            Divider(
                              height: 2,
                              thickness: 1,
                              indent: 20,
                              endIndent: 20,
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 30, left: 15, right: 15, bottom: 30),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: ExpansionTile(
                                      title: Text(
                                        'How do I make a booking on Klook?',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      children: [
                                        Container(
                                          color:
                                              Color.fromRGBO(245, 243, 243, 1),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "1. Log in to your Klook account or create one.\n"
                                              "2. Select Stays from the main menu, enter your destination and dates, and hit search\n"
                                              "3. Choose a property and complete the booking\n"
                                              "4. You'll get a confirmation email within 30 minutes of booking",
                                              style: TextStyle(
                                                  fontSize: 16, height: 2),
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Terms & Conditions',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                        color: Colors.white,
                        // height: 500,
                        child: Column(
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 30, left: 15, right: 15, bottom: 30),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: '• ',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 18),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text:
                                                    'By making an Accommodation reservation on the Klook platform, you accept and agree to the relevant Accommodation booking conditions,'
                                                    'including cxancellation and no-showpolicies. The cancellation and no-show policy of each Accommodation is available on the Klook Platform at the Accommodation information pages.Certain rates, fees or special offers will not be eligible for cancellation, refund or change.',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                    height: 1.8))
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15, bottom: 15),
                                        child: RichText(
                                          text: TextSpan(
                                            text: '• ',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 20),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text:
                                                      'Any cancellation or changes (where applicable) to your reservation must be made through Klook and not directly with the Accommodation or any third party supplier. Any problems or questions on your reservation should be directed to our Klook customer service, who will assist you and serve as a point of contact with the Accommodation or the third party supplier.',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                      height: 1.8))
                                            ],
                                          ),
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: '• ',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 18),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text:
                                                    'Prices for Accommodation are for room reservations only, and for the specified stay dates and number of people, unless expressly indicated otherwise.',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                    height: 1.8))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

Widget popularStays({staysImages, rate, name, price, stars}) {
  return StaysCard(
    staysImages: staysImages,
    rate: rate,
    name: name,
    price: price,
    stars: stars,
  );
}

Widget hotelVouchers({staysImages, rate, title, price, city, validity}) {
  return VoucherCard(
    staysImages: staysImages,
    title: title,
    price: price,
    city: city,
    validity: validity,
  );
}
