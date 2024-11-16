import 'package:flutter/material.dart';
import 'condition_details_page.dart';
import '../models/skin_condition.dart';

class ResultsPage extends StatelessWidget {
  final SkinCondition detectedCondition;

  const ResultsPage({super.key, required this.detectedCondition});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff603FeF),
        elevation: 0,
        title: const Text(
          'Results',
          style: TextStyle(
            color: Color(0xFFffffff),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text('Detected condition: ${detectedCondition.name}',
                  style: const TextStyle(
                    color: Color(0xFF171111),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Dermatologia is 86% confident that the skin condition is Eczema...',
                  style: TextStyle(
                    color: Color(0xFF171111),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                const Text(
                  'What to do next',
                  style: TextStyle(
                    color: Color(0xFF171111),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                // Display recommendations here
                buildNextStepItem('Moisturize your skin often'),
                buildNextStepItem('Use mild soap when bathing'),
                buildNextStepItem('Apply anti-itch cream'),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _navigateToConditionDetails(context, detectedCondition);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff603FeF),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Learn More', style: TextStyle(color: Color(0xFFffffff),fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for the next step items
  Widget buildNextStepItem(String step) {
    return ListTile(
      title: Text(step, style: const TextStyle(fontSize: 16)),
      leading: const Icon(Icons.check_circle_outline),
    );
  }

  // Navigate to the ConditionDetailsPage
  void _navigateToConditionDetails(BuildContext context, SkinCondition condition) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConditionDetailsPage(condition: condition),
      ),
    );
  }
}
