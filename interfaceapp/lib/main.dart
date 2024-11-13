import "package:flutter/material.dart";
import "NewInter.dart";
import 'upload.dart';
import 'login.dart';
import 'Register.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        'register':(context)=>const Register(),
        'homepage': (context) => const Home(),
        '/upload': (context) => const ImageUploadPage()
      },
    ));
