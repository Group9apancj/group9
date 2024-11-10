import "package:flutter/material.dart";
import "NewInter.dart";
import 'upload.dart';
import 'login.dart';
import 'Register.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        'register':(context)=>Register(),
        'homepage': (context) => Home(),
        '/upload': (context) => ImageUploadPage()
      },
    ));
