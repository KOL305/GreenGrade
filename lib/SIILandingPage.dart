// import 'package:flutter/material.dart';
// import 'QRCodeCompressor.dart';
// import 'HomePage.dart';
// import 'SIIFORM.dart';
// import 'SIIGEMINI.dart';
// import 'GEMINICALCULATOR.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class SIILandingPage extends StatefulWidget {
//   const SIILandingPage({super.key, required this.title});

//   final String title;

//   @override
//   State<SIILandingPage> createState() => SIILandingPageState();
// }

// class SIILandingPageState extends State<SIILandingPage> {
//   List<String> companies = []; // Track list of companies

//   void _addCompany(String companyName) async {
//     var box = Hive.box('SII');
//     String key =
//         'Company ${box.length}'; // Use the current length as the new key
//     await box.put(key, {"siiMin": 0.322, "siiMax": 0.664}); // Add a new entry
//   }

//   void _deleteCompany(String key) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Delete Company'),
//           content: Text('Are you sure you want to delete?'),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: Text('Delete'),
//               onPressed: () async {
//                 var box = Hive.box('SII');
//                 await box.delete(key); // Remove the item with the specified key
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   List<String> listTiles = [
//     'Home',
//     'Sustainability Interval Calculator',
//     'Gemini Index Generator',
//     'QR Code Compressor',
//     'QR Code Scanner'
//   ];

//   void _showDeletePopup(BuildContext context, int index) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Delete ListTile"),
//           content: Text("Are you sure you want to delete this item?"),
//           actions: [
//             TextButton(
//               child: Text("Cancel"),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: Text("Delete"),
//               onPressed: () {
//                 setState(() {
//                   listTiles.removeAt(index);
//                 });
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     Hive.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF11221D),
//         elevation: 0,
//         leading: Builder(
//           builder: (context) {
//             return IconButton(
//               icon: Icon(Icons.menu, color: Color(0xFF62ffac)),
//               onPressed: () {
//                 Scaffold.of(context).openDrawer();
//               },
//             );
//           },
//         ),
//       ),
//       drawer: Drawer(
//         child: Container(
//           color: Colors.black,
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: <Widget>[
//               ListTile(
//                 leading: Icon(Icons.menu, color: Color(0xFF62ffac)),
//               ),
//               ListTile(
//                 title: Text(
//                   'Home',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 onTap: () {
//                   Navigator.pop(context); // Close drawer
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => HomePage()),
//                   );;
//                 },
//               ),
//               ListTile(
//                 title: Text(
//                   'Sustainability Interval Calculator',
//                   style: TextStyle(
//                     color: Color(0xFF62ffac),
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 onTap: () {
//                   Navigator.pop(context); // Close drawer
//                 },
//               ),
//               ListTile(
//                 title: Text(
//                   'Gemini Index Generator',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 onTap: () {
//                   //print("TO GEMINI calculator");
//                    Navigator.pop(context); // Close drawer
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => GEMINICALCULATOR()),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF11221D), Color(0xFF000000)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Title
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: Container(
//                       height: 2,
//                       color: Colors.greenAccent,
//                     ),
//                   ),
//                   SizedBox(width: 8),
//                   Column(
//                     children: [
//                       Text(
//                         'Sustainability Interval',
//                         style: TextStyle(
//                           color: Colors.greenAccent,
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         'Index Calculator',
//                         style: TextStyle(
//                           color: Colors.greenAccent,
//                           fontSize: 32,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(width: 8),
//                   Expanded(
//                     child: Container(
//                       height: 2,
//                       color: Colors.greenAccent,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),
//               // Description
//               Column(
//                 children: [
//                   Text(
//                     'Upload sustainability indicator values you have.',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'Or upload a sustainability report for Gemini to extract SI values for you.',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//               SizedBox(height: 24),
//               // "Your Companies" Section
//               Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Color(0xFFF5FFF5), Color(0xFFC8FFC8)],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   ),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 padding: EdgeInsets.all(16),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Your Companies',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 24),
//               // Squares Section

//               Container(
//                 height: 200,
//                 child: Column(
//                   children: [
//                     FutureBuilder(
//                         future: Hive.openBox('SII'),
//                         builder: (context, snapshot) {
//                           if (snapshot.connectionState ==
//                               ConnectionState.done) {
//                             // Box is opened, you can use it here
//                             return Expanded(
//                                 child: ValueListenableBuilder(
//                                     valueListenable:
//                                         Hive.box('SII').listenable(),
//                                     builder: (context, box, widget) {
//                                       List keys = box.keys
//                                           .toList()
//                                           .reversed
//                                           .toList(); // Get all keys from the box
//                                       List entries =
//                                           box.values.toList().reversed.toList();
//                                       return ListView.builder(
//                                         scrollDirection: Axis.horizontal,
//                                         itemCount: entries.length,
//                                         itemBuilder: (context, index) {
//                                           return GestureDetector(
//                                             onTap: () {
//                                               // Handle the tap event here
//                                               // Navigator.pop(
//                                               //     context); // Close the drawer
//                                               Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       SIIGEMINI(
//                                                           index: index,
//                                                           data: entries[index]),
//                                                 ),
//                                               );
//                                               print("Square $index tapped");
//                                             },
//                                             onLongPress: () {
//                                               _deleteCompany(keys[index]);
//                                             },
//                                             child: Container(
//                                               margin: EdgeInsets.symmetric(
//                                                   horizontal: 8),
//                                               width: 180,
//                                               height: 180, // Making it a square
//                                               decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 borderRadius:
//                                                     BorderRadius.circular(8),
//                                                 boxShadow: [
//                                                   BoxShadow(
//                                                     color: Colors.black
//                                                         .withOpacity(0.1),
//                                                     blurRadius: 5,
//                                                     offset: Offset(2, 2),
//                                                   ),
//                                                 ],
//                                               ),

//                                               child: Align(
//                                                 alignment: Alignment.center,
//                                                 child: Column(children: [
//                                                   SizedBox(height: 25),
//                                                   Text(
//                                                     entries[index]["name"], 
//                                                     overflow: TextOverflow.ellipsis,
//                                                     style: TextStyle(
//                                                       fontSize: 20,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: Colors.black,
//                                                     ),
//                                                   ),
//                                                   SizedBox(height: 15),
//                                                   Text(
//                                                     "SII Min: ${entries[index]["siiMin"]}",
//                                                     style: TextStyle(
//                                                       fontSize: 20,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: Colors.black,
//                                                     ),
//                                                   ),
//                                                   Text(
//                                                     "SII Max: ${entries[index]["siiMax"]}",
//                                                     style: TextStyle(
//                                                       fontSize: 20,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: Colors.black,
//                                                     ),
//                                                   ),
//                                                 ]),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       );
//                                     }));
//                             // Use the box her
//                           } else {
//                             // Show loading indicator or handle error
//                             return CircularProgressIndicator();
//                           }
//                         }),
//                     SizedBox(height: 20),
//                     Container(
//                       height: 10,
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [Color(0xFFF5FFF5), Color(0xFFC8FFC8)],
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                         ),
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 24),
//               // Profile Creation Section
//               Column(
//                 children: [
//                   Text(
//                     'Create a new profile:',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   OutlinedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               SIIFORM(title: "SII Input Form"),
//                         ),
//                       );
//                     },
//                     style: OutlinedButton.styleFrom(
//                       side: BorderSide(color: Colors.greenAccent, width: 2),
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                     ),
//                     child: Text(
//                       'Upload Indicators',
//                       style: TextStyle(
//                         color: Colors.greenAccent,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'or',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'Use Google’s Gemini to generate company indicators:',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 16),
//                   OutlinedButton(
//                     onPressed: () {
//                       // Navigator to Google Gemini page
//                     },
//                     style: OutlinedButton.styleFrom(
//                       side: BorderSide(color: Colors.greenAccent, width: 2),
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                     ),
//                     child: Text(
//                       'Gemini API',
//                       style: TextStyle(
//                         color: Colors.greenAccent,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           // Button to clear all items
//           FloatingActionButton(
//             onPressed: () async {
//               var box = Hive.box('SII');
//               await box.clear(); // Clear all items from the box
//             },
//             child: Icon(Icons.clear_all),
//             heroTag:
//                 null, // Add this if you have multiple FABs to avoid conflicts
//           ),
//           SizedBox(width: 16), // Space between the buttons
//           // Button to add a new entry
//           FloatingActionButton(
//             onPressed: () async {
//               var box = Hive.box('SII');
//               int timestamp = DateTime.now().millisecondsSinceEpoch;
//               String key =timestamp.toString(); // Use the current length as the new key
//               await box.put(
//                   key, {"name": "Company ${box.length}", "siiMin": 0.322, "siiMax": 0.664}); // Add a new entry
//             },
//             child: Icon(Icons.add),
//             heroTag:
//                 null, // Add this if you have multiple FABs to avoid conflicts
//           ),
//         ],
//       ),
//     );
//   }
// }
