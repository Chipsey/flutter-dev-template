import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class CustomImageProvider extends ChangeNotifier {
  Uint8List? currentImage;

  changeImageFile(File image) {
    currentImage = image.readAsBytesSync();
    print(image);
    notifyListeners();
  }

  changeImage(Uint8List image) {
    currentImage = image;
    print(image);
    notifyListeners();
  }
}
