import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // Main content of the page
            Center(child: Text("Main Page Content")),
            // Loader overlay
            ThreeBodyLoaderOverlay(),
          ],
        ),
      ),
    );
  }
}

class ThreeBodyLoaderOverlay extends StatelessWidget {
  const ThreeBodyLoaderOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Blurred and translucent background
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
        // Centered loader
        const Center(
          child: ThreeBodyLoader(),
        ),
      ],
    );
  }
}

class ThreeBodyLoader extends StatefulWidget {
  const ThreeBodyLoader({Key? key}) : super(key: key);

  @override
  _ThreeBodyLoaderState createState() => _ThreeBodyLoaderState();
}

class _ThreeBodyLoaderState extends State<ThreeBodyLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 999),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          // Add scaling transformation to the entire loader
          double loaderScale = 0.85 + 0.15 * sin(2 * pi * _controller.value);
          return Transform.scale(
            scale: loaderScale,
            child: SizedBox(
              height: 50,
              width: 50,
              child: CustomPaint(
                painter: _ThreeBodyPainter(_controller.value),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ThreeBodyPainter extends CustomPainter {
  final double progress;

  _ThreeBodyPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF5D3FD3)
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Calculate positions
    double angle = 2 * pi * progress;

    // Dot positions (rotating around the center)
    Offset dot1 = Offset(
      center.dx + radius * cos(angle + pi / 3),
      center.dy + radius * sin(angle + pi / 3),
    );
    Offset dot2 = Offset(
      center.dx + radius * cos(angle - pi / 3),
      center.dy + radius * sin(angle - pi / 3),
    );
    Offset dot3 = Offset(
      center.dx + radius * cos(angle + pi),
      center.dy + radius * sin(angle + pi),
    );

    // Scaling effect based on progress
    double scale1 = _calculateScale(progress + 0.33);
    double scale2 = _calculateScale(progress + 0.66);
    double scale3 = _calculateScale(progress);

    // Draw dots with scaling
    canvas.drawCircle(dot1, size.width * 0.15 * scale1, paint);
    canvas.drawCircle(dot2, size.width * 0.15 * scale2, paint);
    canvas.drawCircle(dot3, size.width * 0.15 * scale3, paint);
  }

  // Function to calculate scaling effect (oscillating between 0.65 and 1)
  double _calculateScale(double value) {
    return 0.65 + 0.35 * (0.5 * (1 + sin(2 * pi * value)));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
