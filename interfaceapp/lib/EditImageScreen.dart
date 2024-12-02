// edit_image_screen.dart
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class EditImageScreen extends StatefulWidget {
  final Uint8List imageBytes;

  const EditImageScreen({super.key, required this.imageBytes});

  @override
  _EditImageScreenState createState() => _EditImageScreenState();
}

class _EditImageScreenState extends State<EditImageScreen> {
  double _brightness = 1.0;
  double _contrast = 1.0;
  int _rotationAngle = 0;
  Uint8List? _editedImageBytes;

  @override
  void initState() {
    super.initState();
    _editedImageBytes = widget.imageBytes;
  }

  Future<void> _cropImage() async {
    if (_editedImageBytes == null) return;

    final tempDir = await getTemporaryDirectory();
    final tempPath = '${tempDir.path}/image.jpg';
    final imageFile = File(tempPath)..writeAsBytesSync(_editedImageBytes!);

    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [CropAspectRatioPreset.square],
      uiSettings: [
        const AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.deepPurple,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        const IOSUiSettings(
          title: 'Crop Image',
        ),
      ],
    );

    if (croppedFile != null) {
      final bytes = await croppedFile.readAsBytes();
      setState(() {
        _editedImageBytes = bytes;
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

  void _rotateImage() {
    setState(() {
      _rotationAngle = (_rotationAngle + 90) % 360;
    });
  }

  List<double> _getColorMatrix(double brightness, double contrast) {
    double factor = (259 * (contrast + 255)) / (255 * (259 - contrast));
    double b = brightness - 1;

    return [
      factor, 0, 0, 0, b, // Red
      0, factor, 0, 0, b, // Green
      0, 0, factor, 0, b, // Blue
      0, 0, 0, 1, 0, // Alpha
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Image"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: _editedImageBytes != null
                  ? ColorFiltered(
                colorFilter: ColorFilter.matrix(_getColorMatrix(_brightness, _contrast)),
                child: Transform.rotate(
                  angle: _rotationAngle * 3.14159 / 180,
                  child: Image.memory(
                    _editedImageBytes!,
                    fit: BoxFit.contain,
                  ),
                ),
              )
                  : Container(),
            ),
          ),
          Slider(
            label: "Brightness",
            value: _brightness,
            min: 0.5,
            max: 1.5,
            onChanged: _applyBrightness,
          ),
          Slider(
            label: "Contrast",
            value: _contrast,
            min: 0.5,
            max: 1.5,
            onChanged: _applyContrast,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _cropImage,
                child: const Text("Crop"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: _rotateImage,
                child: const Text("Rotate"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, _editedImageBytes);
                },
                child: const Text("Confirm"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
