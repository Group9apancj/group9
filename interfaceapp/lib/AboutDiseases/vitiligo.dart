import 'package:flutter/material.dart';

class Vitiligo extends StatelessWidget {
  const Vitiligo({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Vitiligo"),
            ),
            body: const SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(16),
                        child: Image(image: AssetImage("assets/images/vitiligo.jpg"))),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Vitiligo is a long-term skin condition that causes patches of skin to lose their pigment. This happens when melanocytes, the cells responsible for producing pigment, are destroyed. These patches can appear anywhere on the body and may grow over time.",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "What Causes Vitiligo?",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                    Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "The exact cause of vitiligo is unknown, but possible factors include:\n"
                              "1. Autoimmune conditions, where the immune system attacks melanocytes.\n"
                              "2. Genetic predisposition.\n"
                              "3. Exposure to certain chemicals.\n"
                              "4. A trigger event, such as stress, sunburn, or exposure to industrial chemicals.\n"
                              "5. Family history of the condition.",
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
