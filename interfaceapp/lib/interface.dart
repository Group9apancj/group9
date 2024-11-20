import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:typed_data';
import 'uploadClass.dart';
<<<<<<< HEAD
<<<<<<< HEAD
=======
import 'dart:convert';
import 'dart:ui' as ui;
>>>>>>> origin/master

void main() => runApp(const MaterialApp(
      home: HomeScreen(user: 'warge'),
=======
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'EditImageScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
>>>>>>> d9fc0dfb46a38b6783a0c865ac673059ed7e1300
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
<<<<<<< HEAD
  final String user;
  const HomeScreen({super.key, required this.user});
=======
>>>>>>> d9fc0dfb46a38b6783a0c865ac673059ed7e1300
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Upload2 upload = Upload2();
  Uint8List? _imageBytes;
  double _brightness = 1.0;
  double _contrast = 1.0;
  bool _isEditing = false;
  int _rotationAngle = 0;

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

    // Save the Uint8List image as a temporary file
    final tempDir = await getTemporaryDirectory();
    final tempPath = '${tempDir.path}/image.jpg';
    final imageFile = File(tempPath)..writeAsBytesSync(_imageBytes!);

    // Crop the image using ImageCropper
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ],
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
      ],
    );

    if (croppedFile != null) {
      final bytes = await croppedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
      });
    }
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

  void _resetFilters() {
    setState(() {
      _brightness = 1.0;
      _contrast = 1.0;
      _rotationAngle = 0;
    });
  }

  void _rotateImage() {
    setState(() {
      _rotationAngle = (_rotationAngle + 90) % 360;
    });
  }

  Future<void> sendImageToModel() async {
    if (_imageBytes != null) {
<<<<<<< HEAD
      final image = await decodeImageFromList(_imageBytes!);
      print("${image.width} ${image.height}");
=======
>>>>>>> d9fc0dfb46a38b6783a0c865ac673059ed7e1300
      final results = await upload.uploadImage(_imageBytes);
      print(results);
    } else {
      print("Select photo");
    }
  }

  int _currentIndex = 1;

<<<<<<< HEAD
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
=======
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
>>>>>>> d9fc0dfb46a38b6783a0c865ac673059ed7e1300
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
<<<<<<< HEAD
              width: double.infinity,
              decoration: const BoxDecoration(
=======
              decoration: BoxDecoration(
>>>>>>> d9fc0dfb46a38b6783a0c865ac673059ed7e1300
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
<<<<<<< HEAD
                      'Good Morning,${widget.user}',
                      style: const TextStyle(
                        fontSize: 24,
=======
                      'Dermatologia',
                      style: TextStyle(
                        fontSize: 28,
>>>>>>> d9fc0dfb46a38b6783a0c865ac673059ed7e1300
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
<<<<<<< HEAD
                    const SizedBox(height: 20),
                    const Text(
=======
                    SizedBox(height: 5),
                    Text(
                      'How are you today?',
                      style: TextStyle(fontSize: 16, color: Colors.white),
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
>>>>>>> d9fc0dfb46a38b6783a0c865ac673059ed7e1300
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
<<<<<<< HEAD
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
=======
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
>>>>>>> d9fc0dfb46a38b6783a0c865ac673059ed7e1300
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
              child: InkWell(
                onTap: () async {
                  if (_imageBytes != null) {
                    // Navigate to the EditImageScreen and wait for the result
                    final editedImage = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditImageScreen(imageBytes: _imageBytes!),
                      ),
                    );

                    // Update the image if editedImage is returned
                    if (editedImage != null && editedImage is Uint8List) {
                      setState(() {
                        _imageBytes = editedImage;
                      });
                    }
                  }
                },
                child: Center(
                  child: _imageBytes != null
                      ? ColorFiltered(
                    colorFilter: ColorFilter.matrix(
                      _getColorMatrix(_brightness, _contrast),
                    ),
                    child: Transform.rotate(
                      angle: _rotationAngle * 3.14159 / 180,
                      child: Image.memory(
                        _imageBytes!,
                        fit: BoxFit.cover,
<<<<<<< HEAD
                      )
                    : const Icon(
                        Icons.add_photo_alternate_outlined,
                        color: Colors.deepPurple,
                        size: 50,
=======
>>>>>>> d9fc0dfb46a38b6783a0c865ac673059ed7e1300
                      ),
                    ),
                  )
                      : Icon(
                    Icons.add_photo_alternate_outlined,
                    color: Colors.deepPurple,
                    size: 50,
                  ),
                ),
              ),

            ),
<<<<<<< HEAD
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
=======
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
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 4,
                  backgroundColor: Color(0xFF9575CD),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
>>>>>>> d9fc0dfb46a38b6783a0c865ac673059ed7e1300
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

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          iconSize: 40,
          onPressed: onTap,
          color: Colors.deepPurple,
        ),
        Text(label, style: TextStyle(fontSize: 16)),
      ],
    );
  }

  List<double> _getColorMatrix(double brightness, double contrast) {
    double factor = (259 * (contrast + 255)) / (255 * (259 - contrast));
    double b = brightness - 1;

    return [
      factor, 0, 0, 0, b,
      0, factor, 0, 0, b,
      0, 0, factor, 0, b,
      0, 0, 0, 1, 0,
    ];
  }
}
