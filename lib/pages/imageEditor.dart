import 'dart:io'; // Add this import for File class
import 'package:Xillica/providers/image_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Consumes the custom image provider --CustomImageProvider--
class CustomImageEditor extends StatefulWidget {
  const CustomImageEditor({Key? key}) : super(key: key);

  @override
  State<CustomImageEditor> createState() => _CustomImageEditorState();
}

class _CustomImageEditorState extends State<CustomImageEditor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Image Editor'),
        actions: [
          TextButton(
            onPressed: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.save_alt),
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
                      return Image.memory(
                        value.currentImage!,
                        width: double.infinity,
                        fit: BoxFit.cover,
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
              children: [
                _bottomItem(
                  Icons.crop_rotate,
                  "Crop",
                  onPress: () {
                    Navigator.of(context).pushNamed('/crop');
                  },
                ),
                // _bottomItem(
                //   Icons.select_all_rounded,
                //   "Resize",
                //   onPress: null,
                // ),
                _bottomItem(
                  Icons.flip,
                  "Flip",
                  onPress: null,
                ),
                _bottomItem(
                  Icons.color_lens_outlined,
                  "Color",
                  onPress: null,
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
        width: 90,
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
