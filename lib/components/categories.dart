import 'package:flutter/material.dart';
import 'package:klook2/components/hotel.dart';

// void main(){
//   runApp(Categories());
// }
class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //backgroundColor: Color(0xFFF9F9F9),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SafeArea(
                        left: false,
                        top: true,
                        bottom: true,
                        right: false,
                        child: Text(
                          'All categories',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )),
                    SafeArea(
                        left: false,
                        top: true,
                        bottom: true,
                        right: false,
                        child: Icon(Icons.add_shopping_cart)),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 20,
              ),
              //Experiences:
              Padding(
                padding: const EdgeInsets.all(10),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Experiences',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    )),
              ),
              //Tours:
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Icon(
                      Icons.beach_access,
                      color: Colors.purple,
                      size: 35,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Tours',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 30,
              ),

              //Accommodation:
              Padding(
                padding: const EdgeInsets.all(10),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Accommodation',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    )),
              ),
              //Hotels:
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Icon(
                        Icons.home_work_outlined,
                        color: Colors.deepOrange,
                        size: 35,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Hotels & more',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Hotel()),
                  );
                },
              ),

              // Padding(
              //   padding: const EdgeInsets.all(10),
              //   child: Column(
              //     children: [
              //       Icon(Icons.home_work_outlined, color: Colors.deepOrange,size: 35,),
              //       SizedBox(height: 10,),
              //       Text('Hotels & more', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),)
              //     ],
              //   ),
              // ),

              // Center(
              //   child: ElevatedButton(
              //     onPressed: (){
              //       Navigator.push(context, new MaterialPageRoute(
              //           builder: (context) => Hotel()));
              //     }, child: null,
              //   ),
              // )

              // GestureDetector(
              //   onTap: (){
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => Hotel()
              //       ),
              //     );
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
