import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

class Upload2 {
  final ImagePicker _picker = ImagePicker();
  final String apiUrl = 'http://192.168.1.125:5000/upload_image';

  Future<File?> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    return pickedFile != null ? File(pickedFile.path) : null;
  }

  Future<String> uploadImage(Uint8List? image) async {
    if (image == null) {
      return "There is no image to upload.";
    }
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"content-type": "application/octet-stream"},
        body: image,
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        return response.statusCode.toString();
      }
    } catch (e) {
      print("Error: $e");
      return "Error connecting to the server.";
    }
  }
}
