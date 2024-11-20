import "package:flutter/material.dart";
import 'login.dart';
import 'Register.dart';
import 'anotherInterface.dart';
import 'diagnosis_page.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        'register':(context)=>const Register(),
      },
  onGenerateRoute: (settings){
        if(settings.name=="homepage"){
          final Map<String,dynamic> args=settings.arguments as Map<String,dynamic>;
          return MaterialPageRoute(builder: (context){
            return nav(
              user: args["name"]
            );
          });
        }
<<<<<<< HEAD
        return null;
=======

        if(settings.name=="diagnosis"){
          final Map<String,dynamic> args=settings.arguments as Map<String,dynamic>;
          return MaterialPageRoute(builder: (context){
            return (
                detail: args["name"]
            );
          });
        }
>>>>>>> origin/master
  },
  debugShowCheckedModeBanner: false,
    ));
