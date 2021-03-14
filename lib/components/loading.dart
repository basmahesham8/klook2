/// Flutter code sample for LinearProgressIndicator

// This example shows a [LinearProgressIndicator] with a changing value.

import 'package:flutter/material.dart';

// void main() => runApp( MyApp());

/// This is the main application widget.
class Loading extends StatelessWidget {
  //  MyApp({Key? key}) : super(key: key);

  static  String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  //  MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
/// AnimationControllers can be created with vsync: this because of TickerProviderStateMixin.
class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
   AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration:  Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.fromLTRB(0.0 ,25 ,0 ,0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         
          children: <Widget>[
             
            LinearProgressIndicator(
              value: controller.value,
              semanticsLabel: 'Linear progress indicator',
            ),
          ],
        ),
      ),
    );
  }
}
