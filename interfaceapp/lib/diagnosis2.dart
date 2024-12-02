import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'results.dart'; // Ensure this file contains ResultsPage with the required parameter
import 'models/skin_condition.dart';
import 'condition_details_page.dart'; // Ensure this file contains ConditionDetailsPage with required parameter

void main() => runApp(MaterialApp(
      home: DiagnosisS(details: {"Haalla":"Man"},),
    ));

class DiagnosisS extends StatefulWidget {
  final Map<String,dynamic> details;
  const DiagnosisS({required this.details});

  @override
  State<DiagnosisS> createState() => _DiagnosisSState();
}

class _DiagnosisSState extends State<DiagnosisS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios,size: 30,color: Colors.white,)),
        title: const Text(
          'Other possible conditions!',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:SafeArea(
        child: Column(children: [
          OtherDs(results: widget.details)
        ]),
      ),
      ),
    );
  }
}

class OtherDs extends StatefulWidget {
  final Map<String,dynamic> results;
  const OtherDs({required this.results});

  @override
  State<OtherDs> createState() => _OtherDsState();
}

class _OtherDsState extends State<OtherDs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: widget.results.entries.map((entry){
          return Column(children: [
            Container(
              padding: EdgeInsets.all(5),
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(entry.key,
                        style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(entry.value.toString()+"%",
                        style: GoogleFonts.roboto(
                          color: Color(0xFF673AB7),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text("description",
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.roboto(
                            color: Colors.black45,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      TextButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultsPage(
                                  detectedCondition: entry.key
                              ),
                            ),
                          );

                        },
                        child: Row(children: [
                          Text("Read more",
                            style: GoogleFonts.roboto(
                                color: Color(0xFF673AB7),
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.arrow_forward_sharp)
                        ]
                        ),

                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.only(left: 5),
                        ),
                      )
                    ],
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1,
                    )
                  ]
              ),
            ),

            SizedBox(height: 20)
          ]
          );
        }).toList(),
      ),
    );
  }
}

class Ups extends StatefulWidget {
  const Ups({super.key});

  @override
  State<Ups> createState() => _UpsState();
}

class _UpsState extends State<Ups> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Heighest diagnosis results",
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Acne",
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("89%",
                  style: GoogleFonts.roboto(
                    color: Color(0xFF673AB7),
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                ElevatedButton(
                  onPressed: (){},
                  child: Row(children: [
                    Text("Read more",
                      style: GoogleFonts.roboto(
                          color: Color(0xFF673AB7),
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward_sharp)
                  ]
                  ),

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.all(5),
                  ),
                )
              ]
          )
        ],
      ),
      decoration: BoxDecoration(
        color:  Color(0xff603FeF),
        image: DecorationImage(
            image: AssetImage("assets/Ws.jpg"),
            fit: BoxFit.cover,
            opacity: 0.8
        ),

      ),
    );
  }
}

class TheOther extends StatefulWidget {
  const TheOther({super.key});

  @override
  State<TheOther> createState() => _TheOtherState();
}

class _TheOtherState extends State<TheOther> {
  Map<String,dynamic>dis={};
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: EdgeInsets.all(5),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(dis["name"],
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(dis["percentage"],
                  style: GoogleFonts.roboto(
                    color: Color(0xFF673AB7),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(dis["description"],
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.roboto(
                      color: Colors.black45,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                TextButton(
                  onPressed: (){},
                  child: Row(children: [
                    Text("Read more",
                      style: GoogleFonts.roboto(
                          color: Color(0xFF673AB7),
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward_sharp)
                  ]
                  ),

                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.only(left: 5),
                  ),
                )
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 1,
              )
            ]
        ),
      ),

      SizedBox(height: 20)
    ]
    )
    ;
  }
}
