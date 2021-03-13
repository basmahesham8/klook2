import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './subCategoryActivities.dart';

class TestHome extends StatefulWidget {
  @override
  _TestHomeState createState() => _TestHomeState();
}

class _TestHomeState extends State<TestHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextButton(
              child: Text(
                'experiences',
                style: TextStyle(color: Colors.lightBlue[400], fontSize: 12),
              ),
              onPressed: () => showSubCategory(),
            ),
          ],
        ),
      ),
    );
  }

  void showSubCategory() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return FutureBuilder<QuerySnapshot>(
              
              future:
                  FirebaseFirestore.instance.collection('SubCategories').where('Name' , isNotEqualTo: 'Experiences').get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("Loading");
                }
                final List<DocumentSnapshot> documents = snapshot.data.docs;
                return ListView(
                    children: documents
                        .map((doc) => Column (
                          children : [

                            // SizedBox (height: 20,),
                             Card(
                               margin: const EdgeInsets.all(10),
                              child: ListTile(
                                onTap:() { Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SubCategoryActivities(subCategoryName :doc['Name'])), 
                                );},
                                title: Row(children: [
                                  Expanded(
                                      child: Container(
                                        child: Image.network(doc['Image']),
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 7, 0),
                                      ),
                                      flex: 1),
                                  Expanded(child: Text(doc['Name']), flex: 8),

                                  Expanded(
                                      child: Icon(Icons.keyboard_arrow_right),
                                      flex: 1),

                                  // Icon(Icons.keyboard_arrow_right),
                                ]),
                              ),
                            )


                          ]
                        )                            )
                        .toList());
              });
        });
  }
}
