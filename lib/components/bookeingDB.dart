// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klook2/components/tourCard.dart';

class GetUserName extends StatelessWidget {
  // final String documentId;

  GetUserName(this.documentsss);

  final List<DocumentSnapshot> documentsss;

  getlist() {
    return documentsss;
  }

  @override
  Widget build(BuildContext context) {
    // CollectionReference users = FirebaseFirestore.instance
    // .collection('users')
    // .where('Email', isEqualTo: 'hagar@elgarh98.com');

    // getlist() {
    //   return documentss;
    // }
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance
          .collection('ToursCollection')
          .where('Section', isEqualTo: 'BestSeller')
          .get(),
      builder: (context, snapshott) {
        if (!snapshott.hasData) {
          // widget.dataHas = true;
          return Text("Loading");
        }

        List<DocumentSnapshot> documentss = snapshott.data.docs;

        return ListView(
            scrollDirection: Axis.horizontal,
            children: documentss
                .map((doc) => MCard(
                          title: doc['Title'],
                          city: doc['City'],
                          section: doc['Section'],
                          image: doc['Image'],
                          booked: doc['Booked'],
                          categories: doc['Categories'],
                          date: doc['Date'],
                          price: doc['Price'],
                          rate: doc['Rate'],
                          review: doc['Review'],
                          distance: doc['Distance'],
                          imageheight: 60,
                        )
                    // Card(
                    //       child: ListTile(
                    //         title: Text(doc['City']),
                    //         subtitle: Text(doc['Title']),
                    //       ),
                    //     )
                    )
                .toList());

        // );
        // )
      },
    );
  }
}
