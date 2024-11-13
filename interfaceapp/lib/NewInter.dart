import 'package:flutter/material.dart';
import 'dart:math';

import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xffffffff),
          Color(0xffffffff),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Color(0xff715cf8),
                 /* image: DecorationImage(
                      image: AssetImage("assets/phoda1.jpg"),
                      opacity: 0.1,
                      fit: BoxFit.cover),*/
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Hello",
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "User,",
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        size: 40,
                      ),
                      style: IconButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                    )
                  ],
                ),

                    const buttons(),
              ]),
            ),
            const SizedBox(height: 10),
            Container(
                child: const Column(
              children: [wigs(), SizedBox(height: 10), News()],
            )),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/upload');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff715cf8),
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xff1b91bf)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.upload),
                      Text("Upload"),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff715cf8),
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xff1b91bf)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.more),
                      SizedBox(width: 5),
                      Text("More info!"),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class TimeMachine extends StatefulWidget {
  const TimeMachine({super.key});

  @override
  _TimeMachineState createState() => _TimeMachineState();
}

class _TimeMachineState extends State<TimeMachine>
    with TickerProviderStateMixin {
  late final AnimationController _galaxyAnimation;

  @override
  void initState() {
    super.initState();
    _galaxyAnimation = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _galaxyAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _galaxyAnimation,
      child: CircularContainerLayout(
        containerCount: 8,
        radius: 100,
        animationValue: _galaxyAnimation.value, // Pass the animation value
      ),
    );
  }
}

class CircularContainerLayout extends StatelessWidget {
  final int containerCount;
  final double radius;
  final double animationValue;

  const CircularContainerLayout(
      {super.key, required this.containerCount,
      required this.radius,
      required this.animationValue});

  bool _isAtTop(double angle) {
    const double topThreshold = pi / 6; // Adjust threshold as necessary
    return (angle <= topThreshold || angle >= (2 * pi - topThreshold));
  }

  @override
  Widget build(BuildContext context) {
    List<String> colors = ["0xff2a0f3c", "0xffab007d", "0xffab007d"];
    Random rand = Random();
    return Stack(
      alignment: Alignment.center,
      children: List.generate(containerCount, (index) {
        final double angle = (index / containerCount) * 2 * pi +
            (animationValue * 2 * pi); // Update angle based on animation
        final double x = radius * cos(angle);
        final double y = radius * sin(angle);
        final bool atTop = _isAtTop(angle);

        return Transform.translate(
          offset: Offset(x, y),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: const Color(0xff1b91bf),
                shape: BoxShape.circle,
                //border: Border.all(color: Colors.white, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xffd84d63).withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ]),
            alignment: Alignment.center,
            child: const Text(
              "Eczema",
              style: TextStyle(
                color: Color(0xfff1f2f2),
                fontSize: 20,
              ),
            ),
          ),
        );
      }),
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
      margin: const EdgeInsets.only(left: 10,right: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        image: const DecorationImage(
            image: NetworkImage("https://th.bing.com/th/id/R.6bf1a6dd6cd70a4c3e22c85d389bf7f9?rik=FTrQ%2b3h5b5JZyA&riu=http%3a%2f%2fwww.organicbeautyblogger.com%2fwp-content%2fuploads%2f2018%2f11%2fHerbivore-Hydrate-and-Glow-Organic-Skincare.jpg&ehk=L1FlkIAHs1nl2rvGxAB02SfL%2fWGLhG5eBHAX0jByc5w%3d&risl=&pid=ImgRaw&r=0"),
          fit: BoxFit.cover,
          opacity: 0.1
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5
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

class wigs extends StatefulWidget {
  const wigs({super.key});

  @override
  State<wigs> createState() => _wigsState();
}

class _wigsState extends State<wigs> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: const Color(0xfffe8f2b),
                      /*image: DecorationImage(
                          image: AssetImage("assets/lotions.jpg"),
                          opacity: 0.5,
                          fit: BoxFit.cover),*/
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: Container(
                  height: 200,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                   /* image: DecorationImage(
                        image: AssetImage("assets/lotions2.jpg"),
                        opacity: 0.5,
                        fit: BoxFit.cover),*/
                    color: const Color(0xfff45262),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "SkinCare",
                            style: GoogleFonts.roboto(
                              color: const Color(0xffffffff),
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          IconButton(onPressed: (){},
                          icon: const FaIcon(
                              FontAwesomeIcons.hospital,
                            size: 30,
                            color: Color(0xff171c3c),
                          ),
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.white,
                            )
                          ),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          ],
        ));
  }
}

class buttons extends StatefulWidget {
  const buttons({super.key});

  @override
  State<buttons> createState() => _buttonsState();
}

class _buttonsState extends State<buttons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff6e59f1),
                foregroundColor: Colors.white,
                side: const BorderSide(color: Color(0xff1b91bf)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                )),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.home_filled),
                Text("Home"),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff6e59f1),
                foregroundColor: Colors.white,
                side: const BorderSide(color: Color(0xff1b91bf)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                )),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.person),
                Text("Profile"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
