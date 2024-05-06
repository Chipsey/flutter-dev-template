// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/pages/categories.dart';
import 'package:todo_app/pages/courses.dart';
import 'package:todo_app/pages/dashboard.dart';
import 'package:todo_app/pages/login.dart';
import 'package:todo_app/pages/stateful.dart';
import 'package:todo_app/pages/todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
      routes: {
        '/login': (context) => Login(),
        '/dashboard': (context) => Dashboard(),
        '/courses': (context) => Courses(),
        '/categories': (context) => Categories(),
      },
    );
  }
}

// class MyApp extends StatelessWidget {
//   MyApp({super.key});

//   String name = "Xillica";
//   int age = 24;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.grey[100],
//         appBar: AppBar(
//           title: Text(
//             "Xillica",
//             style:
//                 TextStyle(color: Colors.grey[100], fontWeight: FontWeight.bold),
//           ),
//           backgroundColor: Colors.teal[300],
//           elevation: 0,
//           leading: Icon(
//             Icons.menu,
//             color: Colors.grey[100],
//           ),
//           actions: [
//             IconButton(
//               onPressed: () {},
//               icon: Icon(Icons.logout, color: Colors.grey[100]),
//             )
//           ],
//         ),
//         body: ListView(scrollDirection: Axis.vertical, children: [
//           Container(
//               height: 200,
//               decoration: BoxDecoration(
//                   color: Colors.teal[300],
//                   borderRadius: BorderRadius.circular(0)),
//               padding: EdgeInsets.all(25),
//               child: Icon(
//                 Icons.headphones,
//                 color: Colors.grey[100],
//                 size: 80,
//               )),
//           Container(
//               height: 200,
//               decoration: BoxDecoration(
//                   color: Colors.teal[300],
//                   borderRadius: BorderRadius.circular(0)),
//               padding: EdgeInsets.all(25),
//               child: Icon(
//                 Icons.headphones,
//                 color: Colors.grey[100],
//                 size: 80,
//               )),
//           Container(
//               height: 200,
//               decoration: BoxDecoration(
//                   color: Colors.teal[300],
//                   borderRadius: BorderRadius.circular(0)),
//               padding: EdgeInsets.all(25),
//               child: Icon(
//                 Icons.headphones,
//                 color: Colors.grey[100],
//                 size: 80,
//               )),
//           Container(
//               height: 200,
//               decoration: BoxDecoration(
//                   color: Colors.teal[300],
//                   borderRadius: BorderRadius.circular(0)),
//               padding: EdgeInsets.all(25),
//               child: Icon(
//                 Icons.headphones,
//                 color: Colors.grey[100],
//                 size: 80,
//               )),
//           Container(
//               height: 200,
//               decoration: BoxDecoration(
//                   color: Colors.teal[300],
//                   borderRadius: BorderRadius.circular(0)),
//               padding: EdgeInsets.all(25),
//               child: Icon(
//                 Icons.headphones,
//                 color: Colors.grey[100],
//                 size: 80,
//               )),
//         ]),
//       ),
//     );
//   }
// }
