// ignore_for_file: prefer_const_constructors

import 'package:Xillica/pages/editor_functions/crop_screen.dart';
import 'package:Xillica/pages/imageEditor.dart';
import 'package:Xillica/pages/imagePicker.dart';
import 'package:Xillica/providers/image_provider.dart';
import 'package:Xillica/services/camera_service.dart';
import 'package:flutter/material.dart';
import 'package:Xillica/pages/categories.dart';
import 'package:Xillica/pages/cart.dart';
import 'package:Xillica/pages/dashboard.dart';
import 'package:Xillica/pages/login.dart';
// import 'package:Xillica/pages/stateful.dart';
// import 'package:Xillica/pages/todo.dart';
import 'package:Xillica/services/notification_service.dart';
import 'package:camera/camera.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();

  // final cameras = await availableCameras();
  // print("Cameras: " + cameras.toString());
  // final firstCamera = cameras.last;

  // runApp(MyApp(
  //   firstCamera: firstCamera,
  // ));

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CustomImageProvider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // final firstCamera;
  // const MyApp({super.key, required this.firstCamera});

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
      routes: {
        '/login': (context) => Login(),
        '/dashboard': (context) => Dashboard(),
        '/cart': (context) => Cart(),
        '/categories': (context) => Categories(),
        '/image_picker': (context) => CustomImagePicker(),
        // '/camera': (context) => CameraService(
        //       camera: firstCamera,
        //     ),
        '/image_editor': (context) => CustomImageEditor(),
        '/crop': (context) => CropScreen(),
      },
    );
  }
}
