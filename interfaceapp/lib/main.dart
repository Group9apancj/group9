import "package:flutter/material.dart";
import "NewInter.dart";
import 'upload.dart';
void main()=>runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/':(context)=>Home(),
    '/upload':(context)=>ImageUploadPage()
  },
));