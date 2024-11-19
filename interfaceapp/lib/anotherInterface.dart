import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'home2.dart';
import 'interface.dart';

void main() => runApp(MaterialApp(
      home: nav(user:"user"),
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
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[current],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF603FeF),
        unselectedItemColor: const Color(0xff171111),
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
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),

    );
  }
}

