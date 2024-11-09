import "package:flutter/material.dart";
import "NewInter.dart";
import 'upload.dart';
import 'login.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        'homepage': (context) => Home(),
        '/upload': (context) => ImageUploadPage()
      },
    ));
