import 'package:flutter/material.dart';

class Ringworm extends StatelessWidget {
  const Ringworm({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Ringworm"),
            ),
            body: const SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(16),
                        child: Image(image: AssetImage("assets/images/ringworm.jpg"))),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Ringworm is a common fungal skin infection. Despite its name, it’s not caused by a worm but by a type of fungus. It usually appears as a red, itchy, circular rash with clearer skin in the middle. It can affect various parts of the body, including the scalp, feet (athlete's foot), groin (jock itch), and nails.",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "What Causes Ringworm?",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                    Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "Ringworm is caused by dermatophytes, a group of fungi that thrive in warm, moist environments. Common causes include:\n"
                              "1. Direct skin-to-skin contact with an infected person.\n"
                              "2. Contact with contaminated objects, such as clothing, towels, or bedding.\n"
                              "3. Touching animals infected with the fungus, particularly cats and dogs.\n"
                              "4. Walking barefoot in damp public areas like locker rooms or swimming pools.",
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
