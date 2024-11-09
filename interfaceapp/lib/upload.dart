import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'uploadClass.dart';

void main()=>runApp(MaterialApp(
  home: ImageUploadPage(),
));

class ImageUploadPage extends StatefulWidget {
  @override
  _ImageUploadPageState createState() => _ImageUploadPageState();
}

class _ImageUploadPageState extends State<ImageUploadPage> {
  File? _image;
  Upload2 ups=Upload2();
  Future<void> _pickImage() async {

    final _image2=await ups.pickImage();
    setState(() {
      if (_image2 != null) {
        _image = _image2;  // Set the picked image
      } else {
        _showCustomAlertDialog(context);
      }
    });
  }

  Future<void> _uploadImage() async {
    if (_image != null) {
      final zobwela =await ups.uploadImage(_image);
      print(zobwela);
    }else{
      print("No image selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image to Server'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image!= null
                ? Image.file(_image!)
                : Text('No image selected.'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image from Gallery'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadImage,
              child: Text('Upload Image'),
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
        title: Text('Warning'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.warning,color: Colors.yellow,size:40), // Add an image
            SizedBox(height: 10),
            Text('Image is not selected'),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      );
    },
  );
}
