import 'package:flutter/material.dart';

class Scabies extends StatelessWidget {
  const Scabies({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Scabies"),
            ),
            body: const SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(16),
                        child: Image(image: AssetImage("assets/images/scabies.jpg"))),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Scabies is a contagious skin condition caused by a tiny mite called *Sarcoptes scabiei*. The mites burrow into the skin to live and lay eggs, causing intense itching and a pimple-like rash. It commonly spreads through close physical contact.",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "What Causes Scabies?",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                    Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "Scabies is caused by:\n"
                              "1. Direct skin-to-skin contact with an infected person.\n"
                              "2. Prolonged physical contact, such as holding hands.\n"
                              "3. Sharing clothing, bedding, or towels with someone infected.\n"
                              "4. Crowded conditions, such as dormitories or nursing homes, where close contact is frequent.",
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
