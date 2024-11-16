import 'package:flutter/material.dart';
import '../models/skin_condition.dart';

class ConditionDetailsPage extends StatelessWidget {
  final SkinCondition condition;

  const ConditionDetailsPage({super.key, required this.condition});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff603FeF),
        title: Text(condition.name, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  condition.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Name section
            Text(
              condition.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff603FeF)),
            ),
            const SizedBox(height: 20),
            // Description section
            _buildInfoSection(title: 'What is ${condition.name}?', content: condition.description),
            const SizedBox(height: 20),
            // Symptoms section
            _buildInfoSection(title: 'Symptoms', content: condition.symptoms),
            const SizedBox(height: 20),
            // Treatments section
            _buildInfoSection(title: 'Treatments', content: condition.treatments),
          ],
        ),
      ),
    );
  }

  // Helper widget to build each section with consistent styling
  Widget _buildInfoSection({required String title, required String content}) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
          const SizedBox(height: 5),
          Text(content, style: const TextStyle(fontSize: 16, color: Colors.black87)),
        ],
      ),
    );
  }
}
