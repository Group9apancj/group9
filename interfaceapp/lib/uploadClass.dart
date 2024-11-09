import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class Upload2 {
  final ImagePicker _picker = ImagePicker();
  final String apiUrl = 'http://192.168.1.125:5000/upload_image';

  Future<File?> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    return pickedFile != null ? File(pickedFile.path) : null;
  }

  Future<String> uploadImage(File? image) async {
    if (image == null) {
      return "There is no image to upload.";
    }
    try {
      List<int> imageBytes = await image.readAsBytes();
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"content-type": "application/octet-stream"},
        body: imageBytes,
      );

      if (response.statusCode == 200) {
        print("Image upload successful, wait for analysis and results");
        return "Image upload successful";
      } else {
        print("Failed to upload image: ${response.statusCode}");
        return "Can't upload image, try connecting to the server";
      }
    } catch (e) {
      print("Error: $e");
      return "Error connecting to the server.";
    }
  }
}
