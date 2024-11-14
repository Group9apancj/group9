import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:photo_view/photo_view.dart';
import 'dart:typed_data';
import 'uploadClass.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Upload2 upload = Upload2();
  Uint8List? _imageBytes;
  double _brightness = 1.0;
  double _contrast = 1.0;
  bool _isEditing = false;

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
        _resetFilters();
      });
    }
  }

  Future<void> _pickImageFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
        _resetFilters();
      });
    }
  }

  Future<void> _cropImage() async {
    if (_imageBytes == null) return;

    // Get temporary directory path
    final tempDir = await getTemporaryDirectory();
    final tempPath = '${tempDir.path}/image.jpg';

    // Save the image as a file
    final imageFile = File(tempPath)..writeAsBytesSync(_imageBytes!);

    // Crop the image using the file path
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [CropAspectRatioPreset.square],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.deepPurple,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Crop Image',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );

    if (croppedFile != null) {
      final bytes = await croppedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
      });
    }
  }



  Future<void> _rotateImage() async {
    if (_imageBytes == null) return;
    // Rotation logic, e.g., 90 degrees clockwise, can be implemented using the Transform widget
    setState(() {
      _imageBytes = _imageBytes; // Placeholder for the actual rotation logic
    });
  }

  Future<void> sendImageToModel() async {
    if (_imageBytes != null) {
      final results = await upload.uploadImage(_imageBytes);
      print(results);
    } else {
      print("Select photo");
    }
  }

  void _resetFilters() {
    setState(() {
      _brightness = 1.0;
      _contrast = 1.0;
    });
  }

  void _applyBrightness(double value) {
    setState(() {
      _brightness = value;
    });
  }

  void _applyContrast(double value) {
    setState(() {
      _contrast = value;
    });
  }

  int _currentIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
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
              padding: EdgeInsets.all(16),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good Morning, X',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'How are you today?',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search skin disease...',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildActionButton(
                  icon: Icons.camera_alt_outlined,
                  label: 'Open Camera',
                  onTap: _pickImageFromCamera,
                ),
                SizedBox(width: 90),
                _buildActionButton(
                  icon: Icons.photo_camera_back_outlined,
                  label: 'Open Gallery',
                  onTap: _pickImageFromGallery,
                ),
              ],
            ),
            SizedBox(height: 20),
            // Container to display the selected image or icon
            Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(10.0),
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
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Center(
                child: _imageBytes != null
                    ? Image.memory(
                  _imageBytes!,
                  fit: BoxFit.cover,
                )
                    : Icon(
                  Icons.add_photo_alternate_outlined,
                  color: Colors.deepPurple,
                  size: 50,
                ),
              ),
            ),
            SizedBox(height: 10),
            _isEditing
                ? Column(
              children: [
                Text("Brightness"),
                Slider(
                  value: _brightness,
                  min: 0.5,
                  max: 1.5,
                  onChanged: _applyBrightness,
                ),
                Text("Contrast"),
                Slider(
                  value: _contrast,
                  min: 0.5,
                  max: 1.5,
                  onChanged: _applyContrast,
                ),
                ElevatedButton(
                  onPressed: _cropImage,
                  child: Text("Crop Image"),
                ),
                ElevatedButton(
                  onPressed: _rotateImage,
                  child: Text("Rotate Image"),
                ),
              ],
            )
                : Container(),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: 150,
              child: ElevatedButton(
                onPressed: sendImageToModel,
                child: Row(
                  children: [
                    Icon(Icons.upload),
                    SizedBox(width: 5),
                    Text(
                      "Upload",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 4,
                  backgroundColor: Color(0xFF9575CD),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.photo_camera_back_outlined),
              label: 'Image Upload',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
      {required IconData icon, required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 35, color: Colors.deepPurple),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(fontSize: 16, color: Colors.deepPurple),
          ),
        ],
      ),
    );
  }
}
