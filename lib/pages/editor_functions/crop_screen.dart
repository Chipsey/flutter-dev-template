import 'dart:typed_data';
import 'dart:ui';

import 'package:Xillica/components/loading_screen.dart';
import 'package:Xillica/providers/image_provider.dart';
import 'package:crop_image/crop_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

class CropScreen extends StatefulWidget {
  const CropScreen({super.key});

  @override
  State<CropScreen> createState() => _CropScreenState();
}

class _CropScreenState extends State<CropScreen> {
  late CropController controller;
  late CustomImageProvider imageProvider;
  bool isDataLoading = false;

  @override
  void initState() {
    isDataLoading = true;

    imageProvider = Provider.of<CustomImageProvider>(context, listen: false);
    controller = CropController(
      aspectRatio: 1,
      defaultCrop: const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9),
    );

    isDataLoading = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isDataLoading) {
      return LoadingScreen();
    }
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: const CloseButton(),
        title: Text('Crop'),
        actions: [
          TextButton(
            onPressed: () async {
              ui.Image bitmap = await controller.croppedBitmap();
              ByteData? data =
                  await bitmap.toByteData(format: ImageByteFormat.png);
              Uint8List bytes = data!.buffer.asUint8List();
              imageProvider.changeImage(bytes);
              if (!mounted) return;
              Navigator.of(context).pop();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.done),
              ],
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Consumer<CustomImageProvider>(
                  builder: (BuildContext context, value, Widget? child) {
                    if (value.currentImage != null) {
                      return CropImage(
                        controller: controller,
                        image: Image.memory(
                          value.currentImage!,
                          // width: double.infinity,
                          // fit: BoxFit.cover,
                        ),
                        alwaysMove: true,
                        gridCornerSize: 20,
                        gridThinWidth: 2,
                        gridThickWidth: 4,
                        scrimColor: Colors.grey.withOpacity(0.5),
                        alwaysShowThirdLines: true,
                        onCrop: (rect) => print(rect),
                        minimumImageSize: 50,
                        maximumImageSize: 2000,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 130,
        color: Colors.white,
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _bottomItem(
                  Icons.rotate_90_degrees_ccw_outlined,
                  "Left",
                  onPress: () {
                    controller.rotateLeft();
                  },
                ),
                _bottomItem(
                  Icons.rotate_90_degrees_cw_outlined,
                  "Right",
                  onPress: () {
                    controller.rotateRight();
                  },
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Container(
                    color: Colors.grey[900],
                    width: 1,
                    height: double.infinity,
                  ),
                ),
                _bottomItem(
                  Icons.rotate_left,
                  "Free",
                  onPress: () {
                    controller.aspectRatio = 1;
                    controller.crop = Rect.fromLTRB(0.05, 0.05, 0.95, 0.95);
                  },
                ),
                _bottomItem(
                  Icons.square_foot,
                  "Square",
                  onPress: () {
                    controller.aspectRatio = 1;
                    controller.crop = Rect.fromLTRB(0.05, 0.05, 0.95, 0.95);
                  },
                ),
                _bottomItem(
                  Icons.select_all_rounded,
                  "2:1",
                  onPress: () {
                    controller.aspectRatio = 2;
                    controller.crop = Rect.fromLTRB(0.05, 0.05, 0.95, 0.95);
                  },
                ),
                _bottomItem(
                  Icons.select_all_rounded,
                  "1:2",
                  onPress: () {
                    controller.aspectRatio = 1 / 2;
                    controller.crop = Rect.fromLTRB(0.05, 0.05, 0.95, 0.95);
                  },
                ),
                _bottomItem(
                  Icons.select_all_rounded,
                  "4:3",
                  onPress: () {
                    controller.aspectRatio = 4 / 3;
                    controller.crop = Rect.fromLTRB(0.05, 0.05, 0.95, 0.95);
                  },
                ),
                _bottomItem(
                  Icons.select_all_rounded,
                  "3:4",
                  onPress: () {
                    controller.aspectRatio = 3 / 4;
                    controller.crop = Rect.fromLTRB(0.05, 0.05, 0.95, 0.95);
                  },
                ),
                _bottomItem(
                  Icons.select_all_rounded,
                  "16:9",
                  onPress: () {
                    controller.aspectRatio = 16 / 9;
                    controller.crop = Rect.fromLTRB(0.05, 0.05, 0.95, 0.95);
                  },
                ),
                _bottomItem(
                  Icons.select_all_rounded,
                  "9:16",
                  onPress: () {
                    controller.aspectRatio = 9 / 16;
                    controller.crop = Rect.fromLTRB(0.05, 0.05, 0.95, 0.95);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomItem(IconData icon, String title, {required onPress}) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: double.infinity,
        width: 80,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.grey[900],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                title,
                style: TextStyle(color: Colors.grey[900]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
