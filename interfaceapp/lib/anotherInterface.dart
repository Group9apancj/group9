import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'NewInter.dart';

void main() => runApp(MaterialApp(
  home: Inter(),
  debugShowCheckedModeBanner: false,
));

class Inter extends StatefulWidget {
  const Inter({super.key});

  @override
  State<Inter> createState() => _InterState();
}

class _InterState extends State<Inter> {
  int _currentIndex = 0; // Initialize the current index for the BottomNavigationBar

  // Define the onItemTapped method to update the selected tab index
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffafafc),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 50),
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Dermatologia",
                        style: GoogleFonts.roboto(
                          color: Color(0xFF673AB7),
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        )),
                    Row(children: [
                      Text("Hello",
                          style: GoogleFonts.roboto(
                            color: Color(0xff7d5a7a),
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                          )),
                      SizedBox(width: 10),
                      Text("User,",
                          style: GoogleFonts.roboto(
                            color: Color(0xff7d5a7a),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          )),
                    ]),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Container(
                height: 60,
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      height: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/OIP2.jpg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          )),
                    ),
                    Text(
                      "My Medical history",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      softWrap: true,
                    ),
                    Icon(
                      Icons.history,
                      color: Color(0xFF673AB7),
                      size: 25,
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xffdad5fd),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Last diagnosis",
                      style: GoogleFonts.roboto(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 2),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.history_edu,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Eczema",
                                  style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.date_range,
                                        color: Color(0xFF673AB7),
                                        size: 20,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "22/03/2099",
                                        style: GoogleFonts.roboto(
                                          color: Colors.deepPurple,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                        ),
                                      )
                                    ]),
                                Row(children: [
                                  Icon(
                                    Icons.timelapse,
                                    color: Color(0xFF673AB7),
                                    size: 20,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "03:00",
                                    style: GoogleFonts.roboto(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                  )
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(blurRadius: 1, color: Colors.grey)
                          ]),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              ImageCarousel(),
              SizedBox(height: 16),
              News() // Make sure to define the News widget
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.photo_camera_back_outlined),
              label: 'Image Upload',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class ImageCarousel extends StatefulWidget {
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<String> images = [
    'assets/phoda1.jpg',
    'assets/Ws.jpg',
    'assets/lotions.jpg',
    'assets/lotions2.jpg',
  ];

  @override
  void initState() {
    super.initState();
    // Automatic page transition (rotating effect)
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: double.infinity, // 85% of screen width to center and prevent touching borders
        child: PageView.builder(
          controller: _pageController,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20.0), // Rounded corners
              child: Image.asset(
                images[index],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
