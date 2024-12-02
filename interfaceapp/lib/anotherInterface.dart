import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'home2.dart';
import 'interface2.dart';
import 'diagnosis_page.dart';
import 'diagnosis2.dart';
import 'ProfilePage.dart';

void main() => runApp(MaterialApp(
      home: nav(user:"phidohphidz@gmail.com"),

  onGenerateRoute: (settings){

    if(settings.name=="homepage"){
      final Map<String,dynamic> args=settings.arguments as Map<String,dynamic>;
      return MaterialPageRoute(builder: (context){
        return nav(
            user: args["name"]
        );
      });
    }

    if(settings.name=="diagnosis"){
      final Map<String,dynamic> args=settings.arguments as Map<String,dynamic>;
      return MaterialPageRoute(builder: (context){
        return DiagnosisScreen(
            details: args
        );
      });
    }

    if(settings.name=="diagnosis2"){
      final Map<String,dynamic> args=settings.arguments as Map<String,dynamic>;
      return MaterialPageRoute(builder: (context){
        return DiagnosisS(
            details: args
        );
      });
    }
  },

  debugShowCheckedModeBanner: false,
));

class nav extends StatefulWidget {
  final String user;
  const nav({required this.user});

  @override
  State<nav> createState() => _navState();
}

class _navState extends State<nav> {

  int current=0;
  late List<Widget> _pages=[
    Inter(user: widget.user),
    HomeScreen(user:widget.user),
    ProfilePage2(user:widget.user)
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[current],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF603FeF),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: current,
        onTap: (index){
          setState(() {
            current=index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera_back_outlined),
            label: 'ImageUpload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),

    );
  }
}

