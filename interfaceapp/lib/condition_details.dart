
class ConditionDetailsPage extends StatelessWidget {
  final String condition;

  ConditionDetailsPage({required this.condition});

  @override
  Widget build(BuildContext context) {
    // Example details; replace with real data as needed.
    Map<String, String> conditionDetails = {
      "Acne": "Acne is a common skin condition that causes pimples and oily skin. It can be treated with topical and oral medications.",
      "Eczema": "Eczema causes inflamed, itchy, cracked, and rough skin. Treatment includes moisturizers and corticosteroids."
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(condition),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          conditionDetails[condition] ?? "No details available for this condition.",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
