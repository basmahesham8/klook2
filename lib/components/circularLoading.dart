import 'package:flutter/material.dart';



class CircularLoading extends StatelessWidget {

  static     String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return     MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
   AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration:     Duration(seconds: 5),
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
        padding:     EdgeInsets.fromLTRB(0 , 300 , 0 ,0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
         
           Center ( 
             child :CircularProgressIndicator(
              value: controller.value,
              semanticsLabel: 'Linear progress indicator',
            )),
          ],
        ),
      ),
    );
  }
}
