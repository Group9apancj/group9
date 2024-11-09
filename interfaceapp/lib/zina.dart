import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
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
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color(0xffebeff2),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  "assets/logo.jpg",
                  width: 50,
                  height: 50,
                )),
            Text(
              "Group 9",
              style: GoogleFonts.roboto(
                  color: Color(0xff65025c),
                  fontSize: 20,
                  fontWeight: FontWeight.w900),
            ),
            Column(children: [
              Text(
                "05:30",
                style: GoogleFonts.roboto(
                    color: Color(0xff180018),
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
              Text(
                "07/10/2024",
                style: GoogleFonts.roboto(
                    color: Color(0xff180018),
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
            ]),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            infos(),
          ],
        ),
      ),
    );
  }
}

class infos extends StatefulWidget {
  const infos({super.key});

  @override
  State<infos> createState() => _infosState();
}

class _infosState extends State<infos> {
  List<List<String>> disease = [
    ["Eczema", "Acne"],
    ["Casinoma", "Kerastosis"],
    ["Millia","Shingles"]
  ];
  List<String> images = [
    "https://th.bing.com/th/id/R.f68864f864175c368e2d9b1c0bcbe2e5?rik=UoHeXpk1TGlhdA&riu=http%3a%2f%2fhealtharticlesmagazine.com%2fwp-content%2fuploads%2f2017%2f10%2fSkin-disease.jpg&ehk=XOfSqXmovN74PjXA%2bOgc3NSdFwE6m6tZDq8FPaPto%2bY%3d&risl=&pid=ImgRaw&r=0",
    "https://th.bing.com/th/id/OIP.utfuIevHURJIUR7Li8AhjwHaGB?rs=1&pid=ImgDetMain",
    "https://healthy-food-near-me.com/wp-content/uploads/2022/09/skin-diseases-what-do-you-need-to-know-about-them-920x425.jpg",
    "https://th.bing.com/th/id/OIP.XLdNKKt_Cg85vR2uo6AYyQHaFj?rs=1&pid=ImgDetMain",
    "https://th.bing.com/th/id/OIP.iSSUaC3c24jGqXtaNEYHhAHaE4?rs=1&pid=ImgDetMain",
    "https://th.bing.com/th/id/OIP.FFNs6NfGFInus2CStZ5XeAHaM9?w=975&h=1706&rs=1&pid=ImgDetMain",
    "https://preview.redd.it/texture-on-skin-v0-jvq4yv8ipx7d1.jpg?width=640&crop=smart&auto=webp&s=78ec3bf4db2d77c6f718ac5ea00e9c7b721e9d7d"
  ];

  var rand=Random();

  String Image2="https://th.bing.com/th/id/OIP.utfuIevHURJIUR7Li8AhjwHaGB?rs=1&pid=ImgDetMain";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Text(
                    "Hello, ",
                    style: GoogleFonts.roboto(
                        color: Color(0xff0d0e11), fontSize: 20),
                  ),
                  Text(
                    "User!",
                    style: GoogleFonts.roboto(
                        color: Color(0xff8b4cf7),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.upload,
                        color: Color(0xffe2f7ff),
                        size: 20,
                      ),
                      style: IconButton.styleFrom(
                          backgroundColor: Color(0xff61156d)),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.history,
                        color: Color(0xffe2f7ff),
                        size: 20,
                      ),
                      style: IconButton.styleFrom(
                          backgroundColor: Color(0xff180018)),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.person,
                        color: Color(0xffe2f7ff),
                        size: 20,
                      ),
                      style: IconButton.styleFrom(
                          backgroundColor: Color(0xff071226)),
                    ),
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(color: Color(0xffebeff2)),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Icon(
                            Icons.lightbulb,
                            size: 30,
                            color: Color(0xff2493c5),
                          ),
                          Text(
                            "For Knowledge!",
                            style: GoogleFonts.roboto(
                                color: Color(0xff20052d),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Click!",
                                style: GoogleFonts.roboto(
                                    color: Color(0xff209848),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 2),
                              Text(
                                "Condition below",
                                style: GoogleFonts.roboto(
                                    color: Color(0xff094790),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                      ]),
                ),
                SizedBox(height: 5),
                for (var dis in disease) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var txt in dis) ...[
                        Expanded(
                          child: Container(
                            height: 100,
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "$txt",
                                          style: GoogleFonts.roboto(
                                              color: Color(0xffeb03fd),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "20 Diagnosis",
                                          style: GoogleFonts.roboto(
                                              color: Color(0xff540c53),
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        Container(
                                          height: 10,
                                          width: 95,
                                          decoration: BoxDecoration(
                                            color: Color(0xff3668a4),
                                            borderRadius:
                                            BorderRadius.circular(20),
                                          ),
                                        )
                                      ],
                                    )),
                                Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.network(
                                      images[rand.nextInt(6)],
                                      width: 85,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color(0xffab007d),
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Color(0xffab007d),
                                              width: 5)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0xff540c53),
                                            blurRadius: 0.5)
                                      ]),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 0.5,
                                      offset: Offset(0, 0))
                                ],
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                        dis.indexOf(txt) < 1
                            ? SizedBox(width: 20)
                            : SizedBox(width: 0),
                      ],
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ],
            ),
            decoration: BoxDecoration(color: Color(0xffebeff2)),
          ),
        ],
      ),
    );
  }
}
