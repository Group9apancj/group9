import 'dart:io';
import 'package:flutter/material.dart';
import 'uploadClass.dart';


void main()=>runApp(const MaterialApp(
  home: ImageUploadPage(),
));

class ImageUploadPage extends StatefulWidget {
  const ImageUploadPage({super.key});

  @override
  _ImageUploadPageState createState() => _ImageUploadPageState();
}

class _ImageUploadPageState extends State<ImageUploadPage> {
  File? _image;
  Upload2 ups=Upload2();
  Future<void> _pickImage() async {

    final image2=await ups.pickImage();
    setState(() {
      if (image2 != null) {
        _image = image2;  // Set the picked image
      } else {
        _showCustomAlertDialog(context);
      }
    });
  }

  Future<void> _uploadImage() async {
    if (_image != null) {
      //final zobwela =await ups.uploadImage(_image);
      //print(zobwela);
    }else{
      print("No image selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Image to Server'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image!= null
                ? Image.file(_image!)
                : const Text('No image selected.'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Pick Image from Gallery'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadImage,
              child: const Text('Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}


void _showCustomAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Warning'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.warning,color: Colors.yellow,size:40), // Add an image
            SizedBox(height: 10),
            Text('Image is not selected'),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      );
    },
  );
}
