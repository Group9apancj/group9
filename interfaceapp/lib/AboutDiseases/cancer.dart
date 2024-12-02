import 'package:flutter/material.dart';

class Cancer extends StatelessWidget {
  const Cancer({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Cancer"),
            ),
            body: const SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(16),
                        child: Image(image: AssetImage("assets/images/cancer.jpg"))),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Cancer is a broad term for a group of diseases characterized by the uncontrolled growth and spread of abnormal cells. These cells can form tumors, invade nearby tissues, and spread to other parts of the body. There are over 100 types of cancer, each classified by the type of cell that is initially affected.",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "What Causes Cancer?",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                    Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "Cancer can be caused by genetic mutations and environmental factors. Common causes include:\n"
                              "1. Tobacco use.\n"
                              "2. Excessive alcohol consumption.\n"
                              "3. Exposure to ultraviolet (UV) radiation from the sun.\n"
                              "4. Exposure to carcinogenic chemicals.\n"
                              "5. Certain viruses and bacteria, such as HPV and H. pylori.\n"
                              "6. Family history of cancer.\n"
                              "7. Unhealthy diet and lack of physical activity.\n"
                              "8. Aging, as the risk increases with age.",
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
