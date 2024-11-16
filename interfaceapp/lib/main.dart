import "package:flutter/material.dart";
import "NewInter.dart";
import 'upload.dart';
import 'login.dart';
import 'Register.dart';
import 'anotherInterface.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        'register':(context)=>const Register(),
        //'homepage': (context) => const Inter(),
        '/upload': (context) => const ImageUploadPage()
      },
  onGenerateRoute: (settings){
        if(settings.name=="homepage"){
          final Map<String,dynamic> args=settings.arguments as Map<String,dynamic>;
          return MaterialPageRoute(builder: (context){
            return Inter(
              user: args["name"]
            );
          });
        }
  },
  debugShowCheckedModeBanner: false,
    ));
