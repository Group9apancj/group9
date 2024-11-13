import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

void main() => runApp(const MaterialApp(
      home: Inter(),
    ));

class Inter extends StatefulWidget {
  const Inter({super.key});

  @override
  State<Inter> createState() => _InterState();
}

class _InterState extends State<Inter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafafc),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Dematologia",
                      style: GoogleFonts.roboto(
                        color: const Color(0xFF673AB7),
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 30,
                      )),
                  Row(children: [
                    Text("Hello",
                        style: GoogleFonts.roboto(
                          color: const Color(0xff7d5a7a),
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        )),
                    const SizedBox(width: 10),
                    Text("User,",
                        style: GoogleFonts.roboto(
                          color: const Color(0xff7d5a7a),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )),
                  ]),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              height: 100,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xffdad5fd),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
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
                      color: const Color(0xff7d5a7a),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    softWrap: true,
                  ),
                  const Icon(
                    Icons.history,
                    color: Color(0xFF673AB7),
                    size: 40,
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Last diagnosis",
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 0),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(blurRadius: 1, color: Colors.grey)
                        ]),
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.history_edu,
                                color: Color(0xFF673AB7),
                                size: 30,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "Eczma",
                                style: GoogleFonts.roboto(
                                  color: const Color(0xFF673AB7),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                              const Icon(
                                Icons.date_range,
                                color: Colors.black,
                                size: 30,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "22/03/2099",
                                style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
                              )
                          ]),

                              Row(children: [
                                const Icon(
                                  Icons.timelapse,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "03:00",
                                  style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                  ),
                                )
                              ]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            const ImageCarousel()
          ],
        ),
      ),
    );
  }
}

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

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
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
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
      child: SizedBox(
        height: 200, // Adjust the height as needed
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
