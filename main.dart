import 'package:flutter/material.dart';
import 'dart:math'; // Importing dart:math for random number generation

void main() => runApp(
  const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BallPage(),
  ),
);

class BallPage extends StatelessWidget {
  const BallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text(
          'Ask Me Anything',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment(4.0, 1.0),
          colors: [Colors.blue,
          Colors.white]
        )),
          child: const Center(child: Ball())),
    );
  }
}

class Ball extends StatefulWidget {
  const Ball({super.key});

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1; // Initialized with 1

  void handleTap() {
    setState(() { // Notify the framework to redraw widget with new state
      // Generate a new ballNumber between 1 - 5
      ballNumber = Random().nextInt(5) + 1;
    });
    print('Ball clicked! New ball number is: $ballNumber');
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: handleTap,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: Image.asset(
        // Dynamically use ballNumber to load different ball images
        'assets/images/ball$ballNumber.png',
        errorBuilder: (context, error, stackTrace) {
          return const Text('Failed to load image', style: TextStyle(color: Colors.red));
        },
      ),
    );
  }
}
