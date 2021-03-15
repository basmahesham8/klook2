import 'package:flutter/material.dart';
import 'tourCard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/subCategoryActivity.dart';
import 'package:klook2/components/loading.dart';

class SubCategoryActivities extends StatefulWidget {
  final String subCategoryName;
  // final String   tourDiscount;
  // final String   tourSectionInner;

  SubCategoryActivities({this.subCategoryName});

  @override
  _SubCategoryActivitiesState createState() => _SubCategoryActivitiesState();
}

class _SubCategoryActivitiesState extends State<SubCategoryActivities> {
  @override
  Widget build(BuildContext context) {

  

    return Scaffold(
        body: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance
                .collection('ToursCollection')
                .where('Categories', isEqualTo: widget.subCategoryName)
                .get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Loading();
              }

              final List<DocumentSnapshot> documents = snapshot.data.docs;

              return ListView(
                  children: documents
                      .map((doc) => MCard(
                                id: doc.id,
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
                              )
                          // Card(
                          //       child: ListTile(
                          //         title: Text(doc['City']),
                          //         subtitle: Text(doc['Title']),
                          //       ),
                          //     )
                          )
                      .toList());
            }));
  }
}
