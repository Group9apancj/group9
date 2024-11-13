import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff8A2BE2),
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
                const Text(
                  'Eczema',
                  style: TextStyle(
                    color: Color(0xFF171111),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Dermatologia is 86% confident that the skin condition is Eczema. This is a common skin condition that affects people of all ages.',
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
                buildNextStepItem('Moisturize your skin often'),
                buildNextStepItem('Use mild soap when bathing'),
                buildNextStepItem('Apply anti-itch cream'),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle appointment booking
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff8A2BE2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'learn more',
                      style: TextStyle(
                        color: Color(0xFFffffff),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            'We recommend that you see a dermatologist for further treatment.',
            style: TextStyle(
              color: Color(0xFF8A2BE2),
              fontSize: 14,
            ),
          ),
          BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Color(0xFF171111)),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Color(0xFF876464)),
                label: 'Detect',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border, color: Color(0xFF876464)),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Color(0xFF876464)),
                label: 'Profile',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildNextStepItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF171111),
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
