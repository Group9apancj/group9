import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'uploadClass.dart';
<<<<<<< HEAD
=======
import 'dart:convert';
import 'dart:ui' as ui;
>>>>>>> origin/master

void main() => runApp(const MaterialApp(
      home: HomeScreen(user: 'warge'),
      debugShowCheckedModeBanner: false,
    ));

class HomeScreen extends StatefulWidget {
  final String user;
  const HomeScreen({super.key, required this.user});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Upload2 upload = Upload2();

  Uint8List? _imageBytes;

  Future<void> _pickImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
      });
    }
  }

  Future<void> _pickImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      final bytes =
          await pickedFile.readAsBytes(); // Get bytes for web compatibility
      setState(() {
        _imageBytes = bytes;
      });
    }
  }

  Future<void> sendImageToModel() async {
    if (_imageBytes != null) {
      final image = await decodeImageFromList(_imageBytes!);
      print("${image.width} ${image.height}");
      final results = await upload.uploadImage(_imageBytes);
      showAlertDialog3(context, "Do you want to review your results?");
      
      Map<String,dynamic> ham=jsonDecode(results);
      print(ham["predicted"]);
    } else {
      showAlertDialog(context, "please select a photo");
    }
  }

  void showAlertDialog3(BuildContext context, msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Notice"),
          content: Text(msg),
          actions: [
            TextButton(
              child: Text("Archive"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),

            TextButton(
              child: Text("View"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  void showAlertDialog(BuildContext context, msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("warning"),
          content: Text(msg),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF673AB7), Color(0xFF9575CD)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good Morning,${widget.user}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Select image to upload',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _pickImageFromCamera();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF9575CD),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Row(children: [
                    Icon(Icons.camera_alt_outlined),
                    Text('Open Camera'),
                  ]),
                ),
                ElevatedButton(
                  onPressed: () {
                    _pickImageFromGallery();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF9575CD),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Row(children: [
                    Icon(Icons.camera_alt_outlined),
                    Text('Open galley'),
                  ]),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Container to display the selected image or icon
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.all(10.0),
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Center(
                child: _imageBytes != null
                    ? Image.memory(
                        _imageBytes!,
                        fit: BoxFit.cover,
                      )
                    : const Icon(
                        Icons.add_photo_alternate_outlined,
                        color: Colors.deepPurple,
                        size: 50,
                      ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    sendImageToModel();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 4,
                    backgroundColor: const Color(0xFF9575CD),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.upload),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Upload",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                )),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
