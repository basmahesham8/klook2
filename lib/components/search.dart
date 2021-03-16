import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:klook2/components/activityDetails.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<String> added = [];
  String currentText = "";
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  List<String> suggestions = [];
//  Set< dynamic> suggestions = [];

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection('ToursCollection')
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                suggestions.add(doc["Title"]);
              })
            });

    print(added);

    return SimpleAutoCompleteTextField(
        key: key,
        decoration: new InputDecoration(
          fillColor: Colors.white,
          filled: true,
          icon: Icon(
            Icons.search_rounded,
            size: 30,
            color: Colors.white,
          ),

          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(30.0),
            ),
          ),
          hintText: 'Search by activity',
          // errorText: "Beans"
        ),
        controller: TextEditingController(text: ""),
        suggestions: suggestions,
        textChanged: (text) => currentText = text,
        // clearOnSubmit: true,
        textSubmitted: (text) => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ActivityDetails(title: text)),
            ));
  }
}
