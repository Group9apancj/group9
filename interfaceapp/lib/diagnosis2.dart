import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'results.dart'; // Ensure this file contains ResultsPage with the required parameter
import 'models/skin_condition.dart';
import 'condition_details_page.dart'; // Ensure this file contains ConditionDetailsPage with required parameter

void main() => runApp(MaterialApp(
      home: DiagnosisScreen(),
    ));

class DiagnosisScreen extends StatelessWidget {
  const DiagnosisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffdfd9fc),
        title: const Text(
          'Diagnosis results',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:SafeArea(
        child: Column(children: [
          Container(
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
          ),
          SizedBox(height: 20),

        Text("Other possible conditions!",
            style: GoogleFonts.roboto(
                color: Colors.black45,
                fontWeight: FontWeight.bold,
                fontSize: 16
            ),
        ),
          OtherDs()
        ]),
      ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF603FeF),
        unselectedItemColor: const Color(0xff171111),
        showUnselectedLabels: true,
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

class OtherDs extends StatefulWidget {
  const OtherDs({super.key});

  @override
  State<OtherDs> createState() => _OtherDsState();
}

class _OtherDsState extends State<OtherDs> {

  List<Widget> widgetList=[];


 List<Map<String,dynamic>> others=[
   {'name': 'Eczema',
   'imageUrl': 'assets/acne_image.jpg',
   'description': 'Eczema is a common skin condition that causes pimples and other blemishes.',
   'percentage':'78%',
   },

   {'name': 'Vitiligo',
     'imageUrl': 'assets/acne_image.jpg',
     'description': 'Vitiligo is a common skin condition that causes pimples and other blemishes.',
     'percentage':'30%',
   },

   {'name': 'Shingles',
     'imageUrl': 'assets/acne_image.jpg',
     'description': 'Shingles is a common skin condition that causes pimples and other blemishes.',
     'percentage':'28%',
   },

   {'name': 'chickenpox',
     'imageUrl': 'assets/acne_image.jpg',
     'description': 'Chickenpox is a common skin condition that causes pimples and other blemishes.',
     'percentage':'59%',
   },

   {'name': 'carsinoma',
     'imageUrl': 'assets/acne_image.jpg',
     'description': 'Carsinoma is a common skin condition that causes pimples and other blemishes.',
     'percentage':'42%',
   },

   {'name': 'kerastosis',
     'imageUrl': 'assets/acne_image.jpg',
     'description': 'Kerastosis is a common skin condition that causes pimples and other blemishes.',
     'percentage':'73%',
   },

   {'name': 'Missles',
     'imageUrl': 'assets/acne_image.jpg',
     'description': 'Missles is a common skin condition that causes pimples and other blemishes.',
     'percentage':'64%',
   },
    ];


  @override
  void initState(){
    super.initState();
    getInWidget();
  }

 void getInWidget() async {
   for (var dis in others) {
setState(() {
  widgetList.add(
    Column(children: [
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
    ),
  );
});
   }
 }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          ...widgetList
        ],
      ),
    );
  }
}

