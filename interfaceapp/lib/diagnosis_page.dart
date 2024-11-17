import 'package:flutter/material.dart';
import 'results.dart';
import 'models/skin_condition.dart';
import 'condition_details_page.dart';

void main()=>runApp(MaterialApp(
  home: DiagnosisScreen(),
));

class DiagnosisScreen extends StatelessWidget {
  const DiagnosisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the detected skin condition object
    final detectedCondition = SkinCondition(
      name: 'Acne',
      imageUrl: 'assets/acne_image.jpg',
      description: 'Acne is a common skin condition that causes pimples and other blemishes.',
      symptoms: 'Pimples, blackheads, whiteheads',
      treatments: 'Topical creams, salicylic acid, benzoyl peroxide',
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff603FeF),
        title: const Text(
          'Diagnosis',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Diagnosis Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your diagnosis is in',
                    style: TextStyle(
                      color: Color(0xFF171111),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Dermatologia has diagnosed you with Acne. It\'s 86.0% confident.',
                    style: TextStyle(
                      color: Color(0xFF171111),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Next Steps Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF4F0F0),
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // Navigate to ResultsPage and pass detectedCondition
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultsPage(detectedCondition: detectedCondition),
                        ),
                      );
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.arrow_forward, color: Color(0xFF171111), size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Next steps',
                          style: TextStyle(
                            color: Color(0xFF171111),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // See More Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate directly to ConditionDetailsPage and pass detectedCondition
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConditionDetailsPage(condition: detectedCondition),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF603FeF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Other possible conditions',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Bottom Navigation Bar
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Color(0xFFF4F0F0)),
                  ),
                ),
                child: BottomNavigationBar(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
