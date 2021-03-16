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
        appBar: AppBar(
          title: Text(
            widget.subCategoryName,
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
                                booked: doc['Booked'].toString(),
                                categories: doc['Categories'],
                                date: doc['Date'].toString(),
                                price: doc['Price'].toString(),
                                rate: doc['Rate'].toString(),
                                review: doc['Review'].toString(),
                                distance: doc['Distance'].toString(),
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
