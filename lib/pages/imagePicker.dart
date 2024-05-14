import 'dart:io'; // Add this import for File class
import 'package:Xillica/components/loading_screen.dart';
import 'package:Xillica/pages/imageEditor.dart';
import 'package:Xillica/providers/image_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CustomImagePicker extends StatefulWidget {
  const CustomImagePicker({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  File? _selectedImage;
  late CustomImageProvider imageProvider;

  bool isDataLoading = false;

  @override
  void initState() {
    isDataLoading = true;
    imageProvider = Provider.of<CustomImageProvider>(context, listen: false);
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
                  isDataLoading = true;
                  _pickImageFromGallery();
                  isDataLoading = false;
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
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/image_editor');
                          },
                          child: Text(
                            'Edit',
                            style: TextStyle(color: Colors.white),
                          ),
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

  Future<void> _pickImageFromGallery() async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final File imageFile = File(pickedImage.path);

      setState(() {
        _selectedImage = imageFile;
      });

      imageProvider.changeImageFile(imageFile);
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

  // Future<void> _openImageEditorPage() async {
  //   if (_selectedImage != null) {
  //     await Navigator.of(context).push(
  //       MaterialPageRoute(
  //         builder: (context) =>
  //             CustomImageEditor(selectedImage: _selectedImage!),
  //       ),
  //     );
  //   }
  // }
}
