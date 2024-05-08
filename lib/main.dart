// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:Xillica/pages/categories.dart';
import 'package:Xillica/pages/courses.dart';
import 'package:Xillica/pages/dashboard.dart';
import 'package:Xillica/pages/login.dart';
// import 'package:Xillica/pages/stateful.dart';
// import 'package:Xillica/pages/todo.dart';
import 'package:Xillica/services/notification_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
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
