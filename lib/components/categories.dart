import 'package:flutter/material.dart';
import 'package:klook2/components/subCategoryActivities.dart';

import 'hotel.dart';
void main(){
  runApp(Categories());
}
class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //backgroundColor: Color(0xFFF9F9F9),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(children: [
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
                      child: Text('All categories', style: TextStyle(fontSize: 20,
                          color: Colors.black, fontWeight: FontWeight.bold),)
                  ),
                  SafeArea(
                      left: false,
                      top: true,
                      bottom: true,
                      right: false,
                      child: Icon(Icons.add_shopping_cart)
                  ),

                ],
              ),
            )
            ,Divider(thickness: 1,),
            SizedBox(height: 20,),
            //Experiences:
            Padding(
              padding: const EdgeInsets.all(10),
              child: Align(alignment: Alignment.topLeft,child: Text('Experiences', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),)
              ),
            ),
            //Tours:
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Icon(Icons.local_activity, color: Colors.deepOrange,size: 35,),
                    SizedBox(height: 10,),
                    Text('Attractions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),)

                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SubCategoryActivities(
                              subCategoryName:
                              'Attractions')),
                );
              },
            ),
            SizedBox(height: 50,),
            Divider(thickness: 1,),
            SizedBox(height: 30,),

            //Accommodation:
            Padding(
              padding: const EdgeInsets.all(10),
              child: Align(alignment: Alignment.topLeft,child: Text('Accommodation', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),)
              ),
            ),
            //Hotels:
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Icon(Icons.home_work_outlined, color: Colors.green,size: 35,),
                    SizedBox(height: 10,),
                    Text('Hotels & more', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),)
                  ],
                ),
              ),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Hotel()
                    ),
                  );
                },
              )
            ]),

          ),
        ),
      );
    // );
  }
}




// import 'package:flutter/material.dart';
// import 'package:klook2/components/hotel.dart';
//
// class Categories extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         //backgroundColor: Color(0xFFF9F9F9),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(15),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       SafeArea(
//                           left: false,
//                           top: true,
//                           bottom: true,
//                           right: false,
//                           child: Text(
//                             'All categories',
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold),
//                           )),
//                       SafeArea(
//                           left: false,
//                           top: true,
//                           bottom: true,
//                           right: false,
//                           child: Icon(Icons.add_shopping_cart)),
//                     ],
//                   ),
//                 ),
//                 Divider(
//                   thickness: 1,
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 //Experiences:
//                 Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Align(
//                       alignment: Alignment.topLeft,
//                       child: Text(
//                         'Experiences',
//                         style:
//                             TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
//                       )),
//                 ),
//                 //Tours:
//                 Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Padding(
//                     padding: const EdgeInsets.all(2.0),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               children: [
//                                 Icon(
//                                   Icons.local_activity,
//                                   color: Colors.deepOrange,
//                                   size: 35,
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Text(
//                                   'Attractions',
//                                   textAlign: TextAlign.center,
//                                   style:
//                                   TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
//                                 )
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 Icon(
//                                   Icons.emoji_nature,
//                                   color: Colors.green,
//                                   size: 35,
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Container(
//                                   width: 80,
//                                   child: Text(
//                                     'Outdoors & sports',
//                                     textAlign: TextAlign.center,
//                                     maxLines: 2,
//                                     style:
//                                     TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 Icon(
//                                   Icons.self_improvement,
//                                   color: Colors.lightBlueAccent,
//                                   size: 35,
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Container(
//                                   width: 90,
//                                   child: Text(
//                                     'Relaxation & beauty',
//                                     textAlign: TextAlign.center,
//                                     style:
//                                     TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 Icon(
//                                   Icons.border_color,
//                                   color: Colors.blueAccent,
//                                   size: 35,
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Container(
//                                   width: 90,
//                                   child: Text(
//                                     'Culture & workshops',
//                                     textAlign: TextAlign.center,
//                                     style:
//                                     TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 30,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Column(
//                               children: [
//                                 Icon(
//                                   Icons.wine_bar,
//                                   color: Colors.pink,
//                                   size: 35,
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Container(
//                                   width: 80,
//                                   child: Center(
//                                     child: Text(
//                                       'Fun & nightlife',
//                                       textAlign: TextAlign.center,
//                                       style:
//                                       TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 Icon(
//                                   Icons.beach_access_outlined,
//                                   color: Colors.purple,
//                                   size: 35,
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Container(
//                                   width: 80,
//                                   child: Text(
//                                     'Tours',
//                                     maxLines: 2,
//                                     textAlign: TextAlign.center,
//                                     style:
//                                     TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
//                                   ),
//                                 )
//                               ],
//                             ),
//
//                           ],
//                         ),
//
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Divider(
//                   thickness: 1,
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//
//                 //Accommodation:
//                 Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Align(
//                       alignment: Alignment.topLeft,
//                       child: Text(
//                         'Accommodation',
//                         style:
//                             TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
//                       )),
//                 ),
//                 //Hotels:
//                 GestureDetector(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(10),
//                         child: Column(
//                           children: [
//                             Icon(
//                               Icons.home_work_outlined,
//                               color: Colors.deepOrange,
//                               size: 35,
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               'Hotels & more',
//                               style: TextStyle(
//                                   fontSize: 15, fontWeight: FontWeight.w900),
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => Hotel()),
//                     );
//                   },
//                 ),
//                 SizedBox(height: 30,),
//                 Divider(
//                   thickness: 1,
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 //More to explore:
//                 Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Align(
//                       alignment: Alignment.topLeft,
//                       child: Text(
//                         'More to explore',
//                         style:
//                         TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
//                       )),
//                 ),
//                 //Tours:
//                 Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Padding(
//                     padding: const EdgeInsets.all(2.0),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Column(
//                               children: [
//                                 Icon(
//                                   Icons.fastfood_rounded,
//                                   color: Colors.deepOrange,
//                                   size: 35,
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Text(
//                                   'Food & dining',
//                                   textAlign: TextAlign.center,
//                                   style:
//                                   TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
//                                 )
//                               ],
//                             ),
//                             SizedBox(width: 20,),
//                             Column(
//                               children: [
//                                 Icon(
//                                   Icons.sim_card,
//                                   color: Colors.green,
//                                   size: 35,
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Container(
//                                   width: 80,
//                                   child: Text(
//                                     'WIFI & SIM cards',
//                                     textAlign: TextAlign.center,
//                                     maxLines: 2,
//                                     style:
//                                     TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
