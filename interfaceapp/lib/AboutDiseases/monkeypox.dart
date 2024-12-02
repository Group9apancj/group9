import 'package:flutter/material.dart';

class Monkeypox extends StatelessWidget {
  const Monkeypox({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Monkeypox"),
            ),
            body: const SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(16),
                        child: Image(image: AssetImage("assets/images/monkeypox.jpg"))),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Monkeypox is a rare disease caused by infection with the monkeypox virus. It is a viral zoonotic disease, meaning it can spread from animals to humans and also between humans. Symptoms include fever, headache, muscle aches, backache, swollen lymph nodes, chills, and a rash that may form blisters and scabs. The rash often starts on the face before spreading to other parts of the body.",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "What Causes Monkeypox?",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                    Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "Monkeypox can spread through close contact with an infected person, animal, or materials contaminated with the virus. Common causes include:\n"
                              "1. Direct contact with monkeypox rash, scabs, or body fluids.\n"
                              "2. Respiratory secretions during prolonged face-to-face contact.\n"
                              "3. Touching items, such as clothing or linens, used by an infected person.\n"
                              "4. Eating undercooked meat or other products from infected animals.\n"
                              "5. Being bitten or scratched by an infected animal.",
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
