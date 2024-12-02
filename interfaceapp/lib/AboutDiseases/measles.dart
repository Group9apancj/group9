import 'package:flutter/material.dart';

class Measles extends StatelessWidget {
  const Measles({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Measles"),
            ),
            body: const SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(16),
                        child: Image(image: AssetImage("assets/images/measles.jpg"))),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Measles is a highly contagious viral disease caused by the measles virus. It primarily affects children but can also occur in adults. Symptoms include fever, cough, runny nose, inflamed eyes, and a distinctive red rash that spreads across the body.",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "What Causes Measles?",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                    Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "Measles spreads through respiratory droplets from coughing or sneezing. Causes include:\n"
                              "1. Close contact with an infected person.\n"
                              "2. Breathing in droplets containing the virus.\n"
                              "3. Touching contaminated surfaces and then touching your face.\n"
                              "4. Lack of vaccination, which greatly increases susceptibility to the disease.",
                          style: TextStyle(fontSize: 18),
                        )),
                  ],
                )),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back),
            ),
          ),
        ));
  }
}
