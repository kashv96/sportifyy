import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var screenHeight = size.height;
    var screenWidth = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/json/player_animation.json',
            width: screenWidth,
            height: screenHeight * 0.4,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 36),
          const Text(
            'Sportifyy',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 14.0),
            child: Text(
              'Join sports events effortlessly',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 32.0, horizontal: 50.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
                textStyle:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/signup');
              },
              child: const Text('Get Started'),
            ),
          ),
        ],
      ),
    );
  }
}
