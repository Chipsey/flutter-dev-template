import 'dart:io'; // Add this import for File class
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends StatefulWidget {
  const CustomImagePicker({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Image Picker'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              MaterialButton(
                color: Colors.green[600],
                child: const Text(
                  "Pick Image From Gallery",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _pickImageFromGallery();
                },
              ),
              MaterialButton(
                color: Colors.blue[600],
                child: const Text(
                  "Pick Image From Camera",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _pickImageFromCamera();
                },
              ),
              SizedBox(height: 20),
              _selectedImage != null
                  ? Column(
                      children: [
                        Image.file(
                          _selectedImage!,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  Future _pickImageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }
}
