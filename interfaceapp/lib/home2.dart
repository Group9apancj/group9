import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

void main()=>runApp(const MaterialApp(
  home: Inter(user: "Halaa"),
));

class Inter extends StatefulWidget {
  final String user;
  const Inter({super.key, required this.user});

  @override
  State<Inter> createState() => _InterState();
}

class _InterState extends State<Inter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                AppBar2(user:widget.user),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(10),
                child: SizedBox(
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
                      const SizedBox(height: 2),
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
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  const SizedBox(width: 10),
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
                            const SizedBox(height: 10),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.date_range,
                                          color: Color(0xFF673AB7),
                                          size: 20,
                                        ),
                                        const SizedBox(width: 5),
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
                                    const Icon(
                                      Icons.timelapse,
                                      color: Color(0xFF673AB7),
                                      size: 20,
                                    ),
                                    const SizedBox(width: 5),
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
                      )
                    ],
                  ),
                ),
                ),
                const SizedBox(height: 140),
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: const BoxDecoration(
                  image:DecorationImage(
                    image: AssetImage("assets/wap.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                ),
                //ImageCarousel(),
                const SizedBox(height: 16),
                //News()
              ],
            ),
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
        height: 200,
        width: double
            .infinity, // 85% of screen width to center and prevent touching borders
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


class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  Map<String, int> diseases = {
    "Eczema": 20,
    "Acne": 50,
    "Keratosis": 80,
    "Keratosisg": 80,
    "Keratosisf": 80,
    "Keratosiws": 80,
    "Keratosiwst": 80,
    "Keratosiwss": 80,
    "Keratosiwsg": 80,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.450,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Color(0xFF673AB7),
                blurRadius: 1
            )
          ]
      ),
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: diseases.entries.map((entry) {
              return Container(
                padding: const EdgeInsets.all(5),
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  entry.key,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      entry.value.toString(),
                                      style: const TextStyle(
                                        color: Color(0xfff65364),
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    const Text(
                                      'Diagnosis',
                                      style: TextStyle(
                                        color: Color(0xff181d3d),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Recentry",
                                  style: TextStyle(
                                    color: Color(0xff6e59f1),
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "07/12/2099",
                                  style: TextStyle(
                                    color: Color(0xff191c3d),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class AppBar2 extends StatefulWidget { // Fix class name
  final String user;
  const AppBar2({super.key, required this.user});

  @override
  State<AppBar2> createState() => _AppBar2State();
}


class _AppBar2State extends State<AppBar2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF673AB7), Color(0xFF9575CD)],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Dermatologia',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Row(children: [
            const Text(
              'Hello',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
              const SizedBox(width: 5),
              Text(
                widget.user,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              ]),
            ]),
            const SizedBox(height: 20),
            Container(
              height: 60,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 50,
                    decoration: BoxDecoration(
                      // image: DecorationImage(
                      //   image: AssetImage("assets/OIP2.jpg"),
                      // fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.black45,
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
                  const Icon(
                    Icons.history,
                    color: Color(0xFF673AB7),
                    size: 25,
                  )
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}

class AppBar1 extends StatefulWidget {
  const AppBar1({super.key});

  @override
  State<AppBar1> createState() => _AppBar1State();
}

class _AppBar1State extends State<AppBar1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Dermatologia",
                  style: GoogleFonts.roboto(
                    color: const Color(0xFF673AB7),
                    fontWeight: FontWeight.bold,
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
                Text('user,',
                    style: GoogleFonts.roboto(
                      color: const Color(0xff7d5a7a),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
              ]),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 60,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xffdad5fd),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 50,
                decoration: BoxDecoration(
                  // image: DecorationImage(
                  //   image: AssetImage("assets/OIP2.jpg"),
                  // fit: BoxFit.cover),
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
              const Icon(
                Icons.history,
                color: Color(0xFF673AB7),
                size: 25,
              )
            ],
          ),
        ),
      ],
    );
  }
}
